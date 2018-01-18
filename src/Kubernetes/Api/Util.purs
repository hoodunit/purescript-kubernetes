module Kubernetes.Api.Util where

import Prelude
import Control.Alt ((<|>))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)

data IntOrString = 
  IntOrStringString String
  | IntOrStringInt Int


derive instance genericIntOrString :: Generic IntOrString _
instance showIntOrString :: Show IntOrString where show = genericShow
instance decodeIntOrString :: Decode IntOrString where
  decode f = (IntOrStringInt <$> decode f) <|> (IntOrStringString <$> decode f)
instance encodeIntOrString :: Encode IntOrString where
  encode (IntOrStringString s) = encode s
  encode (IntOrStringInt i) = encode i