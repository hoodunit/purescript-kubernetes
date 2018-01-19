module Kubernetes.Api.CoreV1.Binding where

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
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a Binding
createNamespacedBinding :: forall e. Config -> String -> CoreV1.Binding -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Binding)
createNamespacedBinding cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/bindings"
    encodedBody = encodeJSON body

-- | create binding of a Pod
createNamespacedPodBinding :: forall e. Config -> String -> String -> CoreV1.Binding -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Binding)
createNamespacedPodBinding cfg namespace name body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/binding"
    encodedBody = encodeJSON body