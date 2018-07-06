module Kubernetes.Generation.GenerateApi where

import Prelude

import Data.Array as Array
import Data.Foldable (find, findMap)
import Data.Lens ((^.))
import Data.Lens as L
import Data.List.NonEmpty (NonEmptyList(..))
import Data.List.NonEmpty as NonEmptyList
import Data.Maybe (Maybe(Just, Nothing))
import Data.NonEmpty ((:|))
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple(..), uncurry)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Generation.AST as AST
import Kubernetes.Generation.JsonSchema (SchemaRef(SchemaRef))
import Kubernetes.Generation.Names (apiModuleFromGroupVersion, apiModuleFromTag, schemaRefToQualifiedName, stripModuleFromId, stripTagFromId, uppercaseFirstChar)
import Kubernetes.Generation.PathParsing as PathParsing
import Kubernetes.Generation.Swagger (Operation, Param, PathItem, Response, _delete, _get, _head, _options, _patch, _post, _put, _ref, _schema, _type)
import Kubernetes.SchemaExtensions (GroupVersionKind(GroupVersionKind))
import Partial.Unsafe (unsafeCrashWith)
import Record as Record
import Simple.JSON (writeJSON)

type DeclWithModule =
  { moduleName :: AST.ModuleName, decl :: AST.Declaration }

type ApiResponse =
  { responseCode :: String
  , "type" :: Maybe String
  , typeRef :: Maybe String }

generateEndpointModules :: Partial => Object PathItem -> Array AST.Module
generateEndpointModules paths = groupEndpointsByModule (parseEndpoints paths)
  where
    parseEndpoints :: Object PathItem -> Array DeclWithModule
    parseEndpoints = Object.toUnfoldable
      >>> map (uncurry parsePathMethods)
      >>> Array.concat

parsePathMethods :: Partial => String -> PathItem -> Array DeclWithModule
parsePathMethods path item =
  item
  # pathOperations
  # map (parsePathMethod path)
  # Array.catMaybes

parsePathMethod :: Partial => String -> Tuple String Operation -> Maybe DeclWithModule
-- Not generating patch functions for now as it requires special handling
parsePathMethod _ (Tuple "patch" _) = Nothing
parsePathMethod path (Tuple _method
                                op@{ operationId: Just id
                                    , responses: Just responses
                                    , description: description
                                    , tags: tags }) =
  
  Just { moduleName
       , decl: AST.Endpoint
           { description
           , method
           , name
           , body
           , queryParams
           , returnType
           , urlWithParams } }
  where
    moduleName = parseModuleName op
    method = parseMethod _method
    name = operationName op moduleName id tags
    body = parseOperationBody op
    queryParams = parseOperationParams (uppercaseFirstChar $ name <> "Options") op
    returnType = endpointReturnType moduleName parsedResponses
    urlWithParams = PathParsing.parse path

    parsedResponses :: Array ApiResponse
    parsedResponses = parseResp <$> Object.toUnfoldable responses
    
    parseResp :: Tuple String Response -> ApiResponse
    parseResp (Tuple responseCode r) =
      { responseCode
      , typeRef: L.view (_schema <<< L._Just <<< _ref) r
      , "type": L.view (_schema <<< L._Just <<< _type) r }
parsePathMethod _ (Tuple name op) =
  unsafeCrashWith $ "Could not parse operation: " <> show (writeJSON op)

parseModuleName :: Partial => Operation -> AST.ModuleName
parseModuleName op@{"x-kubernetes-group-version-kind":
                    Just (GroupVersionKind v)} =
  case apiModuleFromGroupVersion v of
    Just name -> name
    Nothing -> unsafeCrashWith $ "Could not parse module name from group version: " <>
      show (writeJSON op)
parseModuleName op@{tags: Just [tag]} =
  case apiModuleFromTag tag of
    Just name -> name
    Nothing -> unsafeCrashWith $ "Could not parse module name from tag: " <>
      show (writeJSON op)
parseModuleName op = unsafeCrashWith $ "Could not module name from op: " <>
  show (writeJSON op)

endpointReturnType :: Partial => AST.ModuleName -> Array ApiResponse -> AST.TypeDecl
endpointReturnType modName responses =
  case find (((==) "200") <<< _.responseCode) responses of
    Just {typeRef: Just ref} -> case schemaRefToQualifiedName (SchemaRef ref) of
      Just name -> AST.TypeRef name
      Nothing -> unsafeCrashWith $ "Could not parse type ref to qualified name: " <> ref
    Just {"type": Just simpleType} -> parseType simpleType
    _ -> AST.TypeString

operationName :: Operation -> AST.ModuleName -> String -> Maybe (Array String) -> String
operationName {"x-kubernetes-action": Just _} modName opId (Just [tag]) =
  opId # stripTagFromId tag # stripModuleFromId modName
operationName op modName opId (Just [tag]) = opId # stripTagFromId tag
operationName _ modName opId (Just []) = opId
operationName _ modName opId (Just tags) = unsafeCrashWith $ "Operation '" <> opId <>
                                 "' has multiple tags: " <> show tags
operationName _ modName opId Nothing = opId

