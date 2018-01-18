module Kubernetes.Api.APIExtensionsV1Beta1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | AllowedFlexVolume represents a single Flexvolume that is allowed to be used.
-- |
-- | Fields:
-- | - `driver`: Driver is the name of the Flexvolume driver.
newtype AllowedFlexVolume = AllowedFlexVolume
  { driver :: (NullOrUndefined String) }

derive instance newtypeAllowedFlexVolume :: Newtype AllowedFlexVolume _
derive instance genericAllowedFlexVolume :: Generic AllowedFlexVolume _
instance showAllowedFlexVolume :: Show AllowedFlexVolume where show a = genericShow a
instance decodeAllowedFlexVolume :: Decode AllowedFlexVolume where
  decode a = do
               driver <- readProp "driver" a >>= decode
               pure $ AllowedFlexVolume { driver }
instance encodeAllowedFlexVolume :: Encode AllowedFlexVolume where
  encode (AllowedFlexVolume a) = encode $ StrMap.fromFoldable $
               [ Tuple "driver" (encode a.driver) ]


instance defaultAllowedFlexVolume :: Default AllowedFlexVolume where
  default = AllowedFlexVolume
    { driver: NullOrUndefined Nothing }

-- | defines the host volume conditions that will be enabled by a policy for pods to use. It requires the path prefix to be defined.
-- |
-- | Fields:
-- | - `pathPrefix`: is the path prefix that the host volume must match. It does not support `*`. Trailing slashes are trimmed when validating the path prefix with a host path.
-- |    
-- |    Examples: `/foo` would allow `/foo`, `/foo/` and `/foo/bar` `/foo` would not allow `/food` or `/etc/foo`
newtype AllowedHostPath = AllowedHostPath
  { pathPrefix :: (NullOrUndefined String) }

derive instance newtypeAllowedHostPath :: Newtype AllowedHostPath _
derive instance genericAllowedHostPath :: Generic AllowedHostPath _
instance showAllowedHostPath :: Show AllowedHostPath where show a = genericShow a
instance decodeAllowedHostPath :: Decode AllowedHostPath where
  decode a = do
               pathPrefix <- readProp "pathPrefix" a >>= decode
               pure $ AllowedHostPath { pathPrefix }
instance encodeAllowedHostPath :: Encode AllowedHostPath where
  encode (AllowedHostPath a) = encode $ StrMap.fromFoldable $
               [ Tuple "pathPrefix" (encode a.pathPrefix) ]


instance defaultAllowedHostPath :: Default AllowedHostPath where
  default = AllowedHostPath
    { pathPrefix: NullOrUndefined Nothing }

-- | DEPRECATED - This group version of DaemonSet is deprecated by apps/v1beta2/DaemonSet. See the release notes for more information. DaemonSet represents the configuration of a daemon set.
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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ DaemonSet { apiVersion, kind, metadata, spec, status }
instance encodeDaemonSet :: Encode DaemonSet where
  encode (DaemonSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


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
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ DaemonSetCondition { _type, lastTransitionTime, message, reason, status }
instance encodeDaemonSetCondition :: Encode DaemonSetCondition where
  encode (DaemonSetCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ DaemonSetList { apiVersion, items, kind, metadata }
instance encodeDaemonSetList :: Encode DaemonSetList where
  encode (DaemonSetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


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
-- | - `selector`: A label query over pods that are managed by the daemon set. Must match in order to be controlled. If empty, defaulted to labels on Pod template. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: An object that describes the pod that will be created. The DaemonSet will create exactly one copy of this pod on every node that matches the template's node selector (or on every node if no node selector is specified). More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
-- | - `templateGeneration`: DEPRECATED. A sequence number representing a specific generation of the template. Populated by the system. It can be set only during the creation.
-- | - `updateStrategy`: An update strategy to replace existing DaemonSet pods with new pods.
newtype DaemonSetSpec = DaemonSetSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , revisionHistoryLimit :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec)
  , templateGeneration :: (NullOrUndefined Int)
  , updateStrategy :: (NullOrUndefined DaemonSetUpdateStrategy) }

derive instance newtypeDaemonSetSpec :: Newtype DaemonSetSpec _
derive instance genericDaemonSetSpec :: Generic DaemonSetSpec _
instance showDaemonSetSpec :: Show DaemonSetSpec where show a = genericShow a
instance decodeDaemonSetSpec :: Decode DaemonSetSpec where
  decode a = do
               minReadySeconds <- readProp "minReadySeconds" a >>= decode
               revisionHistoryLimit <- readProp "revisionHistoryLimit" a >>= decode
               selector <- readProp "selector" a >>= decode
               template <- readProp "template" a >>= decode
               templateGeneration <- readProp "templateGeneration" a >>= decode
               updateStrategy <- readProp "updateStrategy" a >>= decode
               pure $ DaemonSetSpec { minReadySeconds, revisionHistoryLimit, selector, template, templateGeneration, updateStrategy }
instance encodeDaemonSetSpec :: Encode DaemonSetSpec where
  encode (DaemonSetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encode a.minReadySeconds)
               , Tuple "revisionHistoryLimit" (encode a.revisionHistoryLimit)
               , Tuple "selector" (encode a.selector)
               , Tuple "template" (encode a.template)
               , Tuple "templateGeneration" (encode a.templateGeneration)
               , Tuple "updateStrategy" (encode a.updateStrategy) ]


