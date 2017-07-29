module Kubernetes.Api.AppsV1Beta1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.Runtime as Runtime
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | create a ControllerRevision
createNamespacedControllerRevision :: forall e. Config -> String -> ControllerRevision -> Aff (http :: HTTP | e) (Either MetaV1.Status ControllerRevision)
createNamespacedControllerRevision cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/controllerrevisions"
    encodedBody = encodeJSON body

-- | create a Deployment
createNamespacedDeployment :: forall e. Config -> String -> Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
createNamespacedDeployment cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments"
    encodedBody = encodeJSON body

-- | create rollback of a Deployment
createNamespacedDeploymentRollback :: forall e. Config -> String -> String -> DeploymentRollback -> Aff (http :: HTTP | e) (Either MetaV1.Status DeploymentRollback)
createNamespacedDeploymentRollback cfg namespace name body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/rollback"
    encodedBody = encodeJSON body

-- | create a StatefulSet
createNamespacedStatefulSet :: forall e. Config -> String -> StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
createNamespacedStatefulSet cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets"
    encodedBody = encodeJSON body

-- | DeleteCollectionNamespacedControllerRevisionOptions
newtype DeleteCollectionNamespacedControllerRevisionOptions = DeleteCollectionNamespacedControllerRevisionOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedControllerRevisionOptions :: Newtype DeleteCollectionNamespacedControllerRevisionOptions _
derive instance genericDeleteCollectionNamespacedControllerRevisionOptions :: Generic DeleteCollectionNamespacedControllerRevisionOptions _
instance showDeleteCollectionNamespacedControllerRevisionOptions :: Show DeleteCollectionNamespacedControllerRevisionOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedControllerRevisionOptions :: Decode DeleteCollectionNamespacedControllerRevisionOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedControllerRevisionOptions :: Encode DeleteCollectionNamespacedControllerRevisionOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedControllerRevisionOptions :: Default DeleteCollectionNamespacedControllerRevisionOptions where
  default = DeleteCollectionNamespacedControllerRevisionOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ControllerRevision
deleteCollectionNamespacedControllerRevision :: forall e. Config -> String -> DeleteCollectionNamespacedControllerRevisionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedControllerRevision cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/controllerrevisions" <> formatQueryString options

-- | DeleteCollectionNamespacedDeploymentOptions
newtype DeleteCollectionNamespacedDeploymentOptions = DeleteCollectionNamespacedDeploymentOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedDeploymentOptions :: Newtype DeleteCollectionNamespacedDeploymentOptions _
derive instance genericDeleteCollectionNamespacedDeploymentOptions :: Generic DeleteCollectionNamespacedDeploymentOptions _
instance showDeleteCollectionNamespacedDeploymentOptions :: Show DeleteCollectionNamespacedDeploymentOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedDeploymentOptions :: Decode DeleteCollectionNamespacedDeploymentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedDeploymentOptions :: Encode DeleteCollectionNamespacedDeploymentOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedDeploymentOptions :: Default DeleteCollectionNamespacedDeploymentOptions where
  default = DeleteCollectionNamespacedDeploymentOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Deployment
deleteCollectionNamespacedDeployment :: forall e. Config -> String -> DeleteCollectionNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedDeployment cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments" <> formatQueryString options

-- | DeleteCollectionNamespacedStatefulSetOptions
newtype DeleteCollectionNamespacedStatefulSetOptions = DeleteCollectionNamespacedStatefulSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedStatefulSetOptions :: Newtype DeleteCollectionNamespacedStatefulSetOptions _
derive instance genericDeleteCollectionNamespacedStatefulSetOptions :: Generic DeleteCollectionNamespacedStatefulSetOptions _
instance showDeleteCollectionNamespacedStatefulSetOptions :: Show DeleteCollectionNamespacedStatefulSetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedStatefulSetOptions :: Decode DeleteCollectionNamespacedStatefulSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedStatefulSetOptions :: Encode DeleteCollectionNamespacedStatefulSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedStatefulSetOptions :: Default DeleteCollectionNamespacedStatefulSetOptions where
  default = DeleteCollectionNamespacedStatefulSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of StatefulSet
deleteCollectionNamespacedStatefulSet :: forall e. Config -> String -> DeleteCollectionNamespacedStatefulSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedStatefulSet cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets" <> formatQueryString options