parseMethod :: Partial => String -> AST.HttpMethod
parseMethod "get" = AST.GET
parseMethod "post" = AST.POST
parseMethod "delete" = AST.DELETE
parseMethod "head" = AST.HEAD
parseMethod "options" = AST.OPTIONS
parseMethod "patch" = AST.PATCH
parseMethod "put" = AST.PUT
parseMethod s = unsafeCrashWith $ "Unhandled operation HTTP method: " <> s

parseOperationParams :: Partial => String -> Operation -> Maybe AST.ObjectType
parseOperationParams _ {parameters: Nothing} = Nothing
parseOperationParams name {parameters: Just params} =
  if Array.null fields
     then Nothing
     else Just $ AST.ObjectType $
       { description: Nothing
       , groupVersionKind: []
       , name
       , fields }
  where fields = Array.catMaybes (parseParam <$> params)

parseParam :: Partial => Param -> Maybe AST.OptionalField
parseParam { description: description
           , name
           , "type": Just paramType} =
  Just { description
       , name
       , innerType: parseType paramType }
parseParam { name: "body"
           , "in": "body" } = Nothing
parseParam p = unsafeCrashWith $ "Could not parse param " <>
               show (writeJSON $ Record.delete (SProxy :: SProxy "schema") p)

parseOperationBody :: Partial => Operation -> Maybe AST.TypeDecl
parseOperationBody {parameters: Just params} =
  findMap bodyParamAsDecl params
parseOperationBody _ = Nothing

bodyParamAsDecl :: Partial => Param -> Maybe AST.TypeDecl
bodyParamAsDecl
  { name: "body"
  , "in": "body"
  , schema: Just {"$ref": Just ref} } =
    case schemaRefToQualifiedName (SchemaRef ref) of
      Just name -> Just $ AST.TypeRef name
      Nothing -> unsafeCrashWith $ "Could not parse body ref to qualified name: " <> ref
bodyParamAsDecl _ = Nothing

parseType :: Partial => String -> AST.TypeDecl
parseType "string" = AST.TypeString
parseType "boolean" = AST.TypeBoolean
parseType "integer" = AST.TypeInt
parseType s = unsafeCrashWith $ "Cannot parse param type '" <> s <> "'"

pathOperations :: PathItem -> Array (Tuple String Operation)
pathOperations s = Array.catMaybes
  [ (s ^. _get) # pair "get"
  , (s ^. _put) # pair "put"
  , (s ^. _post) # pair "post"
  , (s ^. _delete) # pair "delete"
  , (s ^. _options) # pair "options"
  , (s ^. _head) # pair "head"
  , (s ^. _patch) # pair "patch" ]
  where
    pair name m = (Tuple name) <$> m

groupEndpointsByModule :: Partial => Array DeclWithModule -> Array AST.Module
groupEndpointsByModule endpoints =
  case NonEmptyList.fromFoldable endpoints of
    Just endpointDecls ->
      groupByModule endpointDecls
      # map (\d -> mkModule (modName d) (decls d))
      # NonEmptyList.toUnfoldable
    Nothing -> []
  where
    modName :: NonEmptyList DeclWithModule -> AST.ModuleName
    modName = NonEmptyList.head >>> _.moduleName
    
    decls :: NonEmptyList DeclWithModule -> Array AST.Declaration
    decls = Array.fromFoldable >>> map _.decl
    
    groupByModule :: NonEmptyList DeclWithModule -> NonEmptyList (NonEmptyList DeclWithModule)
    groupByModule = NonEmptyList.sortBy sortByModName
      >>> NonEmptyList.groupBy orderByModName
      
    sortByModName :: DeclWithModule -> DeclWithModule -> Ordering
    sortByModName {moduleName: m1} {moduleName: m2} = m1 `compare` m2
    
    orderByModName :: DeclWithModule -> DeclWithModule -> Boolean
    orderByModName {moduleName: m1} {moduleName: m2} = m1 == m2

mkModule :: AST.ModuleName -> Array AST.Declaration -> AST.Module
mkModule moduleName decls =
  { name: moduleName
  , imports: (AST.RawImport <$>
    [ "Prelude"
    , "Data.Either (Either(Left,Right))"
    , "Effect.Aff (Aff)"
    , "Foreign.Class (class Decode, class Encode, encode, decode)"
    , "Foreign.Generic (encodeJSON, genericEncode, genericDecode)"
    , "Foreign.Index (readProp)"
    , "Data.Generic.Rep (class Generic)"
    , "Data.Generic.Rep.Show (genericShow)"
    , "Data.Maybe (Maybe(Just,Nothing))"
    , "Data.Newtype (class Newtype)"
    , "Data.Tuple (Tuple(Tuple))"
    , "Foreign.Object (Object)"
    , "Foreign.Object as Object"
    , "Kubernetes.Client as Client"
    , "Kubernetes.Config (Config)"
    , "Kubernetes.Default (class Default)"
    , "Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)" ]) <>
    [ AST.K8SImport {parentModule: Nothing, k8sModule: NonEmptyList $ "Meta" :| pure "V1"} ]
  , declarations: decls }
