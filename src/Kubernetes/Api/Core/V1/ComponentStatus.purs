module Kubernetes.Api.Core.V1.ComponentStatus where

import Prelude
import Prelude
import Data.Either (Either(Left,Right))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(Tuple))
import Effect.Aff (Aff)
import Foreign.Class (class Decode, class Encode, encode, decode)
import Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Core.V1 as CoreV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | list objects of kind ComponentStatus
list :: Config -> Aff (Either MetaV1.Status CoreV1.ComponentStatusList)
list cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/componentstatuses"

-- | read the specified ComponentStatus
read :: Config -> String -> Aff (Either MetaV1.Status CoreV1.ComponentStatus)
read cfg name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/componentstatuses/" <> name <> ""