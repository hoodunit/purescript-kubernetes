module Kubernetes.Api.Apps.V1Beta1 where

import Prelude
import Prelude
import Prelude
import Control.Alt ((<|>))
import Data.Either (Either(Left,Right))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Tuple (Tuple(Tuple))
import Effect.Aff (Aff)
import Foreign.Class (class Decode, class Encode, decode, encode)
import Foreign.Class (class Decode, class Encode, encode, decode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Prelude
import Data.Newtype (class Newtype)
import Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Foreign.Generic.Types (Options)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Core.V1 as CoreV1
import Kubernetes.Api.Meta.V1 as MetaV1
import Kubernetes.Api.Runtime as Runtime
import Kubernetes.Api.Util as Util

-- | DEPRECATED - This group version of ControllerRevision is deprecated by apps/v1beta2/ControllerRevision. See the release notes for more information. ControllerRevision implements an immutable snapshot of state data. Clients are responsible for serializing and deserializing the objects that contain their internal state. Once a ControllerRevision has been successfully created, it can not be updated. The API Server will fail validation of all requests that attempt to mutate the Data field. ControllerRevisions may, however, be deleted. Note that, due to its use by both the DaemonSet and StatefulSet controllers for update and rollback, this object is beta. However, it may be subject to name and representation changes in future releases, and clients should not depend on its stability. It is primarily for internal use by controllers.
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
               assertPropEq "apiVersion" "apps/v1beta1" a
               assertPropEq "kind" "ControllerRevision" a
               metadata <- decodeMaybe "metadata" a
               revision <- decodeMaybe "revision" a
               pure $ ControllerRevision { _data, metadata, revision }
instance encodeControllerRevision :: Encode ControllerRevision where
  encode (ControllerRevision a) = encode $ Object.fromFoldable $
               [ Tuple "_data" (encodeMaybe a._data)
               , Tuple "apiVersion" (encode "apps/v1beta1")
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
               assertPropEq "apiVersion" "apps/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ControllerRevisionList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ControllerRevisionList { items, metadata }
instance encodeControllerRevisionList :: Encode ControllerRevisionList where
  encode (ControllerRevisionList a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ControllerRevisionList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultControllerRevisionList :: Default ControllerRevisionList where
  default = ControllerRevisionList
    { items: Nothing
    , metadata: Nothing }

-- | DEPRECATED - This group version of Deployment is deprecated by apps/v1beta2/Deployment. See the release notes for more information. Deployment enables declarative updates for Pods and ReplicaSets.
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
               assertPropEq "apiVersion" "apps/v1beta1" a
               assertPropEq "kind" "Deployment" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Deployment { metadata, spec, status }
instance encodeDeployment :: Encode Deployment where
  encode (Deployment a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta1")
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
  encode (DeploymentCondition a) = encode $ Object.fromFoldable $
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
               assertPropEq "apiVersion" "apps/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "DeploymentList" a
               metadata <- decodeMaybe "metadata" a
               pure $ DeploymentList { items, metadata }
instance encodeDeploymentList :: Encode DeploymentList where
  encode (DeploymentList a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "DeploymentList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultDeploymentList :: Default DeploymentList where
  default = DeploymentList
    { items: Nothing
    , metadata: Nothing }

-- | DEPRECATED. DeploymentRollback stores the information required to rollback a deployment.
-- |
-- | Fields:
-- | - `name`: Required: This must match the Name of a deployment.
-- | - `rollbackTo`: The config of this deployment rollback.
-- | - `updatedAnnotations`: The annotations to be updated to a deployment
newtype DeploymentRollback = DeploymentRollback
  { name :: (Maybe String)
  , rollbackTo :: (Maybe RollbackConfig)
  , updatedAnnotations :: (Maybe (Object String)) }

derive instance newtypeDeploymentRollback :: Newtype DeploymentRollback _
derive instance genericDeploymentRollback :: Generic DeploymentRollback _
instance showDeploymentRollback :: Show DeploymentRollback where show a = genericShow a
instance decodeDeploymentRollback :: Decode DeploymentRollback where
  decode a = do
               assertPropEq "apiVersion" "apps/v1beta1" a
               assertPropEq "kind" "DeploymentRollback" a
               name <- decodeMaybe "name" a
               rollbackTo <- decodeMaybe "rollbackTo" a
               updatedAnnotations <- decodeMaybe "updatedAnnotations" a
               pure $ DeploymentRollback { name, rollbackTo, updatedAnnotations }
instance encodeDeploymentRollback :: Encode DeploymentRollback where
  encode (DeploymentRollback a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta1")
               , Tuple "kind" (encode "DeploymentRollback")
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "rollbackTo" (encodeMaybe a.rollbackTo)
               , Tuple "updatedAnnotations" (encodeMaybe a.updatedAnnotations) ]


instance defaultDeploymentRollback :: Default DeploymentRollback where
  default = DeploymentRollback
    { name: Nothing
    , rollbackTo: Nothing
    , updatedAnnotations: Nothing }

-- | DeploymentSpec is the specification of the desired behavior of the Deployment.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `paused`: Indicates that the deployment is paused.
-- | - `progressDeadlineSeconds`: The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. Defaults to 600s.
-- | - `replicas`: Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
-- | - `revisionHistoryLimit`: The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 2.
-- | - `rollbackTo`: DEPRECATED. The config this deployment is rolling back to. Will be cleared after rollback is done.
-- | - `selector`: Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment.
-- | - `strategy`: The deployment strategy to use to replace existing pods with new ones.
-- | - `template`: Template describes the pods that will be created.
newtype DeploymentSpec = DeploymentSpec
  { minReadySeconds :: (Maybe Int)
  , paused :: (Maybe Boolean)
  , progressDeadlineSeconds :: (Maybe Int)
  , replicas :: (Maybe Int)
  , revisionHistoryLimit :: (Maybe Int)
  , rollbackTo :: (Maybe RollbackConfig)
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
               rollbackTo <- decodeMaybe "rollbackTo" a
               selector <- decodeMaybe "selector" a
               strategy <- decodeMaybe "strategy" a
               template <- decodeMaybe "template" a
               pure $ DeploymentSpec { minReadySeconds, paused, progressDeadlineSeconds, replicas, revisionHistoryLimit, rollbackTo, selector, strategy, template }
instance encodeDeploymentSpec :: Encode DeploymentSpec where
  encode (DeploymentSpec a) = encode $ Object.fromFoldable $
               [ Tuple "minReadySeconds" (encodeMaybe a.minReadySeconds)
               , Tuple "paused" (encodeMaybe a.paused)
               , Tuple "progressDeadlineSeconds" (encodeMaybe a.progressDeadlineSeconds)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "revisionHistoryLimit" (encodeMaybe a.revisionHistoryLimit)
               , Tuple "rollbackTo" (encodeMaybe a.rollbackTo)
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
    , rollbackTo: Nothing
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
  encode (DeploymentStatus a) = encode $ Object.fromFoldable $
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
  encode (DeploymentStrategy a) = encode $ Object.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "rollingUpdate" (encodeMaybe a.rollingUpdate) ]


instance defaultDeploymentStrategy :: Default DeploymentStrategy where
  default = DeploymentStrategy
    { _type: Nothing
    , rollingUpdate: Nothing }

-- | DEPRECATED.
-- |
-- | Fields:
-- | - `revision`: The revision to rollback to. If set to 0, rollback to the last revision.
newtype RollbackConfig = RollbackConfig
  { revision :: (Maybe Int) }

derive instance newtypeRollbackConfig :: Newtype RollbackConfig _
derive instance genericRollbackConfig :: Generic RollbackConfig _
instance showRollbackConfig :: Show RollbackConfig where show a = genericShow a
instance decodeRollbackConfig :: Decode RollbackConfig where
  decode a = do
               revision <- decodeMaybe "revision" a
               pure $ RollbackConfig { revision }
instance encodeRollbackConfig :: Encode RollbackConfig where
  encode (RollbackConfig a) = encode $ Object.fromFoldable $
               [ Tuple "revision" (encodeMaybe a.revision) ]


instance defaultRollbackConfig :: Default RollbackConfig where
  default = RollbackConfig
    { revision: Nothing }

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
  encode (RollingUpdateDeployment a) = encode $ Object.fromFoldable $
               [ Tuple "maxSurge" (encodeMaybe a.maxSurge)
               , Tuple "maxUnavailable" (encodeMaybe a.maxUnavailable) ]


instance defaultRollingUpdateDeployment :: Default RollingUpdateDeployment where
  default = RollingUpdateDeployment
    { maxSurge: Nothing
    , maxUnavailable: Nothing }

-- | RollingUpdateStatefulSetStrategy is used to communicate parameter for RollingUpdateStatefulSetStrategyType.
-- |
-- | Fields:
-- | - `partition`: Partition indicates the ordinal at which the StatefulSet should be partitioned.
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
  encode (RollingUpdateStatefulSetStrategy a) = encode $ Object.fromFoldable $
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
               assertPropEq "apiVersion" "apps/v1beta1" a
               assertPropEq "kind" "Scale" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Scale { metadata, spec, status }
instance encodeScale :: Encode Scale where
  encode (Scale a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta1")
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
  encode (ScaleSpec a) = encode $ Object.fromFoldable $
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
  , selector :: (Maybe (Object String))
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
  encode (ScaleStatus a) = encode $ Object.fromFoldable $
               [ Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "targetSelector" (encodeMaybe a.targetSelector) ]


instance defaultScaleStatus :: Default ScaleStatus where
  default = ScaleStatus
    { replicas: Nothing
    , selector: Nothing
    , targetSelector: Nothing }

-- | DEPRECATED - This group version of StatefulSet is deprecated by apps/v1beta2/StatefulSet. See the release notes for more information. StatefulSet represents a set of pods with consistent identities. Identities are defined as:
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
               assertPropEq "apiVersion" "apps/v1beta1" a
               assertPropEq "kind" "StatefulSet" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ StatefulSet { metadata, spec, status }
instance encodeStatefulSet :: Encode StatefulSet where
  encode (StatefulSet a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta1")
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
  encode (StatefulSetCondition a) = encode $ Object.fromFoldable $
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
               assertPropEq "apiVersion" "apps/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "StatefulSetList" a
               metadata <- decodeMaybe "metadata" a
               pure $ StatefulSetList { items, metadata }
instance encodeStatefulSetList :: Encode StatefulSetList where
  encode (StatefulSetList a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "apps/v1beta1")
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
-- | - `selector`: selector is a label query over pods that should match the replica count. If empty, defaulted to labels on the pod template. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
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
  encode (StatefulSetSpec a) = encode $ Object.fromFoldable $
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
  encode (StatefulSetStatus a) = encode $ Object.fromFoldable $
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
-- | - `_type`: Type indicates the type of the StatefulSetUpdateStrategy.
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
  encode (StatefulSetUpdateStrategy a) = encode $ Object.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "rollingUpdate" (encodeMaybe a.rollingUpdate) ]


instance defaultStatefulSetUpdateStrategy :: Default StatefulSetUpdateStrategy where
  default = StatefulSetUpdateStrategy
    { _type: Nothing
    , rollingUpdate: Nothing }

-- | get available resources
getAPIResources :: Config -> Aff (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/"