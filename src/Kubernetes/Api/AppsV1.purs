module Kubernetes.Api.AppsV1 where

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

-- | ControllerRevision implements an immutable snapshot of state data. Clients are responsible for serializing and deserializing the objects that contain their internal state. Once a ControllerRevision has been successfully created, it can not be updated. The API Server will fail validation of all requests that attempt to mutate the Data field. ControllerRevisions may, however, be deleted. Note that, due to its use by both the DaemonSet and StatefulSet controllers for update and rollback, this object is beta. However, it may be subject to name and representation changes in future releases, and clients should not depend on its stability. It is primarily for internal use by controllers.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `_data`: Data is the serialized representation of the state.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `revision`: Revision indicates the revision of the state represented by Data.
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

-- | ControllerRevisionList is a resource containing a list of ControllerRevision objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of ControllerRevisions
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
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

-- | DaemonSet represents the configuration of a daemon set.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: The desired behavior of this daemon set. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: The current status of this daemon set. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype DaemonSet = DaemonSet
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined DaemonSetSpec)
  , status :: (NullOrUndefined DaemonSetStatus) }

derive instance newtypeDaemonSet :: Newtype DaemonSet _
derive instance genericDaemonSet :: Generic DaemonSet _
instance showDaemonSet :: Show DaemonSet where show a = genericShow a
instance decodeDaemonSet :: Decode DaemonSet where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSet :: Encode DaemonSet where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSet :: Default DaemonSet where
  default = DaemonSet
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | DaemonSetCondition describes the state of a DaemonSet at a certain point.
-- |
-- | Fields:
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
-- | - `_type`: Type of DaemonSet condition.
newtype DaemonSetCondition = DaemonSetCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeDaemonSetCondition :: Newtype DaemonSetCondition _
derive instance genericDaemonSetCondition :: Generic DaemonSetCondition _
instance showDaemonSetCondition :: Show DaemonSetCondition where show a = genericShow a
instance decodeDaemonSetCondition :: Decode DaemonSetCondition where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetCondition :: Encode DaemonSetCondition where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetCondition :: Default DaemonSetCondition where
  default = DaemonSetCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | DaemonSetList is a collection of daemon sets.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: A list of daemon sets.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype DaemonSetList = DaemonSetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array DaemonSet))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeDaemonSetList :: Newtype DaemonSetList _
derive instance genericDaemonSetList :: Generic DaemonSetList _
instance showDaemonSetList :: Show DaemonSetList where show a = genericShow a
instance decodeDaemonSetList :: Decode DaemonSetList where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetList :: Encode DaemonSetList where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetList :: Default DaemonSetList where
  default = DaemonSetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | DaemonSetSpec is the specification of a daemon set.
-- |
-- | Fields:
-- | - `minReadySeconds`: The minimum number of seconds for which a newly created DaemonSet pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready).
-- | - `revisionHistoryLimit`: The number of old history to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
-- | - `selector`: A label query over pods that are managed by the daemon set. Must match in order to be controlled. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: An object that describes the pod that will be created. The DaemonSet will create exactly one copy of this pod on every node that matches the template's node selector (or on every node if no node selector is specified). More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
-- | - `updateStrategy`: An update strategy to replace existing DaemonSet pods with new pods.
newtype DaemonSetSpec = DaemonSetSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , revisionHistoryLimit :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec)
  , updateStrategy :: (NullOrUndefined DaemonSetUpdateStrategy) }

derive instance newtypeDaemonSetSpec :: Newtype DaemonSetSpec _
derive instance genericDaemonSetSpec :: Generic DaemonSetSpec _
instance showDaemonSetSpec :: Show DaemonSetSpec where show a = genericShow a
instance decodeDaemonSetSpec :: Decode DaemonSetSpec where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetSpec :: Encode DaemonSetSpec where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetSpec :: Default DaemonSetSpec where
  default = DaemonSetSpec
    { minReadySeconds: NullOrUndefined Nothing
    , revisionHistoryLimit: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing
    , updateStrategy: NullOrUndefined Nothing }

