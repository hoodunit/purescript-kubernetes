module Kubernetes.SchemaExtensions where

import Prelude

import Control.Alt ((<|>))
import Data.Foreign.Class (class Decode, decode)
import Data.Foreign.Index (readProp)
import Data.Newtype (class Newtype)
import Simple.JSON (class ReadForeign, class WriteForeign)
import Simple.JSON as SimpleJSON

newtype GroupVersionKind = GroupVersionKind
  { group :: String
  , kind :: String
  , version :: String }

derive instance newtypeGroupVersionKind :: Newtype GroupVersionKind _
instance decodeGroupVersionKind :: Decode GroupVersionKind where
  decode f = do
    group <- (readProp "group" f >>= decode) <|> pure ""
    kind <- (readProp "kind" f >>= decode) <|> pure ""
    version <- (readProp "version" f >>= decode) <|> pure ""
    pure $ GroupVersionKind { group, kind, version }
instance writeForeignGroupVersionKind :: WriteForeign GroupVersionKind where
  writeImpl (GroupVersionKind v) = SimpleJSON.write v
instance readForeignGroupVersionKind :: ReadForeign GroupVersionKind where
  readImpl = decode
  
instance showGroupVersionKind :: Show GroupVersionKind where
  show (GroupVersionKind { group, version, kind }) =
    "{\n  group: " <> group <>
    ",\n  version: " <> version <>
    ",\n  kind: " <> kind <> "}"
