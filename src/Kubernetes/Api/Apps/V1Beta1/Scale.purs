module Kubernetes.Api.Apps.V1Beta1.Scale where

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
import Kubernetes.Api.Apps.V1Beta1 as AppsV1Beta1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | read scale of the specified Deployment
readNamespacedDeployment :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.Scale)
readNamespacedDeployment cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"

-- | read scale of the specified StatefulSet
readNamespacedStatefulSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.Scale)
readNamespacedStatefulSet cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/scale"

-- | replace scale of the specified Deployment
replaceNamespacedDeployment :: forall e. Config -> String -> String -> AppsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.Scale)
replaceNamespacedDeployment cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified StatefulSet
replaceNamespacedStatefulSet :: forall e. Config -> String -> String -> AppsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.Scale)
replaceNamespacedStatefulSet cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/scale"
    encodedBody = encodeJSON body