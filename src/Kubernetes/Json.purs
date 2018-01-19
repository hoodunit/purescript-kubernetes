module Kubernetes.Json where

import Prelude

import Data.Foreign (Foreign, F)
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..), unNullOrUndefined)
import Data.Maybe (Maybe)
import Kubernetes.Generation.Names (psFieldToJsonField)

jsonOptions :: Options
jsonOptions = defaultOptions
  { unwrapSingleConstructors = true
  , fieldTransform = psFieldToJsonField }

decodeMaybe :: forall a. Decode a => String -> Foreign -> F (Maybe a)
decodeMaybe propName f = do
  propValForeign <- readProp propName f
  propVal <- decode propValForeign :: F (NullOrUndefined a)
  pure $ unNullOrUndefined propVal

encodeMaybe :: forall a. Encode a => Maybe a -> Foreign
encodeMaybe val = encode (NullOrUndefined val)
