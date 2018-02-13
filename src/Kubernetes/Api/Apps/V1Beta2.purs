module Kubernetes.Api.Apps.V1Beta2 where

import Prelude
import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
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
import Kubernetes.Api.Runtime as Runtime
import Kubernetes.Api.Util as Util

-- | DEPRECATED - This group version of ControllerRevision is deprecated by apps/v1/ControllerRevision. See the release notes for more information. ControllerRevision implements an immutable snapshot of state data. Clients are responsible for serializing and deserializing the objects that contain their internal state. Once a ControllerRevision has been successfully created, it can not be updated. The API Server will fail validation of all requests that attempt to mutate the Data field. ControllerRevisions may, however, be deleted. Note that, due to its use by both the DaemonSet and StatefulSet controllers for update and rollback, this object is beta. However, it may be subject to name and representation changes in future releases, and clients should not depend on its stability. It is primarily for internal use by controllers.
-- |
-- | Fields:
-- | - `_data`: Data is the serialized representation of the state.
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `revision`: Revision indicates the revision of the state represented by Data.
newtype ControllerRevision = ControllerRevision
  { _data :: (Maybe Runtime.RawExtension)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , revision :: (Maybe Int) }

derive instance newtypeControllerRevision :: Newtype ControllerRevision _
derive instance genericControllerRevision :: Generic ControllerRevision _
instance showControllerRevision :: Show ControllerRevision where show a = genericShow a
instance decodeControllerRevision :: Decode ControllerRevision where
  decode a = do
               _data <- decodeMaybe "_data" a
               assertPropEq "apiVersion" "apps/v1beta2" a
               assertPropEq "kind" "ControllerRevision" a
               metadata <- decodeMaybe "metadata" a
               revision <- decodeMaybe "revision" a
               pure $ ControllerRevision { _data, metadata, revision }
instance encodeControllerRevision :: Encode ControllerRevision where
  encode (ControllerRevision a) = encode $ StrMap.fromFoldable $
               [ Tuple "_data" (encodeMaybe a._data)
               , Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "kind" (encode "ControllerRevision")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "revision" (encodeMaybe a.revision) ]


instance defaultControllerRevision :: Default ControllerRevision where
  default = ControllerRevision
    { _data: Nothing
    , metadata: Nothing
    , revision: Nothing }

-- | ControllerRevisionList is a resource containing a list of ControllerRevision objects.
-- |
-- | Fields:
-- | - `items`: Items is the list of ControllerRevisions
-- | - `metadata`: More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype ControllerRevisionList = ControllerRevisionList
  { items :: (Maybe (Array ControllerRevision))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeControllerRevisionList :: Newtype ControllerRevisionList _
derive instance genericControllerRevisionList :: Generic ControllerRevisionList _
instance showControllerRevisionList :: Show ControllerRevisionList where show a = genericShow a
instance decodeControllerRevisionList :: Decode ControllerRevisionList where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ControllerRevisionList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ControllerRevisionList { items, metadata }
instance encodeControllerRevisionList :: Encode ControllerRevisionList where
  encode (ControllerRevisionList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ControllerRevisionList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultControllerRevisionList :: Default ControllerRevisionList where
  default = ControllerRevisionList
    { items: Nothing
    , metadata: Nothing }

-- | DEPRECATED - This group version of DaemonSet is deprecated by apps/v1/DaemonSet. See the release notes for more information. DaemonSet represents the configuration of a daemon set.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: The desired behavior of this daemon set. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: The current status of this daemon set. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype DaemonSet = DaemonSet
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe DaemonSetSpec)
  , status :: (Maybe DaemonSetStatus) }

