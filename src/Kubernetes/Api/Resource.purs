module Kubernetes.Api.Resource where

import Prelude
import Prelude
import Control.Alt ((<|>))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(Tuple))
import Foreign.Class (class Decode, class Encode, decode, encode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Foreign.Generic.Types (Options)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)

newtype Quantity = Quantity String

derive instance newtypeQuantity :: Newtype Quantity _
derive instance genericQuantity :: Generic Quantity _
instance showQuantity :: Show Quantity where show a = genericShow a
instance decodeQuantity :: Decode Quantity where
  decode a = genericDecode jsonOptions a 
instance encodeQuantity :: Encode Quantity where
  encode a = genericEncode jsonOptions a