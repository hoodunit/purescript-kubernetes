module Kubernetes.Api.AutoscalingV1.Scale where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Kubernetes.Api.AutoscalingV1 as AutoscalingV1
import Kubernetes.Api.MetaV1 as MetaV1

-- | read scale of the specified Deployment
readNamespacedDeploymentScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV1.Scale)
readNamespacedDeploymentScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"

-- | read scale of the specified ReplicaSet
readNamespacedReplicaSetScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV1.Scale)
readNamespacedReplicaSetScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"

-- | read scale of the specified ReplicationController
readNamespacedReplicationControllerScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV1.Scale)
readNamespacedReplicationControllerScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"

-- | read scale of the specified StatefulSet
readNamespacedStatefulSetScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV1.Scale)
readNamespacedStatefulSetScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/scale"

-- | replace scale of the specified Deployment
replaceNamespacedDeploymentScale :: forall e. Config -> String -> String -> AutoscalingV1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV1.Scale)
replaceNamespacedDeploymentScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicaSet
replaceNamespacedReplicaSetScale :: forall e. Config -> String -> String -> AutoscalingV1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV1.Scale)
replaceNamespacedReplicaSetScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicationController
replaceNamespacedReplicationControllerScale :: forall e. Config -> String -> String -> AutoscalingV1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV1.Scale)
replaceNamespacedReplicationControllerScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified StatefulSet
replaceNamespacedStatefulSetScale :: forall e. Config -> String -> String -> AutoscalingV1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV1.Scale)
replaceNamespacedStatefulSetScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/scale"
    encodedBody = encodeJSON body