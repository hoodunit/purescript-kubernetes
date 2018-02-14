module Kubernetes.Api.Logs where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Index (readProp)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Kubernetes.Api.Meta.V1 as MetaV1

logFileHandler :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
logFileHandler cfg logpath = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/logs/" <> logpath <> ""

logFileListHandler :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
logFileListHandler cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/logs/"