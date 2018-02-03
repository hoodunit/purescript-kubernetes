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
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.Resource as Resource
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | CrossVersionObjectReference contains enough information to let you identify the referred resource.
-- |
-- | Fields:
-- | - `apiVersion`: API version of the referent
-- | - `kind`: Kind of the referent; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds"
-- | - `name`: Name of the referent; More info: http://kubernetes.io/docs/user-guide/identifiers#names
newtype CrossVersionObjectReference = CrossVersionObjectReference
  { apiVersion :: (Maybe String)
  , kind :: (Maybe String)
  , name :: (Maybe String) }

derive instance newtypeCrossVersionObjectReference :: Newtype CrossVersionObjectReference _
derive instance genericCrossVersionObjectReference :: Generic CrossVersionObjectReference _
instance showCrossVersionObjectReference :: Show CrossVersionObjectReference where show a = genericShow a
instance decodeCrossVersionObjectReference :: Decode CrossVersionObjectReference where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               kind <- decodeMaybe "kind" a
               name <- decodeMaybe "name" a
               pure $ CrossVersionObjectReference { apiVersion, kind, name }
instance encodeCrossVersionObjectReference :: Encode CrossVersionObjectReference where
  encode (CrossVersionObjectReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "name" (encodeMaybe a.name) ]


instance defaultCrossVersionObjectReference :: Default CrossVersionObjectReference where
  default = CrossVersionObjectReference
    { apiVersion: Nothing
    , kind: Nothing
    , name: Nothing }

-- | HorizontalPodAutoscaler is the configuration for a horizontal pod autoscaler, which automatically manages the replica count of any resource implementing the scale subresource based on the metrics specified.
-- |
-- | Fields:
-- | - `metadata`: metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: spec is the specification for the behaviour of the autoscaler. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status.
-- | - `status`: status is the current information about the autoscaler.
newtype HorizontalPodAutoscaler = HorizontalPodAutoscaler
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe HorizontalPodAutoscalerSpec)
  , status :: (Maybe HorizontalPodAutoscalerStatus) }

derive instance newtypeHorizontalPodAutoscaler :: Newtype HorizontalPodAutoscaler _
derive instance genericHorizontalPodAutoscaler :: Generic HorizontalPodAutoscaler _
instance showHorizontalPodAutoscaler :: Show HorizontalPodAutoscaler where show a = genericShow a
instance decodeHorizontalPodAutoscaler :: Decode HorizontalPodAutoscaler where
  decode a = do
               assertPropEq "apiVersion" "autoscaling/v2beta1" a
               assertPropEq "kind" "HorizontalPodAutoscaler" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ HorizontalPodAutoscaler { metadata, spec, status }