instance defaultDaemonSetSpec :: Default DaemonSetSpec where
  default = DaemonSetSpec
    { minReadySeconds: NullOrUndefined Nothing
    , revisionHistoryLimit: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing
    , templateGeneration: NullOrUndefined Nothing
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
  decode a = do
               collisionCount <- readProp "collisionCount" a >>= decode
               conditions <- readProp "conditions" a >>= decode
               currentNumberScheduled <- readProp "currentNumberScheduled" a >>= decode
               desiredNumberScheduled <- readProp "desiredNumberScheduled" a >>= decode
               numberAvailable <- readProp "numberAvailable" a >>= decode
               numberMisscheduled <- readProp "numberMisscheduled" a >>= decode
               numberReady <- readProp "numberReady" a >>= decode
               numberUnavailable <- readProp "numberUnavailable" a >>= decode
               observedGeneration <- readProp "observedGeneration" a >>= decode
               updatedNumberScheduled <- readProp "updatedNumberScheduled" a >>= decode
               pure $ DaemonSetStatus { collisionCount, conditions, currentNumberScheduled, desiredNumberScheduled, numberAvailable, numberMisscheduled, numberReady, numberUnavailable, observedGeneration, updatedNumberScheduled }
instance encodeDaemonSetStatus :: Encode DaemonSetStatus where
  encode (DaemonSetStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "collisionCount" (encode a.collisionCount)
               , Tuple "conditions" (encode a.conditions)
               , Tuple "currentNumberScheduled" (encode a.currentNumberScheduled)
               , Tuple "desiredNumberScheduled" (encode a.desiredNumberScheduled)
               , Tuple "numberAvailable" (encode a.numberAvailable)
               , Tuple "numberMisscheduled" (encode a.numberMisscheduled)
               , Tuple "numberReady" (encode a.numberReady)
               , Tuple "numberUnavailable" (encode a.numberUnavailable)
               , Tuple "observedGeneration" (encode a.observedGeneration)
               , Tuple "updatedNumberScheduled" (encode a.updatedNumberScheduled) ]


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

-- | Fields:
-- | - `rollingUpdate`: Rolling update config params. Present only if type = "RollingUpdate".
-- | - `_type`: Type of daemon set update. Can be "RollingUpdate" or "OnDelete". Default is OnDelete.
newtype DaemonSetUpdateStrategy = DaemonSetUpdateStrategy
  { _type :: (NullOrUndefined String)
  , rollingUpdate :: (NullOrUndefined RollingUpdateDaemonSet) }

derive instance newtypeDaemonSetUpdateStrategy :: Newtype DaemonSetUpdateStrategy _
derive instance genericDaemonSetUpdateStrategy :: Generic DaemonSetUpdateStrategy _
instance showDaemonSetUpdateStrategy :: Show DaemonSetUpdateStrategy where show a = genericShow a
instance decodeDaemonSetUpdateStrategy :: Decode DaemonSetUpdateStrategy where
  decode a = do
               _type <- readProp "_type" a >>= decode
               rollingUpdate <- readProp "rollingUpdate" a >>= decode
               pure $ DaemonSetUpdateStrategy { _type, rollingUpdate }
instance encodeDaemonSetUpdateStrategy :: Encode DaemonSetUpdateStrategy where
  encode (DaemonSetUpdateStrategy a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "rollingUpdate" (encode a.rollingUpdate) ]


instance defaultDaemonSetUpdateStrategy :: Default DaemonSetUpdateStrategy where
  default = DaemonSetUpdateStrategy
    { _type: NullOrUndefined Nothing
    , rollingUpdate: NullOrUndefined Nothing }

-- | DEPRECATED - This group version of Deployment is deprecated by apps/v1beta2/Deployment. See the release notes for more information. Deployment enables declarative updates for Pods and ReplicaSets.
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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ Deployment { apiVersion, kind, metadata, spec, status }
instance encodeDeployment :: Encode Deployment where
  encode (Deployment a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


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
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               lastUpdateTime <- readProp "lastUpdateTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ DeploymentCondition { _type, lastTransitionTime, lastUpdateTime, message, reason, status }
instance encodeDeploymentCondition :: Encode DeploymentCondition where
  encode (DeploymentCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "lastUpdateTime" (encode a.lastUpdateTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ DeploymentList { apiVersion, items, kind, metadata }
instance encodeDeploymentList :: Encode DeploymentList where
  encode (DeploymentList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultDeploymentList :: Default DeploymentList where
  default = DeploymentList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | DEPRECATED. DeploymentRollback stores the information required to rollback a deployment.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `name`: Required: This must match the Name of a deployment.
-- | - `rollbackTo`: The config of this deployment rollback.
-- | - `updatedAnnotations`: The annotations to be updated to a deployment
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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               name <- readProp "name" a >>= decode
               rollbackTo <- readProp "rollbackTo" a >>= decode
               updatedAnnotations <- readProp "updatedAnnotations" a >>= decode
               pure $ DeploymentRollback { apiVersion, kind, name, rollbackTo, updatedAnnotations }
instance encodeDeploymentRollback :: Encode DeploymentRollback where
  encode (DeploymentRollback a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "name" (encode a.name)
               , Tuple "rollbackTo" (encode a.rollbackTo)
               , Tuple "updatedAnnotations" (encode a.updatedAnnotations) ]


instance defaultDeploymentRollback :: Default DeploymentRollback where
  default = DeploymentRollback
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , rollbackTo: NullOrUndefined Nothing
    , updatedAnnotations: NullOrUndefined Nothing }

-- | DeploymentSpec is the specification of the desired behavior of the Deployment.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `paused`: Indicates that the deployment is paused and will not be processed by the deployment controller.
-- | - `progressDeadlineSeconds`: The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. This is not set by default.
-- | - `replicas`: Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
-- | - `revisionHistoryLimit`: The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified.
-- | - `rollbackTo`: DEPRECATED. The config this deployment is rolling back to. Will be cleared after rollback is done.
-- | - `selector`: Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment.
-- | - `strategy`: The deployment strategy to use to replace existing pods with new ones.
-- | - `template`: Template describes the pods that will be created.
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
  decode a = do
               minReadySeconds <- readProp "minReadySeconds" a >>= decode
               paused <- readProp "paused" a >>= decode
               progressDeadlineSeconds <- readProp "progressDeadlineSeconds" a >>= decode
               replicas <- readProp "replicas" a >>= decode
               revisionHistoryLimit <- readProp "revisionHistoryLimit" a >>= decode
               rollbackTo <- readProp "rollbackTo" a >>= decode
               selector <- readProp "selector" a >>= decode
               strategy <- readProp "strategy" a >>= decode
               template <- readProp "template" a >>= decode
               pure $ DeploymentSpec { minReadySeconds, paused, progressDeadlineSeconds, replicas, revisionHistoryLimit, rollbackTo, selector, strategy, template }
instance encodeDeploymentSpec :: Encode DeploymentSpec where
  encode (DeploymentSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encode a.minReadySeconds)
               , Tuple "paused" (encode a.paused)
               , Tuple "progressDeadlineSeconds" (encode a.progressDeadlineSeconds)
               , Tuple "replicas" (encode a.replicas)
               , Tuple "revisionHistoryLimit" (encode a.revisionHistoryLimit)
               , Tuple "rollbackTo" (encode a.rollbackTo)
               , Tuple "selector" (encode a.selector)
               , Tuple "strategy" (encode a.strategy)
               , Tuple "template" (encode a.template) ]


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
  decode a = do
               availableReplicas <- readProp "availableReplicas" a >>= decode
               collisionCount <- readProp "collisionCount" a >>= decode
               conditions <- readProp "conditions" a >>= decode
               observedGeneration <- readProp "observedGeneration" a >>= decode
               readyReplicas <- readProp "readyReplicas" a >>= decode
               replicas <- readProp "replicas" a >>= decode
               unavailableReplicas <- readProp "unavailableReplicas" a >>= decode
               updatedReplicas <- readProp "updatedReplicas" a >>= decode
               pure $ DeploymentStatus { availableReplicas, collisionCount, conditions, observedGeneration, readyReplicas, replicas, unavailableReplicas, updatedReplicas }
instance encodeDeploymentStatus :: Encode DeploymentStatus where
  encode (DeploymentStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "availableReplicas" (encode a.availableReplicas)
               , Tuple "collisionCount" (encode a.collisionCount)
               , Tuple "conditions" (encode a.conditions)
               , Tuple "observedGeneration" (encode a.observedGeneration)
               , Tuple "readyReplicas" (encode a.readyReplicas)
               , Tuple "replicas" (encode a.replicas)
               , Tuple "unavailableReplicas" (encode a.unavailableReplicas)
               , Tuple "updatedReplicas" (encode a.updatedReplicas) ]


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
  decode a = do
               _type <- readProp "_type" a >>= decode
               rollingUpdate <- readProp "rollingUpdate" a >>= decode
               pure $ DeploymentStrategy { _type, rollingUpdate }
instance encodeDeploymentStrategy :: Encode DeploymentStrategy where
  encode (DeploymentStrategy a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "rollingUpdate" (encode a.rollingUpdate) ]


instance defaultDeploymentStrategy :: Default DeploymentStrategy where
  default = DeploymentStrategy
    { _type: NullOrUndefined Nothing
    , rollingUpdate: NullOrUndefined Nothing }

-- | FSGroupStrategyOptions defines the strategy type and options used to create the strategy.
-- |
-- | Fields:
-- | - `ranges`: Ranges are the allowed ranges of fs groups.  If you would like to force a single fs group then supply a single range with the same start and end.
-- | - `rule`: Rule is the strategy that will dictate what FSGroup is used in the SecurityContext.
newtype FSGroupStrategyOptions = FSGroupStrategyOptions
  { ranges :: (NullOrUndefined (Array IDRange))
  , rule :: (NullOrUndefined String) }

derive instance newtypeFSGroupStrategyOptions :: Newtype FSGroupStrategyOptions _
derive instance genericFSGroupStrategyOptions :: Generic FSGroupStrategyOptions _
instance showFSGroupStrategyOptions :: Show FSGroupStrategyOptions where show a = genericShow a
instance decodeFSGroupStrategyOptions :: Decode FSGroupStrategyOptions where
  decode a = do
               ranges <- readProp "ranges" a >>= decode
               rule <- readProp "rule" a >>= decode
               pure $ FSGroupStrategyOptions { ranges, rule }
instance encodeFSGroupStrategyOptions :: Encode FSGroupStrategyOptions where
  encode (FSGroupStrategyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "ranges" (encode a.ranges)
               , Tuple "rule" (encode a.rule) ]


instance defaultFSGroupStrategyOptions :: Default FSGroupStrategyOptions where
  default = FSGroupStrategyOptions
    { ranges: NullOrUndefined Nothing
    , rule: NullOrUndefined Nothing }

-- | HTTPIngressPath associates a path regex with a backend. Incoming urls matching the path are forwarded to the backend.
-- |
-- | Fields:
-- | - `backend`: Backend defines the referenced service endpoint to which the traffic will be forwarded to.
-- | - `path`: Path is an extended POSIX regex as defined by IEEE Std 1003.1, (i.e this follows the egrep/unix syntax, not the perl syntax) matched against the path of an incoming request. Currently it can contain characters disallowed from the conventional "path" part of a URL as defined by RFC 3986. Paths must begin with a '/'. If unspecified, the path defaults to a catch all sending traffic to the backend.
newtype HTTPIngressPath = HTTPIngressPath
  { backend :: (NullOrUndefined IngressBackend)
  , path :: (NullOrUndefined String) }

derive instance newtypeHTTPIngressPath :: Newtype HTTPIngressPath _
derive instance genericHTTPIngressPath :: Generic HTTPIngressPath _
instance showHTTPIngressPath :: Show HTTPIngressPath where show a = genericShow a
instance decodeHTTPIngressPath :: Decode HTTPIngressPath where
  decode a = do
               backend <- readProp "backend" a >>= decode
               path <- readProp "path" a >>= decode
               pure $ HTTPIngressPath { backend, path }
instance encodeHTTPIngressPath :: Encode HTTPIngressPath where
  encode (HTTPIngressPath a) = encode $ StrMap.fromFoldable $
               [ Tuple "backend" (encode a.backend)
               , Tuple "path" (encode a.path) ]


instance defaultHTTPIngressPath :: Default HTTPIngressPath where
  default = HTTPIngressPath
    { backend: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing }

-- | HTTPIngressRuleValue is a list of http selectors pointing to backends. In the example: http://<host>/<path>?<searchpart> -> backend where where parts of the url correspond to RFC 3986, this resource will be used to match against everything after the last '/' and before the first '?' or '#'.
-- |
-- | Fields:
-- | - `paths`: A collection of paths that map requests to backends.
newtype HTTPIngressRuleValue = HTTPIngressRuleValue
  { paths :: (NullOrUndefined (Array HTTPIngressPath)) }

derive instance newtypeHTTPIngressRuleValue :: Newtype HTTPIngressRuleValue _
derive instance genericHTTPIngressRuleValue :: Generic HTTPIngressRuleValue _
instance showHTTPIngressRuleValue :: Show HTTPIngressRuleValue where show a = genericShow a
instance decodeHTTPIngressRuleValue :: Decode HTTPIngressRuleValue where
  decode a = do
               paths <- readProp "paths" a >>= decode
               pure $ HTTPIngressRuleValue { paths }
instance encodeHTTPIngressRuleValue :: Encode HTTPIngressRuleValue where
  encode (HTTPIngressRuleValue a) = encode $ StrMap.fromFoldable $
               [ Tuple "paths" (encode a.paths) ]


instance defaultHTTPIngressRuleValue :: Default HTTPIngressRuleValue where
  default = HTTPIngressRuleValue
    { paths: NullOrUndefined Nothing }

-- | Host Port Range defines a range of host ports that will be enabled by a policy for pods to use.  It requires both the start and end to be defined.
-- |
-- | Fields:
-- | - `max`: max is the end of the range, inclusive.
-- | - `min`: min is the start of the range, inclusive.
newtype HostPortRange = HostPortRange
  { max :: (NullOrUndefined Int)
  , min :: (NullOrUndefined Int) }

derive instance newtypeHostPortRange :: Newtype HostPortRange _
derive instance genericHostPortRange :: Generic HostPortRange _
instance showHostPortRange :: Show HostPortRange where show a = genericShow a
instance decodeHostPortRange :: Decode HostPortRange where
  decode a = do
               max <- readProp "max" a >>= decode
               min <- readProp "min" a >>= decode
               pure $ HostPortRange { max, min }
instance encodeHostPortRange :: Encode HostPortRange where
  encode (HostPortRange a) = encode $ StrMap.fromFoldable $
               [ Tuple "max" (encode a.max)
               , Tuple "min" (encode a.min) ]


instance defaultHostPortRange :: Default HostPortRange where
  default = HostPortRange
    { max: NullOrUndefined Nothing
    , min: NullOrUndefined Nothing }

-- | ID Range provides a min/max of an allowed range of IDs.
-- |
-- | Fields:
-- | - `max`: Max is the end of the range, inclusive.
-- | - `min`: Min is the start of the range, inclusive.
newtype IDRange = IDRange
  { max :: (NullOrUndefined Int)
  , min :: (NullOrUndefined Int) }

derive instance newtypeIDRange :: Newtype IDRange _
derive instance genericIDRange :: Generic IDRange _
instance showIDRange :: Show IDRange where show a = genericShow a
instance decodeIDRange :: Decode IDRange where
  decode a = do
               max <- readProp "max" a >>= decode
               min <- readProp "min" a >>= decode
               pure $ IDRange { max, min }
instance encodeIDRange :: Encode IDRange where
  encode (IDRange a) = encode $ StrMap.fromFoldable $
               [ Tuple "max" (encode a.max)
               , Tuple "min" (encode a.min) ]


instance defaultIDRange :: Default IDRange where
  default = IDRange
    { max: NullOrUndefined Nothing
    , min: NullOrUndefined Nothing }

-- | DEPRECATED 1.9 - This group version of IPBlock is deprecated by networking/v1/IPBlock. IPBlock describes a particular CIDR (Ex. "192.168.1.1/24") that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The except entry describes CIDRs that should not be included within this rule.
-- |
-- | Fields:
-- | - `cidr`: CIDR is a string representing the IP Block Valid examples are "192.168.1.1/24"
-- | - `except`: Except is a slice of CIDRs that should not be included within an IP Block Valid examples are "192.168.1.1/24" Except values will be rejected if they are outside the CIDR range
newtype IPBlock = IPBlock
  { cidr :: (NullOrUndefined String)
  , except :: (NullOrUndefined (Array String)) }

derive instance newtypeIPBlock :: Newtype IPBlock _
derive instance genericIPBlock :: Generic IPBlock _
instance showIPBlock :: Show IPBlock where show a = genericShow a
instance decodeIPBlock :: Decode IPBlock where
  decode a = do
               cidr <- readProp "cidr" a >>= decode
               except <- readProp "except" a >>= decode
               pure $ IPBlock { cidr, except }
instance encodeIPBlock :: Encode IPBlock where
  encode (IPBlock a) = encode $ StrMap.fromFoldable $
               [ Tuple "cidr" (encode a.cidr)
               , Tuple "except" (encode a.except) ]


instance defaultIPBlock :: Default IPBlock where
  default = IPBlock
    { cidr: NullOrUndefined Nothing
    , except: NullOrUndefined Nothing }

-- | Ingress is a collection of rules that allow inbound connections to reach the endpoints defined by a backend. An Ingress can be configured to give services externally-reachable urls, load balance traffic, terminate SSL, offer name based virtual hosting etc.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec is the desired state of the Ingress. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status is the current state of the Ingress. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Ingress = Ingress
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined IngressSpec)
  , status :: (NullOrUndefined IngressStatus) }

derive instance newtypeIngress :: Newtype Ingress _
derive instance genericIngress :: Generic Ingress _
instance showIngress :: Show Ingress where show a = genericShow a
instance decodeIngress :: Decode Ingress where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ Ingress { apiVersion, kind, metadata, spec, status }
instance encodeIngress :: Encode Ingress where
  encode (Ingress a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultIngress :: Default Ingress where
  default = Ingress
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | IngressBackend describes all endpoints for a given service and port.
-- |
-- | Fields:
-- | - `serviceName`: Specifies the name of the referenced service.
-- | - `servicePort`: Specifies the port of the referenced service.
newtype IngressBackend = IngressBackend
  { serviceName :: (NullOrUndefined String)
  , servicePort :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeIngressBackend :: Newtype IngressBackend _
derive instance genericIngressBackend :: Generic IngressBackend _
instance showIngressBackend :: Show IngressBackend where show a = genericShow a
instance decodeIngressBackend :: Decode IngressBackend where
  decode a = do
               serviceName <- readProp "serviceName" a >>= decode
               servicePort <- readProp "servicePort" a >>= decode
               pure $ IngressBackend { serviceName, servicePort }
instance encodeIngressBackend :: Encode IngressBackend where
  encode (IngressBackend a) = encode $ StrMap.fromFoldable $
               [ Tuple "serviceName" (encode a.serviceName)
               , Tuple "servicePort" (encode a.servicePort) ]


instance defaultIngressBackend :: Default IngressBackend where
  default = IngressBackend
    { serviceName: NullOrUndefined Nothing
    , servicePort: NullOrUndefined Nothing }

-- | IngressList is a collection of Ingress.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of Ingress.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype IngressList = IngressList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Ingress))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeIngressList :: Newtype IngressList _
derive instance genericIngressList :: Generic IngressList _
instance showIngressList :: Show IngressList where show a = genericShow a
instance decodeIngressList :: Decode IngressList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ IngressList { apiVersion, items, kind, metadata }
instance encodeIngressList :: Encode IngressList where
  encode (IngressList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultIngressList :: Default IngressList where
  default = IngressList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | IngressRule represents the rules mapping the paths under a specified host to the related backend services. Incoming requests are first evaluated for a host match, then routed to the backend associated with the matching IngressRuleValue.
-- |
-- | Fields:
-- | - `host`: Host is the fully qualified domain name of a network host, as defined by RFC 3986. Note the following deviations from the "host" part of the URI as defined in the RFC: 1. IPs are not allowed. Currently an IngressRuleValue can only apply to the
-- |    	  IP in the Spec of the parent Ingress.
-- |    2. The `:` delimiter is not respected because ports are not allowed.
-- |    	  Currently the port of an Ingress is implicitly :80 for http and
-- |    	  :443 for https.
-- |    Both these may change in the future. Incoming requests are matched against the host before the IngressRuleValue. If the host is unspecified, the Ingress routes all traffic based on the specified IngressRuleValue.
-- | - `http`
newtype IngressRule = IngressRule
  { host :: (NullOrUndefined String)
  , http :: (NullOrUndefined HTTPIngressRuleValue) }

derive instance newtypeIngressRule :: Newtype IngressRule _
derive instance genericIngressRule :: Generic IngressRule _
instance showIngressRule :: Show IngressRule where show a = genericShow a
instance decodeIngressRule :: Decode IngressRule where
  decode a = do
               host <- readProp "host" a >>= decode
               http <- readProp "http" a >>= decode
               pure $ IngressRule { host, http }
instance encodeIngressRule :: Encode IngressRule where
  encode (IngressRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "host" (encode a.host)
               , Tuple "http" (encode a.http) ]


instance defaultIngressRule :: Default IngressRule where
  default = IngressRule
    { host: NullOrUndefined Nothing
    , http: NullOrUndefined Nothing }

-- | IngressSpec describes the Ingress the user wishes to exist.
-- |
-- | Fields:
-- | - `backend`: A default backend capable of servicing requests that don't match any rule. At least one of 'backend' or 'rules' must be specified. This field is optional to allow the loadbalancer controller or defaulting logic to specify a global default.
-- | - `rules`: A list of host rules used to configure the Ingress. If unspecified, or no rule matches, all traffic is sent to the default backend.
-- | - `tls`: TLS configuration. Currently the Ingress only supports a single TLS port, 443. If multiple members of this list specify different hosts, they will be multiplexed on the same port according to the hostname specified through the SNI TLS extension, if the ingress controller fulfilling the ingress supports SNI.
newtype IngressSpec = IngressSpec
  { backend :: (NullOrUndefined IngressBackend)
  , rules :: (NullOrUndefined (Array IngressRule))
  , tls :: (NullOrUndefined (Array IngressTLS)) }

derive instance newtypeIngressSpec :: Newtype IngressSpec _
derive instance genericIngressSpec :: Generic IngressSpec _
instance showIngressSpec :: Show IngressSpec where show a = genericShow a
instance decodeIngressSpec :: Decode IngressSpec where
  decode a = do
               backend <- readProp "backend" a >>= decode
               rules <- readProp "rules" a >>= decode
               tls <- readProp "tls" a >>= decode
               pure $ IngressSpec { backend, rules, tls }
instance encodeIngressSpec :: Encode IngressSpec where
  encode (IngressSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "backend" (encode a.backend)
               , Tuple "rules" (encode a.rules)
               , Tuple "tls" (encode a.tls) ]


instance defaultIngressSpec :: Default IngressSpec where
  default = IngressSpec
    { backend: NullOrUndefined Nothing
    , rules: NullOrUndefined Nothing
    , tls: NullOrUndefined Nothing }

-- | IngressStatus describe the current state of the Ingress.
-- |
-- | Fields:
-- | - `loadBalancer`: LoadBalancer contains the current status of the load-balancer.
newtype IngressStatus = IngressStatus
  { loadBalancer :: (NullOrUndefined CoreV1.LoadBalancerStatus) }

derive instance newtypeIngressStatus :: Newtype IngressStatus _
derive instance genericIngressStatus :: Generic IngressStatus _
instance showIngressStatus :: Show IngressStatus where show a = genericShow a
instance decodeIngressStatus :: Decode IngressStatus where
  decode a = do
               loadBalancer <- readProp "loadBalancer" a >>= decode
               pure $ IngressStatus { loadBalancer }
instance encodeIngressStatus :: Encode IngressStatus where
  encode (IngressStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "loadBalancer" (encode a.loadBalancer) ]


instance defaultIngressStatus :: Default IngressStatus where
  default = IngressStatus
    { loadBalancer: NullOrUndefined Nothing }

-- | IngressTLS describes the transport layer security associated with an Ingress.
-- |
-- | Fields:
-- | - `hosts`: Hosts are a list of hosts included in the TLS certificate. The values in this list must match the name/s used in the tlsSecret. Defaults to the wildcard host setting for the loadbalancer controller fulfilling this Ingress, if left unspecified.
-- | - `secretName`: SecretName is the name of the secret used to terminate SSL traffic on 443. Field is left optional to allow SSL routing based on SNI hostname alone. If the SNI host in a listener conflicts with the "Host" header field used by an IngressRule, the SNI host is used for termination and value of the Host header is used for routing.
newtype IngressTLS = IngressTLS
  { hosts :: (NullOrUndefined (Array String))
  , secretName :: (NullOrUndefined String) }

derive instance newtypeIngressTLS :: Newtype IngressTLS _
derive instance genericIngressTLS :: Generic IngressTLS _
instance showIngressTLS :: Show IngressTLS where show a = genericShow a
instance decodeIngressTLS :: Decode IngressTLS where
  decode a = do
               hosts <- readProp "hosts" a >>= decode
               secretName <- readProp "secretName" a >>= decode
               pure $ IngressTLS { hosts, secretName }
instance encodeIngressTLS :: Encode IngressTLS where
  encode (IngressTLS a) = encode $ StrMap.fromFoldable $
               [ Tuple "hosts" (encode a.hosts)
               , Tuple "secretName" (encode a.secretName) ]


instance defaultIngressTLS :: Default IngressTLS where
  default = IngressTLS
    { hosts: NullOrUndefined Nothing
    , secretName: NullOrUndefined Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicy is deprecated by networking/v1/NetworkPolicy. NetworkPolicy describes what network traffic is allowed for a set of Pods
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior for this NetworkPolicy.
newtype NetworkPolicy = NetworkPolicy
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined NetworkPolicySpec) }

derive instance newtypeNetworkPolicy :: Newtype NetworkPolicy _
derive instance genericNetworkPolicy :: Generic NetworkPolicy _
instance showNetworkPolicy :: Show NetworkPolicy where show a = genericShow a
instance decodeNetworkPolicy :: Decode NetworkPolicy where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               pure $ NetworkPolicy { apiVersion, kind, metadata, spec }
instance encodeNetworkPolicy :: Encode NetworkPolicy where
  encode (NetworkPolicy a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec) ]