-- | DaemonSetStatus represents the current status of a daemon set.
-- |
-- | Fields:
-- | - `collisionCount`: Count of hash collisions for the DaemonSet. The DaemonSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
-- | - `conditions`: Represents the latest available observations of a DaemonSet's current state.
-- | - `currentNumberScheduled`: The number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
-- | - `desiredNumberScheduled`: The total number of nodes that should be running the daemon pod (including nodes correctly running the daemon pod). More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
-- | - `numberAvailable`: The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and available (ready for at least spec.minReadySeconds)
-- | - `numberMisscheduled`: The number of nodes that are running the daemon pod, but are not supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
-- | - `numberReady`: The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and ready.
-- | - `numberUnavailable`: The number of nodes that should be running the daemon pod and have none of the daemon pod running and available (ready for at least spec.minReadySeconds)
-- | - `observedGeneration`: The most recent generation observed by the daemon set controller.
-- | - `updatedNumberScheduled`: The total number of nodes that are running updated daemon pod
newtype DaemonSetStatus = DaemonSetStatus
  { collisionCount :: (NullOrUndefined Int)
  , conditions :: (NullOrUndefined (Array DaemonSetCondition))
  , currentNumberScheduled :: (NullOrUndefined Int)
  , desiredNumberScheduled :: (NullOrUndefined Int)
  , numberAvailable :: (NullOrUndefined Int)
  , numberMisscheduled :: (NullOrUndefined Int)
  , numberReady :: (NullOrUndefined Int)
  , numberUnavailable :: (NullOrUndefined Int)
  , observedGeneration :: (NullOrUndefined Int)
  , updatedNumberScheduled :: (NullOrUndefined Int) }

derive instance newtypeDaemonSetStatus :: Newtype DaemonSetStatus _
derive instance genericDaemonSetStatus :: Generic DaemonSetStatus _
instance showDaemonSetStatus :: Show DaemonSetStatus where show a = genericShow a
instance decodeDaemonSetStatus :: Decode DaemonSetStatus where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetStatus :: Encode DaemonSetStatus where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetStatus :: Default DaemonSetStatus where
  default = DaemonSetStatus
    { collisionCount: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , currentNumberScheduled: NullOrUndefined Nothing
    , desiredNumberScheduled: NullOrUndefined Nothing
    , numberAvailable: NullOrUndefined Nothing
    , numberMisscheduled: NullOrUndefined Nothing
    , numberReady: NullOrUndefined Nothing
    , numberUnavailable: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , updatedNumberScheduled: NullOrUndefined Nothing }

-- | DaemonSetUpdateStrategy is a struct used to control the update strategy for a DaemonSet.
-- |
-- | Fields:
-- | - `rollingUpdate`: Rolling update config params. Present only if type = "RollingUpdate".
-- | - `_type`: Type of daemon set update. Can be "RollingUpdate" or "OnDelete". Default is RollingUpdate.
newtype DaemonSetUpdateStrategy = DaemonSetUpdateStrategy
  { _type :: (NullOrUndefined String)
  , rollingUpdate :: (NullOrUndefined RollingUpdateDaemonSet) }

derive instance newtypeDaemonSetUpdateStrategy :: Newtype DaemonSetUpdateStrategy _
derive instance genericDaemonSetUpdateStrategy :: Generic DaemonSetUpdateStrategy _
instance showDaemonSetUpdateStrategy :: Show DaemonSetUpdateStrategy where show a = genericShow a
instance decodeDaemonSetUpdateStrategy :: Decode DaemonSetUpdateStrategy where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetUpdateStrategy :: Encode DaemonSetUpdateStrategy where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetUpdateStrategy :: Default DaemonSetUpdateStrategy where
  default = DaemonSetUpdateStrategy
    { _type: NullOrUndefined Nothing
    , rollingUpdate: NullOrUndefined Nothing }

-- | Deployment enables declarative updates for Pods and ReplicaSets.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata.
-- | - `spec`: Specification of the desired behavior of the Deployment.
-- | - `status`: Most recently observed status of the Deployment.
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

-- | DeploymentCondition describes the state of a deployment at a certain point.
-- |
-- | Fields:
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `lastUpdateTime`: The last time this condition was updated.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
-- | - `_type`: Type of deployment condition.
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

-- | DeploymentList is a list of Deployments.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of Deployments.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata.
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

-- | DeploymentSpec is the specification of the desired behavior of the Deployment.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `paused`: Indicates that the deployment is paused.
-- | - `progressDeadlineSeconds`: The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. Defaults to 600s.
-- | - `replicas`: Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
-- | - `revisionHistoryLimit`: The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
-- | - `selector`: Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment. It must match the pod template's labels.
-- | - `strategy`: The deployment strategy to use to replace existing pods with new ones.
-- | - `template`: Template describes the pods that will be created.
newtype DeploymentSpec = DeploymentSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , paused :: (NullOrUndefined Boolean)
  , progressDeadlineSeconds :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , revisionHistoryLimit :: (NullOrUndefined Int)
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
    , selector: NullOrUndefined Nothing
    , strategy: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | DeploymentStatus is the most recently observed status of the Deployment.
