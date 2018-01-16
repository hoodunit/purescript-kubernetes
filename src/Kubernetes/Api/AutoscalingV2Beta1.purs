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

-- | io.k8s.api.autoscaling.v2beta1.CrossVersionObjectReference
-- | CrossVersionObjectReference contains enough information to let you identify the referred resource.
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

-- | io.k8s.api.autoscaling.v2beta1.HorizontalPodAutoscaler
-- | HorizontalPodAutoscaler is the configuration for a horizontal pod autoscaler, which automatically manages the replica count of any resource implementing the scale subresource based on the metrics specified.
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

-- | io.k8s.api.autoscaling.v2beta1.HorizontalPodAutoscalerCondition
-- | HorizontalPodAutoscalerCondition describes the state of a HorizontalPodAutoscaler at a certain point.
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

-- | io.k8s.api.autoscaling.v2beta1.HorizontalPodAutoscalerList
-- | HorizontalPodAutoscaler is a list of horizontal pod autoscaler objects.
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

-- | io.k8s.api.autoscaling.v2beta1.HorizontalPodAutoscalerSpec
-- | HorizontalPodAutoscalerSpec describes the desired functionality of the HorizontalPodAutoscaler.
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

-- | io.k8s.api.autoscaling.v2beta1.HorizontalPodAutoscalerStatus
-- | HorizontalPodAutoscalerStatus describes the current status of a horizontal pod autoscaler.
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

-- | io.k8s.api.autoscaling.v2beta1.MetricSpec
-- | MetricSpec specifies how to scale based on a single metric (only `type` and one other matching field should be set at once).
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

-- | io.k8s.api.autoscaling.v2beta1.MetricStatus
-- | MetricStatus describes the last-read state of a single metric.
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

-- | io.k8s.api.autoscaling.v2beta1.ObjectMetricSource
-- | ObjectMetricSource indicates how to scale on a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
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

-- | io.k8s.api.autoscaling.v2beta1.ObjectMetricStatus
-- | ObjectMetricStatus indicates the current value of a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
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

-- | io.k8s.api.autoscaling.v2beta1.PodsMetricSource
-- | PodsMetricSource indicates how to scale on a metric describing each pod in the current scale target (for example, transactions-processed-per-second). The values will be averaged together before being compared to the target value.
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

-- | io.k8s.api.autoscaling.v2beta1.PodsMetricStatus
-- | PodsMetricStatus indicates the current value of a metric describing each pod in the current scale target (for example, transactions-processed-per-second).
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

-- | io.k8s.api.autoscaling.v2beta1.ResourceMetricSource
-- | ResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.  Only one "target" type should be set.
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

-- | io.k8s.api.autoscaling.v2beta1.ResourceMetricStatus
-- | ResourceMetricStatus indicates the current value of a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
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

-- | DeleteCollectionNamespacedHorizontalPodAutoscalerOptions
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

-- | DeleteNamespacedHorizontalPodAutoscalerOptions
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

-- | ListNamespacedHorizontalPodAutoscalerOptions
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

-- | ReadNamespacedHorizontalPodAutoscalerOptions
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