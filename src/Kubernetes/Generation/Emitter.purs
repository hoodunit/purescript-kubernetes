module Kubernetes.Generation.Emitter where

import Kubernetes.Generation.AST
import Prelude

import Data.Array as Array
import Data.Foldable (fold)
import Data.List.NonEmpty as NonEmpty
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Data.String as String
import Kubernetes.Generation.Names (lowercaseFirstChar, startsWith, startsWithUpperCase, typeUnqualifiedName)
import Partial.Unsafe (unsafeCrashWith)

emitTypeDecl :: TypeDecl -> String
emitTypeDecl TypeString = "String"
emitTypeDecl TypeNumber = "Number"
emitTypeDecl TypeInt = "Int"
emitTypeDecl TypeBoolean = "Boolean"
emitTypeDecl (TypeArray t) = "(Array " <> emitTypeDecl t <> ")"
emitTypeDecl (TypeNullable t) = "(Nullable " <> emitTypeDecl t <> ")"
emitTypeDecl (TypeObject t) = "(StrMap " <> emitTypeDecl t <> ")"
emitTypeDecl (TypeRef t) = t

emitOptionalField :: OptionalField -> String
emitOptionalField {name, innerType} =
  sanitizedName <> " :: " <> "(Maybe " <> emitTypeDecl innerType <> ")"
  where
    sanitizedName = if startsWithUpperCase name then "\"" <> name <> "\"" else name

emitDeclaration :: Partial => Declaration -> String
emitDeclaration (NewtypeDecl (ObjectType {qualifiedName, description, fields})) =
  docs <>
    "newtype " <> name <> " = " <> name <> "\n" <>
    "  { " <> fieldDecls <>
    " }" <>
    "\n\n" <> deriveNewtype name <>
    "\n" <> typeClassBoilerplate name fieldNames <>
    "\n\n" <> defaultInstance name fieldNames
  where
    docs = objectDocs description fields
    sortedFields = Array.sortWith (_.name) fields
    fieldDecls = String.joinWith "\n  , " (emitOptionalField <$> sortedFields)
    fieldNames = _.name <$> sortedFields
    name = typeUnqualifiedName qualifiedName
emitDeclaration (RecordDecl (ObjectType {qualifiedName, description, fields})) =
  docs <>
    "type " <> name <> " =\n" <>
    "  { " <> fieldDecls <>
    " }" <>
    "\n\n" <> defaultRecordNameAndValue name fieldNames
  where
    docs = objectDocs description fields
    sortedFields = Array.sortWith (_.name) fields
    fieldDecls = String.joinWith "\n  , " (emitOptionalField <$> sortedFields)
    fieldNames = _.name <$> sortedFields
    name = typeUnqualifiedName qualifiedName
emitDeclaration (AdtType {qualifiedName, description, constructors}) =
  docs <>
    "data " <> name <> " = \n  " <> constructorDecls <>
    "\n\n" <> adtTypeClassBoilerplate name
  where
    docs = formatDescription description
    constructorDecls = String.joinWith "\n  | " (mkConstructor <$> constructors)
    mkConstructor t = name <> adtCtrSuffix t <> " " <> emitTypeDecl t
    name = typeUnqualifiedName qualifiedName
emitDeclaration (AliasType {qualifiedName, description, innerType}) =
  docs <>
    "newtype " <> name <> " = " <> name <> " " <> emitTypeDecl innerType <>
    "\n\n" <> deriveNewtype name <>
    "\n" <> genericTypeClassBoilerplate name
  where
    docs = formatDescription description
    name = typeUnqualifiedName qualifiedName
emitDeclaration (LensHelper {name}) =
  underscoreName <> " :: forall s a r. Newtype s { " <> name <> " :: a | r } => Lens' s a\n" <>
  underscoreName <> " = _Newtype <<< prop (SProxy :: SProxy \"" <> name <> "\")"
  where
    underscoreName = if startsWith "_" name then name else "_" <> name