-- |
-- | Fields:
-- | - `availableReplicas`: Total number of available pods (ready for at least minReadySeconds) targeted by this deployment.
-- | - `collisionCount`: Count of hash collisions for the Deployment. The Deployment controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ReplicaSet.
-- | - `conditions`: Represents the latest available observations of a deployment's current state.
-- | - `observedGeneration`: The generation observed by the deployment controller.
-- | - `readyReplicas`: Total number of ready pods targeted by this deployment.
-- | - `replicas`: Total number of non-terminated pods targeted by this deployment (their labels match the selector).
-- | - `unavailableReplicas`: Total number of unavailable pods targeted by this deployment. This is the total number of pods that are still required for the deployment to have 100% available capacity. They may either be pods that are running but not yet available or pods that still have not been created.
-- | - `updatedReplicas`: Total number of non-terminated pods targeted by this deployment that have the desired template spec.
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

-- | DeploymentStrategy describes how to replace existing pods with new ones.
-- |
-- | Fields:
-- | - `rollingUpdate`: Rolling update config params. Present only if DeploymentStrategyType = RollingUpdate.
-- | - `_type`: Type of deployment. Can be "Recreate" or "RollingUpdate". Default is RollingUpdate.
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

-- | ReplicaSet ensures that a specified number of pod replicas are running at any given time.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: If the Labels of a ReplicaSet are empty, they are defaulted to be the same as the Pod(s) that the ReplicaSet manages. Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the specification of the desired behavior of the ReplicaSet. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status is the most recently observed status of the ReplicaSet. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype ReplicaSet = ReplicaSet
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined ReplicaSetSpec)
  , status :: (NullOrUndefined ReplicaSetStatus) }

derive instance newtypeReplicaSet :: Newtype ReplicaSet _
derive instance genericReplicaSet :: Generic ReplicaSet _
instance showReplicaSet :: Show ReplicaSet where show a = genericShow a
instance decodeReplicaSet :: Decode ReplicaSet where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSet :: Encode ReplicaSet where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSet :: Default ReplicaSet where
  default = ReplicaSet
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | ReplicaSetCondition describes the state of a replica set at a certain point.
-- |
-- | Fields:
-- | - `lastTransitionTime`: The last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
-- | - `_type`: Type of replica set condition.
newtype ReplicaSetCondition = ReplicaSetCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeReplicaSetCondition :: Newtype ReplicaSetCondition _
derive instance genericReplicaSetCondition :: Generic ReplicaSetCondition _
instance showReplicaSetCondition :: Show ReplicaSetCondition where show a = genericShow a
instance decodeReplicaSetCondition :: Decode ReplicaSetCondition where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSetCondition :: Encode ReplicaSetCondition where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSetCondition :: Default ReplicaSetCondition where
  default = ReplicaSetCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | ReplicaSetList is a collection of ReplicaSets.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of ReplicaSets. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ReplicaSetList = ReplicaSetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ReplicaSet))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeReplicaSetList :: Newtype ReplicaSetList _
derive instance genericReplicaSetList :: Generic ReplicaSetList _
instance showReplicaSetList :: Show ReplicaSetList where show a = genericShow a
instance decodeReplicaSetList :: Decode ReplicaSetList where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSetList :: Encode ReplicaSetList where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSetList :: Default ReplicaSetList where
  default = ReplicaSetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | ReplicaSetSpec is the specification of a ReplicaSet.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `replicas`: Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
-- | - `selector`: Selector is a label query over pods that should match the replica count. Label keys and values that must match in order to be controlled by this replica set. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: Template is the object that describes the pod that will be created if insufficient replicas are detected. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
newtype ReplicaSetSpec = ReplicaSetSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec) }