derive instance newtypeDaemonSet :: Newtype DaemonSet _
derive instance genericDaemonSet :: Generic DaemonSet _
instance showDaemonSet :: Show DaemonSet where show a = genericShow a
instance decodeDaemonSet :: Decode DaemonSet where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               assertPropEq "kind" "DaemonSet" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ DaemonSet { metadata, spec, status }
instance encodeDaemonSet :: Encode DaemonSet where
  encode (DaemonSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "kind" (encode "DaemonSet")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultDaemonSet :: Default DaemonSet where
  default = DaemonSet
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | DaemonSetCondition describes the state of a DaemonSet at a certain point.
-- |
-- | Fields:
-- | - `_type`: Type of DaemonSet condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype DaemonSetCondition = DaemonSetCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeDaemonSetCondition :: Newtype DaemonSetCondition _
derive instance genericDaemonSetCondition :: Generic DaemonSetCondition _
instance showDaemonSetCondition :: Show DaemonSetCondition where show a = genericShow a
instance decodeDaemonSetCondition :: Decode DaemonSetCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ DaemonSetCondition { _type, lastTransitionTime, message, reason, status }
instance encodeDaemonSetCondition :: Encode DaemonSetCondition where
  encode (DaemonSetCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultDaemonSetCondition :: Default DaemonSetCondition where
  default = DaemonSetCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | DaemonSetList is a collection of daemon sets.
-- |
-- | Fields:
-- | - `items`: A list of daemon sets.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype DaemonSetList = DaemonSetList
  { items :: (Maybe (Array DaemonSet))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeDaemonSetList :: Newtype DaemonSetList _
derive instance genericDaemonSetList :: Generic DaemonSetList _
instance showDaemonSetList :: Show DaemonSetList where show a = genericShow a
instance decodeDaemonSetList :: Decode DaemonSetList where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "DaemonSetList" a
               metadata <- decodeMaybe "metadata" a
               pure $ DaemonSetList { items, metadata }
instance encodeDaemonSetList :: Encode DaemonSetList where
  encode (DaemonSetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "DaemonSetList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultDaemonSetList :: Default DaemonSetList where
  default = DaemonSetList
    { items: Nothing
    , metadata: Nothing }

-- | DaemonSetSpec is the specification of a daemon set.
-- |
-- | Fields:
-- | - `minReadySeconds`: The minimum number of seconds for which a newly created DaemonSet pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready).
-- | - `revisionHistoryLimit`: The number of old history to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
-- | - `selector`: A label query over pods that are managed by the daemon set. Must match in order to be controlled. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: An object that describes the pod that will be created. The DaemonSet will create exactly one copy of this pod on every node that matches the template's node selector (or on every node if no node selector is specified). More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
-- | - `updateStrategy`: An update strategy to replace existing DaemonSet pods with new pods.
newtype DaemonSetSpec = DaemonSetSpec
  { minReadySeconds :: (Maybe Int)
  , revisionHistoryLimit :: (Maybe Int)
  , selector :: (Maybe MetaV1.LabelSelector)
  , template :: (Maybe CoreV1.PodTemplateSpec)
  , updateStrategy :: (Maybe DaemonSetUpdateStrategy) }

derive instance newtypeDaemonSetSpec :: Newtype DaemonSetSpec _
derive instance genericDaemonSetSpec :: Generic DaemonSetSpec _
instance showDaemonSetSpec :: Show DaemonSetSpec where show a = genericShow a
instance decodeDaemonSetSpec :: Decode DaemonSetSpec where
  decode a = do
               minReadySeconds <- decodeMaybe "minReadySeconds" a
               revisionHistoryLimit <- decodeMaybe "revisionHistoryLimit" a
               selector <- decodeMaybe "selector" a
               template <- decodeMaybe "template" a
               updateStrategy <- decodeMaybe "updateStrategy" a
               pure $ DaemonSetSpec { minReadySeconds, revisionHistoryLimit, selector, template, updateStrategy }
instance encodeDaemonSetSpec :: Encode DaemonSetSpec where
  encode (DaemonSetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encodeMaybe a.minReadySeconds)
               , Tuple "revisionHistoryLimit" (encodeMaybe a.revisionHistoryLimit)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "template" (encodeMaybe a.template)
               , Tuple "updateStrategy" (encodeMaybe a.updateStrategy) ]


instance defaultDaemonSetSpec :: Default DaemonSetSpec where
  default = DaemonSetSpec
    { minReadySeconds: Nothing
    , revisionHistoryLimit: Nothing
    , selector: Nothing
    , template: Nothing
    , updateStrategy: Nothing }

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
  { collisionCount :: (Maybe Int)
  , conditions :: (Maybe (Array DaemonSetCondition))
  , currentNumberScheduled :: (Maybe Int)
  , desiredNumberScheduled :: (Maybe Int)
  , numberAvailable :: (Maybe Int)
  , numberMisscheduled :: (Maybe Int)
  , numberReady :: (Maybe Int)
  , numberUnavailable :: (Maybe Int)
  , observedGeneration :: (Maybe Int)
  , updatedNumberScheduled :: (Maybe Int) }

derive instance newtypeDaemonSetStatus :: Newtype DaemonSetStatus _
derive instance genericDaemonSetStatus :: Generic DaemonSetStatus _
instance showDaemonSetStatus :: Show DaemonSetStatus where show a = genericShow a
instance decodeDaemonSetStatus :: Decode DaemonSetStatus where
  decode a = do
               collisionCount <- decodeMaybe "collisionCount" a
               conditions <- decodeMaybe "conditions" a
               currentNumberScheduled <- decodeMaybe "currentNumberScheduled" a
               desiredNumberScheduled <- decodeMaybe "desiredNumberScheduled" a
               numberAvailable <- decodeMaybe "numberAvailable" a
               numberMisscheduled <- decodeMaybe "numberMisscheduled" a
               numberReady <- decodeMaybe "numberReady" a
               numberUnavailable <- decodeMaybe "numberUnavailable" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               updatedNumberScheduled <- decodeMaybe "updatedNumberScheduled" a
               pure $ DaemonSetStatus { collisionCount, conditions, currentNumberScheduled, desiredNumberScheduled, numberAvailable, numberMisscheduled, numberReady, numberUnavailable, observedGeneration, updatedNumberScheduled }
instance encodeDaemonSetStatus :: Encode DaemonSetStatus where
  encode (DaemonSetStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "collisionCount" (encodeMaybe a.collisionCount)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "currentNumberScheduled" (encodeMaybe a.currentNumberScheduled)
               , Tuple "desiredNumberScheduled" (encodeMaybe a.desiredNumberScheduled)
               , Tuple "numberAvailable" (encodeMaybe a.numberAvailable)
               , Tuple "numberMisscheduled" (encodeMaybe a.numberMisscheduled)
               , Tuple "numberReady" (encodeMaybe a.numberReady)
               , Tuple "numberUnavailable" (encodeMaybe a.numberUnavailable)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration)
               , Tuple "updatedNumberScheduled" (encodeMaybe a.updatedNumberScheduled) ]


instance defaultDaemonSetStatus :: Default DaemonSetStatus where
  default = DaemonSetStatus
    { collisionCount: Nothing
    , conditions: Nothing
    , currentNumberScheduled: Nothing
    , desiredNumberScheduled: Nothing
    , numberAvailable: Nothing
    , numberMisscheduled: Nothing
    , numberReady: Nothing
    , numberUnavailable: Nothing
    , observedGeneration: Nothing
    , updatedNumberScheduled: Nothing }

-- | DaemonSetUpdateStrategy is a struct used to control the update strategy for a DaemonSet.
-- |
-- | Fields:
-- | - `_type`: Type of daemon set update. Can be "RollingUpdate" or "OnDelete". Default is RollingUpdate.
-- | - `rollingUpdate`: Rolling update config params. Present only if type = "RollingUpdate".
newtype DaemonSetUpdateStrategy = DaemonSetUpdateStrategy
  { _type :: (Maybe String)
  , rollingUpdate :: (Maybe RollingUpdateDaemonSet) }

derive instance newtypeDaemonSetUpdateStrategy :: Newtype DaemonSetUpdateStrategy _
derive instance genericDaemonSetUpdateStrategy :: Generic DaemonSetUpdateStrategy _
instance showDaemonSetUpdateStrategy :: Show DaemonSetUpdateStrategy where show a = genericShow a
instance decodeDaemonSetUpdateStrategy :: Decode DaemonSetUpdateStrategy where
  decode a = do
               _type <- decodeMaybe "_type" a
               rollingUpdate <- decodeMaybe "rollingUpdate" a
               pure $ DaemonSetUpdateStrategy { _type, rollingUpdate }
instance encodeDaemonSetUpdateStrategy :: Encode DaemonSetUpdateStrategy where
  encode (DaemonSetUpdateStrategy a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "rollingUpdate" (encodeMaybe a.rollingUpdate) ]


instance defaultDaemonSetUpdateStrategy :: Default DaemonSetUpdateStrategy where
  default = DaemonSetUpdateStrategy
    { _type: Nothing
    , rollingUpdate: Nothing }

-- | DEPRECATED - This group version of Deployment is deprecated by apps/v1/Deployment. See the release notes for more information. Deployment enables declarative updates for Pods and ReplicaSets.
-- |
-- | Fields:
-- | - `metadata`: Standard object metadata.
-- | - `spec`: Specification of the desired behavior of the Deployment.
-- | - `status`: Most recently observed status of the Deployment.
newtype Deployment = Deployment
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe DeploymentSpec)
  , status :: (Maybe DeploymentStatus) }