-- | DeleteNamespacedControllerRevisionOptions
newtype DeleteNamespacedControllerRevisionOptions = DeleteNamespacedControllerRevisionOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedControllerRevisionOptions :: Newtype DeleteNamespacedControllerRevisionOptions _
derive instance genericDeleteNamespacedControllerRevisionOptions :: Generic DeleteNamespacedControllerRevisionOptions _
instance showDeleteNamespacedControllerRevisionOptions :: Show DeleteNamespacedControllerRevisionOptions where show a = genericShow a
instance decodeDeleteNamespacedControllerRevisionOptions :: Decode DeleteNamespacedControllerRevisionOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedControllerRevisionOptions :: Encode DeleteNamespacedControllerRevisionOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedControllerRevisionOptions :: Default DeleteNamespacedControllerRevisionOptions where
  default = DeleteNamespacedControllerRevisionOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ControllerRevision
deleteNamespacedControllerRevision :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedControllerRevisionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedControllerRevision cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedDeploymentOptions
newtype DeleteNamespacedDeploymentOptions = DeleteNamespacedDeploymentOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedDeploymentOptions :: Newtype DeleteNamespacedDeploymentOptions _
derive instance genericDeleteNamespacedDeploymentOptions :: Generic DeleteNamespacedDeploymentOptions _
instance showDeleteNamespacedDeploymentOptions :: Show DeleteNamespacedDeploymentOptions where show a = genericShow a
instance decodeDeleteNamespacedDeploymentOptions :: Decode DeleteNamespacedDeploymentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedDeploymentOptions :: Encode DeleteNamespacedDeploymentOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedDeploymentOptions :: Default DeleteNamespacedDeploymentOptions where
  default = DeleteNamespacedDeploymentOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a Deployment
deleteNamespacedDeployment :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedDeployment cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedStatefulSetOptions
newtype DeleteNamespacedStatefulSetOptions = DeleteNamespacedStatefulSetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedStatefulSetOptions :: Newtype DeleteNamespacedStatefulSetOptions _
derive instance genericDeleteNamespacedStatefulSetOptions :: Generic DeleteNamespacedStatefulSetOptions _
instance showDeleteNamespacedStatefulSetOptions :: Show DeleteNamespacedStatefulSetOptions where show a = genericShow a
instance decodeDeleteNamespacedStatefulSetOptions :: Decode DeleteNamespacedStatefulSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedStatefulSetOptions :: Encode DeleteNamespacedStatefulSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedStatefulSetOptions :: Default DeleteNamespacedStatefulSetOptions where
  default = DeleteNamespacedStatefulSetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a StatefulSet
deleteNamespacedStatefulSet :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedStatefulSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedStatefulSet cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/"

-- | io.k8s.api.apps.v1beta1.ControllerRevision
-- | DEPRECATED - This group version of ControllerRevision is deprecated by apps/v1beta2/ControllerRevision. See the release notes for more information. ControllerRevision implements an immutable snapshot of state data. Clients are responsible for serializing and deserializing the objects that contain their internal state. Once a ControllerRevision has been successfully created, it can not be updated. The API Server will fail validation of all requests that attempt to mutate the Data field. ControllerRevisions may, however, be deleted. Note that, due to its use by both the DaemonSet and StatefulSet controllers for update and rollback, this object is beta. However, it may be subject to name and representation changes in future releases, and clients should not depend on its stability. It is primarily for internal use by controllers.
newtype ControllerRevision = ControllerRevision
  { _data :: (NullOrUndefined Runtime.RawExtension)
  , apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , revision :: (NullOrUndefined Int) }

derive instance newtypeControllerRevision :: Newtype ControllerRevision _
derive instance genericControllerRevision :: Generic ControllerRevision _
instance showControllerRevision :: Show ControllerRevision where show a = genericShow a
instance decodeControllerRevision :: Decode ControllerRevision where
  decode a = genericDecode jsonOptions a 
instance encodeControllerRevision :: Encode ControllerRevision where
  encode a = genericEncode jsonOptions a

instance defaultControllerRevision :: Default ControllerRevision where
  default = ControllerRevision
    { _data: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , revision: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.ControllerRevisionList
-- | ControllerRevisionList is a resource containing a list of ControllerRevision objects.
newtype ControllerRevisionList = ControllerRevisionList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ControllerRevision))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeControllerRevisionList :: Newtype ControllerRevisionList _
derive instance genericControllerRevisionList :: Generic ControllerRevisionList _
instance showControllerRevisionList :: Show ControllerRevisionList where show a = genericShow a
instance decodeControllerRevisionList :: Decode ControllerRevisionList where
  decode a = genericDecode jsonOptions a 
