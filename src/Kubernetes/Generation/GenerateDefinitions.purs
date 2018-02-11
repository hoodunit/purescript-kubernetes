module Kubernetes.Generation.GenerateDefinitions where

import Prelude

import Data.Array as Array
import Data.Bifunctor (lmap)
import Data.Foldable (any, elem, find, foldl)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.FunctorWithIndex (mapWithIndex)
import Data.List.NonEmpty as NonEmptyList
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (unwrap)
import Data.NonEmpty (NonEmpty(..))
import Data.NonEmpty as NonEmpty
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.String as String
import Data.Tuple (Tuple(..), fst, uncurry)
import Debug.Trace as Debug
import Kubernetes.Generation.AST as AST
import Kubernetes.Generation.GenerateSchemaType (generateTypeForSchema)
import Kubernetes.Generation.JsonSchema (Schema(..), SchemaRef(..), SchemaType(..), TypeValidator(..))
import Kubernetes.Generation.Names (apiModule, modNameAsQualifiedStr, modNameAsStr, modulePrefix, schemaRefToQualifiedName)
import Partial.Unsafe (unsafeCrashWith)
import Unsafe.Coerce (unsafeCoerce)

type KubernetesSchema =
  { name :: String
  , schema :: Schema }

type GeneratedModule =
  { output :: AST.Module, lenses :: Array String }

generateDefinitionModules :: Partial => AST.ModuleName -> Array KubernetesSchema -> Array AST.Module
generateDefinitionModules moduleNs schemas = k8sTypeModules <> [lensModule]
  where
    modules = groupSchemasByModule schemas
    moduleNames = fst <$> modules
    generated = (uncurry $ generateModule moduleNs moduleNames) <$> modules
    k8sTypeModules = _.output <$> generated
    lensNames = Array.nub $ Array.concat $ _.lenses <$> generated
    lensModule = generateLensModule moduleNs lensNames
    
    dumpModule :: Tuple String (Array KubernetesSchema) -> String
    dumpModule (Tuple mod arr) = mod <> "\n" <> (String.joinWith "\n" (_.name <$> arr))

generateLensModule :: AST.ModuleName -> Array String -> AST.Module
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

generateModule :: Partial => AST.ModuleName -> Array AST.ModuleName -> AST.ModuleName -> Array KubernetesSchema -> GeneratedModule
generateModule moduleNs allModules moduleName schemas = { output: mod, lenses }
  where
    mod =
      { name: moduleNs <> moduleName
      , imports: sharedImports moduleNs moduleDeps
      , declarations: typeDeclarations }
    typeDeclarations = _.output <$> typeOutputs
    typeOutputs =
      schemas
      # map (\({name, schema}) -> generateTypeForSchema moduleName (AST.K8SQualifiedName name) schema)
      # Array.catMaybes
    lenses = typeOutputs
      # map _.lenses
      # Array.concat
      # Array.nub
    moduleDeps =
      schemas
      # map _.schema
      >>= schemaRefs
      # map schemaRefToQualifiedName
      # Array.catMaybes
      # map _.moduleName
      # Array.nub
      # Array.filter ((/=) moduleName)

sharedImports :: AST.ModuleName -> Array AST.ModuleName -> Array String
sharedImports moduleNs deps =
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
    depImports = deps
      # Array.sort
      # Array.nub
      # map mkImport
    mkImport modName = modNameAsQualifiedStr (moduleNs <> modName) <>
                       " as " <> modNameAsStr modName

schemaRefs :: Schema -> Array SchemaRef
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

groupSchemasByModule :: forall f. Partial => Array {name :: String | f}
  -> (Array (Tuple AST.ModuleName (Array {name :: String | f})))
groupSchemasByModule schemas = case find (eq (pure "Unknown") <<< fst) groups of
  Just (Tuple _ unknowns) -> let unknownNames = modNames unknowns
    in unsafeCrashWith $
      "No module found for " <> show (Array.length unknowns) <>
      " names: \n" <> String.joinWith "\n" unknownNames <>
      "\n -> " <> show (Array.length unknownNames) <> " modules not found"
  Nothing -> groups
  where
    groups :: Array (Tuple AST.ModuleName (Array {name :: String | f}))
    groups = mkTupleGroup <$> arrayGroups

    arrayGroups :: Array (NonEmpty Array {name :: String | f})
    arrayGroups = schemas
      # Array.sortWith (\{name} -> moduleName name)
      # Array.groupBy byNamePrefix

    mkTupleGroup :: NonEmpty Array {name :: String | f}
      -> (Tuple AST.ModuleName (Array {name :: String | f}))
    mkTupleGroup group = foldl
                         (\(Tuple n xs) x -> Tuple n (xs <> [x]))
                         (Tuple (groupName group) [])
                         group

    groupName :: NonEmpty Array {name :: String | f} -> AST.ModuleName
    groupName g = moduleName (NonEmpty.head g).name

    moduleName :: String -> AST.ModuleName
    moduleName n = case apiModule (AST.K8SQualifiedName n) of
                     Just mod -> mod
                     Nothing -> pure "Unknown"
    modNames :: Array {name :: String | f} -> Array String
    modNames =
      map (modulePrefix <<< AST.K8SQualifiedName <<< _.name)
      >>> Array.nub
      >>> Array.sort

byNamePrefix :: forall f. {name :: String | f} -> {name :: String | f} -> Boolean
byNamePrefix {name: name1} {name: name2} =
  apiModule (AST.K8SQualifiedName name1) == apiModule (AST.K8SQualifiedName name2)