emitDeclaration (Endpoint
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
  name <> " " <> paramNamesStr <> "= makeRequest (" <> methodCall <> ")\n" <>
  "  where\n" <>
  "    url = " <> buildUrlStr <>
  buildBodyStr body
  where
    optionsDecl (Just params) = emitDeclaration (NewtypeDecl params) <> "\n\n"
    optionsDecl Nothing = ""
    
    fnParamTypes = (String.joinWith " -> " allFnParamTypes) <>
                   (if Array.null allFnParamTypes then "" else " -> ")
    allFnParamTypes = ["Config"] <> urlTypes <> bodyTypes <> optionsTypes
    urlTypes = const "String" <$> paramNames
    bodyTypes = maybe [] (\b -> [emitTypeDecl b]) body
    optionsTypes = maybe [] (\o -> [typeUnqualifiedName ((unwrap o).qualifiedName)]) queryParams
    
    returnType' = "(Either MetaV1.Status " <> emitTypeDecl returnType <> ")"
    
    paramNamesStr = (String.joinWith " " (["cfg"] <> paramNames <> bodyNames <> optionsName)) <> " "
    paramNames = urlParamNames urlWithParams
    bodyNames = maybe [] (const ["body"]) body
    optionsName = const "options" <$> optionsTypes

    methodCall = methodName method <> " cfg url" <> maybe " Nothing" (const " (Just encodedBody)") body
    
    buildUrlStr = urlBuilderStr urlWithParams <> formatQueryStr queryParams
    formatQueryStr = maybe "" (const " <> formatQueryString options") 
    buildBodyStr = maybe "" (const "\n    encodedBody = encodeJSON body")

methodName :: HttpMethod -> String
methodName GET = "get"
methodName DELETE = "delete"
methodName HEAD = "head"
methodName OPTIONS = "options"
methodName PATCH = "patch"
methodName POST = "post"
methodName PUT = "put"

urlParamNames :: UrlWithParams -> Array String
urlParamNames (EndUrl _) = []
urlParamNames (UrlChunk _ name rest) = [name] <> urlParamNames rest

urlBuilderStr :: UrlWithParams -> String
urlBuilderStr (EndUrl s) = "\"" <> s <> "\""
urlBuilderStr (UrlChunk chunk paramName rest) = "\"" <> chunk <> "\" <> " <> paramName <> " <> " <> urlBuilderStr rest

adtCtrSuffix :: TypeDecl -> String
adtCtrSuffix TypeString = "String"
adtCtrSuffix TypeNumber = "Number"
adtCtrSuffix TypeInt = "Int"
adtCtrSuffix TypeBoolean = "Boolean"
adtCtrSuffix (TypeArray _) = "Array"
adtCtrSuffix (TypeObject _) = "Object"
adtCtrSuffix (TypeNullable _) = "Nullable"
adtCtrSuffix (TypeRef t) = t

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

typeClassBoilerplate :: String -> Array String -> String
typeClassBoilerplate name fieldNames = 
  "derive instance generic" <> name <> " :: Generic " <> name <> " _" <> "\n" <>
  "instance show" <> name <> " :: Show " <> name <> " where show a = genericShow a" <> "\n" <>
  decodeInstance name fieldNames <>
  encodeInstance name fieldNames
  
decodeInstance :: String -> Array String -> String
decodeInstance name fieldNames = 
  "instance decode" <> name <> " :: Decode " <> name <> " where\n" <>
  "  decode a = do" <> decodeFields <> "\n" <>
  "               pure $ " <> name <> " { " <> fields <> " }\n"
  where
    fieldPrefix = "\n               "
    decodeFields = fieldPrefix <> (String.joinWith fieldPrefix $ decodeField <$> fieldNames)
    fields = String.joinWith ", " fieldNames
    decodeField f = f <> " <- decodeMaybe \"" <> f <> "\" a"
  
encodeInstance :: String -> Array String -> String
encodeInstance name fieldNames = 
  "instance encode" <> name <> " :: Encode " <> name <> " where\n" <>
  "  encode (" <> name <> " a) = encode $ StrMap.fromFoldable $\n" <>
  "               [ " <> encodeFields fieldNames <> " ]\n"
  where
    fieldSep = "\n               , "
    encodeFields = String.joinWith fieldSep <<< map encodeField
    fields = String.joinWith ", " fieldNames
    encodeField f = "Tuple \"" <> f <> "\" (encodeMaybe a." <> f <> ")"

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

emitApiModule :: Partial => ApiModule -> String
emitApiModule {name, imports, declarations} =
  "module " <> moduleName name <> " where\n\n" <>
  emittedImports <> "\n\n" <>
  emittedDecls
  where
    emittedImports = String.joinWith "\n" $ emitImport <$> imports
    emittedDecls = String.joinWith "\n\n" $ emitDeclaration <$> (Array.sort declarations)
    moduleName = String.joinWith "." <<< NonEmpty.toUnfoldable