instance encodeHorizontalPodAutoscaler :: Encode HorizontalPodAutoscaler where
  encode (HorizontalPodAutoscaler a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "autoscaling/v2beta1")
               , Tuple "kind" (encode "HorizontalPodAutoscaler")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultHorizontalPodAutoscaler :: Default HorizontalPodAutoscaler where
  default = HorizontalPodAutoscaler
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | HorizontalPodAutoscalerCondition describes the state of a HorizontalPodAutoscaler at a certain point.
-- |
-- | Fields:
-- | - `_type`: type describes the current condition
-- | - `lastTransitionTime`: lastTransitionTime is the last time the condition transitioned from one status to another
-- | - `message`: message is a human-readable explanation containing details about the transition
-- | - `reason`: reason is the reason for the condition's last transition.
-- | - `status`: status is the status of the condition (True, False, Unknown)
newtype HorizontalPodAutoscalerCondition = HorizontalPodAutoscalerCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeHorizontalPodAutoscalerCondition :: Newtype HorizontalPodAutoscalerCondition _
derive instance genericHorizontalPodAutoscalerCondition :: Generic HorizontalPodAutoscalerCondition _
instance showHorizontalPodAutoscalerCondition :: Show HorizontalPodAutoscalerCondition where show a = genericShow a
instance decodeHorizontalPodAutoscalerCondition :: Decode HorizontalPodAutoscalerCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ HorizontalPodAutoscalerCondition { _type, lastTransitionTime, message, reason, status }
instance encodeHorizontalPodAutoscalerCondition :: Encode HorizontalPodAutoscalerCondition where
  encode (HorizontalPodAutoscalerCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultHorizontalPodAutoscalerCondition :: Default HorizontalPodAutoscalerCondition where
  default = HorizontalPodAutoscalerCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | HorizontalPodAutoscaler is a list of horizontal pod autoscaler objects.
-- |
-- | Fields:
-- | - `items`: items is the list of horizontal pod autoscaler objects.
-- | - `metadata`: metadata is the standard list metadata.
newtype HorizontalPodAutoscalerList = HorizontalPodAutoscalerList
  { items :: (Maybe (Array HorizontalPodAutoscaler))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeHorizontalPodAutoscalerList :: Newtype HorizontalPodAutoscalerList _
derive instance genericHorizontalPodAutoscalerList :: Generic HorizontalPodAutoscalerList _
instance showHorizontalPodAutoscalerList :: Show HorizontalPodAutoscalerList where show a = genericShow a
instance decodeHorizontalPodAutoscalerList :: Decode HorizontalPodAutoscalerList where
  decode a = do
               assertPropEq "apiVersion" "autoscaling/v2beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "HorizontalPodAutoscalerList" a
               metadata <- decodeMaybe "metadata" a
               pure $ HorizontalPodAutoscalerList { items, metadata }
instance encodeHorizontalPodAutoscalerList :: Encode HorizontalPodAutoscalerList where
  encode (HorizontalPodAutoscalerList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "autoscaling/v2beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "HorizontalPodAutoscalerList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultHorizontalPodAutoscalerList :: Default HorizontalPodAutoscalerList where
  default = HorizontalPodAutoscalerList
    { items: Nothing
    , metadata: Nothing }

-- | HorizontalPodAutoscalerSpec describes the desired functionality of the HorizontalPodAutoscaler.
-- |
-- | Fields:
-- | - `maxReplicas`: maxReplicas is the upper limit for the number of replicas to which the autoscaler can scale up. It cannot be less that minReplicas.
-- | - `metrics`: metrics contains the specifications for which to use to calculate the desired replica count (the maximum replica count across all metrics will be used).  The desired replica count is calculated multiplying the ratio between the target value and the current value by the current number of pods.  Ergo, metrics used must decrease as the pod count is increased, and vice-versa.  See the individual metric source types for more information about how each type of metric must respond.
-- | - `minReplicas`: minReplicas is the lower limit for the number of replicas to which the autoscaler can scale down. It defaults to 1 pod.
-- | - `scaleTargetRef`: scaleTargetRef points to the target resource to scale, and is used to the pods for which metrics should be collected, as well as to actually change the replica count.
newtype HorizontalPodAutoscalerSpec = HorizontalPodAutoscalerSpec
  { maxReplicas :: (Maybe Int)
  , metrics :: (Maybe (Array MetricSpec))
  , minReplicas :: (Maybe Int)
  , scaleTargetRef :: (Maybe CrossVersionObjectReference) }

derive instance newtypeHorizontalPodAutoscalerSpec :: Newtype HorizontalPodAutoscalerSpec _
derive instance genericHorizontalPodAutoscalerSpec :: Generic HorizontalPodAutoscalerSpec _
instance showHorizontalPodAutoscalerSpec :: Show HorizontalPodAutoscalerSpec where show a = genericShow a
instance decodeHorizontalPodAutoscalerSpec :: Decode HorizontalPodAutoscalerSpec where
  decode a = do
               maxReplicas <- decodeMaybe "maxReplicas" a
               metrics <- decodeMaybe "metrics" a
               minReplicas <- decodeMaybe "minReplicas" a
               scaleTargetRef <- decodeMaybe "scaleTargetRef" a
               pure $ HorizontalPodAutoscalerSpec { maxReplicas, metrics, minReplicas, scaleTargetRef }
instance encodeHorizontalPodAutoscalerSpec :: Encode HorizontalPodAutoscalerSpec where
  encode (HorizontalPodAutoscalerSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxReplicas" (encodeMaybe a.maxReplicas)
               , Tuple "metrics" (encodeMaybe a.metrics)
               , Tuple "minReplicas" (encodeMaybe a.minReplicas)
               , Tuple "scaleTargetRef" (encodeMaybe a.scaleTargetRef) ]


instance defaultHorizontalPodAutoscalerSpec :: Default HorizontalPodAutoscalerSpec where
  default = HorizontalPodAutoscalerSpec
    { maxReplicas: Nothing
    , metrics: Nothing
    , minReplicas: Nothing
    , scaleTargetRef: Nothing }

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
  { conditions :: (Maybe (Array HorizontalPodAutoscalerCondition))
  , currentMetrics :: (Maybe (Array MetricStatus))
  , currentReplicas :: (Maybe Int)
  , desiredReplicas :: (Maybe Int)
  , lastScaleTime :: (Maybe MetaV1.Time)
  , observedGeneration :: (Maybe Int) }

derive instance newtypeHorizontalPodAutoscalerStatus :: Newtype HorizontalPodAutoscalerStatus _
derive instance genericHorizontalPodAutoscalerStatus :: Generic HorizontalPodAutoscalerStatus _
instance showHorizontalPodAutoscalerStatus :: Show HorizontalPodAutoscalerStatus where show a = genericShow a
instance decodeHorizontalPodAutoscalerStatus :: Decode HorizontalPodAutoscalerStatus where
  decode a = do
               conditions <- decodeMaybe "conditions" a
               currentMetrics <- decodeMaybe "currentMetrics" a
               currentReplicas <- decodeMaybe "currentReplicas" a
               desiredReplicas <- decodeMaybe "desiredReplicas" a
               lastScaleTime <- decodeMaybe "lastScaleTime" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               pure $ HorizontalPodAutoscalerStatus { conditions, currentMetrics, currentReplicas, desiredReplicas, lastScaleTime, observedGeneration }
instance encodeHorizontalPodAutoscalerStatus :: Encode HorizontalPodAutoscalerStatus where
  encode (HorizontalPodAutoscalerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "currentMetrics" (encodeMaybe a.currentMetrics)
               , Tuple "currentReplicas" (encodeMaybe a.currentReplicas)
               , Tuple "desiredReplicas" (encodeMaybe a.desiredReplicas)
               , Tuple "lastScaleTime" (encodeMaybe a.lastScaleTime)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration) ]


instance defaultHorizontalPodAutoscalerStatus :: Default HorizontalPodAutoscalerStatus where
  default = HorizontalPodAutoscalerStatus
    { conditions: Nothing
    , currentMetrics: Nothing
    , currentReplicas: Nothing
    , desiredReplicas: Nothing
    , lastScaleTime: Nothing
    , observedGeneration: Nothing }

-- | MetricSpec specifies how to scale based on a single metric (only `type` and one other matching field should be set at once).
-- |
-- | Fields:
-- | - `_type`: type is the type of metric source.  It should be one of "Object", "Pods" or "Resource", each mapping to a matching field in the object.
-- | - `object`: object refers to a metric describing a single kubernetes object (for example, hits-per-second on an Ingress object).
-- | - `pods`: pods refers to a metric describing each pod in the current scale target (for example, transactions-processed-per-second).  The values will be averaged together before being compared to the target value.
-- | - `resource`: resource refers to a resource metric (such as those specified in requests and limits) known to Kubernetes describing each pod in the current scale target (e.g. CPU or memory). Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
newtype MetricSpec = MetricSpec
  { _type :: (Maybe String)
  , object :: (Maybe ObjectMetricSource)
  , pods :: (Maybe PodsMetricSource)
  , resource :: (Maybe ResourceMetricSource) }

derive instance newtypeMetricSpec :: Newtype MetricSpec _
derive instance genericMetricSpec :: Generic MetricSpec _
instance showMetricSpec :: Show MetricSpec where show a = genericShow a
instance decodeMetricSpec :: Decode MetricSpec where
  decode a = do
               _type <- decodeMaybe "_type" a
               object <- decodeMaybe "object" a
               pods <- decodeMaybe "pods" a
               resource <- decodeMaybe "resource" a
               pure $ MetricSpec { _type, object, pods, resource }
instance encodeMetricSpec :: Encode MetricSpec where
  encode (MetricSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "object" (encodeMaybe a.object)
               , Tuple "pods" (encodeMaybe a.pods)
               , Tuple "resource" (encodeMaybe a.resource) ]


instance defaultMetricSpec :: Default MetricSpec where
  default = MetricSpec
    { _type: Nothing
    , object: Nothing
    , pods: Nothing
    , resource: Nothing }

-- | MetricStatus describes the last-read state of a single metric.
-- |
-- | Fields:
-- | - `_type`: type is the type of metric source.  It will be one of "Object", "Pods" or "Resource", each corresponds to a matching field in the object.
-- | - `object`: object refers to a metric describing a single kubernetes object (for example, hits-per-second on an Ingress object).
-- | - `pods`: pods refers to a metric describing each pod in the current scale target (for example, transactions-processed-per-second).  The values will be averaged together before being compared to the target value.
-- | - `resource`: resource refers to a resource metric (such as those specified in requests and limits) known to Kubernetes describing each pod in the current scale target (e.g. CPU or memory). Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
newtype MetricStatus = MetricStatus
  { _type :: (Maybe String)
  , object :: (Maybe ObjectMetricStatus)
  , pods :: (Maybe PodsMetricStatus)
  , resource :: (Maybe ResourceMetricStatus) }

derive instance newtypeMetricStatus :: Newtype MetricStatus _
derive instance genericMetricStatus :: Generic MetricStatus _
instance showMetricStatus :: Show MetricStatus where show a = genericShow a
instance decodeMetricStatus :: Decode MetricStatus where
  decode a = do
               _type <- decodeMaybe "_type" a
               object <- decodeMaybe "object" a
               pods <- decodeMaybe "pods" a
               resource <- decodeMaybe "resource" a
               pure $ MetricStatus { _type, object, pods, resource }
instance encodeMetricStatus :: Encode MetricStatus where
  encode (MetricStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "object" (encodeMaybe a.object)
               , Tuple "pods" (encodeMaybe a.pods)
               , Tuple "resource" (encodeMaybe a.resource) ]


instance defaultMetricStatus :: Default MetricStatus where
  default = MetricStatus
    { _type: Nothing
    , object: Nothing
    , pods: Nothing
    , resource: Nothing }

-- | ObjectMetricSource indicates how to scale on a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
-- |
-- | Fields:
-- | - `metricName`: metricName is the name of the metric in question.
-- | - `target`: target is the described Kubernetes object.
-- | - `targetValue`: targetValue is the target value of the metric (as a quantity).
newtype ObjectMetricSource = ObjectMetricSource
  { metricName :: (Maybe String)
  , target :: (Maybe CrossVersionObjectReference)
  , targetValue :: (Maybe Resource.Quantity) }

derive instance newtypeObjectMetricSource :: Newtype ObjectMetricSource _
derive instance genericObjectMetricSource :: Generic ObjectMetricSource _
instance showObjectMetricSource :: Show ObjectMetricSource where show a = genericShow a
instance decodeObjectMetricSource :: Decode ObjectMetricSource where
  decode a = do
               metricName <- decodeMaybe "metricName" a
               target <- decodeMaybe "target" a
               targetValue <- decodeMaybe "targetValue" a
               pure $ ObjectMetricSource { metricName, target, targetValue }
instance encodeObjectMetricSource :: Encode ObjectMetricSource where
  encode (ObjectMetricSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "metricName" (encodeMaybe a.metricName)
               , Tuple "target" (encodeMaybe a.target)
               , Tuple "targetValue" (encodeMaybe a.targetValue) ]


instance defaultObjectMetricSource :: Default ObjectMetricSource where
  default = ObjectMetricSource
    { metricName: Nothing
    , target: Nothing
    , targetValue: Nothing }

-- | ObjectMetricStatus indicates the current value of a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
-- |
-- | Fields:
-- | - `currentValue`: currentValue is the current value of the metric (as a quantity).
-- | - `metricName`: metricName is the name of the metric in question.
-- | - `target`: target is the described Kubernetes object.
newtype ObjectMetricStatus = ObjectMetricStatus
  { currentValue :: (Maybe Resource.Quantity)
  , metricName :: (Maybe String)
  , target :: (Maybe CrossVersionObjectReference) }

derive instance newtypeObjectMetricStatus :: Newtype ObjectMetricStatus _
derive instance genericObjectMetricStatus :: Generic ObjectMetricStatus _
instance showObjectMetricStatus :: Show ObjectMetricStatus where show a = genericShow a
instance decodeObjectMetricStatus :: Decode ObjectMetricStatus where
  decode a = do
               currentValue <- decodeMaybe "currentValue" a
               metricName <- decodeMaybe "metricName" a
               target <- decodeMaybe "target" a
               pure $ ObjectMetricStatus { currentValue, metricName, target }
instance encodeObjectMetricStatus :: Encode ObjectMetricStatus where
  encode (ObjectMetricStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "currentValue" (encodeMaybe a.currentValue)
               , Tuple "metricName" (encodeMaybe a.metricName)
               , Tuple "target" (encodeMaybe a.target) ]


instance defaultObjectMetricStatus :: Default ObjectMetricStatus where
  default = ObjectMetricStatus
    { currentValue: Nothing
    , metricName: Nothing
    , target: Nothing }

-- | PodsMetricSource indicates how to scale on a metric describing each pod in the current scale target (for example, transactions-processed-per-second). The values will be averaged together before being compared to the target value.
-- |
-- | Fields:
-- | - `metricName`: metricName is the name of the metric in question
-- | - `targetAverageValue`: targetAverageValue is the target value of the average of the metric across all relevant pods (as a quantity)
newtype PodsMetricSource = PodsMetricSource
  { metricName :: (Maybe String)
  , targetAverageValue :: (Maybe Resource.Quantity) }

derive instance newtypePodsMetricSource :: Newtype PodsMetricSource _
derive instance genericPodsMetricSource :: Generic PodsMetricSource _
instance showPodsMetricSource :: Show PodsMetricSource where show a = genericShow a
instance decodePodsMetricSource :: Decode PodsMetricSource where
  decode a = do
               metricName <- decodeMaybe "metricName" a
               targetAverageValue <- decodeMaybe "targetAverageValue" a
               pure $ PodsMetricSource { metricName, targetAverageValue }
instance encodePodsMetricSource :: Encode PodsMetricSource where
  encode (PodsMetricSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "metricName" (encodeMaybe a.metricName)
               , Tuple "targetAverageValue" (encodeMaybe a.targetAverageValue) ]


instance defaultPodsMetricSource :: Default PodsMetricSource where
  default = PodsMetricSource
    { metricName: Nothing
    , targetAverageValue: Nothing }

-- | PodsMetricStatus indicates the current value of a metric describing each pod in the current scale target (for example, transactions-processed-per-second).
-- |
-- | Fields:
-- | - `currentAverageValue`: currentAverageValue is the current value of the average of the metric across all relevant pods (as a quantity)
-- | - `metricName`: metricName is the name of the metric in question
newtype PodsMetricStatus = PodsMetricStatus
  { currentAverageValue :: (Maybe Resource.Quantity)
  , metricName :: (Maybe String) }

derive instance newtypePodsMetricStatus :: Newtype PodsMetricStatus _
derive instance genericPodsMetricStatus :: Generic PodsMetricStatus _
instance showPodsMetricStatus :: Show PodsMetricStatus where show a = genericShow a
instance decodePodsMetricStatus :: Decode PodsMetricStatus where
  decode a = do
               currentAverageValue <- decodeMaybe "currentAverageValue" a
               metricName <- decodeMaybe "metricName" a
               pure $ PodsMetricStatus { currentAverageValue, metricName }
instance encodePodsMetricStatus :: Encode PodsMetricStatus where
  encode (PodsMetricStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "currentAverageValue" (encodeMaybe a.currentAverageValue)
               , Tuple "metricName" (encodeMaybe a.metricName) ]


instance defaultPodsMetricStatus :: Default PodsMetricStatus where
  default = PodsMetricStatus
    { currentAverageValue: Nothing
    , metricName: Nothing }

-- | ResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.  Only one "target" type should be set.
-- |
-- | Fields:
-- | - `name`: name is the name of the resource in question.
-- | - `targetAverageUtilization`: targetAverageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods.
-- | - `targetAverageValue`: targetAverageValue is the target value of the average of the resource metric across all relevant pods, as a raw value (instead of as a percentage of the request), similar to the "pods" metric source type.
newtype ResourceMetricSource = ResourceMetricSource
  { name :: (Maybe String)
  , targetAverageUtilization :: (Maybe Int)
  , targetAverageValue :: (Maybe Resource.Quantity) }

derive instance newtypeResourceMetricSource :: Newtype ResourceMetricSource _
derive instance genericResourceMetricSource :: Generic ResourceMetricSource _
instance showResourceMetricSource :: Show ResourceMetricSource where show a = genericShow a
instance decodeResourceMetricSource :: Decode ResourceMetricSource where
  decode a = do
               name <- decodeMaybe "name" a
               targetAverageUtilization <- decodeMaybe "targetAverageUtilization" a
               targetAverageValue <- decodeMaybe "targetAverageValue" a
               pure $ ResourceMetricSource { name, targetAverageUtilization, targetAverageValue }
instance encodeResourceMetricSource :: Encode ResourceMetricSource where
  encode (ResourceMetricSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "targetAverageUtilization" (encodeMaybe a.targetAverageUtilization)
               , Tuple "targetAverageValue" (encodeMaybe a.targetAverageValue) ]


instance defaultResourceMetricSource :: Default ResourceMetricSource where
  default = ResourceMetricSource
    { name: Nothing
    , targetAverageUtilization: Nothing
    , targetAverageValue: Nothing }

-- | ResourceMetricStatus indicates the current value of a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
-- |
-- | Fields:
-- | - `currentAverageUtilization`: currentAverageUtilization is the current value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods.  It will only be present if `targetAverageValue` was set in the corresponding metric specification.
-- | - `currentAverageValue`: currentAverageValue is the current value of the average of the resource metric across all relevant pods, as a raw value (instead of as a percentage of the request), similar to the "pods" metric source type. It will always be set, regardless of the corresponding metric specification.
-- | - `name`: name is the name of the resource in question.
newtype ResourceMetricStatus = ResourceMetricStatus
  { currentAverageUtilization :: (Maybe Int)
  , currentAverageValue :: (Maybe Resource.Quantity)
  , name :: (Maybe String) }

derive instance newtypeResourceMetricStatus :: Newtype ResourceMetricStatus _
derive instance genericResourceMetricStatus :: Generic ResourceMetricStatus _
instance showResourceMetricStatus :: Show ResourceMetricStatus where show a = genericShow a
instance decodeResourceMetricStatus :: Decode ResourceMetricStatus where
  decode a = do
               currentAverageUtilization <- decodeMaybe "currentAverageUtilization" a
               currentAverageValue <- decodeMaybe "currentAverageValue" a
               name <- decodeMaybe "name" a
               pure $ ResourceMetricStatus { currentAverageUtilization, currentAverageValue, name }
instance encodeResourceMetricStatus :: Encode ResourceMetricStatus where
  encode (ResourceMetricStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "currentAverageUtilization" (encodeMaybe a.currentAverageUtilization)
               , Tuple "currentAverageValue" (encodeMaybe a.currentAverageValue)
               , Tuple "name" (encodeMaybe a.name) ]


instance defaultResourceMetricStatus :: Default ResourceMetricStatus where
  default = ResourceMetricStatus
    { currentAverageUtilization: Nothing
    , currentAverageValue: Nothing
    , name: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/"