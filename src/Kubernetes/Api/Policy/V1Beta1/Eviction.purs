module Kubernetes.Api.Policy.V1Beta1.Eviction where

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
import Kubernetes.Api.Meta.V1 as MetaV1
import Kubernetes.Api.Policy.V1Beta1 as PolicyV1Beta1

-- | create eviction of a Pod
createNamespacedPod :: Config -> String -> String -> PolicyV1Beta1.Eviction -> Aff (Either MetaV1.Status PolicyV1Beta1.Eviction)
createNamespacedPod cfg namespace name body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/eviction"
    encodedBody = encodeJSON body