derive instance newtypeReplicaSetSpec :: Newtype ReplicaSetSpec _
derive instance genericReplicaSetSpec :: Generic ReplicaSetSpec _
instance showReplicaSetSpec :: Show ReplicaSetSpec where show a = genericShow a
instance decodeReplicaSetSpec :: Decode ReplicaSetSpec where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSetSpec :: Encode ReplicaSetSpec where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSetSpec :: Default ReplicaSetSpec where
  default = ReplicaSetSpec
    { minReadySeconds: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | ReplicaSetStatus represents the current status of a ReplicaSet.
-- |
-- | Fields:
-- | - `availableReplicas`: The number of available replicas (ready for at least minReadySeconds) for this replica set.
-- | - `conditions`: Represents the latest available observations of a replica set's current state.
-- | - `fullyLabeledReplicas`: The number of pods that have labels matching the labels of the pod template of the replicaset.
-- | - `observedGeneration`: ObservedGeneration reflects the generation of the most recently observed ReplicaSet.
-- | - `readyReplicas`: The number of ready replicas for this replica set.
-- | - `replicas`: Replicas is the most recently oberved number of replicas. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
newtype ReplicaSetStatus = ReplicaSetStatus
  { availableReplicas :: (NullOrUndefined Int)
  , conditions :: (NullOrUndefined (Array ReplicaSetCondition))
  , fullyLabeledReplicas :: (NullOrUndefined Int)
  , observedGeneration :: (NullOrUndefined Int)
  , readyReplicas :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int) }

derive instance newtypeReplicaSetStatus :: Newtype ReplicaSetStatus _
derive instance genericReplicaSetStatus :: Generic ReplicaSetStatus _
instance showReplicaSetStatus :: Show ReplicaSetStatus where show a = genericShow a
instance decodeReplicaSetStatus :: Decode ReplicaSetStatus where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSetStatus :: Encode ReplicaSetStatus where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSetStatus :: Default ReplicaSetStatus where
  default = ReplicaSetStatus
    { availableReplicas: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , fullyLabeledReplicas: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , readyReplicas: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing }

-- | Spec to control the desired behavior of daemon set rolling update.
-- |
-- | Fields:
-- | - `maxUnavailable`: The maximum number of DaemonSet pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of total number of DaemonSet pods at the start of the update (ex: 10%). Absolute number is calculated from percentage by rounding up. This cannot be 0. Default value is 1. Example: when this is set to 30%, at most 30% of the total number of nodes that should be running the daemon pod (i.e. status.desiredNumberScheduled) can have their pods stopped for an update at any given time. The update starts by stopping at most 30% of those DaemonSet pods and then brings up new DaemonSet pods in their place. Once the new pods are available, it then proceeds onto other DaemonSet pods, thus ensuring that at least 70% of original number of DaemonSet pods are available at all times during the update.
newtype RollingUpdateDaemonSet = RollingUpdateDaemonSet
  { maxUnavailable :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeRollingUpdateDaemonSet :: Newtype RollingUpdateDaemonSet _
derive instance genericRollingUpdateDaemonSet :: Generic RollingUpdateDaemonSet _
instance showRollingUpdateDaemonSet :: Show RollingUpdateDaemonSet where show a = genericShow a
instance decodeRollingUpdateDaemonSet :: Decode RollingUpdateDaemonSet where
  decode a = genericDecode jsonOptions a 
instance encodeRollingUpdateDaemonSet :: Encode RollingUpdateDaemonSet where
  encode a = genericEncode jsonOptions a

instance defaultRollingUpdateDaemonSet :: Default RollingUpdateDaemonSet where
  default = RollingUpdateDaemonSet
    { maxUnavailable: NullOrUndefined Nothing }

-- | Spec to control the desired behavior of rolling update.
-- |
-- | Fields:
-- | - `maxSurge`: The maximum number of pods that can be scheduled above the desired number of pods. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). This can not be 0 if MaxUnavailable is 0. Absolute number is calculated from percentage by rounding up. Defaults to 25%. Example: when this is set to 30%, the new RC can be scaled up immediately when the rolling update starts, such that the total number of old and new pods do not exceed 130% of desired pods. Once old pods have been killed, new RC can be scaled up further, ensuring that total number of pods running at any time during the update is at most 130% of desired pods.
-- | - `maxUnavailable`: The maximum number of pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). Absolute number is calculated from percentage by rounding down. This can not be 0 if MaxSurge is 0. Defaults to 25%. Example: when this is set to 30%, the old RC can be scaled down to 70% of desired pods immediately when the rolling update starts. Once new pods are ready, old RC can be scaled down further, followed by scaling up the new RC, ensuring that the total number of pods available at all times during the update is at least 70% of desired pods.
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

