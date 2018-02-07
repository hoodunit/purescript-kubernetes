module Kubernetes.Generation.Emitter where

import Kubernetes.Generation.AST
import Prelude

import Data.Array as Array
import Data.Foldable (all, any, fold)
import Data.List.NonEmpty as NonEmpty
import Data.List.NonEmpty as NonEmptyList
import Data.Maybe (Maybe(..), isJust, maybe)
import Data.Newtype (unwrap)
import Data.String as String
import Data.Tuple (Tuple(..))
import Debug.Trace as Debug
import Kubernetes.Generation.Names (lowercaseFirstChar, modNameAsStr, startsWith, startsWithUpperCase)
import Partial.Unsafe (unsafeCrashWith)

emitApiModule :: Partial => ApiModule -> String
emitApiModule {name, imports, declarations} =
  "module " <> moduleName name <> " where\n\n" <>
  emittedImports <> "\n\n" <>
  emittedDecls
  where
    emittedImports = String.joinWith "\n" $ emitImport <$> imports
    emittedDecls = String.joinWith "\n\n" $ emitDeclaration name <$> (Array.sort declarations)
    moduleName = String.joinWith "." <<< NonEmpty.toUnfoldable

emitTypeDecl :: ModuleName -> TypeDecl -> String
emitTypeDecl _ TypeString = "String"
emitTypeDecl _ TypeNumber = "Number"
emitTypeDecl _ TypeInt = "Int"
emitTypeDecl _ TypeBoolean = "Boolean"
emitTypeDecl m (TypeArray t) = "(Array " <> emitTypeDecl m t <> ")"
emitTypeDecl m (TypeNullable t) = "(Nullable " <> emitTypeDecl m t <> ")"
emitTypeDecl m (TypeObject t) = "(StrMap " <> emitTypeDecl m t <> ")"
emitTypeDecl modName (TypeRef {moduleName, k8sTypeName}) | modulesMatch modName moduleName =
  k8sTypeName
emitTypeDecl modName (TypeRef {moduleName, k8sTypeName}) =
  modNameAsStr moduleName <> "." <> k8sTypeName

emitDeclaration :: Partial => ModuleName -> Declaration -> String
emitDeclaration modName (NewtypeDecl (ObjectType {description, fields, groupVersionKind, name})) =
  objectDocs description usedFields <>
    "newtype " <> name <> " = " <> name <> "\n" <>
    "  { " <> emitFields usedFields <>
    " }" <>
    "\n\n" <> deriveNewtype name <>
    "\n" <> typeClassBoilerplate name (_.name <$> allFields) kind version <>
    "\n\n" <> defaultInstance name (_.name <$> usedFields)
  where
    kind = (unwrap >>> _.kind) <$> (Array.head groupVersionKind)
    version = (unwrap >>> parseVersion) <$> (Array.head groupVersionKind)
    parseVersion {group, version} | String.null group = version
    parseVersion {group, version} = group <> "/" <> version
    allFields = Array.sortWith _.name fields
    usedFields = dropUnused allFields
    
    dropUnused = Array.filter (not isUnused <<< _.name)
    isUnused = ((const $ isJust kind) && eq "kind")
               || ((const $ isJust version) && eq "apiVersion")
    emitFields = String.joinWith "\n  , " <<< map (emitOptionalField modName)
emitDeclaration modName (RecordDecl (ObjectType {name, description, fields})) =
  docs <>
    "type " <> name <> " =\n" <>
    "  { " <> fieldDecls <>
    " }" <>
    "\n\n" <> defaultRecordNameAndValue name fieldNames
  where
    docs = objectDocs description fields
    sortedFields = Array.sortWith (_.name) fields
    fieldDecls = String.joinWith "\n  , " (emitOptionalField modName <$> sortedFields)
    fieldNames = _.name <$> sortedFields
emitDeclaration modName (AdtType {name, description, constructors}) =
  docs <>
    "data " <> name <> " = \n  " <> constructorDecls <>
    "\n\n" <> adtTypeClassBoilerplate name
  where
    docs = formatDescription description
    constructorDecls = String.joinWith "\n  | " (mkConstructor <$> constructors)
    mkConstructor t = name <> adtCtrSuffix modName t <> " " <> emitTypeDecl modName t
emitDeclaration modName (AliasType {name, description, innerType}) =
  docs <>
    "newtype " <> name <> " = " <> name <> " " <> emitTypeDecl modName innerType <>
    "\n\n" <> deriveNewtype name <>
    "\n" <> genericTypeClassBoilerplate name
  where
    docs = formatDescription description
emitDeclaration _ (LensHelper {name}) =
  underscoreName <> " :: forall s a r. Newtype s { " <> name <> " :: a | r } => Lens' s a\n" <>
  underscoreName <> " = _Newtype <<< prop (SProxy :: SProxy \"" <> name <> "\")"
  where
    underscoreName = if startsWith "_" name then name else "_" <> name
