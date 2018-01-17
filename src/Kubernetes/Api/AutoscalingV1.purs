module Kubernetes.Api.AutoscalingV1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | CrossVersionObjectReference contains enough information to let you identify the referred resource.
-- |
-- | Fields:
-- | - `apiVersion`: API version of the referent
-- | - `kind`: Kind of the referent; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds"
-- | - `name`: Name of the referent; More info: http://kubernetes.io/docs/user-guide/identifiers#names
newtype CrossVersionObjectReference = CrossVersionObjectReference
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String) }

derive instance newtypeCrossVersionObjectReference :: Newtype CrossVersionObjectReference _
derive instance genericCrossVersionObjectReference :: Generic CrossVersionObjectReference _
instance showCrossVersionObjectReference :: Show CrossVersionObjectReference where show a = genericShow a
instance decodeCrossVersionObjectReference :: Decode CrossVersionObjectReference where
  decode a = genericDecode jsonOptions a 
instance encodeCrossVersionObjectReference :: Encode CrossVersionObjectReference where
  encode a = genericEncode jsonOptions a

instance defaultCrossVersionObjectReference :: Default CrossVersionObjectReference where
  default = CrossVersionObjectReference
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | configuration of a horizontal pod autoscaler.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: behaviour of autoscaler. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status.
-- | - `status`: current information about the autoscaler.
newtype HorizontalPodAutoscaler = HorizontalPodAutoscaler
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined HorizontalPodAutoscalerSpec)
  , status :: (NullOrUndefined HorizontalPodAutoscalerStatus) }

derive instance newtypeHorizontalPodAutoscaler :: Newtype HorizontalPodAutoscaler _
derive instance genericHorizontalPodAutoscaler :: Generic HorizontalPodAutoscaler _
instance showHorizontalPodAutoscaler :: Show HorizontalPodAutoscaler where show a = genericShow a
instance decodeHorizontalPodAutoscaler :: Decode HorizontalPodAutoscaler where
  decode a = genericDecode jsonOptions a 
instance encodeHorizontalPodAutoscaler :: Encode HorizontalPodAutoscaler where
  encode a = genericEncode jsonOptions a

instance defaultHorizontalPodAutoscaler :: Default HorizontalPodAutoscaler where
  default = HorizontalPodAutoscaler
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | list of horizontal pod autoscaler objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: list of horizontal pod autoscaler objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata.
newtype HorizontalPodAutoscalerList = HorizontalPodAutoscalerList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array HorizontalPodAutoscaler))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeHorizontalPodAutoscalerList :: Newtype HorizontalPodAutoscalerList _
derive instance genericHorizontalPodAutoscalerList :: Generic HorizontalPodAutoscalerList _
instance showHorizontalPodAutoscalerList :: Show HorizontalPodAutoscalerList where show a = genericShow a
instance decodeHorizontalPodAutoscalerList :: Decode HorizontalPodAutoscalerList where
  decode a = genericDecode jsonOptions a 
instance encodeHorizontalPodAutoscalerList :: Encode HorizontalPodAutoscalerList where
  encode a = genericEncode jsonOptions a

instance defaultHorizontalPodAutoscalerList :: Default HorizontalPodAutoscalerList where
  default = HorizontalPodAutoscalerList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | specification of a horizontal pod autoscaler.
-- |
-- | Fields:
-- | - `maxReplicas`: upper limit for the number of pods that can be set by the autoscaler; cannot be smaller than MinReplicas.
-- | - `minReplicas`: lower limit for the number of pods that can be set by the autoscaler, default 1.
-- | - `scaleTargetRef`: reference to scaled resource; horizontal pod autoscaler will learn the current resource consumption and will set the desired number of pods by using its Scale subresource.
-- | - `targetCPUUtilizationPercentage`: target average CPU utilization (represented as a percentage of requested CPU) over all the pods; if not specified the default autoscaling policy will be used.
newtype HorizontalPodAutoscalerSpec = HorizontalPodAutoscalerSpec
  { maxReplicas :: (NullOrUndefined Int)
  , minReplicas :: (NullOrUndefined Int)
  , scaleTargetRef :: (NullOrUndefined CrossVersionObjectReference)
  , targetCPUUtilizationPercentage :: (NullOrUndefined Int) }