-- | RollingUpdateStatefulSetStrategy is used to communicate parameter for RollingUpdateStatefulSetStrategyType.
-- |
-- | Fields:
-- | - `partition`: Partition indicates the ordinal at which the StatefulSet should be partitioned. Default value is 0.
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

-- | StatefulSet represents a set of pods with consistent identities. Identities are defined as:
-- |  - Network: A single stable DNS and hostname.
-- |  - Storage: As many VolumeClaims as requested.
-- | The StatefulSet guarantees that a given network identity will always map to the same storage identity.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Spec defines the desired identities of pods in this set.
-- | - `status`: Status is the current status of Pods in this StatefulSet. This data may be out of date by some window of time.
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

-- | StatefulSetCondition describes the state of a statefulset at a certain point.
-- |
-- | Fields:
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
-- | - `_type`: Type of statefulset condition.
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

-- | StatefulSetList is a collection of StatefulSets.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
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

-- | A StatefulSetSpec is the specification of a StatefulSet.
-- |
-- | Fields:
-- | - `podManagementPolicy`: podManagementPolicy controls how pods are created during initial scale up, when replacing pods on nodes, or when scaling down. The default policy is `OrderedReady`, where pods are created in increasing order (pod-0, then pod-1, etc) and the controller will wait until each pod is ready before continuing. When scaling down, the pods are removed in the opposite order. The alternative policy is `Parallel` which will create pods in parallel to match the desired scale without waiting, and on scale down will delete all pods at once.
-- | - `replicas`: replicas is the desired number of replicas of the given Template. These are replicas in the sense that they are instantiations of the same Template, but individual replicas also have a consistent identity. If unspecified, defaults to 1.
-- | - `revisionHistoryLimit`: revisionHistoryLimit is the maximum number of revisions that will be maintained in the StatefulSet's revision history. The revision history consists of all revisions not represented by a currently applied StatefulSetSpec version. The default value is 10.
-- | - `selector`: selector is a label query over pods that should match the replica count. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `serviceName`: serviceName is the name of the service that governs this StatefulSet. This service must exist before the StatefulSet, and is responsible for the network identity of the set. Pods get DNS/hostnames that follow the pattern: pod-specific-string.serviceName.default.svc.cluster.local where "pod-specific-string" is managed by the StatefulSet controller.
-- | - `template`: template is the object that describes the pod that will be created if insufficient replicas are detected. Each pod stamped out by the StatefulSet will fulfill this Template, but have a unique identity from the rest of the StatefulSet.
-- | - `updateStrategy`: updateStrategy indicates the StatefulSetUpdateStrategy that will be employed to update Pods in the StatefulSet when a revision is made to Template.
-- | - `volumeClaimTemplates`: volumeClaimTemplates is a list of claims that pods are allowed to reference. The StatefulSet controller is responsible for mapping network identities to claims in a way that maintains the identity of a pod. Every claim in this list must have at least one matching (by name) volumeMount in one container in the template. A claim in this list takes precedence over any volumes in the template, with the same name.
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

-- | StatefulSetStatus represents the current state of a StatefulSet.
-- |
-- | Fields:
-- | - `collisionCount`: collisionCount is the count of hash collisions for the StatefulSet. The StatefulSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
-- | - `conditions`: Represents the latest available observations of a statefulset's current state.
-- | - `currentReplicas`: currentReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by currentRevision.
-- | - `currentRevision`: currentRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [0,currentReplicas).
-- | - `observedGeneration`: observedGeneration is the most recent generation observed for this StatefulSet. It corresponds to the StatefulSet's generation, which is updated on mutation by the API Server.
-- | - `readyReplicas`: readyReplicas is the number of Pods created by the StatefulSet controller that have a Ready Condition.
-- | - `replicas`: replicas is the number of Pods created by the StatefulSet controller.
-- | - `updateRevision`: updateRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [replicas-updatedReplicas,replicas)
-- | - `updatedReplicas`: updatedReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by updateRevision.
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

-- | StatefulSetUpdateStrategy indicates the strategy that the StatefulSet controller will use to perform updates. It includes any additional parameters necessary to perform the update for the indicated strategy.
-- |
-- | Fields:
-- | - `rollingUpdate`: RollingUpdate is used to communicate parameters when Type is RollingUpdateStatefulSetStrategyType.
-- | - `_type`: Type indicates the type of the StatefulSetUpdateStrategy. Default is RollingUpdate.
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