emitDeclaration modName (Endpoint
  { description
  , method
  , name
  , body: body
  , queryParams
  , returnType
  , urlWithParams}) =
  optionsDecl queryParams <>
  formatDescription description <>
  name <> " :: forall e. " <> fnParamTypes <> "Aff (http :: HTTP | e) " <> returnType' <> "\n" <>
  name <> " " <> paramNamesStr <> "= Client.makeRequest (" <> methodCall <> ")\n" <>
  "  where\n" <>
  "    url = " <> buildUrlStr <>
  buildBodyStr body
  where
    optionsDecl (Just params) = emitDeclaration modName (NewtypeDecl params) <> "\n\n"
    optionsDecl Nothing = ""
    
    fnParamTypes = (String.joinWith " -> " allFnParamTypes) <>
                   (if Array.null allFnParamTypes then "" else " -> ")
    allFnParamTypes = ["Config"] <> urlTypes <> bodyTypes <> optionsTypes
    urlTypes = const "String" <$> paramNames
    bodyTypes = maybe [] (\b -> [emitTypeDecl modName b]) body
    optionsTypes = maybe [] (\o -> [(unwrap o).name]) queryParams
    
    returnType' = "(Either MetaV1.Status " <> emitTypeDecl modName returnType <> ")"
    
    paramNamesStr = (String.joinWith " " (["cfg"] <> paramNames <> bodyNames <> optionsName)) <> " "
    paramNames = urlParamNames urlWithParams
    bodyNames = maybe [] (const ["body"]) body
    optionsName = const "options" <$> optionsTypes

    methodCall = methodName method <> " cfg url" <> maybe " Nothing" (const " (Just encodedBody)") body
    
    buildUrlStr = urlBuilderStr urlWithParams <> formatQueryStr queryParams
    formatQueryStr = maybe "" (const " <> Client.formatQueryString options") 
    buildBodyStr = maybe "" (const "\n    encodedBody = encodeJSON body")

emitOptionalField :: ModuleName -> OptionalField -> String
emitOptionalField modName {name, innerType} =
  sanitizedName <> " :: " <> "(Maybe " <> emitTypeDecl modName innerType <> ")"
  where
    sanitizedName = if startsWithUpperCase name then "\"" <> name <> "\"" else name

methodName :: HttpMethod -> String
methodName GET = "Client.get"
methodName DELETE = "Client.delete"
methodName HEAD = "Client.head"
methodName OPTIONS = "Client.options"
methodName PATCH = "Client.patch"
methodName POST = "Client.post"
methodName PUT = "Client.put"

urlParamNames :: UrlWithParams -> Array String
urlParamNames (EndUrl _) = []
urlParamNames (UrlChunk _ name rest) = [name] <> urlParamNames rest

urlBuilderStr :: UrlWithParams -> String
urlBuilderStr (EndUrl s) = "\"" <> s <> "\""
urlBuilderStr (UrlChunk chunk paramName rest) = "\"" <> chunk <> "\" <> " <> paramName <> " <> " <> urlBuilderStr rest

adtCtrSuffix :: ModuleName -> TypeDecl -> String
adtCtrSuffix _ TypeString = "String"
adtCtrSuffix _ TypeNumber = "Number"
adtCtrSuffix _ TypeInt = "Int"
adtCtrSuffix _ TypeBoolean = "Boolean"
adtCtrSuffix _ (TypeArray _) = "Array"
adtCtrSuffix _ (TypeObject _) = "Object"
adtCtrSuffix _ (TypeNullable _) = "Nullable"
adtCtrSuffix modName (TypeRef {moduleName, k8sTypeName}) | modulesMatch modName moduleName =
  k8sTypeName
adtCtrSuffix _ (TypeRef {moduleName, k8sTypeName}) =
  modNameAsStr moduleName <> "." <> k8sTypeName

-- Modules match if they are equal, minus extra head
-- namespaces in one
modulesMatch :: ModuleName -> ModuleName -> Boolean
modulesMatch fileModule refModule =
  NonEmptyList.zip (NonEmptyList.reverse refModule) (NonEmptyList.reverse fileModule)
  # all (\(Tuple a b) -> a == b)

objectDocs :: Maybe String -> Array OptionalField -> String
objectDocs desc fields =
  formatDescription desc <>
  maybe "" (const "-- |\n") desc <>
  fieldDocs fields <> "\n"

fieldDocs :: Array OptionalField -> String
fieldDocs [] = ""
fieldDocs fields =
  "-- | Fields:\n" <>
  prefix <> (String.joinWith ("\n" <> prefix) $ formatField <$> fields)
  where
    prefix = "-- | - "
    formatField {name, description} = "`" <> name <> "`" <> formatFieldDesc description
    formatFieldDesc (Just d) = ": " <> fixNewlines d
    formatFieldDesc Nothing = ""
    fixNewlines = String.joinWith "\n-- |    " <<< String.split (String.Pattern "\n")

formatDescription :: Maybe String -> String
formatDescription Nothing = ""
formatDescription (Just d) = "-- | " <> fixNewlines d <> "\n"
  where
    fixNewlines = String.joinWith "\n-- | " <<< String.split (String.Pattern "\n")

