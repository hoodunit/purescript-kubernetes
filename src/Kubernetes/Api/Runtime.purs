module Kubernetes.Api.Runtime where

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

-- | RawExtension is used to hold extensions in external versions.
-- | 
-- | To use this, make a field which has RawExtension as its type in your external, versioned struct, and Object in your internal struct. You also need to register your various plugin types.
-- | 
-- | // Internal package: type MyAPIObject struct {
-- | 	runtime.TypeMeta `json:",inline"`
-- | 	MyPlugin runtime.Object `json:"myPlugin"`
-- | } type PluginA struct {
-- | 	AOption string `json:"aOption"`
-- | }
-- | 
-- | // External package: type MyAPIObject struct {
-- | 	runtime.TypeMeta `json:",inline"`
-- | 	MyPlugin runtime.RawExtension `json:"myPlugin"`
-- | } type PluginA struct {
-- | 	AOption string `json:"aOption"`
-- | }
-- | 
-- | // On the wire, the JSON will look something like this: {
-- | 	"kind":"MyAPIObject",
-- | 	"apiVersion":"v1",
-- | 	"myPlugin": {
-- | 		"kind":"PluginA",
-- | 		"aOption":"foo",
-- | 	},
-- | }
-- | 
-- | So what happens? Decode first uses json or yaml to unmarshal the serialized data into your external MyAPIObject. That causes the raw JSON to be stored, but not unpacked. The next step is to copy (using pkg/conversion) into the internal struct. The runtime package's DefaultScheme has conversion functions installed which will unpack the JSON stored in RawExtension, turning it into the correct object type, and storing it in the Object. (TODO: In the case where the object is of an unknown type, a runtime.Unknown object will be created and stored.)
-- |
-- | Fields:
-- | - `_Raw`: Raw is the underlying serialization of this object.
newtype RawExtension = RawExtension
  { _Raw :: (Maybe String) }

derive instance newtypeRawExtension :: Newtype RawExtension _
derive instance genericRawExtension :: Generic RawExtension _
instance showRawExtension :: Show RawExtension where show a = genericShow a
instance decodeRawExtension :: Decode RawExtension where
  decode a = do
               _Raw <- decodeMaybe "_Raw" a
               pure $ RawExtension { _Raw }
instance encodeRawExtension :: Encode RawExtension where
  encode (RawExtension a) = encode $ Object.fromFoldable $
               [ Tuple "_Raw" (encodeMaybe a._Raw) ]


instance defaultRawExtension :: Default RawExtension where
  default = RawExtension
    { _Raw: Nothing }