module Kubernetes.Api.Extensions.V1Beta1.Scale where

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
import Kubernetes.Api.APIExtensions.V1Beta1 as APIExtensionsV1Beta1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | read scale of the specified Deployment
readNamespacedDeployment :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedDeployment cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"

-- | read scale of the specified ReplicaSet
readNamespacedReplicaSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedReplicaSet cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"

-- | read scale of the specified ReplicationControllerDummy
readNamespacedReplicationControllerDummy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedReplicationControllerDummy cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"

-- | replace scale of the specified Deployment
replaceNamespacedDeployment :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedDeployment cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicaSet
replaceNamespacedReplicaSet :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedReplicaSet cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicationControllerDummy
replaceNamespacedReplicationControllerDummy :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedReplicationControllerDummy cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"
    encodedBody = encodeJSON body