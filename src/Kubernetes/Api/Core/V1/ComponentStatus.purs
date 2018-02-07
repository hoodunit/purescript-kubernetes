module Kubernetes.Api.Core.V1.ComponentStatus where

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
import Node.HTTP (HTTP)
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Core.V1 as CoreV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | list objects of kind ComponentStatus
list :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.ComponentStatusList)
list cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/componentstatuses"

-- | read the specified ComponentStatus
read :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.ComponentStatus)
read cfg name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/componentstatuses/" <> name <> ""