derive instance newtypeHorizontalPodAutoscalerSpec :: Newtype HorizontalPodAutoscalerSpec _
derive instance genericHorizontalPodAutoscalerSpec :: Generic HorizontalPodAutoscalerSpec _
instance showHorizontalPodAutoscalerSpec :: Show HorizontalPodAutoscalerSpec where show a = genericShow a
instance decodeHorizontalPodAutoscalerSpec :: Decode HorizontalPodAutoscalerSpec where
  decode a = genericDecode jsonOptions a 
instance encodeHorizontalPodAutoscalerSpec :: Encode HorizontalPodAutoscalerSpec where
  encode a = genericEncode jsonOptions a

instance defaultHorizontalPodAutoscalerSpec :: Default HorizontalPodAutoscalerSpec where
  default = HorizontalPodAutoscalerSpec
    { maxReplicas: NullOrUndefined Nothing
    , minReplicas: NullOrUndefined Nothing
    , scaleTargetRef: NullOrUndefined Nothing
    , targetCPUUtilizationPercentage: NullOrUndefined Nothing }

-- | current status of a horizontal pod autoscaler
-- |
-- | Fields:
-- | - `currentCPUUtilizationPercentage`: current average CPU utilization over all pods, represented as a percentage of requested CPU, e.g. 70 means that an average pod is using now 70% of its requested CPU.
-- | - `currentReplicas`: current number of replicas of pods managed by this autoscaler.
-- | - `desiredReplicas`: desired number of replicas of pods managed by this autoscaler.
-- | - `lastScaleTime`: last time the HorizontalPodAutoscaler scaled the number of pods; used by the autoscaler to control how often the number of pods is changed.
-- | - `observedGeneration`: most recent generation observed by this autoscaler.
newtype HorizontalPodAutoscalerStatus = HorizontalPodAutoscalerStatus
  { currentCPUUtilizationPercentage :: (NullOrUndefined Int)
  , currentReplicas :: (NullOrUndefined Int)
  , desiredReplicas :: (NullOrUndefined Int)
  , lastScaleTime :: (NullOrUndefined MetaV1.Time)
  , observedGeneration :: (NullOrUndefined Int) }

derive instance newtypeHorizontalPodAutoscalerStatus :: Newtype HorizontalPodAutoscalerStatus _
derive instance genericHorizontalPodAutoscalerStatus :: Generic HorizontalPodAutoscalerStatus _
instance showHorizontalPodAutoscalerStatus :: Show HorizontalPodAutoscalerStatus where show a = genericShow a
instance decodeHorizontalPodAutoscalerStatus :: Decode HorizontalPodAutoscalerStatus where
  decode a = genericDecode jsonOptions a 
instance encodeHorizontalPodAutoscalerStatus :: Encode HorizontalPodAutoscalerStatus where
  encode a = genericEncode jsonOptions a

instance defaultHorizontalPodAutoscalerStatus :: Default HorizontalPodAutoscalerStatus where
  default = HorizontalPodAutoscalerStatus
    { currentCPUUtilizationPercentage: NullOrUndefined Nothing
    , currentReplicas: NullOrUndefined Nothing
    , desiredReplicas: NullOrUndefined Nothing
    , lastScaleTime: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing }

-- | Scale represents a scaling request for a resource.
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

-- | ScaleSpec describes the attributes of a scale subresource.
-- |
-- | Fields:
-- | - `replicas`: desired number of instances for the scaled object.
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

-- | ScaleStatus represents the current status of a scale subresource.
-- |
-- | Fields:
-- | - `replicas`: actual number of observed instances of the scaled object.
-- | - `selector`: label query over pods that should match the replicas count. This is same as the label selector but in the string format to avoid introspection by clients. The string will be in the same format as the query-param syntax. More info about label selectors: http://kubernetes.io/docs/user-guide/labels#label-selectors
newtype ScaleStatus = ScaleStatus
  { replicas :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined String) }

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
    , selector: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v1/"