-- | create a ControllerRevision
createNamespacedControllerRevision :: forall e. Config -> String -> ControllerRevision -> Aff (http :: HTTP | e) (Either MetaV1.Status ControllerRevision)
createNamespacedControllerRevision cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions"
    encodedBody = encodeJSON body

-- | create a DaemonSet
createNamespacedDaemonSet :: forall e. Config -> String -> DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status DaemonSet)
createNamespacedDaemonSet cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/daemonsets"
    encodedBody = encodeJSON body

-- | create a Deployment
createNamespacedDeployment :: forall e. Config -> String -> Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
createNamespacedDeployment cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments"
    encodedBody = encodeJSON body

-- | create a ReplicaSet
createNamespacedReplicaSet :: forall e. Config -> String -> ReplicaSet -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicaSet)
createNamespacedReplicaSet cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets"
    encodedBody = encodeJSON body

-- | create a StatefulSet
createNamespacedStatefulSet :: forall e. Config -> String -> StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
createNamespacedStatefulSet cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions" <> formatQueryString options

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
newtype DeleteCollectionNamespacedDaemonSetOptions = DeleteCollectionNamespacedDaemonSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedDaemonSetOptions :: Newtype DeleteCollectionNamespacedDaemonSetOptions _
derive instance genericDeleteCollectionNamespacedDaemonSetOptions :: Generic DeleteCollectionNamespacedDaemonSetOptions _
instance showDeleteCollectionNamespacedDaemonSetOptions :: Show DeleteCollectionNamespacedDaemonSetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedDaemonSetOptions :: Decode DeleteCollectionNamespacedDaemonSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedDaemonSetOptions :: Encode DeleteCollectionNamespacedDaemonSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedDaemonSetOptions :: Default DeleteCollectionNamespacedDaemonSetOptions where
  default = DeleteCollectionNamespacedDaemonSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of DaemonSet
deleteCollectionNamespacedDaemonSet :: forall e. Config -> String -> DeleteCollectionNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedDaemonSet cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/daemonsets" <> formatQueryString options

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments" <> formatQueryString options

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
newtype DeleteCollectionNamespacedReplicaSetOptions = DeleteCollectionNamespacedReplicaSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedReplicaSetOptions :: Newtype DeleteCollectionNamespacedReplicaSetOptions _
derive instance genericDeleteCollectionNamespacedReplicaSetOptions :: Generic DeleteCollectionNamespacedReplicaSetOptions _
instance showDeleteCollectionNamespacedReplicaSetOptions :: Show DeleteCollectionNamespacedReplicaSetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedReplicaSetOptions :: Decode DeleteCollectionNamespacedReplicaSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedReplicaSetOptions :: Encode DeleteCollectionNamespacedReplicaSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedReplicaSetOptions :: Default DeleteCollectionNamespacedReplicaSetOptions where
  default = DeleteCollectionNamespacedReplicaSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ReplicaSet
deleteCollectionNamespacedReplicaSet :: forall e. Config -> String -> DeleteCollectionNamespacedReplicaSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedReplicaSet cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets" <> formatQueryString options

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedDaemonSetOptions = DeleteNamespacedDaemonSetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedDaemonSetOptions :: Newtype DeleteNamespacedDaemonSetOptions _
derive instance genericDeleteNamespacedDaemonSetOptions :: Generic DeleteNamespacedDaemonSetOptions _
instance showDeleteNamespacedDaemonSetOptions :: Show DeleteNamespacedDaemonSetOptions where show a = genericShow a
instance decodeDeleteNamespacedDaemonSetOptions :: Decode DeleteNamespacedDaemonSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedDaemonSetOptions :: Encode DeleteNamespacedDaemonSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedDaemonSetOptions :: Default DeleteNamespacedDaemonSetOptions where
  default = DeleteNamespacedDaemonSetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a DaemonSet
deleteNamespacedDaemonSet :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedDaemonSet cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/daemonsets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedReplicaSetOptions = DeleteNamespacedReplicaSetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedReplicaSetOptions :: Newtype DeleteNamespacedReplicaSetOptions _
derive instance genericDeleteNamespacedReplicaSetOptions :: Generic DeleteNamespacedReplicaSetOptions _
instance showDeleteNamespacedReplicaSetOptions :: Show DeleteNamespacedReplicaSetOptions where show a = genericShow a
instance decodeDeleteNamespacedReplicaSetOptions :: Decode DeleteNamespacedReplicaSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedReplicaSetOptions :: Encode DeleteNamespacedReplicaSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedReplicaSetOptions :: Default DeleteNamespacedReplicaSetOptions where
  default = DeleteNamespacedReplicaSetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ReplicaSet
