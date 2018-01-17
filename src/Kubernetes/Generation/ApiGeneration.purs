module Kubernetes.Generation.ApiGeneration where

import Prelude

import Data.Array as Array
import Data.Foldable (find, findMap, foldl)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.FunctorWithIndex (mapWithIndex)
import Data.Lens ((^.))
import Data.Lens as L
import Data.List (List(..))
import Data.List as List
import Data.List.NonEmpty (NonEmptyList(..))
import Data.List.NonEmpty as NonEmptyList
import Data.Maybe (Maybe(..), maybe)
import Data.Monoid (mempty)
import Data.NonEmpty (NonEmpty(..), (:|))
import Data.NonEmpty as NonEmpty
import Data.Record as Record
import Data.StrMap as StrMap
import Data.String as String
import Data.Symbol (SProxy(..))
import Data.Tuple (Tuple(..), uncurry)
import Debug.Trace as Debug
import Kubernetes.Generation.AST as AST
import Kubernetes.Generation.Names (apiModuleFromGroupVersion, apiModuleFromTag, refName, refName', stripTagFromId, typeModule', typeQualifiedName, uppercaseFirstChar)
import Kubernetes.Generation.PathParsing as PathParsing
import Kubernetes.Generation.Swagger (Operation, Param, PathItem, Swagger, _delete, _get, _head, _options, _patch, _post, _put, _ref, _schema, _type)
import Kubernetes.Generation.TypeGeneration (generateApiTypes)
import Kubernetes.SchemaExtensions (KubernetesGroupVersionKind(..))
import Partial.Unsafe (unsafeCrashWith, unsafePartial)
import Simple.JSON (writeJSON)
    
type ApiEndpoint =
  { operations :: Array ApiOperation
  , path :: String }

type ApiOperation =
  { body :: Maybe AST.TypeDecl
  , description :: Maybe String
  , method :: AST.HttpMethod
  , moduleName :: AST.ApiModuleName
  , name :: String
  , params :: Maybe AST.ObjectType
  , responses :: Array ApiResponse }

type ApiResponse =
  { responseCode :: String
  , "type" :: Maybe String
  , typeRef :: Maybe String }

generateApi :: Partial => AST.ApiModuleName -> Swagger -> AST.ApiAst
generateApi moduleNs swagger = mergeAsts endpointsAst definitionsAst
  where
    endpointsAst = { modules: endpointsModules }
    endpointsModules = mkModules moduleNs endpoints
    endpoints = (uncurry generatePathFns) <$> (StrMap.toUnfoldable swagger.paths)
    
    definitionsAst = unsafePartial $ generateApiTypes moduleNs schemas
    schemas = (\(Tuple name schema) -> {name, schema}) <$> inputDefs
    inputDefs = StrMap.toUnfoldable swagger.definitions