derive instance newtypeDeployment :: Newtype Deployment _
derive instance genericDeployment :: Generic Deployment _
instance showDeployment :: Show Deployment where show a = genericShow a
instance decodeDeployment :: Decode Deployment where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               assertPropEq "kind" "Deployment" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Deployment { metadata, spec, status }
instance encodeDeployment :: Encode Deployment where
  encode (Deployment a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "kind" (encode "Deployment")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultDeployment :: Default Deployment where
  default = Deployment
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | DeploymentCondition describes the state of a deployment at a certain point.
-- |
-- | Fields:
-- | - `_type`: Type of deployment condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `lastUpdateTime`: The last time this condition was updated.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype DeploymentCondition = DeploymentCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , lastUpdateTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeDeploymentCondition :: Newtype DeploymentCondition _
derive instance genericDeploymentCondition :: Generic DeploymentCondition _
instance showDeploymentCondition :: Show DeploymentCondition where show a = genericShow a
instance decodeDeploymentCondition :: Decode DeploymentCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               lastUpdateTime <- decodeMaybe "lastUpdateTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ DeploymentCondition { _type, lastTransitionTime, lastUpdateTime, message, reason, status }
instance encodeDeploymentCondition :: Encode DeploymentCondition where
  encode (DeploymentCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "lastUpdateTime" (encodeMaybe a.lastUpdateTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultDeploymentCondition :: Default DeploymentCondition where
  default = DeploymentCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , lastUpdateTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | DeploymentList is a list of Deployments.
-- |
-- | Fields:
-- | - `items`: Items is the list of Deployments.
-- | - `metadata`: Standard list metadata.
newtype DeploymentList = DeploymentList
  { items :: (Maybe (Array Deployment))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeDeploymentList :: Newtype DeploymentList _
derive instance genericDeploymentList :: Generic DeploymentList _
instance showDeploymentList :: Show DeploymentList where show a = genericShow a
instance decodeDeploymentList :: Decode DeploymentList where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "DeploymentList" a
               metadata <- decodeMaybe "metadata" a
               pure $ DeploymentList { items, metadata }
instance encodeDeploymentList :: Encode DeploymentList where
  encode (DeploymentList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "DeploymentList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultDeploymentList :: Default DeploymentList where
  default = DeploymentList
    { items: Nothing
    , metadata: Nothing }

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
  { minReadySeconds :: (Maybe Int)
  , paused :: (Maybe Boolean)
  , progressDeadlineSeconds :: (Maybe Int)
  , replicas :: (Maybe Int)
  , revisionHistoryLimit :: (Maybe Int)
  , selector :: (Maybe MetaV1.LabelSelector)
  , strategy :: (Maybe DeploymentStrategy)
  , template :: (Maybe CoreV1.PodTemplateSpec) }

derive instance newtypeDeploymentSpec :: Newtype DeploymentSpec _
derive instance genericDeploymentSpec :: Generic DeploymentSpec _
instance showDeploymentSpec :: Show DeploymentSpec where show a = genericShow a
instance decodeDeploymentSpec :: Decode DeploymentSpec where
  decode a = do
               minReadySeconds <- decodeMaybe "minReadySeconds" a
               paused <- decodeMaybe "paused" a
               progressDeadlineSeconds <- decodeMaybe "progressDeadlineSeconds" a
               replicas <- decodeMaybe "replicas" a
               revisionHistoryLimit <- decodeMaybe "revisionHistoryLimit" a
               selector <- decodeMaybe "selector" a
               strategy <- decodeMaybe "strategy" a
               template <- decodeMaybe "template" a
               pure $ DeploymentSpec { minReadySeconds, paused, progressDeadlineSeconds, replicas, revisionHistoryLimit, selector, strategy, template }
instance encodeDeploymentSpec :: Encode DeploymentSpec where
  encode (DeploymentSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encodeMaybe a.minReadySeconds)
               , Tuple "paused" (encodeMaybe a.paused)
               , Tuple "progressDeadlineSeconds" (encodeMaybe a.progressDeadlineSeconds)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "revisionHistoryLimit" (encodeMaybe a.revisionHistoryLimit)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "strategy" (encodeMaybe a.strategy)
               , Tuple "template" (encodeMaybe a.template) ]


instance defaultDeploymentSpec :: Default DeploymentSpec where
  default = DeploymentSpec
    { minReadySeconds: Nothing
    , paused: Nothing
    , progressDeadlineSeconds: Nothing
    , replicas: Nothing
    , revisionHistoryLimit: Nothing
    , selector: Nothing
    , strategy: Nothing
    , template: Nothing }

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
  { availableReplicas :: (Maybe Int)
  , collisionCount :: (Maybe Int)
  , conditions :: (Maybe (Array DeploymentCondition))
  , observedGeneration :: (Maybe Int)
  , readyReplicas :: (Maybe Int)
  , replicas :: (Maybe Int)
  , unavailableReplicas :: (Maybe Int)
  , updatedReplicas :: (Maybe Int) }

derive instance newtypeDeploymentStatus :: Newtype DeploymentStatus _
derive instance genericDeploymentStatus :: Generic DeploymentStatus _
instance showDeploymentStatus :: Show DeploymentStatus where show a = genericShow a
instance decodeDeploymentStatus :: Decode DeploymentStatus where
  decode a = do
               availableReplicas <- decodeMaybe "availableReplicas" a
               collisionCount <- decodeMaybe "collisionCount" a
               conditions <- decodeMaybe "conditions" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               readyReplicas <- decodeMaybe "readyReplicas" a
               replicas <- decodeMaybe "replicas" a
               unavailableReplicas <- decodeMaybe "unavailableReplicas" a
               updatedReplicas <- decodeMaybe "updatedReplicas" a
               pure $ DeploymentStatus { availableReplicas, collisionCount, conditions, observedGeneration, readyReplicas, replicas, unavailableReplicas, updatedReplicas }
instance encodeDeploymentStatus :: Encode DeploymentStatus where
  encode (DeploymentStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "availableReplicas" (encodeMaybe a.availableReplicas)
               , Tuple "collisionCount" (encodeMaybe a.collisionCount)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration)
               , Tuple "readyReplicas" (encodeMaybe a.readyReplicas)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "unavailableReplicas" (encodeMaybe a.unavailableReplicas)
               , Tuple "updatedReplicas" (encodeMaybe a.updatedReplicas) ]


instance defaultDeploymentStatus :: Default DeploymentStatus where
  default = DeploymentStatus
    { availableReplicas: Nothing
    , collisionCount: Nothing
    , conditions: Nothing
    , observedGeneration: Nothing
    , readyReplicas: Nothing
    , replicas: Nothing
    , unavailableReplicas: Nothing
    , updatedReplicas: Nothing }

-- | DeploymentStrategy describes how to replace existing pods with new ones.
-- |
-- | Fields:
-- | - `_type`: Type of deployment. Can be "Recreate" or "RollingUpdate". Default is RollingUpdate.
-- | - `rollingUpdate`: Rolling update config params. Present only if DeploymentStrategyType = RollingUpdate.
newtype DeploymentStrategy = DeploymentStrategy
  { _type :: (Maybe String)
  , rollingUpdate :: (Maybe RollingUpdateDeployment) }

derive instance newtypeDeploymentStrategy :: Newtype DeploymentStrategy _
derive instance genericDeploymentStrategy :: Generic DeploymentStrategy _
instance showDeploymentStrategy :: Show DeploymentStrategy where show a = genericShow a
instance decodeDeploymentStrategy :: Decode DeploymentStrategy where
  decode a = do
               _type <- decodeMaybe "_type" a
               rollingUpdate <- decodeMaybe "rollingUpdate" a
               pure $ DeploymentStrategy { _type, rollingUpdate }
instance encodeDeploymentStrategy :: Encode DeploymentStrategy where
  encode (DeploymentStrategy a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "rollingUpdate" (encodeMaybe a.rollingUpdate) ]


instance defaultDeploymentStrategy :: Default DeploymentStrategy where
  default = DeploymentStrategy
    { _type: Nothing
    , rollingUpdate: Nothing }

-- | DEPRECATED - This group version of ReplicaSet is deprecated by apps/v1/ReplicaSet. See the release notes for more information. ReplicaSet ensures that a specified number of pod replicas are running at any given time.
-- |
-- | Fields:
-- | - `metadata`: If the Labels of a ReplicaSet are empty, they are defaulted to be the same as the Pod(s) that the ReplicaSet manages. Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the specification of the desired behavior of the ReplicaSet. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status is the most recently observed status of the ReplicaSet. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype ReplicaSet = ReplicaSet
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe ReplicaSetSpec)
  , status :: (Maybe ReplicaSetStatus) }

derive instance newtypeReplicaSet :: Newtype ReplicaSet _
derive instance genericReplicaSet :: Generic ReplicaSet _
instance showReplicaSet :: Show ReplicaSet where show a = genericShow a
instance decodeReplicaSet :: Decode ReplicaSet where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               assertPropEq "kind" "ReplicaSet" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ ReplicaSet { metadata, spec, status }
instance encodeReplicaSet :: Encode ReplicaSet where
  encode (ReplicaSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "kind" (encode "ReplicaSet")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultReplicaSet :: Default ReplicaSet where
  default = ReplicaSet
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | ReplicaSetCondition describes the state of a replica set at a certain point.
-- |
-- | Fields:
-- | - `_type`: Type of replica set condition.
-- | - `lastTransitionTime`: The last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype ReplicaSetCondition = ReplicaSetCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeReplicaSetCondition :: Newtype ReplicaSetCondition _
derive instance genericReplicaSetCondition :: Generic ReplicaSetCondition _
instance showReplicaSetCondition :: Show ReplicaSetCondition where show a = genericShow a
instance decodeReplicaSetCondition :: Decode ReplicaSetCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ ReplicaSetCondition { _type, lastTransitionTime, message, reason, status }
instance encodeReplicaSetCondition :: Encode ReplicaSetCondition where
  encode (ReplicaSetCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultReplicaSetCondition :: Default ReplicaSetCondition where
  default = ReplicaSetCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | ReplicaSetList is a collection of ReplicaSets.
-- |
-- | Fields:
-- | - `items`: List of ReplicaSets. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ReplicaSetList = ReplicaSetList
  { items :: (Maybe (Array ReplicaSet))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeReplicaSetList :: Newtype ReplicaSetList _
derive instance genericReplicaSetList :: Generic ReplicaSetList _
instance showReplicaSetList :: Show ReplicaSetList where show a = genericShow a
instance decodeReplicaSetList :: Decode ReplicaSetList where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ReplicaSetList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ReplicaSetList { items, metadata }
instance encodeReplicaSetList :: Encode ReplicaSetList where
  encode (ReplicaSetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ReplicaSetList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultReplicaSetList :: Default ReplicaSetList where
  default = ReplicaSetList
    { items: Nothing
    , metadata: Nothing }

-- | ReplicaSetSpec is the specification of a ReplicaSet.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `replicas`: Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
-- | - `selector`: Selector is a label query over pods that should match the replica count. Label keys and values that must match in order to be controlled by this replica set. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: Template is the object that describes the pod that will be created if insufficient replicas are detected. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
newtype ReplicaSetSpec = ReplicaSetSpec
  { minReadySeconds :: (Maybe Int)
  , replicas :: (Maybe Int)
  , selector :: (Maybe MetaV1.LabelSelector)
  , template :: (Maybe CoreV1.PodTemplateSpec) }

derive instance newtypeReplicaSetSpec :: Newtype ReplicaSetSpec _
derive instance genericReplicaSetSpec :: Generic ReplicaSetSpec _
instance showReplicaSetSpec :: Show ReplicaSetSpec where show a = genericShow a
instance decodeReplicaSetSpec :: Decode ReplicaSetSpec where
  decode a = do
               minReadySeconds <- decodeMaybe "minReadySeconds" a
               replicas <- decodeMaybe "replicas" a
               selector <- decodeMaybe "selector" a
               template <- decodeMaybe "template" a
               pure $ ReplicaSetSpec { minReadySeconds, replicas, selector, template }
instance encodeReplicaSetSpec :: Encode ReplicaSetSpec where
  encode (ReplicaSetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encodeMaybe a.minReadySeconds)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "template" (encodeMaybe a.template) ]


instance defaultReplicaSetSpec :: Default ReplicaSetSpec where
  default = ReplicaSetSpec
    { minReadySeconds: Nothing
    , replicas: Nothing
    , selector: Nothing
    , template: Nothing }

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
  { availableReplicas :: (Maybe Int)
  , conditions :: (Maybe (Array ReplicaSetCondition))
  , fullyLabeledReplicas :: (Maybe Int)
  , observedGeneration :: (Maybe Int)
  , readyReplicas :: (Maybe Int)
  , replicas :: (Maybe Int) }

derive instance newtypeReplicaSetStatus :: Newtype ReplicaSetStatus _
derive instance genericReplicaSetStatus :: Generic ReplicaSetStatus _
instance showReplicaSetStatus :: Show ReplicaSetStatus where show a = genericShow a
instance decodeReplicaSetStatus :: Decode ReplicaSetStatus where
  decode a = do
               availableReplicas <- decodeMaybe "availableReplicas" a
               conditions <- decodeMaybe "conditions" a
               fullyLabeledReplicas <- decodeMaybe "fullyLabeledReplicas" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               readyReplicas <- decodeMaybe "readyReplicas" a
               replicas <- decodeMaybe "replicas" a
               pure $ ReplicaSetStatus { availableReplicas, conditions, fullyLabeledReplicas, observedGeneration, readyReplicas, replicas }
instance encodeReplicaSetStatus :: Encode ReplicaSetStatus where
  encode (ReplicaSetStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "availableReplicas" (encodeMaybe a.availableReplicas)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "fullyLabeledReplicas" (encodeMaybe a.fullyLabeledReplicas)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration)
               , Tuple "readyReplicas" (encodeMaybe a.readyReplicas)
               , Tuple "replicas" (encodeMaybe a.replicas) ]


instance defaultReplicaSetStatus :: Default ReplicaSetStatus where
  default = ReplicaSetStatus
    { availableReplicas: Nothing
    , conditions: Nothing
    , fullyLabeledReplicas: Nothing
    , observedGeneration: Nothing
    , readyReplicas: Nothing
    , replicas: Nothing }

-- | Spec to control the desired behavior of daemon set rolling update.
-- |
-- | Fields:
-- | - `maxUnavailable`: The maximum number of DaemonSet pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of total number of DaemonSet pods at the start of the update (ex: 10%). Absolute number is calculated from percentage by rounding up. This cannot be 0. Default value is 1. Example: when this is set to 30%, at most 30% of the total number of nodes that should be running the daemon pod (i.e. status.desiredNumberScheduled) can have their pods stopped for an update at any given time. The update starts by stopping at most 30% of those DaemonSet pods and then brings up new DaemonSet pods in their place. Once the new pods are available, it then proceeds onto other DaemonSet pods, thus ensuring that at least 70% of original number of DaemonSet pods are available at all times during the update.
newtype RollingUpdateDaemonSet = RollingUpdateDaemonSet
  { maxUnavailable :: (Maybe Util.IntOrString) }

derive instance newtypeRollingUpdateDaemonSet :: Newtype RollingUpdateDaemonSet _
derive instance genericRollingUpdateDaemonSet :: Generic RollingUpdateDaemonSet _
instance showRollingUpdateDaemonSet :: Show RollingUpdateDaemonSet where show a = genericShow a
instance decodeRollingUpdateDaemonSet :: Decode RollingUpdateDaemonSet where
  decode a = do
               maxUnavailable <- decodeMaybe "maxUnavailable" a
               pure $ RollingUpdateDaemonSet { maxUnavailable }
instance encodeRollingUpdateDaemonSet :: Encode RollingUpdateDaemonSet where
  encode (RollingUpdateDaemonSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxUnavailable" (encodeMaybe a.maxUnavailable) ]


instance defaultRollingUpdateDaemonSet :: Default RollingUpdateDaemonSet where
  default = RollingUpdateDaemonSet
    { maxUnavailable: Nothing }

-- | Spec to control the desired behavior of rolling update.
-- |
-- | Fields:
-- | - `maxSurge`: The maximum number of pods that can be scheduled above the desired number of pods. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). This can not be 0 if MaxUnavailable is 0. Absolute number is calculated from percentage by rounding up. Defaults to 25%. Example: when this is set to 30%, the new RC can be scaled up immediately when the rolling update starts, such that the total number of old and new pods do not exceed 130% of desired pods. Once old pods have been killed, new RC can be scaled up further, ensuring that total number of pods running at any time during the update is atmost 130% of desired pods.
-- | - `maxUnavailable`: The maximum number of pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). Absolute number is calculated from percentage by rounding down. This can not be 0 if MaxSurge is 0. Defaults to 25%. Example: when this is set to 30%, the old RC can be scaled down to 70% of desired pods immediately when the rolling update starts. Once new pods are ready, old RC can be scaled down further, followed by scaling up the new RC, ensuring that the total number of pods available at all times during the update is at least 70% of desired pods.
newtype RollingUpdateDeployment = RollingUpdateDeployment
  { maxSurge :: (Maybe Util.IntOrString)
  , maxUnavailable :: (Maybe Util.IntOrString) }

derive instance newtypeRollingUpdateDeployment :: Newtype RollingUpdateDeployment _
derive instance genericRollingUpdateDeployment :: Generic RollingUpdateDeployment _
instance showRollingUpdateDeployment :: Show RollingUpdateDeployment where show a = genericShow a
instance decodeRollingUpdateDeployment :: Decode RollingUpdateDeployment where
  decode a = do
               maxSurge <- decodeMaybe "maxSurge" a
               maxUnavailable <- decodeMaybe "maxUnavailable" a
               pure $ RollingUpdateDeployment { maxSurge, maxUnavailable }
instance encodeRollingUpdateDeployment :: Encode RollingUpdateDeployment where
  encode (RollingUpdateDeployment a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxSurge" (encodeMaybe a.maxSurge)
               , Tuple "maxUnavailable" (encodeMaybe a.maxUnavailable) ]


instance defaultRollingUpdateDeployment :: Default RollingUpdateDeployment where
  default = RollingUpdateDeployment
    { maxSurge: Nothing
    , maxUnavailable: Nothing }

-- | RollingUpdateStatefulSetStrategy is used to communicate parameter for RollingUpdateStatefulSetStrategyType.
-- |
-- | Fields:
-- | - `partition`: Partition indicates the ordinal at which the StatefulSet should be partitioned. Default value is 0.
newtype RollingUpdateStatefulSetStrategy = RollingUpdateStatefulSetStrategy
  { partition :: (Maybe Int) }

derive instance newtypeRollingUpdateStatefulSetStrategy :: Newtype RollingUpdateStatefulSetStrategy _
derive instance genericRollingUpdateStatefulSetStrategy :: Generic RollingUpdateStatefulSetStrategy _
instance showRollingUpdateStatefulSetStrategy :: Show RollingUpdateStatefulSetStrategy where show a = genericShow a
instance decodeRollingUpdateStatefulSetStrategy :: Decode RollingUpdateStatefulSetStrategy where
  decode a = do
               partition <- decodeMaybe "partition" a
               pure $ RollingUpdateStatefulSetStrategy { partition }
instance encodeRollingUpdateStatefulSetStrategy :: Encode RollingUpdateStatefulSetStrategy where
  encode (RollingUpdateStatefulSetStrategy a) = encode $ StrMap.fromFoldable $
               [ Tuple "partition" (encodeMaybe a.partition) ]


instance defaultRollingUpdateStatefulSetStrategy :: Default RollingUpdateStatefulSetStrategy where
  default = RollingUpdateStatefulSetStrategy
    { partition: Nothing }

-- | Scale represents a scaling request for a resource.
-- |
-- | Fields:
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
-- | - `spec`: defines the behavior of the scale. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status.
-- | - `status`: current status of the scale. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status. Read-only.
newtype Scale = Scale
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe ScaleSpec)
  , status :: (Maybe ScaleStatus) }