deleteNamespacedReplicaSet :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedReplicaSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedReplicaSet cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/"

-- | list or watch objects of kind ControllerRevision
listControllerRevisionForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ControllerRevisionList)
listControllerRevisionForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/controllerrevisions"

-- | list or watch objects of kind DaemonSet
listDaemonSetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status DaemonSetList)
listDaemonSetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/daemonsets"

-- | list or watch objects of kind Deployment
listDeploymentForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status DeploymentList)
listDeploymentForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/deployments"

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions" <> formatQueryString options

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
newtype ListNamespacedDaemonSetOptions = ListNamespacedDaemonSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedDaemonSetOptions :: Newtype ListNamespacedDaemonSetOptions _
derive instance genericListNamespacedDaemonSetOptions :: Generic ListNamespacedDaemonSetOptions _
instance showListNamespacedDaemonSetOptions :: Show ListNamespacedDaemonSetOptions where show a = genericShow a
instance decodeListNamespacedDaemonSetOptions :: Decode ListNamespacedDaemonSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedDaemonSetOptions :: Encode ListNamespacedDaemonSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedDaemonSetOptions :: Default ListNamespacedDaemonSetOptions where
  default = ListNamespacedDaemonSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind DaemonSet
listNamespacedDaemonSet :: forall e. Config -> String -> ListNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status DaemonSetList)
listNamespacedDaemonSet cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/daemonsets" <> formatQueryString options

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments" <> formatQueryString options

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
newtype ListNamespacedReplicaSetOptions = ListNamespacedReplicaSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedReplicaSetOptions :: Newtype ListNamespacedReplicaSetOptions _
derive instance genericListNamespacedReplicaSetOptions :: Generic ListNamespacedReplicaSetOptions _
instance showListNamespacedReplicaSetOptions :: Show ListNamespacedReplicaSetOptions where show a = genericShow a
instance decodeListNamespacedReplicaSetOptions :: Decode ListNamespacedReplicaSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedReplicaSetOptions :: Encode ListNamespacedReplicaSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedReplicaSetOptions :: Default ListNamespacedReplicaSetOptions where
  default = ListNamespacedReplicaSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ReplicaSet
listNamespacedReplicaSet :: forall e. Config -> String -> ListNamespacedReplicaSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicaSetList)
listNamespacedReplicaSet cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets" <> formatQueryString options

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets" <> formatQueryString options

-- | list or watch objects of kind ReplicaSet
listReplicaSetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicaSetList)
listReplicaSetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/replicasets"

-- | list or watch objects of kind StatefulSet
listStatefulSetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSetList)
listStatefulSetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/statefulsets"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> "" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedDaemonSetOptions = ReadNamespacedDaemonSetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedDaemonSetOptions :: Newtype ReadNamespacedDaemonSetOptions _
derive instance genericReadNamespacedDaemonSetOptions :: Generic ReadNamespacedDaemonSetOptions _
instance showReadNamespacedDaemonSetOptions :: Show ReadNamespacedDaemonSetOptions where show a = genericShow a
instance decodeReadNamespacedDaemonSetOptions :: Decode ReadNamespacedDaemonSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedDaemonSetOptions :: Encode ReadNamespacedDaemonSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedDaemonSetOptions :: Default ReadNamespacedDaemonSetOptions where
  default = ReadNamespacedDaemonSetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified DaemonSet
readNamespacedDaemonSet :: forall e. Config -> String -> String -> ReadNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status DaemonSet)
readNamespacedDaemonSet cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/daemonsets/" <> name <> "" <> formatQueryString options

-- | read status of the specified DaemonSet
readNamespacedDaemonSetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status DaemonSet)
readNamespacedDaemonSetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/daemonsets/" <> name <> "/status"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> "" <> formatQueryString options

