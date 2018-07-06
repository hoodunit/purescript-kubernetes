module Kubernetes.Generation.GenerateDefinitions where

import Prelude

import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmptyArray
import Data.Foldable (find, foldl)
import Data.Maybe (Maybe(..))
import Data.NonEmpty (NonEmpty)
import Data.NonEmpty as NonEmpty
import Data.String as String
import Data.Tuple (Tuple(..), fst, uncurry)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Generation.AST as AST
import Kubernetes.Generation.GenerateSchemaType (generateTypeForSchema)
import Kubernetes.Generation.JsonSchema (Schema(..), SchemaRef(..))
import Kubernetes.Generation.Names (apiModule, modulePrefix)
import Partial.Unsafe (unsafeCrashWith)

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
  , imports: sharedImports
  , declarations }
  where
    declarations = schemas
      # map (\({name, schema}) -> generateTypeForSchema moduleName (AST.K8SQualifiedName name) schema)
      # Array.catMaybes

sharedImports :: Array AST.Import
sharedImports = AST.RawImport <$>
  [ "Prelude"
  , "Control.Alt ((<|>))"
  , "Foreign.Class (class Decode, class Encode, decode, encode)"
  , "Foreign.Generic (defaultOptions, genericDecode, genericEncode)"
  , "Foreign.Generic.Types (Options)"
  , "Foreign.Index (readProp)"
  , "Data.Generic.Rep (class Generic)"
  , "Data.Generic.Rep.Show (genericShow)"
  , "Data.Maybe (Maybe(Just,Nothing))"
  , "Data.Newtype (class Newtype)"
  , "Data.Tuple (Tuple(Tuple))"
  , "Foreign.Object (Object)"
  , "Foreign.Object as Object"
  , "Kubernetes.Default (class Default)"
  , "Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)" ]

schemaRefs :: Schema -> Array SchemaRef
schemaRefs (Schema {additionalProperties, items, oneOf: _oneOf, properties, ref}) =
  extract ref <> (childSchemas >>= schemaRefs)
  where
    childSchemas :: Array Schema
    childSchemas = join (extract _oneOf) <>
                   extract additionalProperties <>
                   extract items <>
                   extractMap properties

    extract :: forall a. Maybe a -> Array a
    extract (Just v) = [v]
    extract Nothing = []

    extractMap :: forall a. Maybe (Object a) -> Array a
    extractMap (Just v) = Object.values v
    extractMap Nothing = []

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

    arrayGroups :: Array (NonEmptyArray {name :: String | f})
    arrayGroups = schemas
      # Array.sortWith (\{name} -> moduleName name)
      # Array.groupBy byNamePrefix

    mkTupleGroup :: NonEmptyArray {name :: String | f}
      -> (Tuple AST.ModuleName (Array {name :: String | f}))
    mkTupleGroup group = foldl
                         (\(Tuple n xs) x -> Tuple n (xs <> [x]))
                         (Tuple (groupName group) [])
                         group

    groupName :: NonEmptyArray {name :: String | f} -> AST.ModuleName
    groupName g = moduleName (NonEmptyArray.head g).name

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
