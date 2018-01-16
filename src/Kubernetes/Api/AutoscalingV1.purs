module Kubernetes.Api.AutoscalingV1 where

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

-- | create a HorizontalPodAutoscaler
createNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
createNamespacedHorizontalPodAutoscaler cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v1/namespaces/" <> namespace <> "/horizontalpodautoscalers"
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
    url = "/apis/autoscaling/v1/namespaces/" <> namespace <> "/horizontalpodautoscalers" <> formatQueryString options

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
    url = "/apis/autoscaling/v1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v1/"

-- | list or watch objects of kind HorizontalPodAutoscaler
listHorizontalPodAutoscalerForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscalerList)
listHorizontalPodAutoscalerForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v1/horizontalpodautoscalers"

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
    url = "/apis/autoscaling/v1/namespaces/" <> namespace <> "/horizontalpodautoscalers" <> formatQueryString options

-- | read scale of the specified Deployment
readNamespacedDeploymentScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
readNamespacedDeploymentScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"

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
    url = "/apis/autoscaling/v1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "" <> formatQueryString options

-- | read status of the specified HorizontalPodAutoscaler
readNamespacedHorizontalPodAutoscalerStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
readNamespacedHorizontalPodAutoscalerStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "/status"

-- | read scale of the specified ReplicaSet
readNamespacedReplicaSetScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
readNamespacedReplicaSetScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"

-- | read scale of the specified ReplicationController
readNamespacedReplicationControllerScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
readNamespacedReplicationControllerScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"

-- | read scale of the specified StatefulSet
readNamespacedStatefulSetScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
readNamespacedStatefulSetScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/scale"

-- | replace scale of the specified Deployment
replaceNamespacedDeploymentScale :: forall e. Config -> String -> String -> Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
replaceNamespacedDeploymentScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace the specified HorizontalPodAutoscaler
replaceNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
replaceNamespacedHorizontalPodAutoscaler cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified HorizontalPodAutoscaler
replaceNamespacedHorizontalPodAutoscalerStatus :: forall e. Config -> String -> String -> HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status HorizontalPodAutoscaler)
replaceNamespacedHorizontalPodAutoscalerStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicaSet
replaceNamespacedReplicaSetScale :: forall e. Config -> String -> String -> Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
replaceNamespacedReplicaSetScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicationController
replaceNamespacedReplicationControllerScale :: forall e. Config -> String -> String -> Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
replaceNamespacedReplicationControllerScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace scale of the specified StatefulSet
replaceNamespacedStatefulSetScale :: forall e. Config -> String -> String -> Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status Scale)
replaceNamespacedStatefulSetScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of HorizontalPodAutoscaler
watchHorizontalPodAutoscalerListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchHorizontalPodAutoscalerListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v1/watch/horizontalpodautoscalers"

-- | watch changes to an object of kind HorizontalPodAutoscaler
watchNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedHorizontalPodAutoscaler cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v1/watch/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> ""

-- | watch individual changes to a list of HorizontalPodAutoscaler
watchNamespacedHorizontalPodAutoscalerList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedHorizontalPodAutoscalerList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v1/watch/namespaces/" <> namespace <> "/horizontalpodautoscalers"