derive instance newtypeScale :: Newtype Scale _
derive instance genericScale :: Generic Scale _
instance showScale :: Show Scale where show a = genericShow a
instance decodeScale :: Decode Scale where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               assertPropEq "kind" "Scale" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Scale { metadata, spec, status }
instance encodeScale :: Encode Scale where
  encode (Scale a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "kind" (encode "Scale")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultScale :: Default Scale where
  default = Scale
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | ScaleSpec describes the attributes of a scale subresource
-- |
-- | Fields:
-- | - `replicas`: desired number of instances for the scaled object.
newtype ScaleSpec = ScaleSpec
  { replicas :: (Maybe Int) }

derive instance newtypeScaleSpec :: Newtype ScaleSpec _
derive instance genericScaleSpec :: Generic ScaleSpec _
instance showScaleSpec :: Show ScaleSpec where show a = genericShow a
instance decodeScaleSpec :: Decode ScaleSpec where
  decode a = do
               replicas <- decodeMaybe "replicas" a
               pure $ ScaleSpec { replicas }
instance encodeScaleSpec :: Encode ScaleSpec where
  encode (ScaleSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "replicas" (encodeMaybe a.replicas) ]


instance defaultScaleSpec :: Default ScaleSpec where
  default = ScaleSpec
    { replicas: Nothing }

-- | ScaleStatus represents the current status of a scale subresource.
-- |
-- | Fields:
-- | - `replicas`: actual number of observed instances of the scaled object.
-- | - `selector`: label query over pods that should match the replicas count. More info: http://kubernetes.io/docs/user-guide/labels#label-selectors
-- | - `targetSelector`: label selector for pods that should match the replicas count. This is a serializated version of both map-based and more expressive set-based selectors. This is done to avoid introspection in the clients. The string will be in the same format as the query-param syntax. If the target type only supports map-based selectors, both this field and map-based selector field are populated. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
newtype ScaleStatus = ScaleStatus
  { replicas :: (Maybe Int)
  , selector :: (Maybe (StrMap String))
  , targetSelector :: (Maybe String) }

derive instance newtypeScaleStatus :: Newtype ScaleStatus _
derive instance genericScaleStatus :: Generic ScaleStatus _
instance showScaleStatus :: Show ScaleStatus where show a = genericShow a
instance decodeScaleStatus :: Decode ScaleStatus where
  decode a = do
               replicas <- decodeMaybe "replicas" a
               selector <- decodeMaybe "selector" a
               targetSelector <- decodeMaybe "targetSelector" a
               pure $ ScaleStatus { replicas, selector, targetSelector }
instance encodeScaleStatus :: Encode ScaleStatus where
  encode (ScaleStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "targetSelector" (encodeMaybe a.targetSelector) ]


instance defaultScaleStatus :: Default ScaleStatus where
  default = ScaleStatus
    { replicas: Nothing
    , selector: Nothing
    , targetSelector: Nothing }

-- | DEPRECATED - This group version of StatefulSet is deprecated by apps/v1/StatefulSet. See the release notes for more information. StatefulSet represents a set of pods with consistent identities. Identities are defined as:
-- |  - Network: A single stable DNS and hostname.
-- |  - Storage: As many VolumeClaims as requested.
-- | The StatefulSet guarantees that a given network identity will always map to the same storage identity.
-- |
-- | Fields:
-- | - `metadata`
-- | - `spec`: Spec defines the desired identities of pods in this set.
-- | - `status`: Status is the current status of Pods in this StatefulSet. This data may be out of date by some window of time.
newtype StatefulSet = StatefulSet
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe StatefulSetSpec)
  , status :: (Maybe StatefulSetStatus) }

