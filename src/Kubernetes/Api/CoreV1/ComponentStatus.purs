module Kubernetes.Api.CoreV1.ComponentStatus where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1

-- | list objects of kind ComponentStatus
listComponentStatus :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.ComponentStatusList)
listComponentStatus cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/componentstatuses"

-- | read the specified ComponentStatus
readComponentStatus :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.ComponentStatus)
readComponentStatus cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/componentstatuses/" <> name <> ""