module Kubernetes.Generation.TypeGeneration where

import Prelude

import Data.Array as Array
import Data.Bifunctor (lmap)
import Data.Foldable (elem, find, foldl)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (unwrap)
import Data.NonEmpty as NonEmpty
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.String as String
import Data.Tuple (Tuple(..), fst)
import Debug.Trace as Debug
import Kubernetes.Generation.AST as AST
import Kubernetes.Generation.JsonSchema (Schema(..), SchemaType(..), TypeValidator(..))
import Kubernetes.Generation.Names (apiModule, jsonFieldToPsField, modulePrefix, refName, startsWith, typeModule)
import Partial.Unsafe (unsafeCrashWith)
import Unsafe.Coerce (unsafeCoerce)

type KubernetesSchema =
  { name :: String
  , schema :: Schema }

type GeneratedSchema =
  { output :: AST.Declaration, lenses :: Array String }

generateTypeForSchema :: Partial => String -> String -> Schema -> Maybe GeneratedSchema
generateTypeForSchema mod qualifiedName (Schema {description, properties: (NullOrUndefined (Just properties))}) =
  Just {output, lenses: fst <$> sortedFields}
  where
    output = AST.NewtypeDecl $ AST.ObjectType
      { description: unwrap description
      , qualifiedName
      , fields: genField <$> sortedFields }
    sortedFields = properties
      # StrMap.toUnfoldable
      # Array.sortWith fst
      # map (lmap jsonFieldToPsField)
    genField t@(Tuple name _) = generateField mod t
generateTypeForSchema mod qualifiedName (Schema {description, oneOf: NullOrUndefined (Just schemas)}) =
  Just {output, lenses: []}
  where
    output = AST.AdtType
      { description: unwrap description
      , qualifiedName
      , constructors: constructors }
    constructors = generateType mod <$> schemas
generateTypeForSchema mod qualifiedName s@(Schema { description
                                                  , _type: NullOrUndefined (Just _)
                                                  , format: NullOrUndefined (Just "int-or-string")}) =
  Just {output, lenses: []}
  where
    output = AST.AdtType
      { description: unwrap description
      , qualifiedName
      , constructors: [AST.TypeString, AST.TypeInt] }
generateTypeForSchema mod qualifiedName s@(Schema {description, _type: NullOrUndefined (Just _)}) =
  Just {output, lenses: []}
  where
    output = AST.AliasType
      { description: unwrap description
      , qualifiedName
      , innerType }
    innerType = generateType mod s
generateTypeForSchema _ _ (Schema { description: NullOrUndefined (Just _)
                                  , _type: NullOrUndefined Nothing
                                  , additionalProperties: NullOrUndefined Nothing
                                  , items: NullOrUndefined Nothing
                                  , oneOf: NullOrUndefined Nothing
                                  , properties: NullOrUndefined Nothing
                                  , ref: NullOrUndefined Nothing
                                  , required: NullOrUndefined Nothing }) = Nothing
generateTypeForSchema _ _ (Schema { description: NullOrUndefined (Just d) })
  | startsWith "Deprecated" d = Nothing
generateTypeForSchema _ name schema =
  unsafeCrashWith $ "Could not generate type for schema " <> name <>
    "\n  Missing fields needed for generation\n" <> (unsafeCoerce $ Debug.spy schema)

generateField :: Partial => String -> Tuple String Schema -> AST.OptionalField
generateField mod (Tuple name schema) = {description: Nothing, name, innerType}
  where
    innerType = generateType mod schema

generateType :: Partial => String -> Schema -> AST.TypeDecl
generateType _ (Schema {_type: NullOrUndefined (Just (TypeValidatorString SchemaString))}) = AST.TypeString
generateType _ (Schema {_type: NullOrUndefined (Just (TypeValidatorString SchemaNumber))}) = AST.TypeNumber
generateType _ (Schema {_type: NullOrUndefined (Just (TypeValidatorString SchemaInteger))}) = AST.TypeInt
generateType _ (Schema {_type: NullOrUndefined (Just (TypeValidatorString SchemaBoolean))}) = AST.TypeBoolean
generateType mod (Schema { _type: NullOrUndefined (Just (TypeValidatorString SchemaArray))
                         , items: NullOrUndefined (Just inner)}) =
  AST.TypeArray (generateType mod inner)
generateType mod (Schema {_type: NullOrUndefined (Just (TypeValidatorString SchemaObject)),
                      additionalProperties: NullOrUndefined (Just valType)})
  = AST.TypeObject (generateType mod valType)
generateType mod s@(Schema {_type: NullOrUndefined (Just (TypeValidatorArray arr))})
  | elem SchemaNull arr && Array.length arr == 2
  = AST.TypeNullable (typeName mod s (TypeValidatorString innerType))
    where
      innerType = fromMaybe SchemaNull $ find ((/=) SchemaNull) arr
generateType mod (Schema {ref: NullOrUndefined (Just fullyQualifiedName)})
  = AST.TypeRef (refName mod fullyQualifiedName)
generateType _ s = unsafeCrashWith $ "Could not generate type for schema " <> show s

typeName :: Partial => String -> Schema -> TypeValidator -> AST.TypeDecl
typeName _ _ (TypeValidatorString SchemaString) = AST.TypeString
typeName _ _ (TypeValidatorString SchemaNumber) = AST.TypeNumber
typeName _ _ (TypeValidatorString SchemaInteger) = AST.TypeInt
typeName _ _ (TypeValidatorString SchemaBoolean) = AST.TypeBoolean
typeName mod (Schema {items: NullOrUndefined (Just s)}) (TypeValidatorString SchemaArray) =
  AST.TypeArray (generateType mod s)
