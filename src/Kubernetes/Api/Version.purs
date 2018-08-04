module Kubernetes.Api.Version where

import Prelude
import Prelude
import Prelude
import Control.Alt ((<|>))
import Data.Either (Either(Left,Right))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(Tuple))
import Effect.Aff (Aff)
import Foreign.Class (class Decode, class Encode, decode, encode)
import Prelude
import Data.Maybe (Maybe(Just,Nothing))
import Foreign.Class (class Decode, class Encode, encode, decode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Foreign.Generic.Types (Options)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Meta.V1 as MetaV1

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
  { buildDate :: (Maybe String)
  , compiler :: (Maybe String)
  , gitCommit :: (Maybe String)
  , gitTreeState :: (Maybe String)
  , gitVersion :: (Maybe String)
  , goVersion :: (Maybe String)
  , major :: (Maybe String)
  , minor :: (Maybe String)
  , platform :: (Maybe String) }

derive instance newtypeInfo :: Newtype Info _
derive instance genericInfo :: Generic Info _
instance showInfo :: Show Info where show a = genericShow a
instance decodeInfo :: Decode Info where
  decode a = do
               buildDate <- decodeMaybe "buildDate" a
               compiler <- decodeMaybe "compiler" a
               gitCommit <- decodeMaybe "gitCommit" a
               gitTreeState <- decodeMaybe "gitTreeState" a
               gitVersion <- decodeMaybe "gitVersion" a
               goVersion <- decodeMaybe "goVersion" a
               major <- decodeMaybe "major" a
               minor <- decodeMaybe "minor" a
               platform <- decodeMaybe "platform" a
               pure $ Info { buildDate, compiler, gitCommit, gitTreeState, gitVersion, goVersion, major, minor, platform }
instance encodeInfo :: Encode Info where
  encode (Info a) = encode $ Object.fromFoldable $
               [ Tuple "buildDate" (encodeMaybe a.buildDate)
               , Tuple "compiler" (encodeMaybe a.compiler)
               , Tuple "gitCommit" (encodeMaybe a.gitCommit)
               , Tuple "gitTreeState" (encodeMaybe a.gitTreeState)
               , Tuple "gitVersion" (encodeMaybe a.gitVersion)
               , Tuple "goVersion" (encodeMaybe a.goVersion)
               , Tuple "major" (encodeMaybe a.major)
               , Tuple "minor" (encodeMaybe a.minor)
               , Tuple "platform" (encodeMaybe a.platform) ]


instance defaultInfo :: Default Info where
  default = Info
    { buildDate: Nothing
    , compiler: Nothing
    , gitCommit: Nothing
    , gitTreeState: Nothing
    , gitVersion: Nothing
    , goVersion: Nothing
    , major: Nothing
    , minor: Nothing
    , platform: Nothing }

-- | get the code version
getCodeVersion :: Config -> Aff (Either MetaV1.Status Info)
getCodeVersion cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/version/"