instance defaultNetworkPolicy :: Default NetworkPolicy where
  default = NetworkPolicy
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyEgressRule is deprecated by networking/v1/NetworkPolicyEgressRule. NetworkPolicyEgressRule describes a particular set of traffic that is allowed out of pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and to. This type is beta-level in 1.8
-- |
-- | Fields:
-- | - `ports`: List of destination ports for outgoing traffic. Each item in this list is combined using a logical OR. If this field is empty or missing, this rule matches all ports (traffic not restricted by port). If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list.
-- | - `to`: List of destinations for outgoing traffic of pods selected for this rule. Items in this list are combined using a logical OR operation. If this field is empty or missing, this rule matches all destinations (traffic not restricted by destination). If this field is present and contains at least one item, this rule allows traffic only if the traffic matches at least one item in the to list.
newtype NetworkPolicyEgressRule = NetworkPolicyEgressRule
  { ports :: (NullOrUndefined (Array NetworkPolicyPort))
  , to :: (NullOrUndefined (Array NetworkPolicyPeer)) }

derive instance newtypeNetworkPolicyEgressRule :: Newtype NetworkPolicyEgressRule _
derive instance genericNetworkPolicyEgressRule :: Generic NetworkPolicyEgressRule _
instance showNetworkPolicyEgressRule :: Show NetworkPolicyEgressRule where show a = genericShow a
instance decodeNetworkPolicyEgressRule :: Decode NetworkPolicyEgressRule where
  decode a = do
               ports <- readProp "ports" a >>= decode
               to <- readProp "to" a >>= decode
               pure $ NetworkPolicyEgressRule { ports, to }
instance encodeNetworkPolicyEgressRule :: Encode NetworkPolicyEgressRule where
  encode (NetworkPolicyEgressRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "ports" (encode a.ports)
               , Tuple "to" (encode a.to) ]


instance defaultNetworkPolicyEgressRule :: Default NetworkPolicyEgressRule where
  default = NetworkPolicyEgressRule
    { ports: NullOrUndefined Nothing
    , to: NullOrUndefined Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyIngressRule is deprecated by networking/v1/NetworkPolicyIngressRule. This NetworkPolicyIngressRule matches traffic if and only if the traffic matches both ports AND from.
-- |
-- | Fields:
-- | - `from`: List of sources which should be able to access the pods selected for this rule. Items in this list are combined using a logical OR operation. If this field is empty or missing, this rule matches all sources (traffic not restricted by source). If this field is present and contains at least on item, this rule allows traffic only if the traffic matches at least one item in the from list.
-- | - `ports`: List of ports which should be made accessible on the pods selected for this rule. Each item in this list is combined using a logical OR. If this field is empty or missing, this rule matches all ports (traffic not restricted by port). If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list.
newtype NetworkPolicyIngressRule = NetworkPolicyIngressRule
  { from :: (NullOrUndefined (Array NetworkPolicyPeer))
  , ports :: (NullOrUndefined (Array NetworkPolicyPort)) }

derive instance newtypeNetworkPolicyIngressRule :: Newtype NetworkPolicyIngressRule _
derive instance genericNetworkPolicyIngressRule :: Generic NetworkPolicyIngressRule _
instance showNetworkPolicyIngressRule :: Show NetworkPolicyIngressRule where show a = genericShow a
instance decodeNetworkPolicyIngressRule :: Decode NetworkPolicyIngressRule where
  decode a = do
               from <- readProp "from" a >>= decode
               ports <- readProp "ports" a >>= decode
               pure $ NetworkPolicyIngressRule { from, ports }
instance encodeNetworkPolicyIngressRule :: Encode NetworkPolicyIngressRule where
  encode (NetworkPolicyIngressRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "from" (encode a.from)
               , Tuple "ports" (encode a.ports) ]


instance defaultNetworkPolicyIngressRule :: Default NetworkPolicyIngressRule where
  default = NetworkPolicyIngressRule
    { from: NullOrUndefined Nothing
    , ports: NullOrUndefined Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyList is deprecated by networking/v1/NetworkPolicyList. Network Policy List is a list of NetworkPolicy objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of schema objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype NetworkPolicyList = NetworkPolicyList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array NetworkPolicy))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeNetworkPolicyList :: Newtype NetworkPolicyList _