typeName _ s _ = unsafeCrashWith $ "Could not get type name for schema " <> show s

sharedImports :: String -> String -> Array String -> Array String
sharedImports moduleNs moduleName deps =
  [ "Prelude"
  , "Control.Alt ((<|>))"
  , "Data.Foreign.Class (class Decode, class Encode, decode, encode)"
  , "Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)"
  , "Data.Foreign.Generic.Types (Options)"
  , "Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))"
  , "Data.Generic.Rep (class Generic)"
  , "Data.Generic.Rep.Show (genericShow)"
  , "Data.Maybe (Maybe(Just,Nothing))"
  , "Data.Newtype (class Newtype)"
  , "Data.StrMap (StrMap)"
  , "Kubernetes.Default (class Default)"
  , "Kubernetes.Json (jsonOptions)" ] <> depImports
  where
    depImports = mkImport <$> deps
    mkImport modName = moduleNs <> "." <> modName <> " as " <> modName

generateApiTypes :: Partial => String -> Array KubernetesSchema -> AST.ApiAst
generateApiTypes moduleNs schemas = {modules: k8sTypeModules <> [lensModule]}
  where
    modules = groupSchemasByModule schemas
    moduleNames = StrMap.keys modules
    generated = StrMap.values $ mapWithIndex (generateModule moduleNs moduleNames) modules
    k8sTypeModules = _.output <$> generated
    lensNames = Array.nub $ Array.concat $ _.lenses <$> generated
    lensModule = generateLensModule moduleNs lensNames
    
    dumpModule :: Tuple String (Array KubernetesSchema) -> String
    dumpModule (Tuple mod arr) = mod <> "\n" <> (String.joinWith "\n" (_.name <$> arr))

type GeneratedModule =
  { output :: AST.ApiModule, lenses :: Array String }

generateLensModule :: String -> Array String -> AST.ApiModule
generateLensModule moduleNs lensNames =
  { name: moduleNs <> ".Lens"
  , imports:
    [ "Prelude"
    , "Data.Lens (Lens')"
    , "Data.Lens.Iso.Newtype (_Newtype)"
    , "Data.Lens.Record (prop)"
    , "Data.Maybe (Maybe(Just,Nothing))"
    , "Data.Newtype (class Newtype)"
    , "Data.Symbol (SProxy(SProxy))"
    , "Kubernetes.Default (class Default)" ]
    , declarations }
  where
    declarations = (\name -> AST.LensHelper {name}) <$> sortedLenses
    sortedLenses = Array.sort lensNames

generateModule :: Partial => String -> Array String -> String -> Array KubernetesSchema -> GeneratedModule
generateModule moduleNs allModules moduleName schemas = { output: mod, lenses }
  where
    mod =
      { name: moduleNs <> "." <> moduleName
      , imports: sharedImports moduleNs moduleName moduleDeps
      , declarations: typeDeclarations }
    typeDeclarations = _.output <$> typeOutputs
    typeOutputs = Array.catMaybes $ (\({name, schema}) -> generateTypeForSchema moduleName name schema) <$> schemas
    lenses = Array.nub $ Array.concat $ _.lenses <$> typeOutputs
    moduleRefs = Array.catMaybes $ typeModule <$> (schemas >>= (schemaRefs <<< _.schema))
    moduleDeps = Array.filter ((/=) moduleName) $ Array.nub moduleRefs

schemaRefs :: Schema -> Array String
schemaRefs (Schema {additionalProperties, items, oneOf: _oneOf, properties, ref}) =
  extract ref <> (childSchemas >>= schemaRefs)
  where
    childSchemas :: Array Schema
    childSchemas = join (extract _oneOf) <>
                   extract additionalProperties <>
                   extract items <>
                   extractMap properties

    extract :: forall a. NullOrUndefined a -> Array a
    extract (NullOrUndefined (Just v)) = [v]
    extract (NullOrUndefined Nothing) = []

    extractMap :: forall a. NullOrUndefined (StrMap a) -> Array a
    extractMap (NullOrUndefined (Just v)) = StrMap.values v
    extractMap (NullOrUndefined Nothing) = []

groupSchemasByModule :: forall f. Partial => Array {name :: String | f} -> StrMap (Array {name :: String | f})
groupSchemasByModule schemas = case StrMap.lookup "Unknown" groups of
  Just unknown -> let unknownNames = modNames unknown
                  in unsafeCrashWith $
                    "No module found for " <> show (Array.length unknown) <>
                    " names: \n" <> String.joinWith "\n" unknownNames <>
                    "\n -> " <> show (Array.length unknownNames) <> " modules not found"
  Nothing -> groups
  where
    groups = StrMap.fromFoldable tupleGroups
    tupleGroups = mkTupleGroup <$> arrayGroups
    arrayGroups = Array.groupBy byNamePrefix $ Array.sortWith (\{name} -> moduleName name) schemas
    mkTupleGroup group = foldl
                         (\(Tuple n xs) x -> Tuple n (xs <> [x]))
                         (Tuple (groupName group) [])
                         group
    groupName g = moduleName (NonEmpty.head g).name
    moduleName n = case apiModule n of
                     Just mod -> mod
                     Nothing -> "Unknown"
    modNames = Array.sort <<< Array.nub <<< (map $ modulePrefix <<< _.name)

byNamePrefix :: forall f. {name :: String | f} -> {name :: String | f} -> Boolean
byNamePrefix {name: name1} {name: name2} = apiModule name1 == apiModule name2
