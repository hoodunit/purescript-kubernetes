module Kubernetes.Api.ExtensionsV1Beta1.Scale where

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
import Kubernetes.Api.APIExtensionsV1Beta1 as APIExtensionsV1Beta1
import Kubernetes.Api.MetaV1 as MetaV1

-- | read scale of the specified Deployment
readNamespacedDeploymentScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedDeploymentScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"

-- | read scale of the specified ReplicaSet
readNamespacedReplicaSetScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedReplicaSetScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"

-- | read scale of the specified ReplicationControllerDummy
readNamespacedReplicationControllerDummyScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedReplicationControllerDummyScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"

-- | replace scale of the specified Deployment
replaceNamespacedDeploymentScale :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedDeploymentScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicaSet
replaceNamespacedReplicaSetScale :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedReplicaSetScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicationControllerDummy
replaceNamespacedReplicationControllerDummyScale :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedReplicationControllerDummyScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"
    encodedBody = encodeJSON body