derive instance genericNetworkPolicyList :: Generic NetworkPolicyList _
instance showNetworkPolicyList :: Show NetworkPolicyList where show a = genericShow a
instance decodeNetworkPolicyList :: Decode NetworkPolicyList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ NetworkPolicyList { apiVersion, items, kind, metadata }
instance encodeNetworkPolicyList :: Encode NetworkPolicyList where
  encode (NetworkPolicyList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultNetworkPolicyList :: Default NetworkPolicyList where
  default = NetworkPolicyList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyPeer is deprecated by networking/v1/NetworkPolicyPeer.
-- |
-- | Fields:
-- | - `ipBlock`: IPBlock defines policy on a particular IPBlock
-- | - `namespaceSelector`: Selects Namespaces using cluster scoped-labels.  This matches all pods in all namespaces selected by this label selector. This field follows standard label selector semantics. If present but empty, this selector selects all namespaces.
-- | - `podSelector`: This is a label selector which selects Pods in this namespace. This field follows standard label selector semantics. If present but empty, this selector selects all pods in this namespace.
newtype NetworkPolicyPeer = NetworkPolicyPeer
  { ipBlock :: (NullOrUndefined IPBlock)
  , namespaceSelector :: (NullOrUndefined MetaV1.LabelSelector)
  , podSelector :: (NullOrUndefined MetaV1.LabelSelector) }

derive instance newtypeNetworkPolicyPeer :: Newtype NetworkPolicyPeer _
derive instance genericNetworkPolicyPeer :: Generic NetworkPolicyPeer _
instance showNetworkPolicyPeer :: Show NetworkPolicyPeer where show a = genericShow a
instance decodeNetworkPolicyPeer :: Decode NetworkPolicyPeer where
  decode a = do
               ipBlock <- readProp "ipBlock" a >>= decode
               namespaceSelector <- readProp "namespaceSelector" a >>= decode
               podSelector <- readProp "podSelector" a >>= decode
               pure $ NetworkPolicyPeer { ipBlock, namespaceSelector, podSelector }
instance encodeNetworkPolicyPeer :: Encode NetworkPolicyPeer where
  encode (NetworkPolicyPeer a) = encode $ StrMap.fromFoldable $
               [ Tuple "ipBlock" (encode a.ipBlock)
               , Tuple "namespaceSelector" (encode a.namespaceSelector)
               , Tuple "podSelector" (encode a.podSelector) ]


instance defaultNetworkPolicyPeer :: Default NetworkPolicyPeer where
  default = NetworkPolicyPeer
    { ipBlock: NullOrUndefined Nothing
    , namespaceSelector: NullOrUndefined Nothing
    , podSelector: NullOrUndefined Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyPort is deprecated by networking/v1/NetworkPolicyPort.
-- |
-- | Fields:
-- | - `port`: If specified, the port on the given protocol.  This can either be a numerical or named port on a pod.  If this field is not provided, this matches all port names and numbers. If present, only traffic on the specified protocol AND port will be matched.
-- | - `protocol`: Optional.  The protocol (TCP or UDP) which traffic must match. If not specified, this field defaults to TCP.
newtype NetworkPolicyPort = NetworkPolicyPort
  { port :: (NullOrUndefined Util.IntOrString)
  , protocol :: (NullOrUndefined String) }

derive instance newtypeNetworkPolicyPort :: Newtype NetworkPolicyPort _
derive instance genericNetworkPolicyPort :: Generic NetworkPolicyPort _
instance showNetworkPolicyPort :: Show NetworkPolicyPort where show a = genericShow a
instance decodeNetworkPolicyPort :: Decode NetworkPolicyPort where
  decode a = do
               port <- readProp "port" a >>= decode
               protocol <- readProp "protocol" a >>= decode
               pure $ NetworkPolicyPort { port, protocol }
instance encodeNetworkPolicyPort :: Encode NetworkPolicyPort where
  encode (NetworkPolicyPort a) = encode $ StrMap.fromFoldable $
               [ Tuple "port" (encode a.port)
               , Tuple "protocol" (encode a.protocol) ]


instance defaultNetworkPolicyPort :: Default NetworkPolicyPort where
  default = NetworkPolicyPort
    { port: NullOrUndefined Nothing
    , protocol: NullOrUndefined Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicySpec is deprecated by networking/v1/NetworkPolicySpec.
-- |
-- | Fields:
-- | - `egress`: List of egress rules to be applied to the selected pods. Outgoing traffic is allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic matches at least one egress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it selects are isolated by default). This field is beta-level in 1.8
-- | - `ingress`: List of ingress rules to be applied to the selected pods. Traffic is allowed to a pod if there are no NetworkPolicies selecting the pod OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy does not allow any traffic (and serves solely to ensure that the pods it selects are isolated by default).
-- | - `podSelector`: Selects the pods to which this NetworkPolicy object applies.  The array of ingress rules is applied to any pods selected by this field. Multiple network policies can select the same set of pods.  In this case, the ingress rules for each are combined additively. This field is NOT optional and follows standard label selector semantics. An empty podSelector matches all pods in this namespace.
-- | - `policyTypes`: List of rule types that the NetworkPolicy relates to. Valid options are Ingress, Egress, or Ingress,Egress. If this field is not specified, it will default based on the existence of Ingress or Egress rules; policies that contain an Egress section are assumed to affect Egress, and all policies (whether or not they contain an Ingress section) are assumed to affect Ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ "Egress" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include "Egress" (since such a policy would not include an Egress section and would otherwise default to just [ "Ingress" ]). This field is beta-level in 1.8
newtype NetworkPolicySpec = NetworkPolicySpec
  { egress :: (NullOrUndefined (Array NetworkPolicyEgressRule))
  , ingress :: (NullOrUndefined (Array NetworkPolicyIngressRule))
  , podSelector :: (NullOrUndefined MetaV1.LabelSelector)
  , policyTypes :: (NullOrUndefined (Array String)) }

derive instance newtypeNetworkPolicySpec :: Newtype NetworkPolicySpec _
derive instance genericNetworkPolicySpec :: Generic NetworkPolicySpec _
instance showNetworkPolicySpec :: Show NetworkPolicySpec where show a = genericShow a
instance decodeNetworkPolicySpec :: Decode NetworkPolicySpec where
  decode a = do
               egress <- readProp "egress" a >>= decode
               ingress <- readProp "ingress" a >>= decode
               podSelector <- readProp "podSelector" a >>= decode
               policyTypes <- readProp "policyTypes" a >>= decode
               pure $ NetworkPolicySpec { egress, ingress, podSelector, policyTypes }
instance encodeNetworkPolicySpec :: Encode NetworkPolicySpec where
  encode (NetworkPolicySpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "egress" (encode a.egress)
               , Tuple "ingress" (encode a.ingress)
               , Tuple "podSelector" (encode a.podSelector)
               , Tuple "policyTypes" (encode a.policyTypes) ]


instance defaultNetworkPolicySpec :: Default NetworkPolicySpec where
  default = NetworkPolicySpec
    { egress: NullOrUndefined Nothing
    , ingress: NullOrUndefined Nothing
    , podSelector: NullOrUndefined Nothing
    , policyTypes: NullOrUndefined Nothing }

-- | Pod Security Policy governs the ability to make requests that affect the Security Context that will be applied to a pod and container.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: spec defines the policy enforced.
newtype PodSecurityPolicy = PodSecurityPolicy
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodSecurityPolicySpec) }

derive instance newtypePodSecurityPolicy :: Newtype PodSecurityPolicy _
derive instance genericPodSecurityPolicy :: Generic PodSecurityPolicy _
instance showPodSecurityPolicy :: Show PodSecurityPolicy where show a = genericShow a
instance decodePodSecurityPolicy :: Decode PodSecurityPolicy where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               pure $ PodSecurityPolicy { apiVersion, kind, metadata, spec }
instance encodePodSecurityPolicy :: Encode PodSecurityPolicy where
  encode (PodSecurityPolicy a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec) ]