instance encodeControllerRevisionList :: Encode ControllerRevisionList where
  encode a = genericEncode jsonOptions a

instance defaultControllerRevisionList :: Default ControllerRevisionList where
  default = ControllerRevisionList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.Deployment
-- | DEPRECATED - This group version of Deployment is deprecated by apps/v1beta2/Deployment. See the release notes for more information. Deployment enables declarative updates for Pods and ReplicaSets.
newtype Deployment = Deployment
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined DeploymentSpec)
  , status :: (NullOrUndefined DeploymentStatus) }

derive instance newtypeDeployment :: Newtype Deployment _
derive instance genericDeployment :: Generic Deployment _
instance showDeployment :: Show Deployment where show a = genericShow a
instance decodeDeployment :: Decode Deployment where
  decode a = genericDecode jsonOptions a 
instance encodeDeployment :: Encode Deployment where
  encode a = genericEncode jsonOptions a

instance defaultDeployment :: Default Deployment where
  default = Deployment
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.DeploymentCondition
-- | DeploymentCondition describes the state of a deployment at a certain point.
newtype DeploymentCondition = DeploymentCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , lastUpdateTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeDeploymentCondition :: Newtype DeploymentCondition _
derive instance genericDeploymentCondition :: Generic DeploymentCondition _
instance showDeploymentCondition :: Show DeploymentCondition where show a = genericShow a
instance decodeDeploymentCondition :: Decode DeploymentCondition where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentCondition :: Encode DeploymentCondition where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentCondition :: Default DeploymentCondition where
  default = DeploymentCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , lastUpdateTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.DeploymentList
-- | DeploymentList is a list of Deployments.
newtype DeploymentList = DeploymentList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Deployment))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeDeploymentList :: Newtype DeploymentList _
derive instance genericDeploymentList :: Generic DeploymentList _
instance showDeploymentList :: Show DeploymentList where show a = genericShow a
instance decodeDeploymentList :: Decode DeploymentList where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentList :: Encode DeploymentList where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentList :: Default DeploymentList where
  default = DeploymentList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.DeploymentRollback
-- | DEPRECATED. DeploymentRollback stores the information required to rollback a deployment.
newtype DeploymentRollback = DeploymentRollback
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , rollbackTo :: (NullOrUndefined RollbackConfig)
  , updatedAnnotations :: (NullOrUndefined (StrMap String)) }

derive instance newtypeDeploymentRollback :: Newtype DeploymentRollback _
derive instance genericDeploymentRollback :: Generic DeploymentRollback _
instance showDeploymentRollback :: Show DeploymentRollback where show a = genericShow a
instance decodeDeploymentRollback :: Decode DeploymentRollback where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentRollback :: Encode DeploymentRollback where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentRollback :: Default DeploymentRollback where
  default = DeploymentRollback
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , rollbackTo: NullOrUndefined Nothing
    , updatedAnnotations: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.DeploymentSpec
-- | DeploymentSpec is the specification of the desired behavior of the Deployment.
newtype DeploymentSpec = DeploymentSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , paused :: (NullOrUndefined Boolean)
  , progressDeadlineSeconds :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , revisionHistoryLimit :: (NullOrUndefined Int)
  , rollbackTo :: (NullOrUndefined RollbackConfig)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , strategy :: (NullOrUndefined DeploymentStrategy)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec) }

