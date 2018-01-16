module Kubernetes.Api.Version where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | io.k8s.apimachinery.pkg.version.Info
-- | Info contains versioning information. how we'll want to distribute that information.
newtype Info = Info
  { buildDate :: (NullOrUndefined String)
  , compiler :: (NullOrUndefined String)
  , gitCommit :: (NullOrUndefined String)
  , gitTreeState :: (NullOrUndefined String)
  , gitVersion :: (NullOrUndefined String)
  , goVersion :: (NullOrUndefined String)
  , major :: (NullOrUndefined String)
  , minor :: (NullOrUndefined String)
  , platform :: (NullOrUndefined String) }

derive instance newtypeInfo :: Newtype Info _
derive instance genericInfo :: Generic Info _
instance showInfo :: Show Info where show a = genericShow a
instance decodeInfo :: Decode Info where
  decode a = genericDecode jsonOptions a 
instance encodeInfo :: Encode Info where
  encode a = genericEncode jsonOptions a

instance defaultInfo :: Default Info where
  default = Info
    { buildDate: NullOrUndefined Nothing
    , compiler: NullOrUndefined Nothing
    , gitCommit: NullOrUndefined Nothing
    , gitTreeState: NullOrUndefined Nothing
    , gitVersion: NullOrUndefined Nothing
    , goVersion: NullOrUndefined Nothing
    , major: NullOrUndefined Nothing
    , minor: NullOrUndefined Nothing
    , platform: NullOrUndefined Nothing }

-- | get the code version
getCodeVersion :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status Info)
getCodeVersion cfg = makeRequest (get cfg url Nothing)
  where
    url = "/version/"