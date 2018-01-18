module Kubernetes.Api.Version where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Info contains versioning information. how we'll want to distribute that information.
-- |
-- | Fields:
-- | - `buildDate`
-- | - `compiler`
-- | - `gitCommit`
-- | - `gitTreeState`
-- | - `gitVersion`
-- | - `goVersion`
-- | - `major`
-- | - `minor`
-- | - `platform`
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
  decode a = do
               buildDate <- readProp "buildDate" a >>= decode
               compiler <- readProp "compiler" a >>= decode
               gitCommit <- readProp "gitCommit" a >>= decode
               gitTreeState <- readProp "gitTreeState" a >>= decode
               gitVersion <- readProp "gitVersion" a >>= decode
               goVersion <- readProp "goVersion" a >>= decode
               major <- readProp "major" a >>= decode
               minor <- readProp "minor" a >>= decode
               platform <- readProp "platform" a >>= decode
               pure $ Info { buildDate, compiler, gitCommit, gitTreeState, gitVersion, goVersion, major, minor, platform }
instance encodeInfo :: Encode Info where
  encode (Info a) = encode $ StrMap.fromFoldable $
               [ Tuple "buildDate" (encode a.buildDate)
               , Tuple "compiler" (encode a.compiler)
               , Tuple "gitCommit" (encode a.gitCommit)
               , Tuple "gitTreeState" (encode a.gitTreeState)
               , Tuple "gitVersion" (encode a.gitVersion)
               , Tuple "goVersion" (encode a.goVersion)
               , Tuple "major" (encode a.major)
               , Tuple "minor" (encode a.minor)
               , Tuple "platform" (encode a.platform) ]


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