derive instance newtypeStatefulSet :: Newtype StatefulSet _
derive instance genericStatefulSet :: Generic StatefulSet _
instance showStatefulSet :: Show StatefulSet where show a = genericShow a
instance decodeStatefulSet :: Decode StatefulSet where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               assertPropEq "kind" "StatefulSet" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ StatefulSet { metadata, spec, status }
instance encodeStatefulSet :: Encode StatefulSet where
  encode (StatefulSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "kind" (encode "StatefulSet")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultStatefulSet :: Default StatefulSet where
  default = StatefulSet
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | StatefulSetCondition describes the state of a statefulset at a certain point.
-- |
-- | Fields:
-- | - `_type`: Type of statefulset condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype StatefulSetCondition = StatefulSetCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeStatefulSetCondition :: Newtype StatefulSetCondition _
derive instance genericStatefulSetCondition :: Generic StatefulSetCondition _
instance showStatefulSetCondition :: Show StatefulSetCondition where show a = genericShow a
instance decodeStatefulSetCondition :: Decode StatefulSetCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ StatefulSetCondition { _type, lastTransitionTime, message, reason, status }
instance encodeStatefulSetCondition :: Encode StatefulSetCondition where
  encode (StatefulSetCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultStatefulSetCondition :: Default StatefulSetCondition where
  default = StatefulSetCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | StatefulSetList is a collection of StatefulSets.
-- |
-- | Fields:
-- | - `items`
-- | - `metadata`
newtype StatefulSetList = StatefulSetList
  { items :: (Maybe (Array StatefulSet))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeStatefulSetList :: Newtype StatefulSetList _
derive instance genericStatefulSetList :: Generic StatefulSetList _
instance showStatefulSetList :: Show StatefulSetList where show a = genericShow a
instance decodeStatefulSetList :: Decode StatefulSetList where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta2" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "StatefulSetList" a
               metadata <- decodeMaybe "metadata" a
               pure $ StatefulSetList { items, metadata }
instance encodeStatefulSetList :: Encode StatefulSetList where
  encode (StatefulSetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta2")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "StatefulSetList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultStatefulSetList :: Default StatefulSetList where
  default = StatefulSetList
    { items: Nothing
    , metadata: Nothing }

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
  { podManagementPolicy :: (Maybe String)
  , replicas :: (Maybe Int)
  , revisionHistoryLimit :: (Maybe Int)
  , selector :: (Maybe MetaV1.LabelSelector)
  , serviceName :: (Maybe String)
  , template :: (Maybe CoreV1.PodTemplateSpec)
  , updateStrategy :: (Maybe StatefulSetUpdateStrategy)
  , volumeClaimTemplates :: (Maybe (Array CoreV1.PersistentVolumeClaim)) }

derive instance newtypeStatefulSetSpec :: Newtype StatefulSetSpec _
derive instance genericStatefulSetSpec :: Generic StatefulSetSpec _
instance showStatefulSetSpec :: Show StatefulSetSpec where show a = genericShow a
instance decodeStatefulSetSpec :: Decode StatefulSetSpec where
  decode a = do
               podManagementPolicy <- decodeMaybe "podManagementPolicy" a
               replicas <- decodeMaybe "replicas" a
               revisionHistoryLimit <- decodeMaybe "revisionHistoryLimit" a
               selector <- decodeMaybe "selector" a
               serviceName <- decodeMaybe "serviceName" a
               template <- decodeMaybe "template" a
               updateStrategy <- decodeMaybe "updateStrategy" a
               volumeClaimTemplates <- decodeMaybe "volumeClaimTemplates" a
               pure $ StatefulSetSpec { podManagementPolicy, replicas, revisionHistoryLimit, selector, serviceName, template, updateStrategy, volumeClaimTemplates }
instance encodeStatefulSetSpec :: Encode StatefulSetSpec where
  encode (StatefulSetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "podManagementPolicy" (encodeMaybe a.podManagementPolicy)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "revisionHistoryLimit" (encodeMaybe a.revisionHistoryLimit)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "serviceName" (encodeMaybe a.serviceName)
               , Tuple "template" (encodeMaybe a.template)
               , Tuple "updateStrategy" (encodeMaybe a.updateStrategy)
               , Tuple "volumeClaimTemplates" (encodeMaybe a.volumeClaimTemplates) ]


instance defaultStatefulSetSpec :: Default StatefulSetSpec where
  default = StatefulSetSpec
    { podManagementPolicy: Nothing
    , replicas: Nothing
    , revisionHistoryLimit: Nothing
    , selector: Nothing
    , serviceName: Nothing
    , template: Nothing
    , updateStrategy: Nothing
    , volumeClaimTemplates: Nothing }

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
  { collisionCount :: (Maybe Int)
  , conditions :: (Maybe (Array StatefulSetCondition))
  , currentReplicas :: (Maybe Int)
  , currentRevision :: (Maybe String)
  , observedGeneration :: (Maybe Int)
  , readyReplicas :: (Maybe Int)
  , replicas :: (Maybe Int)
  , updateRevision :: (Maybe String)
  , updatedReplicas :: (Maybe Int) }

derive instance newtypeStatefulSetStatus :: Newtype StatefulSetStatus _
derive instance genericStatefulSetStatus :: Generic StatefulSetStatus _
instance showStatefulSetStatus :: Show StatefulSetStatus where show a = genericShow a
instance decodeStatefulSetStatus :: Decode StatefulSetStatus where
  decode a = do
               collisionCount <- decodeMaybe "collisionCount" a
               conditions <- decodeMaybe "conditions" a
               currentReplicas <- decodeMaybe "currentReplicas" a
               currentRevision <- decodeMaybe "currentRevision" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               readyReplicas <- decodeMaybe "readyReplicas" a
               replicas <- decodeMaybe "replicas" a
               updateRevision <- decodeMaybe "updateRevision" a
               updatedReplicas <- decodeMaybe "updatedReplicas" a
               pure $ StatefulSetStatus { collisionCount, conditions, currentReplicas, currentRevision, observedGeneration, readyReplicas, replicas, updateRevision, updatedReplicas }
instance encodeStatefulSetStatus :: Encode StatefulSetStatus where
  encode (StatefulSetStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "collisionCount" (encodeMaybe a.collisionCount)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "currentReplicas" (encodeMaybe a.currentReplicas)
               , Tuple "currentRevision" (encodeMaybe a.currentRevision)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration)
               , Tuple "readyReplicas" (encodeMaybe a.readyReplicas)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "updateRevision" (encodeMaybe a.updateRevision)
               , Tuple "updatedReplicas" (encodeMaybe a.updatedReplicas) ]


instance defaultStatefulSetStatus :: Default StatefulSetStatus where
  default = StatefulSetStatus
    { collisionCount: Nothing
    , conditions: Nothing
    , currentReplicas: Nothing
    , currentRevision: Nothing
    , observedGeneration: Nothing
    , readyReplicas: Nothing
    , replicas: Nothing
    , updateRevision: Nothing
    , updatedReplicas: Nothing }

-- | StatefulSetUpdateStrategy indicates the strategy that the StatefulSet controller will use to perform updates. It includes any additional parameters necessary to perform the update for the indicated strategy.
-- |
-- | Fields:
-- | - `_type`: Type indicates the type of the StatefulSetUpdateStrategy. Default is RollingUpdate.
-- | - `rollingUpdate`: RollingUpdate is used to communicate parameters when Type is RollingUpdateStatefulSetStrategyType.
newtype StatefulSetUpdateStrategy = StatefulSetUpdateStrategy
  { _type :: (Maybe String)
  , rollingUpdate :: (Maybe RollingUpdateStatefulSetStrategy) }

derive instance newtypeStatefulSetUpdateStrategy :: Newtype StatefulSetUpdateStrategy _
derive instance genericStatefulSetUpdateStrategy :: Generic StatefulSetUpdateStrategy _
instance showStatefulSetUpdateStrategy :: Show StatefulSetUpdateStrategy where show a = genericShow a
instance decodeStatefulSetUpdateStrategy :: Decode StatefulSetUpdateStrategy where
  decode a = do
               _type <- decodeMaybe "_type" a
               rollingUpdate <- decodeMaybe "rollingUpdate" a
               pure $ StatefulSetUpdateStrategy { _type, rollingUpdate }
instance encodeStatefulSetUpdateStrategy :: Encode StatefulSetUpdateStrategy where
  encode (StatefulSetUpdateStrategy a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "rollingUpdate" (encodeMaybe a.rollingUpdate) ]


instance defaultStatefulSetUpdateStrategy :: Default StatefulSetUpdateStrategy where
  default = StatefulSetUpdateStrategy
    { _type: Nothing
    , rollingUpdate: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/"