mergeAsts :: AST.ApiAst -> AST.ApiAst -> AST.ApiAst
mergeAsts {modules: endpointsModules} {modules: defsModules} =
  { modules: Array.fromFoldable $
      mergeAsts' (List.fromFoldable endpointsModules) (List.fromFoldable defsModules) Nil }

  where
    mergeAsts' :: List AST.ApiModule -> List AST.ApiModule -> List AST.ApiModule -> List AST.ApiModule
    mergeAsts' Nil Nil merged = merged
    mergeAsts' Nil defs merged = merged <> defs
    mergeAsts' endpoints Nil merged = merged <> endpoints
    mergeAsts' (Cons endpointMod restEndpoints) defs merged =
      case List.partition (\{name} -> name == endpointMod.name) defs of
        {yes: Cons matchingDef Nil, no: otherDefs} ->
          mergeAsts' restEndpoints otherDefs (Cons (mergeModules endpointMod matchingDef) merged)
        {yes: _, no: otherDefs} -> mergeAsts' restEndpoints otherDefs (Cons endpointMod merged)

mergeModules :: AST.ApiModule -> AST.ApiModule -> AST.ApiModule
mergeModules {name, imports: endpointsImports, declarations: endpointsDecls}
             {imports: defsImports, declarations: defsDecls} =
  {name, imports, declarations}
  where
    imports = Array.nub $ Array.sort $ endpointsImports <> defsImports
    declarations = endpointsDecls <> defsDecls

mkModules :: Partial => AST.ApiModuleName -> Array ApiEndpoint -> Array AST.ApiModule
mkModules moduleNs endpoints = maybe [] (groupEndpointsByModule moduleNs) endpointDecls
  where
    endpointDecls = NonEmptyList.fromFoldable $ Array.concat (mkEndpointDecls <$> endpoints)

type DeclWithModule =
  { moduleName :: AST.ApiModuleName, decl :: AST.Declaration }

groupEndpointsByModule ::
  AST.ApiModuleName
  -> NonEmptyList DeclWithModule
  -> Array AST.ApiModule
groupEndpointsByModule moduleNs endpointDecls =
  groupByModule endpointDecls
  # map (\d -> mkModule moduleNs (modName d) (decls d))
  # NonEmptyList.toUnfoldable
  where
    modName :: NonEmptyList DeclWithModule -> AST.ApiModuleName
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

mkModule :: AST.ApiModuleName -> AST.ApiModuleName -> Array AST.Declaration -> AST.ApiModule
mkModule moduleNs moduleName decls =
  { name: moduleNs <> moduleName
  , imports:
    [ "Prelude"
    , "Control.Monad.Aff (Aff)"
    , "Data.Either (Either(Left,Right))"
    , "Data.Foreign.Class (class Decode, class Encode)"
    , "Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)"
    , "Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))"
    , "Data.Generic.Rep (class Generic)"
    , "Data.Generic.Rep.Show (genericShow)"
    , "Data.Maybe (Maybe(Just,Nothing))"
    , "Data.Newtype (class Newtype)"
    , "Node.HTTP (HTTP)"
    , "Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)"
    , "Kubernetes.Config (Config)"
    , "Kubernetes.Default (class Default)"
    , "Kubernetes.Json (jsonOptions)" ] <> depImports
  , declarations: (mapDeclRefs fixRefName) <$> decls }
  where
    depImports = decls >>= declRefs
      # map typeModule' -- Dropping refs for which we can't parse a module
      # Array.catMaybes
      # Array.sort
      # Array.insert "MetaV1"
      # Array.nub
      # Array.filter ((/=) (modNameAsStr moduleName))
      <#> mkImport
    fixRefName (AST.TypeRef r) = AST.TypeRef (refName' (NonEmptyList.last moduleName) r)
    fixRefName t = t
    modNameAsStr = String.joinWith "." <<< NonEmptyList.toUnfoldable
    mkImport dep = modNameAsStr moduleNs <> "." <> dep <> " as " <> dep

declRefs :: AST.Declaration -> Array String
declRefs (AST.Endpoint {body, queryParams, returnType}) =
  Array.catMaybes $ [bodyRef] <> queryRefs <> [returnRef]
  where
    bodyRef = body >>= typeDeclRef
    queryRefs = queryParamRefs queryParams
    returnRef = typeDeclRef returnType
declRefs _ = []

queryParamRefs :: Maybe AST.ObjectType -> Array (Maybe String)
queryParamRefs (Just (AST.ObjectType {fields})) = (typeDeclRef <<< _.innerType) <$> fields
queryParamRefs Nothing = []

typeDeclRef :: AST.TypeDecl -> Maybe String
typeDeclRef (AST.TypeRef s) = Just s
typeDeclRef _ = Nothing

mapDeclRefs :: (AST.TypeDecl -> AST.TypeDecl) -> AST.Declaration -> AST.Declaration
mapDeclRefs f (AST.Endpoint e@{body, queryParams, returnType}) =
  AST.Endpoint $ e { body = (mapTypeDeclRef f) <$> body
                   , queryParams = mapQueryParamRefs f queryParams
                   , returnType = mapTypeDeclRef f returnType }
mapDeclRefs f d = d

mapQueryParamRefs :: (AST.TypeDecl -> AST.TypeDecl) -> Maybe AST.ObjectType -> Maybe AST.ObjectType
mapQueryParamRefs f (Just (AST.ObjectType o@{fields})) =
  Just (AST.ObjectType $ o {fields = (mapFieldRef f) <$> fields})
mapQueryParamRefs _ o = o

mapFieldRef :: (AST.TypeDecl -> AST.TypeDecl) -> AST.OptionalField -> AST.OptionalField
mapFieldRef f field@{innerType} = field { innerType = mapTypeDeclRef f innerType }

mapTypeDeclRef :: (AST.TypeDecl -> AST.TypeDecl) -> AST.TypeDecl -> AST.TypeDecl
mapTypeDeclRef f t@(AST.TypeRef _) = f t
mapTypeDeclRef _ t = t

mkEndpointDecls :: Partial => ApiEndpoint -> Array { moduleName :: AST.ApiModuleName, decl :: AST.Declaration }
mkEndpointDecls {operations, path} = endpointDecl url <$> operations
  where
    url = PathParsing.parse path

endpointDecl :: Partial => AST.UrlWithParams -> ApiOperation -> { moduleName :: AST.ApiModuleName, decl :: AST.Declaration }
endpointDecl urlWithParams op@{description, name, body, method, moduleName, params, responses} =
  { moduleName
  , decl: AST.Endpoint { description, method, name, body, queryParams, returnType, urlWithParams } }
  where
    queryParams = params
    returnType = endpointReturnType moduleName op

endpointReturnType :: Partial => AST.ApiModuleName -> ApiOperation -> AST.TypeDecl
endpointReturnType modName {responses} =
  case find (((==) "200") <<< _.responseCode) responses of
    Just {typeRef: Just ref} -> AST.TypeRef (refName (NonEmptyList.last modName) ref)
    Just {"type": Just simpleType} -> parseType simpleType
    _ -> AST.TypeString

generatePathFns :: Partial => String -> PathItem -> ApiEndpoint
generatePathFns path item =
  { operations: Array.catMaybes $ generateOperation <$> pathOperations item
  , path }

generateOperation :: Partial => Tuple String Operation -> Maybe ApiOperation
-- Not generating patch functions for now as it requires special handling
generateOperation (Tuple "patch" _) = Nothing
generateOperation (Tuple method
                         op@{ operationId: NullOrUndefined (Just id)
                            , responses: NullOrUndefined (Just responses)
                            , description: NullOrUndefined description
                            , tags: NullOrUndefined tags }) =
  Just { body
       , method: parseMethod method
       , description
       , moduleName: parseModuleName op
       , name
       , params
       , responses: parsedResponses}
  where
    name = operationName id tags
    parseResp (Tuple responseCode r) =
      { responseCode
      , typeRef: L.view (_schema <<< L._Just <<< _ref) r
      , "type": L.view (_schema <<< L._Just <<< _type) r }
    parsedResponses = parseResp <$> StrMap.toUnfoldable responses
    params = parseOperationParams (uppercaseFirstChar $ name <> "Options") op
    body = parseOperationBody op
generateOperation (Tuple name op) = unsafeCrashWith $ "Could not parse operation: " <> show (writeJSON op)

parseModuleName :: Partial => Operation -> AST.ApiModuleName
parseModuleName op@{"x-kubernetes-group-version-kind":
                    NullOrUndefined (Just (KubernetesGroupVersionKind v))} =
  case apiModuleFromGroupVersion v of
    Just name -> name
    Nothing -> unsafeCrashWith $ "Could not parse module name from group version: " <>
      show (writeJSON op)
parseModuleName op@{tags: NullOrUndefined (Just [tag])} =
  case apiModuleFromTag tag of
    Just name -> name
    Nothing -> unsafeCrashWith $ "Could not parse module name from tag: " <>
      show (writeJSON op)
parseModuleName op = unsafeCrashWith $ "Could not module name from op: " <>
  show (writeJSON op)

operationName :: String -> Maybe (Array String) -> String
operationName opId (Just [tag]) = stripTagFromId opId tag
operationName opId (Just []) = opId
operationName opId (Just tags) = unsafeCrashWith $ "Operation '" <> opId <>
                                 "' has multiple tags: " <> show tags
operationName opId Nothing = opId

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
parseOperationParams _ {parameters: NullOrUndefined Nothing} = Nothing
parseOperationParams name {parameters: NullOrUndefined (Just params)} =
  if Array.null fields
     then Nothing
     else Just $ AST.ObjectType { description: Nothing, qualifiedName: name, fields }
  where fields = Array.catMaybes (parseParam <$> params)

parseParam :: Partial => Param -> Maybe AST.OptionalField
parseParam { description: NullOrUndefined description
           , name
           , "type": NullOrUndefined (Just paramType)} =
  Just { description
       , name
       , innerType: parseType paramType }
parseParam { name: "body"
           , "in": "body" } = Nothing
parseParam p = unsafeCrashWith $ "Could not parse param " <>
               show (writeJSON $ Record.delete (SProxy :: SProxy "schema") p)

parseOperationBody :: Operation -> Maybe AST.TypeDecl
parseOperationBody {parameters: NullOrUndefined (Just params)} =
  findMap bodyParamAsDecl params
parseOperationBody _ = Nothing

bodyParamAsDecl :: Param -> Maybe AST.TypeDecl
bodyParamAsDecl
  { name: "body"
  , "in": "body"
  , schema: NullOrUndefined (Just {"$ref": NullOrUndefined (Just ref)}) } =
    Just (AST.TypeRef $ typeQualifiedName ref)
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
