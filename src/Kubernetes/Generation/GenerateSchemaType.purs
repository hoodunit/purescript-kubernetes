module Kubernetes.Generation.GenerateSchemaType where

import Prelude

import Data.Array as Array
import Data.Bifunctor (lmap)
import Data.Foldable (elem, find)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (unwrap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(..))
import Data.Tuple as Tuple
import Debug.Trace as Debug
import Kubernetes.Generation.AST as AST
import Kubernetes.Generation.JsonSchema (Schema(..), SchemaType(..), TypeValidator(..))
import Kubernetes.Generation.Names (jsonFieldToPsField, refName, startsWith)
import Partial.Unsafe (unsafeCrashWith)
import Unsafe.Coerce (unsafeCoerce)

type GeneratedSchema =
  { output :: AST.Declaration, lenses :: Array String }

generateTypeForSchema :: Partial => String -> String -> Schema -> Maybe GeneratedSchema
generateTypeForSchema mod qualifiedName (Schema {description, properties: (NullOrUndefined (Just properties)), "x-kubernetes-group-version-kind": (NullOrUndefined groupVersionKind)}) =
  Just {output, lenses: Tuple.fst <$> sortedFields}
  where
    output = AST.NewtypeDecl $ AST.ObjectType
      { description: unwrap description
      , groupVersionKind: fromMaybe [] groupVersionKind
      , qualifiedName
      , fields: generateField mod <$> sortedFields }
    sortedFields = sortFields properties
    sortFields = StrMap.toUnfoldable
      >>> Array.sortWith Tuple.fst
      >>> map (lmap jsonFieldToPsField)
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
generateField mod (Tuple name schema@(Schema {description: d})) = {description: unwrap d, name, innerType}
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