derive instance newtypeDeploymentSpec :: Newtype DeploymentSpec _
derive instance genericDeploymentSpec :: Generic DeploymentSpec _
instance showDeploymentSpec :: Show DeploymentSpec where show a = genericShow a
instance decodeDeploymentSpec :: Decode DeploymentSpec where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentSpec :: Encode DeploymentSpec where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentSpec :: Default DeploymentSpec where
  default = DeploymentSpec
    { minReadySeconds: NullOrUndefined Nothing
    , paused: NullOrUndefined Nothing
    , progressDeadlineSeconds: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , revisionHistoryLimit: NullOrUndefined Nothing
    , rollbackTo: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , strategy: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.DeploymentStatus
-- | DeploymentStatus is the most recently observed status of the Deployment.
newtype DeploymentStatus = DeploymentStatus
  { availableReplicas :: (NullOrUndefined Int)
  , collisionCount :: (NullOrUndefined Int)
  , conditions :: (NullOrUndefined (Array DeploymentCondition))
  , observedGeneration :: (NullOrUndefined Int)
  , readyReplicas :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , unavailableReplicas :: (NullOrUndefined Int)
  , updatedReplicas :: (NullOrUndefined Int) }

derive instance newtypeDeploymentStatus :: Newtype DeploymentStatus _
derive instance genericDeploymentStatus :: Generic DeploymentStatus _
instance showDeploymentStatus :: Show DeploymentStatus where show a = genericShow a
instance decodeDeploymentStatus :: Decode DeploymentStatus where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentStatus :: Encode DeploymentStatus where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentStatus :: Default DeploymentStatus where
  default = DeploymentStatus
    { availableReplicas: NullOrUndefined Nothing
    , collisionCount: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , readyReplicas: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , unavailableReplicas: NullOrUndefined Nothing
    , updatedReplicas: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.DeploymentStrategy
-- | DeploymentStrategy describes how to replace existing pods with new ones.
newtype DeploymentStrategy = DeploymentStrategy
  { _type :: (NullOrUndefined String)
  , rollingUpdate :: (NullOrUndefined RollingUpdateDeployment) }

derive instance newtypeDeploymentStrategy :: Newtype DeploymentStrategy _
derive instance genericDeploymentStrategy :: Generic DeploymentStrategy _
instance showDeploymentStrategy :: Show DeploymentStrategy where show a = genericShow a
instance decodeDeploymentStrategy :: Decode DeploymentStrategy where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentStrategy :: Encode DeploymentStrategy where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentStrategy :: Default DeploymentStrategy where
  default = DeploymentStrategy
    { _type: NullOrUndefined Nothing
    , rollingUpdate: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.RollbackConfig
-- | DEPRECATED.
newtype RollbackConfig = RollbackConfig
  { revision :: (NullOrUndefined Int) }

derive instance newtypeRollbackConfig :: Newtype RollbackConfig _
derive instance genericRollbackConfig :: Generic RollbackConfig _
instance showRollbackConfig :: Show RollbackConfig where show a = genericShow a
instance decodeRollbackConfig :: Decode RollbackConfig where
  decode a = genericDecode jsonOptions a 
instance encodeRollbackConfig :: Encode RollbackConfig where
  encode a = genericEncode jsonOptions a

instance defaultRollbackConfig :: Default RollbackConfig where
  default = RollbackConfig
    { revision: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.RollingUpdateDeployment
-- | Spec to control the desired behavior of rolling update.
newtype RollingUpdateDeployment = RollingUpdateDeployment
  { maxSurge :: (NullOrUndefined Util.IntOrString)
  , maxUnavailable :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeRollingUpdateDeployment :: Newtype RollingUpdateDeployment _
derive instance genericRollingUpdateDeployment :: Generic RollingUpdateDeployment _
instance showRollingUpdateDeployment :: Show RollingUpdateDeployment where show a = genericShow a
instance decodeRollingUpdateDeployment :: Decode RollingUpdateDeployment where
  decode a = genericDecode jsonOptions a 
instance encodeRollingUpdateDeployment :: Encode RollingUpdateDeployment where
  encode a = genericEncode jsonOptions a

instance defaultRollingUpdateDeployment :: Default RollingUpdateDeployment where
  default = RollingUpdateDeployment
    { maxSurge: NullOrUndefined Nothing
    , maxUnavailable: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.RollingUpdateStatefulSetStrategy
-- | RollingUpdateStatefulSetStrategy is used to communicate parameter for RollingUpdateStatefulSetStrategyType.
newtype RollingUpdateStatefulSetStrategy = RollingUpdateStatefulSetStrategy
  { partition :: (NullOrUndefined Int) }

derive instance newtypeRollingUpdateStatefulSetStrategy :: Newtype RollingUpdateStatefulSetStrategy _
derive instance genericRollingUpdateStatefulSetStrategy :: Generic RollingUpdateStatefulSetStrategy _
instance showRollingUpdateStatefulSetStrategy :: Show RollingUpdateStatefulSetStrategy where show a = genericShow a
instance decodeRollingUpdateStatefulSetStrategy :: Decode RollingUpdateStatefulSetStrategy where
  decode a = genericDecode jsonOptions a 
instance encodeRollingUpdateStatefulSetStrategy :: Encode RollingUpdateStatefulSetStrategy where
  encode a = genericEncode jsonOptions a

instance defaultRollingUpdateStatefulSetStrategy :: Default RollingUpdateStatefulSetStrategy where
  default = RollingUpdateStatefulSetStrategy
    { partition: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.Scale
-- | Scale represents a scaling request for a resource.
newtype Scale = Scale
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined ScaleSpec)
  , status :: (NullOrUndefined ScaleStatus) }

derive instance newtypeScale :: Newtype Scale _
derive instance genericScale :: Generic Scale _
instance showScale :: Show Scale where show a = genericShow a
instance decodeScale :: Decode Scale where
  decode a = genericDecode jsonOptions a 
instance encodeScale :: Encode Scale where
  encode a = genericEncode jsonOptions a

instance defaultScale :: Default Scale where
  default = Scale
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.ScaleSpec
-- | ScaleSpec describes the attributes of a scale subresource
newtype ScaleSpec = ScaleSpec
  { replicas :: (NullOrUndefined Int) }

derive instance newtypeScaleSpec :: Newtype ScaleSpec _
derive instance genericScaleSpec :: Generic ScaleSpec _
instance showScaleSpec :: Show ScaleSpec where show a = genericShow a
instance decodeScaleSpec :: Decode ScaleSpec where
  decode a = genericDecode jsonOptions a 
instance encodeScaleSpec :: Encode ScaleSpec where
  encode a = genericEncode jsonOptions a

instance defaultScaleSpec :: Default ScaleSpec where
  default = ScaleSpec
    { replicas: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.ScaleStatus
-- | ScaleStatus represents the current status of a scale subresource.
newtype ScaleStatus = ScaleStatus
  { replicas :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined (StrMap String))
  , targetSelector :: (NullOrUndefined String) }

derive instance newtypeScaleStatus :: Newtype ScaleStatus _
derive instance genericScaleStatus :: Generic ScaleStatus _
instance showScaleStatus :: Show ScaleStatus where show a = genericShow a
instance decodeScaleStatus :: Decode ScaleStatus where
  decode a = genericDecode jsonOptions a 
instance encodeScaleStatus :: Encode ScaleStatus where
  encode a = genericEncode jsonOptions a

instance defaultScaleStatus :: Default ScaleStatus where
  default = ScaleStatus
    { replicas: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , targetSelector: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.StatefulSet
-- | DEPRECATED - This group version of StatefulSet is deprecated by apps/v1beta2/StatefulSet. See the release notes for more information. StatefulSet represents a set of pods with consistent identities. Identities are defined as:
-- |  - Network: A single stable DNS and hostname.
-- |  - Storage: As many VolumeClaims as requested.
-- | The StatefulSet guarantees that a given network identity will always map to the same storage identity.
newtype StatefulSet = StatefulSet
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined StatefulSetSpec)
  , status :: (NullOrUndefined StatefulSetStatus) }

derive instance newtypeStatefulSet :: Newtype StatefulSet _
derive instance genericStatefulSet :: Generic StatefulSet _
instance showStatefulSet :: Show StatefulSet where show a = genericShow a
instance decodeStatefulSet :: Decode StatefulSet where
  decode a = genericDecode jsonOptions a 
instance encodeStatefulSet :: Encode StatefulSet where
  encode a = genericEncode jsonOptions a

instance defaultStatefulSet :: Default StatefulSet where
  default = StatefulSet
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.StatefulSetCondition
-- | StatefulSetCondition describes the state of a statefulset at a certain point.
newtype StatefulSetCondition = StatefulSetCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeStatefulSetCondition :: Newtype StatefulSetCondition _
derive instance genericStatefulSetCondition :: Generic StatefulSetCondition _
instance showStatefulSetCondition :: Show StatefulSetCondition where show a = genericShow a
instance decodeStatefulSetCondition :: Decode StatefulSetCondition where
  decode a = genericDecode jsonOptions a 
instance encodeStatefulSetCondition :: Encode StatefulSetCondition where
  encode a = genericEncode jsonOptions a

instance defaultStatefulSetCondition :: Default StatefulSetCondition where
  default = StatefulSetCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.StatefulSetList
-- | StatefulSetList is a collection of StatefulSets.
newtype StatefulSetList = StatefulSetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array StatefulSet))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeStatefulSetList :: Newtype StatefulSetList _
derive instance genericStatefulSetList :: Generic StatefulSetList _
instance showStatefulSetList :: Show StatefulSetList where show a = genericShow a
instance decodeStatefulSetList :: Decode StatefulSetList where
  decode a = genericDecode jsonOptions a 
instance encodeStatefulSetList :: Encode StatefulSetList where
  encode a = genericEncode jsonOptions a

instance defaultStatefulSetList :: Default StatefulSetList where
  default = StatefulSetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.StatefulSetSpec
-- | A StatefulSetSpec is the specification of a StatefulSet.
newtype StatefulSetSpec = StatefulSetSpec
  { podManagementPolicy :: (NullOrUndefined String)
  , replicas :: (NullOrUndefined Int)
  , revisionHistoryLimit :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , serviceName :: (NullOrUndefined String)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec)
  , updateStrategy :: (NullOrUndefined StatefulSetUpdateStrategy)
  , volumeClaimTemplates :: (NullOrUndefined (Array CoreV1.PersistentVolumeClaim)) }

derive instance newtypeStatefulSetSpec :: Newtype StatefulSetSpec _
derive instance genericStatefulSetSpec :: Generic StatefulSetSpec _
instance showStatefulSetSpec :: Show StatefulSetSpec where show a = genericShow a
instance decodeStatefulSetSpec :: Decode StatefulSetSpec where
  decode a = genericDecode jsonOptions a 
instance encodeStatefulSetSpec :: Encode StatefulSetSpec where
  encode a = genericEncode jsonOptions a

instance defaultStatefulSetSpec :: Default StatefulSetSpec where
  default = StatefulSetSpec
    { podManagementPolicy: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , revisionHistoryLimit: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , serviceName: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing
    , updateStrategy: NullOrUndefined Nothing
    , volumeClaimTemplates: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.StatefulSetStatus
-- | StatefulSetStatus represents the current state of a StatefulSet.
newtype StatefulSetStatus = StatefulSetStatus
  { collisionCount :: (NullOrUndefined Int)
  , conditions :: (NullOrUndefined (Array StatefulSetCondition))
  , currentReplicas :: (NullOrUndefined Int)
  , currentRevision :: (NullOrUndefined String)
  , observedGeneration :: (NullOrUndefined Int)
  , readyReplicas :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , updateRevision :: (NullOrUndefined String)
  , updatedReplicas :: (NullOrUndefined Int) }

derive instance newtypeStatefulSetStatus :: Newtype StatefulSetStatus _
derive instance genericStatefulSetStatus :: Generic StatefulSetStatus _
instance showStatefulSetStatus :: Show StatefulSetStatus where show a = genericShow a
instance decodeStatefulSetStatus :: Decode StatefulSetStatus where
  decode a = genericDecode jsonOptions a 
instance encodeStatefulSetStatus :: Encode StatefulSetStatus where
  encode a = genericEncode jsonOptions a

instance defaultStatefulSetStatus :: Default StatefulSetStatus where
  default = StatefulSetStatus
    { collisionCount: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , currentReplicas: NullOrUndefined Nothing
    , currentRevision: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , readyReplicas: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , updateRevision: NullOrUndefined Nothing
    , updatedReplicas: NullOrUndefined Nothing }

-- | io.k8s.api.apps.v1beta1.StatefulSetUpdateStrategy
-- | StatefulSetUpdateStrategy indicates the strategy that the StatefulSet controller will use to perform updates. It includes any additional parameters necessary to perform the update for the indicated strategy.
newtype StatefulSetUpdateStrategy = StatefulSetUpdateStrategy
  { _type :: (NullOrUndefined String)
  , rollingUpdate :: (NullOrUndefined RollingUpdateStatefulSetStrategy) }

derive instance newtypeStatefulSetUpdateStrategy :: Newtype StatefulSetUpdateStrategy _
derive instance genericStatefulSetUpdateStrategy :: Generic StatefulSetUpdateStrategy _
instance showStatefulSetUpdateStrategy :: Show StatefulSetUpdateStrategy where show a = genericShow a
instance decodeStatefulSetUpdateStrategy :: Decode StatefulSetUpdateStrategy where
  decode a = genericDecode jsonOptions a 
instance encodeStatefulSetUpdateStrategy :: Encode StatefulSetUpdateStrategy where
  encode a = genericEncode jsonOptions a

instance defaultStatefulSetUpdateStrategy :: Default StatefulSetUpdateStrategy where
  default = StatefulSetUpdateStrategy
    { _type: NullOrUndefined Nothing
    , rollingUpdate: NullOrUndefined Nothing }

-- | list or watch objects of kind ControllerRevision
listControllerRevisionForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ControllerRevisionList)
listControllerRevisionForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/controllerrevisions"

-- | list or watch objects of kind Deployment
listDeploymentForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status DeploymentList)
listDeploymentForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/deployments"

