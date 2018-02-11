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

generateDefinitionModules :: Partial => Array KubernetesSchema -> Array AST.Module
generateDefinitionModules schemas = k8sTypeModules
  where
    k8sTypeModules = (uncurry $ generateModule moduleNames) <$> modules
    modules = groupSchemasByModule schemas
    moduleNames = fst <$> modules
    
    dumpModule :: Tuple String (Array KubernetesSchema) -> String
    dumpModule (Tuple mod arr) = mod <> "\n" <> (String.joinWith "\n" (_.name <$> arr))

generateModule :: Partial => Array AST.ModuleName -> AST.ModuleName -> Array KubernetesSchema -> AST.Module
generateModule allModules moduleName schemas =
  { name: moduleName
  , imports: sharedImports moduleDeps
  , declarations }
  where
    declarations = schemas
      # map (\({name, schema}) -> generateTypeForSchema moduleName (AST.K8SQualifiedName name) schema)
      # Array.catMaybes
    moduleDeps =
      schemas
      # map _.schema
      >>= schemaRefs
      # map schemaRefToQualifiedName
      # Array.catMaybes
      # map _.moduleName
      # Array.nub
      # Array.filter ((/=) moduleName)

sharedImports :: Array AST.ModuleName -> Array AST.Import
sharedImports deps =
  [ AST.RawImport "Prelude"
  , AST.RawImport "Control.Alt ((<|>))"
  , AST.RawImport "Data.Foreign.Class (class Decode, class Encode, decode, encode)"
  , AST.RawImport "Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)"
  , AST.RawImport "Data.Foreign.Generic.Types (Options)"
  , AST.RawImport "Data.Foreign.Index (readProp)"
  , AST.RawImport "Data.Generic.Rep (class Generic)"
  , AST.RawImport "Data.Generic.Rep.Show (genericShow)"
  , AST.RawImport "Data.Maybe (Maybe(Just,Nothing))"
  , AST.RawImport "Data.Newtype (class Newtype)"
  , AST.RawImport "Data.StrMap (StrMap)"
  , AST.RawImport "Data.StrMap as StrMap"
  , AST.RawImport "Data.Tuple (Tuple(Tuple))"
  , AST.RawImport "Kubernetes.Default (class Default)"
  , AST.RawImport "Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)" ] <>
  depImports
  where
    depImports = deps
      # Array.sort
      # Array.nub
      # map (\i -> AST.K8SImport {parentModule: Nothing, k8sModule: i})

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
