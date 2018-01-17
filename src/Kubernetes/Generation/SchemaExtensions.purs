module Kubernetes.SchemaExtensions where

import Prelude

import Control.Alt ((<|>))
import Data.Foreign.Class (class Decode, decode)
import Data.Foreign.Index (readProp)
import Simple.JSON (class ReadForeign, class WriteForeign)
import Simple.JSON as SimpleJSON

newtype KubernetesGroupVersionKind = KubernetesGroupVersionKind
  { group :: String
  , kind :: String
  , version :: String }

instance decodeKubernetesGroupVersionKind :: Decode KubernetesGroupVersionKind where
  decode f = do
    group <- (readProp "group" f >>= decode) <|> pure ""
    kind <- (readProp "kind" f >>= decode) <|> pure ""
    version <- (readProp "version" f >>= decode) <|> pure ""
    pure $ KubernetesGroupVersionKind { group, kind, version }
instance writeForeignKubernetesGroupVersionKind :: WriteForeign KubernetesGroupVersionKind where
  writeImpl (KubernetesGroupVersionKind v) = SimpleJSON.write v
instance readForeignKubernetesGroupVersionKind :: ReadForeign KubernetesGroupVersionKind where
  readImpl = decode
  
instance showKubernetesGroupVersionKind :: Show KubernetesGroupVersionKind where
  show (KubernetesGroupVersionKind { group, version, kind }) =
    "{\n  group: " <> group <>
    ",\n  version: " <> version <>
    ",\n  kind: " <> kind <> "}"