-- | ListNamespacedControllerRevisionOptions
newtype ListNamespacedControllerRevisionOptions = ListNamespacedControllerRevisionOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedControllerRevisionOptions :: Newtype ListNamespacedControllerRevisionOptions _
derive instance genericListNamespacedControllerRevisionOptions :: Generic ListNamespacedControllerRevisionOptions _
instance showListNamespacedControllerRevisionOptions :: Show ListNamespacedControllerRevisionOptions where show a = genericShow a
instance decodeListNamespacedControllerRevisionOptions :: Decode ListNamespacedControllerRevisionOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedControllerRevisionOptions :: Encode ListNamespacedControllerRevisionOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedControllerRevisionOptions :: Default ListNamespacedControllerRevisionOptions where
  default = ListNamespacedControllerRevisionOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ControllerRevision
listNamespacedControllerRevision :: forall e. Config -> String -> ListNamespacedControllerRevisionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ControllerRevisionList)
listNamespacedControllerRevision cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/controllerrevisions" <> formatQueryString options

-- | ListNamespacedDeploymentOptions
newtype ListNamespacedDeploymentOptions = ListNamespacedDeploymentOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedDeploymentOptions :: Newtype ListNamespacedDeploymentOptions _
derive instance genericListNamespacedDeploymentOptions :: Generic ListNamespacedDeploymentOptions _
instance showListNamespacedDeploymentOptions :: Show ListNamespacedDeploymentOptions where show a = genericShow a
instance decodeListNamespacedDeploymentOptions :: Decode ListNamespacedDeploymentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedDeploymentOptions :: Encode ListNamespacedDeploymentOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedDeploymentOptions :: Default ListNamespacedDeploymentOptions where
  default = ListNamespacedDeploymentOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Deployment