deriveNewtype :: String -> String
deriveNewtype name = "derive instance newtype" <> name <> " :: Newtype " <> name <> " _"

typeClassBoilerplate :: String -> Array String -> Maybe String -> Maybe String -> String
typeClassBoilerplate name fieldNames kind version = 
  "derive instance generic" <> name <> " :: Generic " <> name <> " _" <> "\n" <>
  "instance show" <> name <> " :: Show " <> name <> " where show a = genericShow a" <> "\n" <>
  decodeInstance name fieldNames kind version <>
  encodeInstance name fieldNames kind version
  
decodeInstance :: String -> Array String -> Maybe String -> Maybe String -> String
decodeInstance name fieldNames kind version = 
  "instance decode" <> name <> " :: Decode " <> name <> " where\n" <>
  "  decode a = do" <> decodeFields <> "\n" <>
  "               pure $ " <> name <> " { " <> fields <> " }\n"
  where
    fieldPrefix = "\n               "
    decodeFields = fieldPrefix <> (String.joinWith fieldPrefix $ decodeField <$> fieldNames)
    fields = (String.joinWith ", " <<< Array.filter (not isUnused)) fieldNames
    isUnused = ((const $ isJust kind) && eq "kind")
      || ((const $ isJust version) && eq "apiVersion")
    decodeField "apiVersion" = case version of
      Just v -> "assertPropEq \"apiVersion\" \"" <> v <> "\" a"
      Nothing -> decodeNormalField "apiVersion"
    decodeField "kind" = case kind of
      Just k -> "assertPropEq \"kind\" \"" <> k <> "\" a"
      Nothing -> decodeNormalField "kind"
    decodeField f = decodeNormalField f
    decodeNormalField f = f <> " <- decodeMaybe \"" <> f <> "\" a"
  
encodeInstance :: String -> Array String -> Maybe String -> Maybe String -> String
encodeInstance name fieldNames kind version = 
  "instance encode" <> name <> " :: Encode " <> name <> " where\n" <>
  "  encode (" <> name <> " a) = encode $ StrMap.fromFoldable $\n" <>
  "               [ " <> encodeFields fieldNames <> " ]\n"
  where
    fieldSep = "\n               , "
    encodeFields = String.joinWith fieldSep <<< map encodeField
    fields = String.joinWith ", " fieldNames
    encodeField "apiVersion" = case version of
      Just v -> "Tuple \"apiVersion\" (encode \"" <> v <> "\")"
      Nothing -> encodeNormalField "apiVersion"
    encodeField "kind" = case kind of
      Just k -> "Tuple \"kind\" (encode \"" <> k <> "\")"
      Nothing -> encodeNormalField "kind"
    encodeField f = encodeNormalField f
    encodeNormalField f = "Tuple \"" <> f <> "\" (encodeMaybe a." <> f <> ")"

genericTypeClassBoilerplate :: String -> String
genericTypeClassBoilerplate name = 
  "derive instance generic" <> name <> " :: Generic " <> name <> " _" <> "\n" <>
  "instance show" <> name <> " :: Show " <> name <> " where show a = genericShow a" <> "\n" <>
  "instance decode" <> name <> " :: Decode " <> name <> " where\n" <>
  "  decode a = genericDecode jsonOptions " <> "a \n" <>
  "instance encode" <> name <> " :: Encode " <> name <> " where\n" <>
  "  encode a = genericEncode jsonOptions a"
  
adtTypeClassBoilerplate :: Partial => String -> String
adtTypeClassBoilerplate "IntOrString" = """
derive instance genericIntOrString :: Generic IntOrString _
instance showIntOrString :: Show IntOrString where show = genericShow
instance decodeIntOrString :: Decode IntOrString where
  decode f = (IntOrStringInt <$> decode f) <|> (IntOrStringString <$> decode f)
instance encodeIntOrString :: Encode IntOrString where
  encode (IntOrStringString s) = encode s
  encode (IntOrStringInt i) = encode i"""
adtTypeClassBoilerplate name =
  unsafeCrashWith $ "No ADT boilerplate defined for ADT type '" <> name <> "'"

defaultInstance :: String -> Array String -> String
defaultInstance name fieldNames =
  "instance default" <> name <> " :: Default " <> name <> " where\n" <>
  "  default = " <> name <> "\n" <> defaultRecordValue 4 fieldNames

defaultRecordNameAndValue :: String -> Array String -> String
defaultRecordNameAndValue typeName fieldNames =
  valName <> " :: " <> typeName <> "\n" <>
  valName <> " =\n" <>
  defaultRecordValue 2 fieldNames
  where
    valName = lowercaseFirstChar typeName
  
defaultRecordValue :: Int -> Array String -> String
defaultRecordValue indents fieldNames = indentStr <> "{ " <> fieldVals  <> " }"
  where
    fieldVals = String.joinWith ("\n" <> indentStr <> ", ") $ defaultFieldValue <$> fieldNames
    indentStr = fold $ Array.replicate indents " "

defaultFieldValue :: String -> String
defaultFieldValue name = name <> ": Nothing"

emitImport :: String -> String
emitImport i = "import " <> i
