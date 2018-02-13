module Kubernetes.Api.Core.V1.Binding where

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
import Kubernetes.Api.Core.V1 as CoreV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | create a Binding
createNamespaced :: forall e. Config -> String -> CoreV1.Binding -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Binding)
createNamespaced cfg namespace body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/bindings"
    encodedBody = encodeJSON body

-- | create binding of a Pod
createNamespacedPod :: forall e. Config -> String -> String -> CoreV1.Binding -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Binding)
createNamespacedPod cfg namespace name body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/binding"
    encodedBody = encodeJSON body