module Kubernetes.Api.AutoscalingV2Beta1 where

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
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.Resource as Resource
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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               name <- readProp "name" a >>= decode
               pure $ CrossVersionObjectReference { apiVersion, kind, name }
instance encodeCrossVersionObjectReference :: Encode CrossVersionObjectReference where
  encode (CrossVersionObjectReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "name" (encode a.name) ]


instance defaultCrossVersionObjectReference :: Default CrossVersionObjectReference where
  default = CrossVersionObjectReference
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | HorizontalPodAutoscaler is the configuration for a horizontal pod autoscaler, which automatically manages the replica count of any resource implementing the scale subresource based on the metrics specified.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: spec is the specification for the behaviour of the autoscaler. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status.
-- | - `status`: status is the current information about the autoscaler.
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
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ HorizontalPodAutoscaler { apiVersion, kind, metadata, spec, status }
instance encodeHorizontalPodAutoscaler :: Encode HorizontalPodAutoscaler where
  encode (HorizontalPodAutoscaler a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultHorizontalPodAutoscaler :: Default HorizontalPodAutoscaler where
  default = HorizontalPodAutoscaler
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | HorizontalPodAutoscalerCondition describes the state of a HorizontalPodAutoscaler at a certain point.
-- |
-- | Fields:
-- | - `lastTransitionTime`: lastTransitionTime is the last time the condition transitioned from one status to another
-- | - `message`: message is a human-readable explanation containing details about the transition
-- | - `reason`: reason is the reason for the condition's last transition.
-- | - `status`: status is the status of the condition (True, False, Unknown)
-- | - `_type`: type describes the current condition
newtype HorizontalPodAutoscalerCondition = HorizontalPodAutoscalerCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeHorizontalPodAutoscalerCondition :: Newtype HorizontalPodAutoscalerCondition _
derive instance genericHorizontalPodAutoscalerCondition :: Generic HorizontalPodAutoscalerCondition _
instance showHorizontalPodAutoscalerCondition :: Show HorizontalPodAutoscalerCondition where show a = genericShow a
instance decodeHorizontalPodAutoscalerCondition :: Decode HorizontalPodAutoscalerCondition where
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ HorizontalPodAutoscalerCondition { _type, lastTransitionTime, message, reason, status }
instance encodeHorizontalPodAutoscalerCondition :: Encode HorizontalPodAutoscalerCondition where
  encode (HorizontalPodAutoscalerCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


instance defaultHorizontalPodAutoscalerCondition :: Default HorizontalPodAutoscalerCondition where
  default = HorizontalPodAutoscalerCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | HorizontalPodAutoscaler is a list of horizontal pod autoscaler objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: items is the list of horizontal pod autoscaler objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: metadata is the standard list metadata.
newtype HorizontalPodAutoscalerList = HorizontalPodAutoscalerList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array HorizontalPodAutoscaler))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeHorizontalPodAutoscalerList :: Newtype HorizontalPodAutoscalerList _
derive instance genericHorizontalPodAutoscalerList :: Generic HorizontalPodAutoscalerList _
instance showHorizontalPodAutoscalerList :: Show HorizontalPodAutoscalerList where show a = genericShow a
instance decodeHorizontalPodAutoscalerList :: Decode HorizontalPodAutoscalerList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ HorizontalPodAutoscalerList { apiVersion, items, kind, metadata }
instance encodeHorizontalPodAutoscalerList :: Encode HorizontalPodAutoscalerList where
  encode (HorizontalPodAutoscalerList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultHorizontalPodAutoscalerList :: Default HorizontalPodAutoscalerList where
  default = HorizontalPodAutoscalerList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | HorizontalPodAutoscalerSpec describes the desired functionality of the HorizontalPodAutoscaler.
-- |
-- | Fields:
-- | - `maxReplicas`: maxReplicas is the upper limit for the number of replicas to which the autoscaler can scale up. It cannot be less that minReplicas.
-- | - `metrics`: metrics contains the specifications for which to use to calculate the desired replica count (the maximum replica count across all metrics will be used).  The desired replica count is calculated multiplying the ratio between the target value and the current value by the current number of pods.  Ergo, metrics used must decrease as the pod count is increased, and vice-versa.  See the individual metric source types for more information about how each type of metric must respond.
-- | - `minReplicas`: minReplicas is the lower limit for the number of replicas to which the autoscaler can scale down. It defaults to 1 pod.
-- | - `scaleTargetRef`: scaleTargetRef points to the target resource to scale, and is used to the pods for which metrics should be collected, as well as to actually change the replica count.
newtype HorizontalPodAutoscalerSpec = HorizontalPodAutoscalerSpec
  { maxReplicas :: (NullOrUndefined Int)
  , metrics :: (NullOrUndefined (Array MetricSpec))
  , minReplicas :: (NullOrUndefined Int)
  , scaleTargetRef :: (NullOrUndefined CrossVersionObjectReference) }

derive instance newtypeHorizontalPodAutoscalerSpec :: Newtype HorizontalPodAutoscalerSpec _
derive instance genericHorizontalPodAutoscalerSpec :: Generic HorizontalPodAutoscalerSpec _
instance showHorizontalPodAutoscalerSpec :: Show HorizontalPodAutoscalerSpec where show a = genericShow a
instance decodeHorizontalPodAutoscalerSpec :: Decode HorizontalPodAutoscalerSpec where
  decode a = do
               maxReplicas <- readProp "maxReplicas" a >>= decode
               metrics <- readProp "metrics" a >>= decode
               minReplicas <- readProp "minReplicas" a >>= decode
               scaleTargetRef <- readProp "scaleTargetRef" a >>= decode
               pure $ HorizontalPodAutoscalerSpec { maxReplicas, metrics, minReplicas, scaleTargetRef }
instance encodeHorizontalPodAutoscalerSpec :: Encode HorizontalPodAutoscalerSpec where
  encode (HorizontalPodAutoscalerSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxReplicas" (encode a.maxReplicas)
               , Tuple "metrics" (encode a.metrics)
               , Tuple "minReplicas" (encode a.minReplicas)
               , Tuple "scaleTargetRef" (encode a.scaleTargetRef) ]


instance defaultHorizontalPodAutoscalerSpec :: Default HorizontalPodAutoscalerSpec where
  default = HorizontalPodAutoscalerSpec
    { maxReplicas: NullOrUndefined Nothing
    , metrics: NullOrUndefined Nothing
    , minReplicas: NullOrUndefined Nothing
    , scaleTargetRef: NullOrUndefined Nothing }

-- | HorizontalPodAutoscalerStatus describes the current status of a horizontal pod autoscaler.
-- |
-- | Fields:
-- | - `conditions`: conditions is the set of conditions required for this autoscaler to scale its target, and indicates whether or not those conditions are met.
-- | - `currentMetrics`: currentMetrics is the last read state of the metrics used by this autoscaler.
-- | - `currentReplicas`: currentReplicas is current number of replicas of pods managed by this autoscaler, as last seen by the autoscaler.
-- | - `desiredReplicas`: desiredReplicas is the desired number of replicas of pods managed by this autoscaler, as last calculated by the autoscaler.
-- | - `lastScaleTime`: lastScaleTime is the last time the HorizontalPodAutoscaler scaled the number of pods, used by the autoscaler to control how often the number of pods is changed.
-- | - `observedGeneration`: observedGeneration is the most recent generation observed by this autoscaler.
newtype HorizontalPodAutoscalerStatus = HorizontalPodAutoscalerStatus
  { conditions :: (NullOrUndefined (Array HorizontalPodAutoscalerCondition))
  , currentMetrics :: (NullOrUndefined (Array MetricStatus))
  , currentReplicas :: (NullOrUndefined Int)
  , desiredReplicas :: (NullOrUndefined Int)
  , lastScaleTime :: (NullOrUndefined MetaV1.Time)
  , observedGeneration :: (NullOrUndefined Int) }

derive instance newtypeHorizontalPodAutoscalerStatus :: Newtype HorizontalPodAutoscalerStatus _
derive instance genericHorizontalPodAutoscalerStatus :: Generic HorizontalPodAutoscalerStatus _
instance showHorizontalPodAutoscalerStatus :: Show HorizontalPodAutoscalerStatus where show a = genericShow a
instance decodeHorizontalPodAutoscalerStatus :: Decode HorizontalPodAutoscalerStatus where
  decode a = do
               conditions <- readProp "conditions" a >>= decode
               currentMetrics <- readProp "currentMetrics" a >>= decode
               currentReplicas <- readProp "currentReplicas" a >>= decode
               desiredReplicas <- readProp "desiredReplicas" a >>= decode
               lastScaleTime <- readProp "lastScaleTime" a >>= decode
               observedGeneration <- readProp "observedGeneration" a >>= decode
               pure $ HorizontalPodAutoscalerStatus { conditions, currentMetrics, currentReplicas, desiredReplicas, lastScaleTime, observedGeneration }
instance encodeHorizontalPodAutoscalerStatus :: Encode HorizontalPodAutoscalerStatus where
  encode (HorizontalPodAutoscalerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "conditions" (encode a.conditions)
               , Tuple "currentMetrics" (encode a.currentMetrics)
               , Tuple "currentReplicas" (encode a.currentReplicas)
               , Tuple "desiredReplicas" (encode a.desiredReplicas)
               , Tuple "lastScaleTime" (encode a.lastScaleTime)
               , Tuple "observedGeneration" (encode a.observedGeneration) ]


instance defaultHorizontalPodAutoscalerStatus :: Default HorizontalPodAutoscalerStatus where
  default = HorizontalPodAutoscalerStatus
    { conditions: NullOrUndefined Nothing
    , currentMetrics: NullOrUndefined Nothing
    , currentReplicas: NullOrUndefined Nothing
    , desiredReplicas: NullOrUndefined Nothing
    , lastScaleTime: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing }

-- | MetricSpec specifies how to scale based on a single metric (only `type` and one other matching field should be set at once).
-- |
-- | Fields:
-- | - `object`: object refers to a metric describing a single kubernetes object (for example, hits-per-second on an Ingress object).
-- | - `pods`: pods refers to a metric describing each pod in the current scale target (for example, transactions-processed-per-second).  The values will be averaged together before being compared to the target value.
-- | - `resource`: resource refers to a resource metric (such as those specified in requests and limits) known to Kubernetes describing each pod in the current scale target (e.g. CPU or memory). Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
-- | - `_type`: type is the type of metric source.  It should be one of "Object", "Pods" or "Resource", each mapping to a matching field in the object.
newtype MetricSpec = MetricSpec
  { _type :: (NullOrUndefined String)
  , object :: (NullOrUndefined ObjectMetricSource)
  , pods :: (NullOrUndefined PodsMetricSource)
  , resource :: (NullOrUndefined ResourceMetricSource) }

derive instance newtypeMetricSpec :: Newtype MetricSpec _
derive instance genericMetricSpec :: Generic MetricSpec _
instance showMetricSpec :: Show MetricSpec where show a = genericShow a
instance decodeMetricSpec :: Decode MetricSpec where
  decode a = do
               _type <- readProp "_type" a >>= decode
               object <- readProp "object" a >>= decode
               pods <- readProp "pods" a >>= decode
               resource <- readProp "resource" a >>= decode
               pure $ MetricSpec { _type, object, pods, resource }
instance encodeMetricSpec :: Encode MetricSpec where
  encode (MetricSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "object" (encode a.object)
               , Tuple "pods" (encode a.pods)
               , Tuple "resource" (encode a.resource) ]


instance defaultMetricSpec :: Default MetricSpec where
  default = MetricSpec
    { _type: NullOrUndefined Nothing
    , object: NullOrUndefined Nothing
    , pods: NullOrUndefined Nothing
    , resource: NullOrUndefined Nothing }

-- | MetricStatus describes the last-read state of a single metric.
-- |
-- | Fields:
-- | - `object`: object refers to a metric describing a single kubernetes object (for example, hits-per-second on an Ingress object).
-- | - `pods`: pods refers to a metric describing each pod in the current scale target (for example, transactions-processed-per-second).  The values will be averaged together before being compared to the target value.
-- | - `resource`: resource refers to a resource metric (such as those specified in requests and limits) known to Kubernetes describing each pod in the current scale target (e.g. CPU or memory). Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
-- | - `_type`: type is the type of metric source.  It will be one of "Object", "Pods" or "Resource", each corresponds to a matching field in the object.
newtype MetricStatus = MetricStatus
  { _type :: (NullOrUndefined String)
  , object :: (NullOrUndefined ObjectMetricStatus)
  , pods :: (NullOrUndefined PodsMetricStatus)
  , resource :: (NullOrUndefined ResourceMetricStatus) }

derive instance newtypeMetricStatus :: Newtype MetricStatus _
derive instance genericMetricStatus :: Generic MetricStatus _
instance showMetricStatus :: Show MetricStatus where show a = genericShow a
instance decodeMetricStatus :: Decode MetricStatus where
  decode a = do
               _type <- readProp "_type" a >>= decode
               object <- readProp "object" a >>= decode
               pods <- readProp "pods" a >>= decode
               resource <- readProp "resource" a >>= decode
               pure $ MetricStatus { _type, object, pods, resource }
instance encodeMetricStatus :: Encode MetricStatus where
  encode (MetricStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "object" (encode a.object)
               , Tuple "pods" (encode a.pods)
               , Tuple "resource" (encode a.resource) ]


instance defaultMetricStatus :: Default MetricStatus where
  default = MetricStatus
    { _type: NullOrUndefined Nothing
    , object: NullOrUndefined Nothing
    , pods: NullOrUndefined Nothing
    , resource: NullOrUndefined Nothing }

-- | ObjectMetricSource indicates how to scale on a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
-- |
-- | Fields:
-- | - `metricName`: metricName is the name of the metric in question.
-- | - `target`: target is the described Kubernetes object.
-- | - `targetValue`: targetValue is the target value of the metric (as a quantity).
newtype ObjectMetricSource = ObjectMetricSource
  { metricName :: (NullOrUndefined String)
  , target :: (NullOrUndefined CrossVersionObjectReference)
  , targetValue :: (NullOrUndefined Resource.Quantity) }

derive instance newtypeObjectMetricSource :: Newtype ObjectMetricSource _
derive instance genericObjectMetricSource :: Generic ObjectMetricSource _
instance showObjectMetricSource :: Show ObjectMetricSource where show a = genericShow a
instance decodeObjectMetricSource :: Decode ObjectMetricSource where
  decode a = do
               metricName <- readProp "metricName" a >>= decode
               target <- readProp "target" a >>= decode
               targetValue <- readProp "targetValue" a >>= decode
               pure $ ObjectMetricSource { metricName, target, targetValue }
instance encodeObjectMetricSource :: Encode ObjectMetricSource where
  encode (ObjectMetricSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "metricName" (encode a.metricName)
               , Tuple "target" (encode a.target)
               , Tuple "targetValue" (encode a.targetValue) ]


instance defaultObjectMetricSource :: Default ObjectMetricSource where
  default = ObjectMetricSource
    { metricName: NullOrUndefined Nothing
    , target: NullOrUndefined Nothing
    , targetValue: NullOrUndefined Nothing }

-- | ObjectMetricStatus indicates the current value of a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
-- |
-- | Fields:
-- | - `currentValue`: currentValue is the current value of the metric (as a quantity).
-- | - `metricName`: metricName is the name of the metric in question.
-- | - `target`: target is the described Kubernetes object.
newtype ObjectMetricStatus = ObjectMetricStatus
  { currentValue :: (NullOrUndefined Resource.Quantity)
  , metricName :: (NullOrUndefined String)
  , target :: (NullOrUndefined CrossVersionObjectReference) }

derive instance newtypeObjectMetricStatus :: Newtype ObjectMetricStatus _
derive instance genericObjectMetricStatus :: Generic ObjectMetricStatus _
instance showObjectMetricStatus :: Show ObjectMetricStatus where show a = genericShow a
instance decodeObjectMetricStatus :: Decode ObjectMetricStatus where
  decode a = do
               currentValue <- readProp "currentValue" a >>= decode
               metricName <- readProp "metricName" a >>= decode
               target <- readProp "target" a >>= decode
               pure $ ObjectMetricStatus { currentValue, metricName, target }
instance encodeObjectMetricStatus :: Encode ObjectMetricStatus where
  encode (ObjectMetricStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "currentValue" (encode a.currentValue)
               , Tuple "metricName" (encode a.metricName)
               , Tuple "target" (encode a.target) ]


instance defaultObjectMetricStatus :: Default ObjectMetricStatus where
  default = ObjectMetricStatus
    { currentValue: NullOrUndefined Nothing
    , metricName: NullOrUndefined Nothing
    , target: NullOrUndefined Nothing }

-- | PodsMetricSource indicates how to scale on a metric describing each pod in the current scale target (for example, transactions-processed-per-second). The values will be averaged together before being compared to the target value.
-- |
-- | Fields:
-- | - `metricName`: metricName is the name of the metric in question
-- | - `targetAverageValue`: targetAverageValue is the target value of the average of the metric across all relevant pods (as a quantity)
newtype PodsMetricSource = PodsMetricSource
  { metricName :: (NullOrUndefined String)
  , targetAverageValue :: (NullOrUndefined Resource.Quantity) }

derive instance newtypePodsMetricSource :: Newtype PodsMetricSource _
derive instance genericPodsMetricSource :: Generic PodsMetricSource _
instance showPodsMetricSource :: Show PodsMetricSource where show a = genericShow a
instance decodePodsMetricSource :: Decode PodsMetricSource where
  decode a = do
               metricName <- readProp "metricName" a >>= decode
               targetAverageValue <- readProp "targetAverageValue" a >>= decode
               pure $ PodsMetricSource { metricName, targetAverageValue }
instance encodePodsMetricSource :: Encode PodsMetricSource where
  encode (PodsMetricSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "metricName" (encode a.metricName)
               , Tuple "targetAverageValue" (encode a.targetAverageValue) ]


instance defaultPodsMetricSource :: Default PodsMetricSource where
  default = PodsMetricSource
    { metricName: NullOrUndefined Nothing
    , targetAverageValue: NullOrUndefined Nothing }

-- | PodsMetricStatus indicates the current value of a metric describing each pod in the current scale target (for example, transactions-processed-per-second).
-- |
-- | Fields:
-- | - `currentAverageValue`: currentAverageValue is the current value of the average of the metric across all relevant pods (as a quantity)
-- | - `metricName`: metricName is the name of the metric in question
newtype PodsMetricStatus = PodsMetricStatus
  { currentAverageValue :: (NullOrUndefined Resource.Quantity)
  , metricName :: (NullOrUndefined String) }

derive instance newtypePodsMetricStatus :: Newtype PodsMetricStatus _
derive instance genericPodsMetricStatus :: Generic PodsMetricStatus _
instance showPodsMetricStatus :: Show PodsMetricStatus where show a = genericShow a
instance decodePodsMetricStatus :: Decode PodsMetricStatus where
  decode a = do
               currentAverageValue <- readProp "currentAverageValue" a >>= decode
               metricName <- readProp "metricName" a >>= decode
               pure $ PodsMetricStatus { currentAverageValue, metricName }
instance encodePodsMetricStatus :: Encode PodsMetricStatus where
  encode (PodsMetricStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "currentAverageValue" (encode a.currentAverageValue)
               , Tuple "metricName" (encode a.metricName) ]


instance defaultPodsMetricStatus :: Default PodsMetricStatus where
  default = PodsMetricStatus
    { currentAverageValue: NullOrUndefined Nothing
    , metricName: NullOrUndefined Nothing }

-- | ResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.  Only one "target" type should be set.
-- |
-- | Fields:
-- | - `name`: name is the name of the resource in question.
-- | - `targetAverageUtilization`: targetAverageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods.
-- | - `targetAverageValue`: targetAverageValue is the target value of the average of the resource metric across all relevant pods, as a raw value (instead of as a percentage of the request), similar to the "pods" metric source type.
newtype ResourceMetricSource = ResourceMetricSource
  { name :: (NullOrUndefined String)
  , targetAverageUtilization :: (NullOrUndefined Int)
  , targetAverageValue :: (NullOrUndefined Resource.Quantity) }

derive instance newtypeResourceMetricSource :: Newtype ResourceMetricSource _
derive instance genericResourceMetricSource :: Generic ResourceMetricSource _
instance showResourceMetricSource :: Show ResourceMetricSource where show a = genericShow a
instance decodeResourceMetricSource :: Decode ResourceMetricSource where
  decode a = do
               name <- readProp "name" a >>= decode
               targetAverageUtilization <- readProp "targetAverageUtilization" a >>= decode
               targetAverageValue <- readProp "targetAverageValue" a >>= decode
               pure $ ResourceMetricSource { name, targetAverageUtilization, targetAverageValue }
instance encodeResourceMetricSource :: Encode ResourceMetricSource where
  encode (ResourceMetricSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "targetAverageUtilization" (encode a.targetAverageUtilization)
               , Tuple "targetAverageValue" (encode a.targetAverageValue) ]


instance defaultResourceMetricSource :: Default ResourceMetricSource where
  default = ResourceMetricSource
    { name: NullOrUndefined Nothing
    , targetAverageUtilization: NullOrUndefined Nothing
    , targetAverageValue: NullOrUndefined Nothing }

-- | ResourceMetricStatus indicates the current value of a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
-- |
-- | Fields:
-- | - `currentAverageUtilization`: currentAverageUtilization is the current value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods.  It will only be present if `targetAverageValue` was set in the corresponding metric specification.
-- | - `currentAverageValue`: currentAverageValue is the current value of the average of the resource metric across all relevant pods, as a raw value (instead of as a percentage of the request), similar to the "pods" metric source type. It will always be set, regardless of the corresponding metric specification.
-- | - `name`: name is the name of the resource in question.
newtype ResourceMetricStatus = ResourceMetricStatus
  { currentAverageUtilization :: (NullOrUndefined Int)
  , currentAverageValue :: (NullOrUndefined Resource.Quantity)
  , name :: (NullOrUndefined String) }

derive instance newtypeResourceMetricStatus :: Newtype ResourceMetricStatus _
derive instance genericResourceMetricStatus :: Generic ResourceMetricStatus _
instance showResourceMetricStatus :: Show ResourceMetricStatus where show a = genericShow a
instance decodeResourceMetricStatus :: Decode ResourceMetricStatus where
  decode a = do
               currentAverageUtilization <- readProp "currentAverageUtilization" a >>= decode
               currentAverageValue <- readProp "currentAverageValue" a >>= decode
               name <- readProp "name" a >>= decode
               pure $ ResourceMetricStatus { currentAverageUtilization, currentAverageValue, name }
instance encodeResourceMetricStatus :: Encode ResourceMetricStatus where
  encode (ResourceMetricStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "currentAverageUtilization" (encode a.currentAverageUtilization)
               , Tuple "currentAverageValue" (encode a.currentAverageValue)
               , Tuple "name" (encode a.name) ]


instance defaultResourceMetricStatus :: Default ResourceMetricStatus where
  default = ResourceMetricStatus
    { currentAverageUtilization: NullOrUndefined Nothing
    , currentAverageValue: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/"