instance defaultPodSecurityPolicy :: Default PodSecurityPolicy where
  default = PodSecurityPolicy
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | Pod Security Policy List is a list of PodSecurityPolicy objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of schema objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype PodSecurityPolicyList = PodSecurityPolicyList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PodSecurityPolicy))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodSecurityPolicyList :: Newtype PodSecurityPolicyList _
derive instance genericPodSecurityPolicyList :: Generic PodSecurityPolicyList _
instance showPodSecurityPolicyList :: Show PodSecurityPolicyList where show a = genericShow a
instance decodePodSecurityPolicyList :: Decode PodSecurityPolicyList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ PodSecurityPolicyList { apiVersion, items, kind, metadata }
instance encodePodSecurityPolicyList :: Encode PodSecurityPolicyList where
  encode (PodSecurityPolicyList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultPodSecurityPolicyList :: Default PodSecurityPolicyList where
  default = PodSecurityPolicyList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | Pod Security Policy Spec defines the policy enforced.
-- |
-- | Fields:
-- | - `allowPrivilegeEscalation`: AllowPrivilegeEscalation determines if a pod can request to allow privilege escalation. If unspecified, defaults to true.
-- | - `allowedCapabilities`: AllowedCapabilities is a list of capabilities that can be requested to add to the container. Capabilities in this field may be added at the pod author's discretion. You must not list a capability in both AllowedCapabilities and RequiredDropCapabilities.
-- | - `allowedFlexVolumes`: AllowedFlexVolumes is a whitelist of allowed Flexvolumes.  Empty or nil indicates that all Flexvolumes may be used.  This parameter is effective only when the usage of the Flexvolumes is allowed in the "Volumes" field.
-- | - `allowedHostPaths`: is a white list of allowed host paths. Empty indicates that all host paths may be used.
-- | - `defaultAddCapabilities`: DefaultAddCapabilities is the default set of capabilities that will be added to the container unless the pod spec specifically drops the capability.  You may not list a capability in both DefaultAddCapabilities and RequiredDropCapabilities. Capabilities added here are implicitly allowed, and need not be included in the AllowedCapabilities list.
-- | - `defaultAllowPrivilegeEscalation`: DefaultAllowPrivilegeEscalation controls the default setting for whether a process can gain more privileges than its parent process.
-- | - `fsGroup`: FSGroup is the strategy that will dictate what fs group is used by the SecurityContext.
-- | - `hostIPC`: hostIPC determines if the policy allows the use of HostIPC in the pod spec.
-- | - `hostNetwork`: hostNetwork determines if the policy allows the use of HostNetwork in the pod spec.
-- | - `hostPID`: hostPID determines if the policy allows the use of HostPID in the pod spec.
-- | - `hostPorts`: hostPorts determines which host port ranges are allowed to be exposed.
-- | - `privileged`: privileged determines if a pod can request to be run as privileged.
-- | - `readOnlyRootFilesystem`: ReadOnlyRootFilesystem when set to true will force containers to run with a read only root file system.  If the container specifically requests to run with a non-read only root file system the PSP should deny the pod. If set to false the container may run with a read only root file system if it wishes but it will not be forced to.
-- | - `requiredDropCapabilities`: RequiredDropCapabilities are the capabilities that will be dropped from the container.  These are required to be dropped and cannot be added.
-- | - `runAsUser`: runAsUser is the strategy that will dictate the allowable RunAsUser values that may be set.
-- | - `seLinux`: seLinux is the strategy that will dictate the allowable labels that may be set.
-- | - `supplementalGroups`: SupplementalGroups is the strategy that will dictate what supplemental groups are used by the SecurityContext.
-- | - `volumes`: volumes is a white list of allowed volume plugins.  Empty indicates that all plugins may be used.
newtype PodSecurityPolicySpec = PodSecurityPolicySpec
  { allowPrivilegeEscalation :: (NullOrUndefined Boolean)
  , allowedCapabilities :: (NullOrUndefined (Array String))
  , allowedFlexVolumes :: (NullOrUndefined (Array AllowedFlexVolume))
  , allowedHostPaths :: (NullOrUndefined (Array AllowedHostPath))
  , defaultAddCapabilities :: (NullOrUndefined (Array String))
  , defaultAllowPrivilegeEscalation :: (NullOrUndefined Boolean)
  , fsGroup :: (NullOrUndefined FSGroupStrategyOptions)
  , hostIPC :: (NullOrUndefined Boolean)
  , hostNetwork :: (NullOrUndefined Boolean)
  , hostPID :: (NullOrUndefined Boolean)
  , hostPorts :: (NullOrUndefined (Array HostPortRange))
  , privileged :: (NullOrUndefined Boolean)
  , readOnlyRootFilesystem :: (NullOrUndefined Boolean)
  , requiredDropCapabilities :: (NullOrUndefined (Array String))
  , runAsUser :: (NullOrUndefined RunAsUserStrategyOptions)
  , seLinux :: (NullOrUndefined SELinuxStrategyOptions)
  , supplementalGroups :: (NullOrUndefined SupplementalGroupsStrategyOptions)
  , volumes :: (NullOrUndefined (Array String)) }

derive instance newtypePodSecurityPolicySpec :: Newtype PodSecurityPolicySpec _
derive instance genericPodSecurityPolicySpec :: Generic PodSecurityPolicySpec _
instance showPodSecurityPolicySpec :: Show PodSecurityPolicySpec where show a = genericShow a
instance decodePodSecurityPolicySpec :: Decode PodSecurityPolicySpec where
  decode a = do
               allowPrivilegeEscalation <- readProp "allowPrivilegeEscalation" a >>= decode
               allowedCapabilities <- readProp "allowedCapabilities" a >>= decode
               allowedFlexVolumes <- readProp "allowedFlexVolumes" a >>= decode
               allowedHostPaths <- readProp "allowedHostPaths" a >>= decode
               defaultAddCapabilities <- readProp "defaultAddCapabilities" a >>= decode
               defaultAllowPrivilegeEscalation <- readProp "defaultAllowPrivilegeEscalation" a >>= decode
               fsGroup <- readProp "fsGroup" a >>= decode
               hostIPC <- readProp "hostIPC" a >>= decode
               hostNetwork <- readProp "hostNetwork" a >>= decode
               hostPID <- readProp "hostPID" a >>= decode
               hostPorts <- readProp "hostPorts" a >>= decode
               privileged <- readProp "privileged" a >>= decode
               readOnlyRootFilesystem <- readProp "readOnlyRootFilesystem" a >>= decode
               requiredDropCapabilities <- readProp "requiredDropCapabilities" a >>= decode
               runAsUser <- readProp "runAsUser" a >>= decode
               seLinux <- readProp "seLinux" a >>= decode
               supplementalGroups <- readProp "supplementalGroups" a >>= decode
               volumes <- readProp "volumes" a >>= decode
               pure $ PodSecurityPolicySpec { allowPrivilegeEscalation, allowedCapabilities, allowedFlexVolumes, allowedHostPaths, defaultAddCapabilities, defaultAllowPrivilegeEscalation, fsGroup, hostIPC, hostNetwork, hostPID, hostPorts, privileged, readOnlyRootFilesystem, requiredDropCapabilities, runAsUser, seLinux, supplementalGroups, volumes }
instance encodePodSecurityPolicySpec :: Encode PodSecurityPolicySpec where
  encode (PodSecurityPolicySpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "allowPrivilegeEscalation" (encode a.allowPrivilegeEscalation)
               , Tuple "allowedCapabilities" (encode a.allowedCapabilities)
               , Tuple "allowedFlexVolumes" (encode a.allowedFlexVolumes)
               , Tuple "allowedHostPaths" (encode a.allowedHostPaths)
               , Tuple "defaultAddCapabilities" (encode a.defaultAddCapabilities)
               , Tuple "defaultAllowPrivilegeEscalation" (encode a.defaultAllowPrivilegeEscalation)
               , Tuple "fsGroup" (encode a.fsGroup)
               , Tuple "hostIPC" (encode a.hostIPC)
               , Tuple "hostNetwork" (encode a.hostNetwork)
               , Tuple "hostPID" (encode a.hostPID)
               , Tuple "hostPorts" (encode a.hostPorts)
               , Tuple "privileged" (encode a.privileged)
               , Tuple "readOnlyRootFilesystem" (encode a.readOnlyRootFilesystem)
               , Tuple "requiredDropCapabilities" (encode a.requiredDropCapabilities)
               , Tuple "runAsUser" (encode a.runAsUser)
               , Tuple "seLinux" (encode a.seLinux)
               , Tuple "supplementalGroups" (encode a.supplementalGroups)
               , Tuple "volumes" (encode a.volumes) ]


instance defaultPodSecurityPolicySpec :: Default PodSecurityPolicySpec where
  default = PodSecurityPolicySpec
    { allowPrivilegeEscalation: NullOrUndefined Nothing
    , allowedCapabilities: NullOrUndefined Nothing
    , allowedFlexVolumes: NullOrUndefined Nothing
    , allowedHostPaths: NullOrUndefined Nothing
    , defaultAddCapabilities: NullOrUndefined Nothing
    , defaultAllowPrivilegeEscalation: NullOrUndefined Nothing
    , fsGroup: NullOrUndefined Nothing
    , hostIPC: NullOrUndefined Nothing
    , hostNetwork: NullOrUndefined Nothing
    , hostPID: NullOrUndefined Nothing
    , hostPorts: NullOrUndefined Nothing
    , privileged: NullOrUndefined Nothing
    , readOnlyRootFilesystem: NullOrUndefined Nothing
    , requiredDropCapabilities: NullOrUndefined Nothing
    , runAsUser: NullOrUndefined Nothing
    , seLinux: NullOrUndefined Nothing
    , supplementalGroups: NullOrUndefined Nothing
    , volumes: NullOrUndefined Nothing }

-- | DEPRECATED - This group version of ReplicaSet is deprecated by apps/v1beta2/ReplicaSet. See the release notes for more information. ReplicaSet ensures that a specified number of pod replicas are running at any given time.
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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ ReplicaSet { apiVersion, kind, metadata, spec, status }
instance encodeReplicaSet :: Encode ReplicaSet where
  encode (ReplicaSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


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
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ ReplicaSetCondition { _type, lastTransitionTime, message, reason, status }
instance encodeReplicaSetCondition :: Encode ReplicaSetCondition where
  encode (ReplicaSetCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ReplicaSetList { apiVersion, items, kind, metadata }
instance encodeReplicaSetList :: Encode ReplicaSetList where
  encode (ReplicaSetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


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
-- | - `selector`: Selector is a label query over pods that should match the replica count. If the selector is empty, it is defaulted to the labels present on the pod template. Label keys and values that must match in order to be controlled by this replica set. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
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
  decode a = do
               minReadySeconds <- readProp "minReadySeconds" a >>= decode
               replicas <- readProp "replicas" a >>= decode
               selector <- readProp "selector" a >>= decode
               template <- readProp "template" a >>= decode
               pure $ ReplicaSetSpec { minReadySeconds, replicas, selector, template }
instance encodeReplicaSetSpec :: Encode ReplicaSetSpec where
  encode (ReplicaSetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encode a.minReadySeconds)
               , Tuple "replicas" (encode a.replicas)
               , Tuple "selector" (encode a.selector)
               , Tuple "template" (encode a.template) ]


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
  decode a = do
               availableReplicas <- readProp "availableReplicas" a >>= decode
               conditions <- readProp "conditions" a >>= decode
               fullyLabeledReplicas <- readProp "fullyLabeledReplicas" a >>= decode
               observedGeneration <- readProp "observedGeneration" a >>= decode
               readyReplicas <- readProp "readyReplicas" a >>= decode
               replicas <- readProp "replicas" a >>= decode
               pure $ ReplicaSetStatus { availableReplicas, conditions, fullyLabeledReplicas, observedGeneration, readyReplicas, replicas }
instance encodeReplicaSetStatus :: Encode ReplicaSetStatus where
  encode (ReplicaSetStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "availableReplicas" (encode a.availableReplicas)
               , Tuple "conditions" (encode a.conditions)
               , Tuple "fullyLabeledReplicas" (encode a.fullyLabeledReplicas)
               , Tuple "observedGeneration" (encode a.observedGeneration)
               , Tuple "readyReplicas" (encode a.readyReplicas)
               , Tuple "replicas" (encode a.replicas) ]


instance defaultReplicaSetStatus :: Default ReplicaSetStatus where
  default = ReplicaSetStatus
    { availableReplicas: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , fullyLabeledReplicas: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , readyReplicas: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing }

-- | DEPRECATED.
-- |
-- | Fields:
-- | - `revision`: The revision to rollback to. If set to 0, rollback to the last revision.
newtype RollbackConfig = RollbackConfig
  { revision :: (NullOrUndefined Int) }

derive instance newtypeRollbackConfig :: Newtype RollbackConfig _
derive instance genericRollbackConfig :: Generic RollbackConfig _
instance showRollbackConfig :: Show RollbackConfig where show a = genericShow a
instance decodeRollbackConfig :: Decode RollbackConfig where
  decode a = do
               revision <- readProp "revision" a >>= decode
               pure $ RollbackConfig { revision }
instance encodeRollbackConfig :: Encode RollbackConfig where
  encode (RollbackConfig a) = encode $ StrMap.fromFoldable $
               [ Tuple "revision" (encode a.revision) ]


instance defaultRollbackConfig :: Default RollbackConfig where
  default = RollbackConfig
    { revision: NullOrUndefined Nothing }

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
  decode a = do
               maxUnavailable <- readProp "maxUnavailable" a >>= decode
               pure $ RollingUpdateDaemonSet { maxUnavailable }
instance encodeRollingUpdateDaemonSet :: Encode RollingUpdateDaemonSet where
  encode (RollingUpdateDaemonSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxUnavailable" (encode a.maxUnavailable) ]


instance defaultRollingUpdateDaemonSet :: Default RollingUpdateDaemonSet where
  default = RollingUpdateDaemonSet
    { maxUnavailable: NullOrUndefined Nothing }

-- | Spec to control the desired behavior of rolling update.
-- |
-- | Fields:
-- | - `maxSurge`: The maximum number of pods that can be scheduled above the desired number of pods. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). This can not be 0 if MaxUnavailable is 0. Absolute number is calculated from percentage by rounding up. By default, a value of 1 is used. Example: when this is set to 30%, the new RC can be scaled up immediately when the rolling update starts, such that the total number of old and new pods do not exceed 130% of desired pods. Once old pods have been killed, new RC can be scaled up further, ensuring that total number of pods running at any time during the update is atmost 130% of desired pods.
-- | - `maxUnavailable`: The maximum number of pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). Absolute number is calculated from percentage by rounding down. This can not be 0 if MaxSurge is 0. By default, a fixed value of 1 is used. Example: when this is set to 30%, the old RC can be scaled down to 70% of desired pods immediately when the rolling update starts. Once new pods are ready, old RC can be scaled down further, followed by scaling up the new RC, ensuring that the total number of pods available at all times during the update is at least 70% of desired pods.
newtype RollingUpdateDeployment = RollingUpdateDeployment
  { maxSurge :: (NullOrUndefined Util.IntOrString)
  , maxUnavailable :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeRollingUpdateDeployment :: Newtype RollingUpdateDeployment _
derive instance genericRollingUpdateDeployment :: Generic RollingUpdateDeployment _
instance showRollingUpdateDeployment :: Show RollingUpdateDeployment where show a = genericShow a
instance decodeRollingUpdateDeployment :: Decode RollingUpdateDeployment where
  decode a = do
               maxSurge <- readProp "maxSurge" a >>= decode
               maxUnavailable <- readProp "maxUnavailable" a >>= decode
               pure $ RollingUpdateDeployment { maxSurge, maxUnavailable }
instance encodeRollingUpdateDeployment :: Encode RollingUpdateDeployment where
  encode (RollingUpdateDeployment a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxSurge" (encode a.maxSurge)
               , Tuple "maxUnavailable" (encode a.maxUnavailable) ]


instance defaultRollingUpdateDeployment :: Default RollingUpdateDeployment where
  default = RollingUpdateDeployment
    { maxSurge: NullOrUndefined Nothing
    , maxUnavailable: NullOrUndefined Nothing }

-- | Run A sUser Strategy Options defines the strategy type and any options used to create the strategy.
-- |
-- | Fields:
-- | - `ranges`: Ranges are the allowed ranges of uids that may be used.
-- | - `rule`: Rule is the strategy that will dictate the allowable RunAsUser values that may be set.
newtype RunAsUserStrategyOptions = RunAsUserStrategyOptions
  { ranges :: (NullOrUndefined (Array IDRange))
  , rule :: (NullOrUndefined String) }

derive instance newtypeRunAsUserStrategyOptions :: Newtype RunAsUserStrategyOptions _
derive instance genericRunAsUserStrategyOptions :: Generic RunAsUserStrategyOptions _
instance showRunAsUserStrategyOptions :: Show RunAsUserStrategyOptions where show a = genericShow a
instance decodeRunAsUserStrategyOptions :: Decode RunAsUserStrategyOptions where
  decode a = do
               ranges <- readProp "ranges" a >>= decode
               rule <- readProp "rule" a >>= decode
               pure $ RunAsUserStrategyOptions { ranges, rule }
instance encodeRunAsUserStrategyOptions :: Encode RunAsUserStrategyOptions where
  encode (RunAsUserStrategyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "ranges" (encode a.ranges)
               , Tuple "rule" (encode a.rule) ]


instance defaultRunAsUserStrategyOptions :: Default RunAsUserStrategyOptions where
  default = RunAsUserStrategyOptions
    { ranges: NullOrUndefined Nothing
    , rule: NullOrUndefined Nothing }

-- | SELinux  Strategy Options defines the strategy type and any options used to create the strategy.
-- |
-- | Fields:
-- | - `rule`: type is the strategy that will dictate the allowable labels that may be set.
-- | - `seLinuxOptions`: seLinuxOptions required to run as; required for MustRunAs More info: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
newtype SELinuxStrategyOptions = SELinuxStrategyOptions
  { rule :: (NullOrUndefined String)
  , seLinuxOptions :: (NullOrUndefined CoreV1.SELinuxOptions) }

derive instance newtypeSELinuxStrategyOptions :: Newtype SELinuxStrategyOptions _
derive instance genericSELinuxStrategyOptions :: Generic SELinuxStrategyOptions _
instance showSELinuxStrategyOptions :: Show SELinuxStrategyOptions where show a = genericShow a
instance decodeSELinuxStrategyOptions :: Decode SELinuxStrategyOptions where
  decode a = do
               rule <- readProp "rule" a >>= decode
               seLinuxOptions <- readProp "seLinuxOptions" a >>= decode
               pure $ SELinuxStrategyOptions { rule, seLinuxOptions }
instance encodeSELinuxStrategyOptions :: Encode SELinuxStrategyOptions where
  encode (SELinuxStrategyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "rule" (encode a.rule)
               , Tuple "seLinuxOptions" (encode a.seLinuxOptions) ]


instance defaultSELinuxStrategyOptions :: Default SELinuxStrategyOptions where
  default = SELinuxStrategyOptions
    { rule: NullOrUndefined Nothing
    , seLinuxOptions: NullOrUndefined Nothing }

-- | represents a scaling request for a resource.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
-- | - `spec`: defines the behavior of the scale. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status.
-- | - `status`: current status of the scale. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status. Read-only.
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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ Scale { apiVersion, kind, metadata, spec, status }
instance encodeScale :: Encode Scale where
  encode (Scale a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultScale :: Default Scale where
  default = Scale
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | describes the attributes of a scale subresource
-- |
-- | Fields:
-- | - `replicas`: desired number of instances for the scaled object.
newtype ScaleSpec = ScaleSpec
  { replicas :: (NullOrUndefined Int) }

derive instance newtypeScaleSpec :: Newtype ScaleSpec _
derive instance genericScaleSpec :: Generic ScaleSpec _
instance showScaleSpec :: Show ScaleSpec where show a = genericShow a
instance decodeScaleSpec :: Decode ScaleSpec where
  decode a = do
               replicas <- readProp "replicas" a >>= decode
               pure $ ScaleSpec { replicas }
instance encodeScaleSpec :: Encode ScaleSpec where
  encode (ScaleSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "replicas" (encode a.replicas) ]


instance defaultScaleSpec :: Default ScaleSpec where
  default = ScaleSpec
    { replicas: NullOrUndefined Nothing }

-- | represents the current status of a scale subresource.
-- |
-- | Fields:
-- | - `replicas`: actual number of observed instances of the scaled object.
-- | - `selector`: label query over pods that should match the replicas count. More info: http://kubernetes.io/docs/user-guide/labels#label-selectors
-- | - `targetSelector`: label selector for pods that should match the replicas count. This is a serializated version of both map-based and more expressive set-based selectors. This is done to avoid introspection in the clients. The string will be in the same format as the query-param syntax. If the target type only supports map-based selectors, both this field and map-based selector field are populated. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
newtype ScaleStatus = ScaleStatus
  { replicas :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined (StrMap String))
  , targetSelector :: (NullOrUndefined String) }

derive instance newtypeScaleStatus :: Newtype ScaleStatus _
derive instance genericScaleStatus :: Generic ScaleStatus _
instance showScaleStatus :: Show ScaleStatus where show a = genericShow a
instance decodeScaleStatus :: Decode ScaleStatus where
  decode a = do
               replicas <- readProp "replicas" a >>= decode
               selector <- readProp "selector" a >>= decode
               targetSelector <- readProp "targetSelector" a >>= decode
               pure $ ScaleStatus { replicas, selector, targetSelector }
instance encodeScaleStatus :: Encode ScaleStatus where
  encode (ScaleStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "replicas" (encode a.replicas)
               , Tuple "selector" (encode a.selector)
               , Tuple "targetSelector" (encode a.targetSelector) ]


instance defaultScaleStatus :: Default ScaleStatus where
  default = ScaleStatus
    { replicas: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , targetSelector: NullOrUndefined Nothing }

-- | SupplementalGroupsStrategyOptions defines the strategy type and options used to create the strategy.
-- |
-- | Fields:
-- | - `ranges`: Ranges are the allowed ranges of supplemental groups.  If you would like to force a single supplemental group then supply a single range with the same start and end.
-- | - `rule`: Rule is the strategy that will dictate what supplemental groups is used in the SecurityContext.
newtype SupplementalGroupsStrategyOptions = SupplementalGroupsStrategyOptions
  { ranges :: (NullOrUndefined (Array IDRange))
  , rule :: (NullOrUndefined String) }

derive instance newtypeSupplementalGroupsStrategyOptions :: Newtype SupplementalGroupsStrategyOptions _
derive instance genericSupplementalGroupsStrategyOptions :: Generic SupplementalGroupsStrategyOptions _
instance showSupplementalGroupsStrategyOptions :: Show SupplementalGroupsStrategyOptions where show a = genericShow a
instance decodeSupplementalGroupsStrategyOptions :: Decode SupplementalGroupsStrategyOptions where
  decode a = do
               ranges <- readProp "ranges" a >>= decode
               rule <- readProp "rule" a >>= decode
               pure $ SupplementalGroupsStrategyOptions { ranges, rule }
instance encodeSupplementalGroupsStrategyOptions :: Encode SupplementalGroupsStrategyOptions where
  encode (SupplementalGroupsStrategyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "ranges" (encode a.ranges)
               , Tuple "rule" (encode a.rule) ]


instance defaultSupplementalGroupsStrategyOptions :: Default SupplementalGroupsStrategyOptions where
  default = SupplementalGroupsStrategyOptions
    { ranges: NullOrUndefined Nothing
    , rule: NullOrUndefined Nothing }

-- | CustomResourceDefinition represents a resource that should be exposed on the API server.  Its name MUST be in the format <.spec.name>.<.spec.group>.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Spec describes how the user wants the resources to appear
-- | - `status`: Status indicates the actual state of the CustomResourceDefinition
newtype CustomResourceDefinition = CustomResourceDefinition
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined CustomResourceDefinitionSpec)
  , status :: (NullOrUndefined CustomResourceDefinitionStatus) }

derive instance newtypeCustomResourceDefinition :: Newtype CustomResourceDefinition _
derive instance genericCustomResourceDefinition :: Generic CustomResourceDefinition _
instance showCustomResourceDefinition :: Show CustomResourceDefinition where show a = genericShow a
instance decodeCustomResourceDefinition :: Decode CustomResourceDefinition where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ CustomResourceDefinition { apiVersion, kind, metadata, spec, status }
instance encodeCustomResourceDefinition :: Encode CustomResourceDefinition where
  encode (CustomResourceDefinition a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultCustomResourceDefinition :: Default CustomResourceDefinition where
  default = CustomResourceDefinition
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | CustomResourceDefinitionCondition contains details for the current condition of this pod.
-- |
-- | Fields:
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: Human-readable message indicating details about last transition.
-- | - `reason`: Unique, one-word, CamelCase reason for the condition's last transition.
-- | - `status`: Status is the status of the condition. Can be True, False, Unknown.
-- | - `_type`: Type is the type of the condition.
newtype CustomResourceDefinitionCondition = CustomResourceDefinitionCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeCustomResourceDefinitionCondition :: Newtype CustomResourceDefinitionCondition _
derive instance genericCustomResourceDefinitionCondition :: Generic CustomResourceDefinitionCondition _
instance showCustomResourceDefinitionCondition :: Show CustomResourceDefinitionCondition where show a = genericShow a
instance decodeCustomResourceDefinitionCondition :: Decode CustomResourceDefinitionCondition where
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ CustomResourceDefinitionCondition { _type, lastTransitionTime, message, reason, status }
instance encodeCustomResourceDefinitionCondition :: Encode CustomResourceDefinitionCondition where
  encode (CustomResourceDefinitionCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


instance defaultCustomResourceDefinitionCondition :: Default CustomResourceDefinitionCondition where
  default = CustomResourceDefinitionCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | CustomResourceDefinitionList is a list of CustomResourceDefinition objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items individual CustomResourceDefinitions
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
newtype CustomResourceDefinitionList = CustomResourceDefinitionList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array CustomResourceDefinition))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeCustomResourceDefinitionList :: Newtype CustomResourceDefinitionList _
derive instance genericCustomResourceDefinitionList :: Generic CustomResourceDefinitionList _
instance showCustomResourceDefinitionList :: Show CustomResourceDefinitionList where show a = genericShow a
instance decodeCustomResourceDefinitionList :: Decode CustomResourceDefinitionList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ CustomResourceDefinitionList { apiVersion, items, kind, metadata }
instance encodeCustomResourceDefinitionList :: Encode CustomResourceDefinitionList where
  encode (CustomResourceDefinitionList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultCustomResourceDefinitionList :: Default CustomResourceDefinitionList where
  default = CustomResourceDefinitionList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | CustomResourceDefinitionNames indicates the names to serve this CustomResourceDefinition
-- |
-- | Fields:
-- | - `kind`: Kind is the serialized kind of the resource.  It is normally CamelCase and singular.
-- | - `listKind`: ListKind is the serialized kind of the list for this resource.  Defaults to <kind>List.
-- | - `plural`: Plural is the plural name of the resource to serve.  It must match the name of the CustomResourceDefinition-registration too: plural.group and it must be all lowercase.
-- | - `shortNames`: ShortNames are short names for the resource.  It must be all lowercase.
-- | - `singular`: Singular is the singular name of the resource.  It must be all lowercase  Defaults to lowercased <kind>
newtype CustomResourceDefinitionNames = CustomResourceDefinitionNames
  { kind :: (NullOrUndefined String)
  , listKind :: (NullOrUndefined String)
  , plural :: (NullOrUndefined String)
  , shortNames :: (NullOrUndefined (Array String))
  , singular :: (NullOrUndefined String) }

derive instance newtypeCustomResourceDefinitionNames :: Newtype CustomResourceDefinitionNames _
derive instance genericCustomResourceDefinitionNames :: Generic CustomResourceDefinitionNames _
instance showCustomResourceDefinitionNames :: Show CustomResourceDefinitionNames where show a = genericShow a
instance decodeCustomResourceDefinitionNames :: Decode CustomResourceDefinitionNames where
  decode a = do
               kind <- readProp "kind" a >>= decode
               listKind <- readProp "listKind" a >>= decode
               plural <- readProp "plural" a >>= decode
               shortNames <- readProp "shortNames" a >>= decode
               singular <- readProp "singular" a >>= decode
               pure $ CustomResourceDefinitionNames { kind, listKind, plural, shortNames, singular }
instance encodeCustomResourceDefinitionNames :: Encode CustomResourceDefinitionNames where
  encode (CustomResourceDefinitionNames a) = encode $ StrMap.fromFoldable $
               [ Tuple "kind" (encode a.kind)
               , Tuple "listKind" (encode a.listKind)
               , Tuple "plural" (encode a.plural)
               , Tuple "shortNames" (encode a.shortNames)
               , Tuple "singular" (encode a.singular) ]


instance defaultCustomResourceDefinitionNames :: Default CustomResourceDefinitionNames where
  default = CustomResourceDefinitionNames
    { kind: NullOrUndefined Nothing
    , listKind: NullOrUndefined Nothing
    , plural: NullOrUndefined Nothing
    , shortNames: NullOrUndefined Nothing
    , singular: NullOrUndefined Nothing }

-- | CustomResourceDefinitionSpec describes how a user wants their resource to appear
-- |
-- | Fields:
-- | - `group`: Group is the group this resource belongs in
-- | - `names`: Names are the names used to describe this custom resource
-- | - `scope`: Scope indicates whether this resource is cluster or namespace scoped.  Default is namespaced
-- | - `validation`: Validation describes the validation methods for CustomResources
-- | - `version`: Version is the version this resource belongs in
newtype CustomResourceDefinitionSpec = CustomResourceDefinitionSpec
  { group :: (NullOrUndefined String)
  , names :: (NullOrUndefined CustomResourceDefinitionNames)
  , scope :: (NullOrUndefined String)
  , validation :: (NullOrUndefined CustomResourceValidation)
  , version :: (NullOrUndefined String) }

derive instance newtypeCustomResourceDefinitionSpec :: Newtype CustomResourceDefinitionSpec _
derive instance genericCustomResourceDefinitionSpec :: Generic CustomResourceDefinitionSpec _
instance showCustomResourceDefinitionSpec :: Show CustomResourceDefinitionSpec where show a = genericShow a
instance decodeCustomResourceDefinitionSpec :: Decode CustomResourceDefinitionSpec where
  decode a = do
               group <- readProp "group" a >>= decode
               names <- readProp "names" a >>= decode
               scope <- readProp "scope" a >>= decode
               validation <- readProp "validation" a >>= decode
               version <- readProp "version" a >>= decode
               pure $ CustomResourceDefinitionSpec { group, names, scope, validation, version }
instance encodeCustomResourceDefinitionSpec :: Encode CustomResourceDefinitionSpec where
  encode (CustomResourceDefinitionSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "group" (encode a.group)
               , Tuple "names" (encode a.names)
               , Tuple "scope" (encode a.scope)
               , Tuple "validation" (encode a.validation)
               , Tuple "version" (encode a.version) ]


instance defaultCustomResourceDefinitionSpec :: Default CustomResourceDefinitionSpec where
  default = CustomResourceDefinitionSpec
    { group: NullOrUndefined Nothing
    , names: NullOrUndefined Nothing
    , scope: NullOrUndefined Nothing
    , validation: NullOrUndefined Nothing
    , version: NullOrUndefined Nothing }

-- | CustomResourceDefinitionStatus indicates the state of the CustomResourceDefinition
-- |
-- | Fields:
-- | - `acceptedNames`: AcceptedNames are the names that are actually being used to serve discovery They may be different than the names in spec.
-- | - `conditions`: Conditions indicate state for particular aspects of a CustomResourceDefinition
newtype CustomResourceDefinitionStatus = CustomResourceDefinitionStatus
  { acceptedNames :: (NullOrUndefined CustomResourceDefinitionNames)
  , conditions :: (NullOrUndefined (Array CustomResourceDefinitionCondition)) }

derive instance newtypeCustomResourceDefinitionStatus :: Newtype CustomResourceDefinitionStatus _
derive instance genericCustomResourceDefinitionStatus :: Generic CustomResourceDefinitionStatus _
instance showCustomResourceDefinitionStatus :: Show CustomResourceDefinitionStatus where show a = genericShow a
instance decodeCustomResourceDefinitionStatus :: Decode CustomResourceDefinitionStatus where
  decode a = do
               acceptedNames <- readProp "acceptedNames" a >>= decode
               conditions <- readProp "conditions" a >>= decode
               pure $ CustomResourceDefinitionStatus { acceptedNames, conditions }
instance encodeCustomResourceDefinitionStatus :: Encode CustomResourceDefinitionStatus where
  encode (CustomResourceDefinitionStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "acceptedNames" (encode a.acceptedNames)
               , Tuple "conditions" (encode a.conditions) ]


instance defaultCustomResourceDefinitionStatus :: Default CustomResourceDefinitionStatus where
  default = CustomResourceDefinitionStatus
    { acceptedNames: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing }

-- | CustomResourceValidation is a list of validation methods for CustomResources.
-- |
-- | Fields:
-- | - `openAPIV3Schema`: OpenAPIV3Schema is the OpenAPI v3 schema to be validated against.
newtype CustomResourceValidation = CustomResourceValidation
  { openAPIV3Schema :: (NullOrUndefined JSONSchemaProps) }

derive instance newtypeCustomResourceValidation :: Newtype CustomResourceValidation _
derive instance genericCustomResourceValidation :: Generic CustomResourceValidation _
instance showCustomResourceValidation :: Show CustomResourceValidation where show a = genericShow a
instance decodeCustomResourceValidation :: Decode CustomResourceValidation where
  decode a = do
               openAPIV3Schema <- readProp "openAPIV3Schema" a >>= decode
               pure $ CustomResourceValidation { openAPIV3Schema }
instance encodeCustomResourceValidation :: Encode CustomResourceValidation where
  encode (CustomResourceValidation a) = encode $ StrMap.fromFoldable $
               [ Tuple "openAPIV3Schema" (encode a.openAPIV3Schema) ]


instance defaultCustomResourceValidation :: Default CustomResourceValidation where
  default = CustomResourceValidation
    { openAPIV3Schema: NullOrUndefined Nothing }

-- | ExternalDocumentation allows referencing an external resource for extended documentation.
-- |
-- | Fields:
-- | - `description`
-- | - `url`
newtype ExternalDocumentation = ExternalDocumentation
  { description :: (NullOrUndefined String)
  , url :: (NullOrUndefined String) }

derive instance newtypeExternalDocumentation :: Newtype ExternalDocumentation _
derive instance genericExternalDocumentation :: Generic ExternalDocumentation _
instance showExternalDocumentation :: Show ExternalDocumentation where show a = genericShow a
instance decodeExternalDocumentation :: Decode ExternalDocumentation where
  decode a = do
               description <- readProp "description" a >>= decode
               url <- readProp "url" a >>= decode
               pure $ ExternalDocumentation { description, url }
instance encodeExternalDocumentation :: Encode ExternalDocumentation where
  encode (ExternalDocumentation a) = encode $ StrMap.fromFoldable $
               [ Tuple "description" (encode a.description)
               , Tuple "url" (encode a.url) ]


instance defaultExternalDocumentation :: Default ExternalDocumentation where
  default = ExternalDocumentation
    { description: NullOrUndefined Nothing
    , url: NullOrUndefined Nothing }

-- | JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil.
-- |
-- | Fields:
-- | - `_Raw`
newtype JSON = JSON
  { _Raw :: (NullOrUndefined String) }

derive instance newtypeJSON :: Newtype JSON _
derive instance genericJSON :: Generic JSON _
instance showJSON :: Show JSON where show a = genericShow a
instance decodeJSON :: Decode JSON where
  decode a = do
               _Raw <- readProp "_Raw" a >>= decode
               pure $ JSON { _Raw }
instance encodeJSON :: Encode JSON where
  encode (JSON a) = encode $ StrMap.fromFoldable $
               [ Tuple "_Raw" (encode a._Raw) ]


instance defaultJSON :: Default JSON where
  default = JSON
    { _Raw: NullOrUndefined Nothing }

-- | JSONSchemaProps is a JSON-Schema following Specification Draft 4 (http://json-schema.org/).
-- |
-- | Fields:
-- | - `_ref`
-- | - `_schema`
-- | - `additionalItems`
-- | - `additionalProperties`
-- | - `allOf`
-- | - `anyOf`
-- | - `_default`
-- | - `definitions`
-- | - `dependencies`
-- | - `description`
-- | - `enum`
-- | - `example`
-- | - `exclusiveMaximum`
-- | - `exclusiveMinimum`
-- | - `externalDocs`
-- | - `format`
-- | - `id`
-- | - `items`
-- | - `maxItems`
-- | - `maxLength`
-- | - `maxProperties`
-- | - `maximum`
-- | - `minItems`
-- | - `minLength`
-- | - `minProperties`
-- | - `minimum`
-- | - `multipleOf`
-- | - `not`
-- | - `oneOf`
-- | - `pattern`
-- | - `patternProperties`
-- | - `properties`
-- | - `required`
-- | - `title`
-- | - `_type`
-- | - `uniqueItems`
newtype JSONSchemaProps = JSONSchemaProps
  { _default :: (NullOrUndefined JSON)
  , _ref :: (NullOrUndefined String)
  , _schema :: (NullOrUndefined String)
  , _type :: (NullOrUndefined String)
  , additionalItems :: (NullOrUndefined JSONSchemaPropsOrBool)
  , additionalProperties :: (NullOrUndefined JSONSchemaPropsOrBool)
  , allOf :: (NullOrUndefined (Array JSONSchemaProps))
  , anyOf :: (NullOrUndefined (Array JSONSchemaProps))
  , definitions :: (NullOrUndefined (StrMap JSONSchemaProps))
  , dependencies :: (NullOrUndefined (StrMap JSONSchemaPropsOrStringArray))
  , description :: (NullOrUndefined String)
  , enum :: (NullOrUndefined (Array JSON))
  , example :: (NullOrUndefined JSON)
  , exclusiveMaximum :: (NullOrUndefined Boolean)
  , exclusiveMinimum :: (NullOrUndefined Boolean)
  , externalDocs :: (NullOrUndefined ExternalDocumentation)
  , format :: (NullOrUndefined String)
  , id :: (NullOrUndefined String)
  , items :: (NullOrUndefined JSONSchemaPropsOrArray)
  , maxItems :: (NullOrUndefined Int)
  , maxLength :: (NullOrUndefined Int)
  , maxProperties :: (NullOrUndefined Int)
  , maximum :: (NullOrUndefined Number)
  , minItems :: (NullOrUndefined Int)
  , minLength :: (NullOrUndefined Int)
  , minProperties :: (NullOrUndefined Int)
  , minimum :: (NullOrUndefined Number)
  , multipleOf :: (NullOrUndefined Number)
  , not :: (NullOrUndefined JSONSchemaProps)
  , oneOf :: (NullOrUndefined (Array JSONSchemaProps))
  , pattern :: (NullOrUndefined String)
  , patternProperties :: (NullOrUndefined (StrMap JSONSchemaProps))
  , properties :: (NullOrUndefined (StrMap JSONSchemaProps))
  , required :: (NullOrUndefined (Array String))
  , title :: (NullOrUndefined String)
  , uniqueItems :: (NullOrUndefined Boolean) }

derive instance newtypeJSONSchemaProps :: Newtype JSONSchemaProps _
derive instance genericJSONSchemaProps :: Generic JSONSchemaProps _
instance showJSONSchemaProps :: Show JSONSchemaProps where show a = genericShow a
instance decodeJSONSchemaProps :: Decode JSONSchemaProps where
  decode a = do
               _default <- readProp "_default" a >>= decode
               _ref <- readProp "_ref" a >>= decode
               _schema <- readProp "_schema" a >>= decode
               _type <- readProp "_type" a >>= decode
               additionalItems <- readProp "additionalItems" a >>= decode
               additionalProperties <- readProp "additionalProperties" a >>= decode
               allOf <- readProp "allOf" a >>= decode
               anyOf <- readProp "anyOf" a >>= decode
               definitions <- readProp "definitions" a >>= decode
               dependencies <- readProp "dependencies" a >>= decode
               description <- readProp "description" a >>= decode
               enum <- readProp "enum" a >>= decode
               example <- readProp "example" a >>= decode
               exclusiveMaximum <- readProp "exclusiveMaximum" a >>= decode
               exclusiveMinimum <- readProp "exclusiveMinimum" a >>= decode
               externalDocs <- readProp "externalDocs" a >>= decode
               format <- readProp "format" a >>= decode
               id <- readProp "id" a >>= decode
               items <- readProp "items" a >>= decode
               maxItems <- readProp "maxItems" a >>= decode
               maxLength <- readProp "maxLength" a >>= decode
               maxProperties <- readProp "maxProperties" a >>= decode
               maximum <- readProp "maximum" a >>= decode
               minItems <- readProp "minItems" a >>= decode
               minLength <- readProp "minLength" a >>= decode
               minProperties <- readProp "minProperties" a >>= decode
               minimum <- readProp "minimum" a >>= decode
               multipleOf <- readProp "multipleOf" a >>= decode
               not <- readProp "not" a >>= decode
               oneOf <- readProp "oneOf" a >>= decode
               pattern <- readProp "pattern" a >>= decode
               patternProperties <- readProp "patternProperties" a >>= decode
               properties <- readProp "properties" a >>= decode
               required <- readProp "required" a >>= decode
               title <- readProp "title" a >>= decode
               uniqueItems <- readProp "uniqueItems" a >>= decode
               pure $ JSONSchemaProps { _default, _ref, _schema, _type, additionalItems, additionalProperties, allOf, anyOf, definitions, dependencies, description, enum, example, exclusiveMaximum, exclusiveMinimum, externalDocs, format, id, items, maxItems, maxLength, maxProperties, maximum, minItems, minLength, minProperties, minimum, multipleOf, not, oneOf, pattern, patternProperties, properties, required, title, uniqueItems }
instance encodeJSONSchemaProps :: Encode JSONSchemaProps where
  encode (JSONSchemaProps a) = encode $ StrMap.fromFoldable $
               [ Tuple "_default" (encode a._default)
               , Tuple "_ref" (encode a._ref)
               , Tuple "_schema" (encode a._schema)
               , Tuple "_type" (encode a._type)
               , Tuple "additionalItems" (encode a.additionalItems)
               , Tuple "additionalProperties" (encode a.additionalProperties)
               , Tuple "allOf" (encode a.allOf)
               , Tuple "anyOf" (encode a.anyOf)
               , Tuple "definitions" (encode a.definitions)
               , Tuple "dependencies" (encode a.dependencies)
               , Tuple "description" (encode a.description)
               , Tuple "enum" (encode a.enum)
               , Tuple "example" (encode a.example)
               , Tuple "exclusiveMaximum" (encode a.exclusiveMaximum)
               , Tuple "exclusiveMinimum" (encode a.exclusiveMinimum)
               , Tuple "externalDocs" (encode a.externalDocs)
               , Tuple "format" (encode a.format)
               , Tuple "id" (encode a.id)
               , Tuple "items" (encode a.items)
               , Tuple "maxItems" (encode a.maxItems)
               , Tuple "maxLength" (encode a.maxLength)
               , Tuple "maxProperties" (encode a.maxProperties)
               , Tuple "maximum" (encode a.maximum)
               , Tuple "minItems" (encode a.minItems)
               , Tuple "minLength" (encode a.minLength)
               , Tuple "minProperties" (encode a.minProperties)
               , Tuple "minimum" (encode a.minimum)
               , Tuple "multipleOf" (encode a.multipleOf)
               , Tuple "not" (encode a.not)
               , Tuple "oneOf" (encode a.oneOf)
               , Tuple "pattern" (encode a.pattern)
               , Tuple "patternProperties" (encode a.patternProperties)
               , Tuple "properties" (encode a.properties)
               , Tuple "required" (encode a.required)
               , Tuple "title" (encode a.title)
               , Tuple "uniqueItems" (encode a.uniqueItems) ]


instance defaultJSONSchemaProps :: Default JSONSchemaProps where
  default = JSONSchemaProps
    { _default: NullOrUndefined Nothing
    , _ref: NullOrUndefined Nothing
    , _schema: NullOrUndefined Nothing
    , _type: NullOrUndefined Nothing
    , additionalItems: NullOrUndefined Nothing
    , additionalProperties: NullOrUndefined Nothing
    , allOf: NullOrUndefined Nothing
    , anyOf: NullOrUndefined Nothing
    , definitions: NullOrUndefined Nothing
    , dependencies: NullOrUndefined Nothing
    , description: NullOrUndefined Nothing
    , enum: NullOrUndefined Nothing
    , example: NullOrUndefined Nothing
    , exclusiveMaximum: NullOrUndefined Nothing
    , exclusiveMinimum: NullOrUndefined Nothing
    , externalDocs: NullOrUndefined Nothing
    , format: NullOrUndefined Nothing
    , id: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , maxItems: NullOrUndefined Nothing
    , maxLength: NullOrUndefined Nothing
    , maxProperties: NullOrUndefined Nothing
    , maximum: NullOrUndefined Nothing
    , minItems: NullOrUndefined Nothing
    , minLength: NullOrUndefined Nothing
    , minProperties: NullOrUndefined Nothing
    , minimum: NullOrUndefined Nothing
    , multipleOf: NullOrUndefined Nothing
    , not: NullOrUndefined Nothing
    , oneOf: NullOrUndefined Nothing
    , pattern: NullOrUndefined Nothing
    , patternProperties: NullOrUndefined Nothing
    , properties: NullOrUndefined Nothing
    , required: NullOrUndefined Nothing
    , title: NullOrUndefined Nothing
    , uniqueItems: NullOrUndefined Nothing }

-- | JSONSchemaPropsOrArray represents a value that can either be a JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization purposes.
-- |
-- | Fields:
-- | - `_JSONSchemas`
-- | - `_Schema`
newtype JSONSchemaPropsOrArray = JSONSchemaPropsOrArray
  { _JSONSchemas :: (NullOrUndefined (Array JSONSchemaProps))
  , _Schema :: (NullOrUndefined JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrArray :: Newtype JSONSchemaPropsOrArray _
derive instance genericJSONSchemaPropsOrArray :: Generic JSONSchemaPropsOrArray _
instance showJSONSchemaPropsOrArray :: Show JSONSchemaPropsOrArray where show a = genericShow a
instance decodeJSONSchemaPropsOrArray :: Decode JSONSchemaPropsOrArray where
  decode a = do
               _JSONSchemas <- readProp "_JSONSchemas" a >>= decode
               _Schema <- readProp "_Schema" a >>= decode
               pure $ JSONSchemaPropsOrArray { _JSONSchemas, _Schema }
instance encodeJSONSchemaPropsOrArray :: Encode JSONSchemaPropsOrArray where
  encode (JSONSchemaPropsOrArray a) = encode $ StrMap.fromFoldable $
               [ Tuple "_JSONSchemas" (encode a._JSONSchemas)
               , Tuple "_Schema" (encode a._Schema) ]


instance defaultJSONSchemaPropsOrArray :: Default JSONSchemaPropsOrArray where
  default = JSONSchemaPropsOrArray
    { _JSONSchemas: NullOrUndefined Nothing
    , _Schema: NullOrUndefined Nothing }

-- | JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property.
-- |
-- | Fields:
-- | - `_Allows`
-- | - `_Schema`
newtype JSONSchemaPropsOrBool = JSONSchemaPropsOrBool
  { _Allows :: (NullOrUndefined Boolean)
  , _Schema :: (NullOrUndefined JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrBool :: Newtype JSONSchemaPropsOrBool _
derive instance genericJSONSchemaPropsOrBool :: Generic JSONSchemaPropsOrBool _
instance showJSONSchemaPropsOrBool :: Show JSONSchemaPropsOrBool where show a = genericShow a
instance decodeJSONSchemaPropsOrBool :: Decode JSONSchemaPropsOrBool where
  decode a = do
               _Allows <- readProp "_Allows" a >>= decode
               _Schema <- readProp "_Schema" a >>= decode
               pure $ JSONSchemaPropsOrBool { _Allows, _Schema }
instance encodeJSONSchemaPropsOrBool :: Encode JSONSchemaPropsOrBool where
  encode (JSONSchemaPropsOrBool a) = encode $ StrMap.fromFoldable $
               [ Tuple "_Allows" (encode a._Allows)
               , Tuple "_Schema" (encode a._Schema) ]


instance defaultJSONSchemaPropsOrBool :: Default JSONSchemaPropsOrBool where
  default = JSONSchemaPropsOrBool
    { _Allows: NullOrUndefined Nothing
    , _Schema: NullOrUndefined Nothing }

-- | JSONSchemaPropsOrStringArray represents a JSONSchemaProps or a string array.
-- |
-- | Fields:
-- | - `_Property`
-- | - `_Schema`
newtype JSONSchemaPropsOrStringArray = JSONSchemaPropsOrStringArray
  { _Property :: (NullOrUndefined (Array String))
  , _Schema :: (NullOrUndefined JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrStringArray :: Newtype JSONSchemaPropsOrStringArray _
derive instance genericJSONSchemaPropsOrStringArray :: Generic JSONSchemaPropsOrStringArray _
instance showJSONSchemaPropsOrStringArray :: Show JSONSchemaPropsOrStringArray where show a = genericShow a
instance decodeJSONSchemaPropsOrStringArray :: Decode JSONSchemaPropsOrStringArray where
  decode a = do
               _Property <- readProp "_Property" a >>= decode
               _Schema <- readProp "_Schema" a >>= decode
               pure $ JSONSchemaPropsOrStringArray { _Property, _Schema }
instance encodeJSONSchemaPropsOrStringArray :: Encode JSONSchemaPropsOrStringArray where
  encode (JSONSchemaPropsOrStringArray a) = encode $ StrMap.fromFoldable $
               [ Tuple "_Property" (encode a._Property)
               , Tuple "_Schema" (encode a._Schema) ]


instance defaultJSONSchemaPropsOrStringArray :: Default JSONSchemaPropsOrStringArray where
  default = JSONSchemaPropsOrStringArray
    { _Property: NullOrUndefined Nothing
    , _Schema: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/"