listNamespacedDeployment :: forall e. Config -> String -> ListNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status DeploymentList)
listNamespacedDeployment cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments" <> formatQueryString options

-- | ListNamespacedStatefulSetOptions
newtype ListNamespacedStatefulSetOptions = ListNamespacedStatefulSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedStatefulSetOptions :: Newtype ListNamespacedStatefulSetOptions _
derive instance genericListNamespacedStatefulSetOptions :: Generic ListNamespacedStatefulSetOptions _
instance showListNamespacedStatefulSetOptions :: Show ListNamespacedStatefulSetOptions where show a = genericShow a
instance decodeListNamespacedStatefulSetOptions :: Decode ListNamespacedStatefulSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedStatefulSetOptions :: Encode ListNamespacedStatefulSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedStatefulSetOptions :: Default ListNamespacedStatefulSetOptions where
  default = ListNamespacedStatefulSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind StatefulSet
listNamespacedStatefulSet :: forall e. Config -> String -> ListNamespacedStatefulSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSetList)
listNamespacedStatefulSet cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets" <> formatQueryString options

-- | list or watch objects of kind StatefulSet
listStatefulSetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSetList)
listStatefulSetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/statefulsets"

-- | ReadNamespacedControllerRevisionOptions
newtype ReadNamespacedControllerRevisionOptions = ReadNamespacedControllerRevisionOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedControllerRevisionOptions :: Newtype ReadNamespacedControllerRevisionOptions _
derive instance genericReadNamespacedControllerRevisionOptions :: Generic ReadNamespacedControllerRevisionOptions _
instance showReadNamespacedControllerRevisionOptions :: Show ReadNamespacedControllerRevisionOptions where show a = genericShow a
instance decodeReadNamespacedControllerRevisionOptions :: Decode ReadNamespacedControllerRevisionOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedControllerRevisionOptions :: Encode ReadNamespacedControllerRevisionOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedControllerRevisionOptions :: Default ReadNamespacedControllerRevisionOptions where
  default = ReadNamespacedControllerRevisionOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ControllerRevision
