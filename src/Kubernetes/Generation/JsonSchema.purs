module Kubernetes.Generation.JsonSchema where

import Prelude

import Control.Alt ((<|>))
import Data.Foreign (F, ForeignError(..), fail, readString)
import Data.Foreign.Class (class Decode, decode)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined)
import Data.StrMap (StrMap)
import Simple.JSON (class ReadForeign)

newtype Schema = Schema
  { _type :: NullOrUndefined TypeValidator
  , additionalProperties :: NullOrUndefined Schema
  , description :: NullOrUndefined String
  , format :: NullOrUndefined String
  , items :: NullOrUndefined Schema
  , oneOf :: NullOrUndefined (Array Schema)
  , properties :: NullOrUndefined (StrMap Schema)
  , ref :: NullOrUndefined String
  , required :: NullOrUndefined (Array String) }
instance readForeignSchema :: ReadForeign Schema where
  readImpl = decode
instance decodeSchema :: Decode Schema where
  decode f = do
    _type <- readProp "type" f >>= decode
    additionalProperties <- readProp "additionalProperties" f >>= decode
    description <- readProp "description" f >>= decode
    format <- readProp "format" f >>= decode
    items <- readProp "items" f >>= decode
    oneOf <- readProp "oneOf" f >>= decode
    properties <- readProp "properties" f >>= decode
    ref <- readProp "$ref" f >>= decode
    required <- readProp "required" f >>= decode
    pure $ Schema { _type, additionalProperties, description, format, items, oneOf, properties, ref, required }
instance showSchema :: Show Schema where
  show (Schema { _type, additionalProperties, description, format, items, oneOf, properties, ref, required }) =
    "{\n  type: " <> show _type <>
    ",\n  additionalProperties: " <> show additionalProperties <>
    ",\n  description: " <> show description <>
    ",\n  format: " <> show format <>
    ",\n  items: " <> show items <>
    ",\n  oneOf: " <> show oneOf <>
    ",\n  properties: " <> show properties <>
    ",\n  ref: " <> show ref <>
    ",\n  required: " <> show required <> "}"

data TypeValidator = TypeValidatorString SchemaType | TypeValidatorArray (Array SchemaType)
instance decodeTypeValidator :: Decode TypeValidator where
  decode f = parseArray <|> parseSingle
    where
      parseArray = TypeValidatorArray <$> (decode f :: F (Array SchemaType))
      parseSingle = TypeValidatorString <$> (decode f :: F SchemaType)
instance showTypeValidator :: Show TypeValidator where
  show (TypeValidatorArray arr) = show arr
  show (TypeValidatorString s) = show s
                        
data SchemaType
  = SchemaObject
  | SchemaArray
  | SchemaString
  | SchemaNumber
  | SchemaInteger
  | SchemaBoolean
  | SchemaNull
instance decodeSchemaType :: Decode SchemaType where
  decode f = do
    decoded <- readString f
    case decoded of
      "object" -> pure SchemaObject
      "array" -> pure SchemaArray
      "string" -> pure SchemaString
      "number" -> pure SchemaNumber
      "integer" -> pure SchemaInteger
      "boolean" -> pure SchemaBoolean
      "null" -> pure SchemaNull
      _ -> fail (JSONError $ "Could not decode value '" <> "' as type SchemaType")
instance showSchemaType :: Show SchemaType where
  show SchemaObject = "\"object\""
  show SchemaArray = "\"array\""
  show SchemaString = "\"string\""
  show SchemaNumber = "\"number\""
  show SchemaInteger = "\"integer\""
  show SchemaBoolean = "\"boolean\""
  show SchemaNull = "\"null\""
instance eqSchemaType :: Eq SchemaType where
  eq SchemaObject SchemaObject = true
  eq SchemaArray SchemaArray = true
  eq SchemaString SchemaString = true
  eq SchemaNumber SchemaNumber = true
  eq SchemaInteger SchemaInteger = true
  eq SchemaBoolean SchemaBoolean = true
  eq SchemaNull SchemaNull = true
  eq _ _ = false
