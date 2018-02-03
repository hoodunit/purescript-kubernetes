module Kubernetes.Generation.GenerateDefinitions where

import Prelude

import Data.Array as Array
import Data.Bifunctor (lmap)
import Data.Foldable (elem, find, foldl)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.FunctorWithIndex (mapWithIndex)
import Data.List.NonEmpty as NonEmptyList
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (unwrap)
import Data.NonEmpty as NonEmpty
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.String as String
import Data.Tuple (Tuple(..), fst)
import Debug.Trace as Debug
import Kubernetes.Generation.AST as AST
import Kubernetes.Generation.GenerateSchemaType (generateTypeForSchema)
import Kubernetes.Generation.JsonSchema (Schema(..), SchemaType(..), TypeValidator(..))
import Kubernetes.Generation.Names (apiModule, jsonFieldToPsField, modulePrefix, refName, startsWith, typeModule)
import Partial.Unsafe (unsafeCrashWith)
import Unsafe.Coerce (unsafeCoerce)

type KubernetesSchema =
  { name :: String
  , schema :: Schema }

type GeneratedModule =
  { output :: AST.ApiModule, lenses :: Array String }

generateDefinitionModules :: Partial => AST.ApiModuleName -> Array KubernetesSchema -> Array AST.ApiModule
generateDefinitionModules moduleNs schemas = k8sTypeModules <> [lensModule]
  where
    modules = groupSchemasByModule schemas
    moduleNames = StrMap.keys modules
    generated = StrMap.values $ mapWithIndex (generateModule moduleNs moduleNames) modules
    k8sTypeModules = _.output <$> generated
    lensNames = Array.nub $ Array.concat $ _.lenses <$> generated
    lensModule = generateLensModule moduleNs lensNames
    
    dumpModule :: Tuple String (Array KubernetesSchema) -> String
    dumpModule (Tuple mod arr) = mod <> "\n" <> (String.joinWith "\n" (_.name <$> arr))

generateLensModule :: AST.ApiModuleName -> Array String -> AST.ApiModule
generateLensModule moduleNs lensNames =
  { name: NonEmptyList.snoc moduleNs "Lens"
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

generateModule :: Partial => AST.ApiModuleName -> Array String -> String -> Array KubernetesSchema -> GeneratedModule
generateModule moduleNs allModules moduleName schemas = { output: mod, lenses }
  where
    mod =
      { name: NonEmptyList.snoc moduleNs moduleName
      , imports: sharedImports moduleNs moduleName moduleDeps
      , declarations: typeDeclarations }
    typeDeclarations = _.output <$> typeOutputs
    typeOutputs = Array.catMaybes $ (\({name, schema}) -> generateTypeForSchema moduleName name schema) <$> schemas
    lenses = Array.nub $ Array.concat $ _.lenses <$> typeOutputs
    moduleRefs = Array.catMaybes $ typeModule <$> (schemas >>= (schemaRefs <<< _.schema))
    moduleDeps = Array.filter ((/=) moduleName) $ Array.nub moduleRefs

sharedImports :: AST.ApiModuleName -> String -> Array String -> Array String
sharedImports moduleNs moduleName deps =
  [ "Prelude"
  , "Control.Alt ((<|>))"
  , "Data.Foreign.Class (class Decode, class Encode, decode, encode)"
  , "Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)"
  , "Data.Foreign.Generic.Types (Options)"
  , "Data.Foreign.Index (readProp)"
  , "Data.Generic.Rep (class Generic)"
  , "Data.Generic.Rep.Show (genericShow)"
  , "Data.Maybe (Maybe(Just,Nothing))"
  , "Data.Newtype (class Newtype)"
  , "Data.StrMap (StrMap)"
  , "Data.StrMap as StrMap"
  , "Data.Tuple (Tuple(Tuple))"
  , "Kubernetes.Default (class Default)"
  , "Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)" ] <> depImports
  where
    depImports = mkImport <$> deps
    moduleAsStr = String.joinWith "." <<< NonEmptyList.toUnfoldable
    mkImport modName = moduleAsStr moduleNs <> "." <> modName <> " as " <> modName

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