readNamespacedControllerRevision :: forall e. Config -> String -> String -> ReadNamespacedControllerRevisionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ControllerRevision)
readNamespacedControllerRevision cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> "" <> formatQueryString options

-- | ReadNamespacedDeploymentOptions
newtype ReadNamespacedDeploymentOptions = ReadNamespacedDeploymentOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedDeploymentOptions :: Newtype ReadNamespacedDeploymentOptions _
derive instance genericReadNamespacedDeploymentOptions :: Generic ReadNamespacedDeploymentOptions _
instance showReadNamespacedDeploymentOptions :: Show ReadNamespacedDeploymentOptions where show a = genericShow a
instance decodeReadNamespacedDeploymentOptions :: Decode ReadNamespacedDeploymentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedDeploymentOptions :: Encode ReadNamespacedDeploymentOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedDeploymentOptions :: Default ReadNamespacedDeploymentOptions where
  default = ReadNamespacedDeploymentOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Deployment
readNamespacedDeployment :: forall e. Config -> String -> String -> ReadNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
readNamespacedDeployment cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "" <> formatQueryString options

-- | read scale of the specified Deployment
readNamespacedDeploymentScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
readNamespacedDeploymentScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"

-- | read status of the specified Deployment
readNamespacedDeploymentStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
readNamespacedDeploymentStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/status"

