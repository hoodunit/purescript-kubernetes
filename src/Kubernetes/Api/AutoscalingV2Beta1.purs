module Kubernetes.Api.AutoscalingV2Beta1 where

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
  decode a = genericDecode jsonOptions a 
instance encodeCrossVersionObjectReference :: Encode CrossVersionObjectReference where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeHorizontalPodAutoscalerCondition :: Encode HorizontalPodAutoscalerCondition where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeHorizontalPodAutoscalerList :: Encode HorizontalPodAutoscalerList where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeHorizontalPodAutoscalerSpec :: Encode HorizontalPodAutoscalerSpec where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeHorizontalPodAutoscalerStatus :: Encode HorizontalPodAutoscalerStatus where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeMetricSpec :: Encode MetricSpec where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeMetricStatus :: Encode MetricStatus where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeObjectMetricSource :: Encode ObjectMetricSource where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeObjectMetricStatus :: Encode ObjectMetricStatus where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodePodsMetricSource :: Encode PodsMetricSource where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodePodsMetricStatus :: Encode PodsMetricStatus where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeResourceMetricSource :: Encode ResourceMetricSource where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeResourceMetricStatus :: Encode ResourceMetricStatus where
  encode a = genericEncode jsonOptions a

instance defaultResourceMetricStatus :: Default ResourceMetricStatus where
  default = ResourceMetricStatus
    { currentAverageUtilization: NullOrUndefined Nothing
    , currentAverageValue: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | create a HorizontalPodAutoscaler
createNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
createNamespacedHorizontalPodAutoscaler cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers"
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
newtype DeleteCollectionNamespacedHorizontalPodAutoscalerOptions = DeleteCollectionNamespacedHorizontalPodAutoscalerOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Newtype DeleteCollectionNamespacedHorizontalPodAutoscalerOptions _
derive instance genericDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Generic DeleteCollectionNamespacedHorizontalPodAutoscalerOptions _
instance showDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Show DeleteCollectionNamespacedHorizontalPodAutoscalerOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Decode DeleteCollectionNamespacedHorizontalPodAutoscalerOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Encode DeleteCollectionNamespacedHorizontalPodAutoscalerOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Default DeleteCollectionNamespacedHorizontalPodAutoscalerOptions where
  default = DeleteCollectionNamespacedHorizontalPodAutoscalerOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of HorizontalPodAutoscaler
deleteCollectionNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> DeleteCollectionNamespacedHorizontalPodAutoscalerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedHorizontalPodAutoscaler cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedHorizontalPodAutoscalerOptions = DeleteNamespacedHorizontalPodAutoscalerOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedHorizontalPodAutoscalerOptions :: Newtype DeleteNamespacedHorizontalPodAutoscalerOptions _
derive instance genericDeleteNamespacedHorizontalPodAutoscalerOptions :: Generic DeleteNamespacedHorizontalPodAutoscalerOptions _
instance showDeleteNamespacedHorizontalPodAutoscalerOptions :: Show DeleteNamespacedHorizontalPodAutoscalerOptions where show a = genericShow a
instance decodeDeleteNamespacedHorizontalPodAutoscalerOptions :: Decode DeleteNamespacedHorizontalPodAutoscalerOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedHorizontalPodAutoscalerOptions :: Encode DeleteNamespacedHorizontalPodAutoscalerOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedHorizontalPodAutoscalerOptions :: Default DeleteNamespacedHorizontalPodAutoscalerOptions where
  default = DeleteNamespacedHorizontalPodAutoscalerOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a HorizontalPodAutoscaler
deleteNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedHorizontalPodAutoscalerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedHorizontalPodAutoscaler cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/"

-- | list or watch objects of kind HorizontalPodAutoscaler
listHorizontalPodAutoscalerForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscalerList)
listHorizontalPodAutoscalerForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/horizontalpodautoscalers"

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
newtype ListNamespacedHorizontalPodAutoscalerOptions = ListNamespacedHorizontalPodAutoscalerOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedHorizontalPodAutoscalerOptions :: Newtype ListNamespacedHorizontalPodAutoscalerOptions _
derive instance genericListNamespacedHorizontalPodAutoscalerOptions :: Generic ListNamespacedHorizontalPodAutoscalerOptions _
instance showListNamespacedHorizontalPodAutoscalerOptions :: Show ListNamespacedHorizontalPodAutoscalerOptions where show a = genericShow a
instance decodeListNamespacedHorizontalPodAutoscalerOptions :: Decode ListNamespacedHorizontalPodAutoscalerOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedHorizontalPodAutoscalerOptions :: Encode ListNamespacedHorizontalPodAutoscalerOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedHorizontalPodAutoscalerOptions :: Default ListNamespacedHorizontalPodAutoscalerOptions where
  default = ListNamespacedHorizontalPodAutoscalerOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind HorizontalPodAutoscaler
listNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> ListNamespacedHorizontalPodAutoscalerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscalerList)
listNamespacedHorizontalPodAutoscaler cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedHorizontalPodAutoscalerOptions = ReadNamespacedHorizontalPodAutoscalerOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedHorizontalPodAutoscalerOptions :: Newtype ReadNamespacedHorizontalPodAutoscalerOptions _
derive instance genericReadNamespacedHorizontalPodAutoscalerOptions :: Generic ReadNamespacedHorizontalPodAutoscalerOptions _
instance showReadNamespacedHorizontalPodAutoscalerOptions :: Show ReadNamespacedHorizontalPodAutoscalerOptions where show a = genericShow a
instance decodeReadNamespacedHorizontalPodAutoscalerOptions :: Decode ReadNamespacedHorizontalPodAutoscalerOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedHorizontalPodAutoscalerOptions :: Encode ReadNamespacedHorizontalPodAutoscalerOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedHorizontalPodAutoscalerOptions :: Default ReadNamespacedHorizontalPodAutoscalerOptions where
  default = ReadNamespacedHorizontalPodAutoscalerOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified HorizontalPodAutoscaler
readNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> ReadNamespacedHorizontalPodAutoscalerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
readNamespacedHorizontalPodAutoscaler cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "" <> formatQueryString options

-- | read status of the specified HorizontalPodAutoscaler
readNamespacedHorizontalPodAutoscalerStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
readNamespacedHorizontalPodAutoscalerStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "/status"

-- | replace the specified HorizontalPodAutoscaler
replaceNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
replaceNamespacedHorizontalPodAutoscaler cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified HorizontalPodAutoscaler
replaceNamespacedHorizontalPodAutoscalerStatus :: forall e. Config -> String -> String -> HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
replaceNamespacedHorizontalPodAutoscalerStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of HorizontalPodAutoscaler
watchHorizontalPodAutoscalerListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchHorizontalPodAutoscalerListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/watch/horizontalpodautoscalers"

-- | watch changes to an object of kind HorizontalPodAutoscaler
watchNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedHorizontalPodAutoscaler cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/watch/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> ""

-- | watch individual changes to a list of HorizontalPodAutoscaler
watchNamespacedHorizontalPodAutoscalerList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedHorizontalPodAutoscalerList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/watch/namespaces/" <> namespace <> "/horizontalpodautoscalers"