-- | read status of the specified Deployment
readNamespacedDeploymentStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
readNamespacedDeploymentStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> "/status"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedReplicaSetOptions = ReadNamespacedReplicaSetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedReplicaSetOptions :: Newtype ReadNamespacedReplicaSetOptions _
derive instance genericReadNamespacedReplicaSetOptions :: Generic ReadNamespacedReplicaSetOptions _
instance showReadNamespacedReplicaSetOptions :: Show ReadNamespacedReplicaSetOptions where show a = genericShow a
instance decodeReadNamespacedReplicaSetOptions :: Decode ReadNamespacedReplicaSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedReplicaSetOptions :: Encode ReadNamespacedReplicaSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedReplicaSetOptions :: Default ReadNamespacedReplicaSetOptions where
  default = ReadNamespacedReplicaSetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ReplicaSet
readNamespacedReplicaSet :: forall e. Config -> String -> String -> ReadNamespacedReplicaSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicaSet)
readNamespacedReplicaSet cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> "" <> formatQueryString options

-- | read status of the specified ReplicaSet
readNamespacedReplicaSetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicaSet)
readNamespacedReplicaSetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/status"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
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
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "" <> formatQueryString options

-- | read status of the specified StatefulSet
readNamespacedStatefulSetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
readNamespacedStatefulSetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/status"

-- | replace the specified ControllerRevision
replaceNamespacedControllerRevision :: forall e. Config -> String -> String -> ControllerRevision -> Aff (http :: HTTP | e) (Either MetaV1.Status ControllerRevision)
replaceNamespacedControllerRevision cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified DaemonSet
replaceNamespacedDaemonSet :: forall e. Config -> String -> String -> DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status DaemonSet)
replaceNamespacedDaemonSet cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/daemonsets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified DaemonSet
replaceNamespacedDaemonSetStatus :: forall e. Config -> String -> String -> DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status DaemonSet)
replaceNamespacedDaemonSetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/daemonsets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified Deployment
replaceNamespacedDeployment :: forall e. Config -> String -> String -> Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
replaceNamespacedDeployment cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Deployment
replaceNamespacedDeploymentStatus :: forall e. Config -> String -> String -> Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status Deployment)
replaceNamespacedDeploymentStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified ReplicaSet
replaceNamespacedReplicaSet :: forall e. Config -> String -> String -> ReplicaSet -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicaSet)
replaceNamespacedReplicaSet cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified ReplicaSet
replaceNamespacedReplicaSetStatus :: forall e. Config -> String -> String -> ReplicaSet -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicaSet)
replaceNamespacedReplicaSetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified StatefulSet
replaceNamespacedStatefulSet :: forall e. Config -> String -> String -> StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
replaceNamespacedStatefulSet cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified StatefulSet
replaceNamespacedStatefulSetStatus :: forall e. Config -> String -> String -> StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status StatefulSet)
replaceNamespacedStatefulSetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of ControllerRevision
watchControllerRevisionListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchControllerRevisionListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/controllerrevisions"

-- | watch individual changes to a list of DaemonSet
watchDaemonSetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchDaemonSetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/daemonsets"

-- | watch individual changes to a list of Deployment
watchDeploymentListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchDeploymentListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/deployments"

-- | watch changes to an object of kind ControllerRevision
watchNamespacedControllerRevision :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedControllerRevision cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> ""

-- | watch individual changes to a list of ControllerRevision
watchNamespacedControllerRevisionList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedControllerRevisionList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/controllerrevisions"

-- | watch changes to an object of kind DaemonSet
watchNamespacedDaemonSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDaemonSet cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/daemonsets/" <> name <> ""

-- | watch individual changes to a list of DaemonSet
watchNamespacedDaemonSetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDaemonSetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/daemonsets"

-- | watch changes to an object of kind Deployment
watchNamespacedDeployment :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDeployment cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/deployments/" <> name <> ""

-- | watch individual changes to a list of Deployment
watchNamespacedDeploymentList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDeploymentList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/deployments"

-- | watch changes to an object of kind ReplicaSet
watchNamespacedReplicaSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedReplicaSet cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/replicasets/" <> name <> ""

-- | watch individual changes to a list of ReplicaSet
watchNamespacedReplicaSetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedReplicaSetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/replicasets"

-- | watch changes to an object of kind StatefulSet
watchNamespacedStatefulSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedStatefulSet cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/statefulsets/" <> name <> ""

-- | watch individual changes to a list of StatefulSet
watchNamespacedStatefulSetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedStatefulSetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/statefulsets"

-- | watch individual changes to a list of ReplicaSet
watchReplicaSetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchReplicaSetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/replicasets"

-- | watch individual changes to a list of StatefulSet
watchStatefulSetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchStatefulSetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/statefulsets"