-- | ReadNamespacedStatefulSetOptions
newtype ReadNamespacedStatefulSetOptions = ReadNamespacedStatefulSetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedStatefulSetOptions :: Newtype ReadNamespacedStatefulSetOptions _
derive instance genericReadNamespacedStatefulSetOptions :: Generic ReadNamespacedStatefulSetOptions _
instance showReadNamespacedStatefulSetOptions :: Show ReadNamespacedStatefulSetOptions where show a = genericShow a
instance decodeReadNamespacedStatefulSetOptions :: Decode ReadNamespacedStatefulSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedStatefulSetOptions :: Encode ReadNamespacedStatefulSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedStatefulSetOptions :: Default ReadNamespacedStatefulSetOptions where
  default = ReadNamespacedStatefulSetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified StatefulSet
readNamespacedStatefulSet :: forall e. Config -> String -> String -> ReadNamespacedStatefulSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
readNamespacedStatefulSet cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "" <> formatQueryString options

-- | read scale of the specified StatefulSet
readNamespacedStatefulSetScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
readNamespacedStatefulSetScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/scale"

-- | read status of the specified StatefulSet
readNamespacedStatefulSetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
readNamespacedStatefulSetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/status"

-- | replace the specified ControllerRevision
replaceNamespacedControllerRevision :: forall e. Config -> String -> String -> ControllerRevision -> Aff (http :: HTTP | e) (Either MetaV1.Status ControllerRevision)
replaceNamespacedControllerRevision cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified Deployment
replaceNamespacedDeployment :: forall e. Config -> String -> String -> Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
replaceNamespacedDeployment cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace scale of the specified Deployment
replaceNamespacedDeploymentScale :: forall e. Config -> String -> String -> Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
replaceNamespacedDeploymentScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace status of the specified Deployment
replaceNamespacedDeploymentStatus :: forall e. Config -> String -> String -> Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
replaceNamespacedDeploymentStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified StatefulSet
replaceNamespacedStatefulSet :: forall e. Config -> String -> String -> StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
replaceNamespacedStatefulSet cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace scale of the specified StatefulSet
replaceNamespacedStatefulSetScale :: forall e. Config -> String -> String -> Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
replaceNamespacedStatefulSetScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace status of the specified StatefulSet
replaceNamespacedStatefulSetStatus :: forall e. Config -> String -> String -> StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
replaceNamespacedStatefulSetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of ControllerRevision
watchControllerRevisionListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchControllerRevisionListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/controllerrevisions"

-- | watch individual changes to a list of Deployment
watchDeploymentListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchDeploymentListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/deployments"

-- | watch changes to an object of kind ControllerRevision
watchNamespacedControllerRevision :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedControllerRevision cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> ""

-- | watch individual changes to a list of ControllerRevision
watchNamespacedControllerRevisionList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedControllerRevisionList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/namespaces/" <> namespace <> "/controllerrevisions"

-- | watch changes to an object of kind Deployment
watchNamespacedDeployment :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDeployment cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/namespaces/" <> namespace <> "/deployments/" <> name <> ""

-- | watch individual changes to a list of Deployment
watchNamespacedDeploymentList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDeploymentList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/namespaces/" <> namespace <> "/deployments"

-- | watch changes to an object of kind StatefulSet
watchNamespacedStatefulSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedStatefulSet cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/namespaces/" <> namespace <> "/statefulsets/" <> name <> ""

-- | watch individual changes to a list of StatefulSet
watchNamespacedStatefulSetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedStatefulSetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/namespaces/" <> namespace <> "/statefulsets"

-- | watch individual changes to a list of StatefulSet
watchStatefulSetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchStatefulSetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/statefulsets"