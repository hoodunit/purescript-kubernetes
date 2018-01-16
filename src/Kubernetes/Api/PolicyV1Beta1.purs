module Kubernetes.Api.PolicyV1Beta1 where

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
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Eviction evicts a pod from its node subject to certain policies and safety constraints. This is a subresource of Pod.  A request to cause such an eviction is created by POSTing to .../pods/<pod name>/evictions.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `deleteOptions`: DeleteOptions may be provided
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: ObjectMeta describes the pod that is being evicted.
newtype Eviction = Eviction
  { apiVersion :: (NullOrUndefined String)
  , deleteOptions :: (NullOrUndefined MetaV1.DeleteOptions)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta) }

derive instance newtypeEviction :: Newtype Eviction _
derive instance genericEviction :: Generic Eviction _
instance showEviction :: Show Eviction where show a = genericShow a
instance decodeEviction :: Decode Eviction where
  decode a = genericDecode jsonOptions a 
instance encodeEviction :: Encode Eviction where
  encode a = genericEncode jsonOptions a

instance defaultEviction :: Default Eviction where
  default = Eviction
    { apiVersion: NullOrUndefined Nothing
    , deleteOptions: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PodDisruptionBudget is an object to define the max disruption that can be caused to a collection of pods
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Specification of the desired behavior of the PodDisruptionBudget.
-- | - `status`: Most recently observed status of the PodDisruptionBudget.
newtype PodDisruptionBudget = PodDisruptionBudget
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodDisruptionBudgetSpec)
  , status :: (NullOrUndefined PodDisruptionBudgetStatus) }

derive instance newtypePodDisruptionBudget :: Newtype PodDisruptionBudget _
derive instance genericPodDisruptionBudget :: Generic PodDisruptionBudget _
instance showPodDisruptionBudget :: Show PodDisruptionBudget where show a = genericShow a
instance decodePodDisruptionBudget :: Decode PodDisruptionBudget where
  decode a = genericDecode jsonOptions a 
instance encodePodDisruptionBudget :: Encode PodDisruptionBudget where
  encode a = genericEncode jsonOptions a

instance defaultPodDisruptionBudget :: Default PodDisruptionBudget where
  default = PodDisruptionBudget
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | PodDisruptionBudgetList is a collection of PodDisruptionBudgets.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
newtype PodDisruptionBudgetList = PodDisruptionBudgetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PodDisruptionBudget))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodDisruptionBudgetList :: Newtype PodDisruptionBudgetList _
derive instance genericPodDisruptionBudgetList :: Generic PodDisruptionBudgetList _
instance showPodDisruptionBudgetList :: Show PodDisruptionBudgetList where show a = genericShow a
instance decodePodDisruptionBudgetList :: Decode PodDisruptionBudgetList where
  decode a = genericDecode jsonOptions a 
instance encodePodDisruptionBudgetList :: Encode PodDisruptionBudgetList where
  encode a = genericEncode jsonOptions a

instance defaultPodDisruptionBudgetList :: Default PodDisruptionBudgetList where
  default = PodDisruptionBudgetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PodDisruptionBudgetSpec is a description of a PodDisruptionBudget.
-- |
-- | Fields:
-- | - `maxUnavailable`: An eviction is allowed if at most "maxUnavailable" pods selected by "selector" are unavailable after the eviction, i.e. even in absence of the evicted pod. For example, one can prevent all voluntary evictions by specifying 0. This is a mutually exclusive setting with "minAvailable".
-- | - `minAvailable`: An eviction is allowed if at least "minAvailable" pods selected by "selector" will still be available after the eviction, i.e. even in the absence of the evicted pod.  So for example you can prevent all voluntary evictions by specifying "100%".
-- | - `selector`: Label query over pods whose evictions are managed by the disruption budget.
newtype PodDisruptionBudgetSpec = PodDisruptionBudgetSpec
  { maxUnavailable :: (NullOrUndefined Util.IntOrString)
  , minAvailable :: (NullOrUndefined Util.IntOrString)
  , selector :: (NullOrUndefined MetaV1.LabelSelector) }

derive instance newtypePodDisruptionBudgetSpec :: Newtype PodDisruptionBudgetSpec _
derive instance genericPodDisruptionBudgetSpec :: Generic PodDisruptionBudgetSpec _
instance showPodDisruptionBudgetSpec :: Show PodDisruptionBudgetSpec where show a = genericShow a
instance decodePodDisruptionBudgetSpec :: Decode PodDisruptionBudgetSpec where
  decode a = genericDecode jsonOptions a 
instance encodePodDisruptionBudgetSpec :: Encode PodDisruptionBudgetSpec where
  encode a = genericEncode jsonOptions a

instance defaultPodDisruptionBudgetSpec :: Default PodDisruptionBudgetSpec where
  default = PodDisruptionBudgetSpec
    { maxUnavailable: NullOrUndefined Nothing
    , minAvailable: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing }

-- | PodDisruptionBudgetStatus represents information about the status of a PodDisruptionBudget. Status may trail the actual state of a system.
-- |
-- | Fields:
-- | - `currentHealthy`: current number of healthy pods
-- | - `desiredHealthy`: minimum desired number of healthy pods
-- | - `disruptedPods`: DisruptedPods contains information about pods whose eviction was processed by the API server eviction subresource handler but has not yet been observed by the PodDisruptionBudget controller. A pod will be in this map from the time when the API server processed the eviction request to the time when the pod is seen by PDB controller as having been marked for deletion (or after a timeout). The key in the map is the name of the pod and the value is the time when the API server processed the eviction request. If the deletion didn't occur and a pod is still there it will be removed from the list automatically by PodDisruptionBudget controller after some time. If everything goes smooth this map should be empty for the most of the time. Large number of entries in the map may indicate problems with pod deletions.
-- | - `disruptionsAllowed`: Number of pod disruptions that are currently allowed.
-- | - `expectedPods`: total number of pods counted by this disruption budget
-- | - `observedGeneration`: Most recent generation observed when updating this PDB status. PodDisruptionsAllowed and other status informatio is valid only if observedGeneration equals to PDB's object generation.
newtype PodDisruptionBudgetStatus = PodDisruptionBudgetStatus
  { currentHealthy :: (NullOrUndefined Int)
  , desiredHealthy :: (NullOrUndefined Int)
  , disruptedPods :: (NullOrUndefined (StrMap MetaV1.Time))
  , disruptionsAllowed :: (NullOrUndefined Int)
  , expectedPods :: (NullOrUndefined Int)
  , observedGeneration :: (NullOrUndefined Int) }

derive instance newtypePodDisruptionBudgetStatus :: Newtype PodDisruptionBudgetStatus _
derive instance genericPodDisruptionBudgetStatus :: Generic PodDisruptionBudgetStatus _
instance showPodDisruptionBudgetStatus :: Show PodDisruptionBudgetStatus where show a = genericShow a
instance decodePodDisruptionBudgetStatus :: Decode PodDisruptionBudgetStatus where
  decode a = genericDecode jsonOptions a 
instance encodePodDisruptionBudgetStatus :: Encode PodDisruptionBudgetStatus where
  encode a = genericEncode jsonOptions a

instance defaultPodDisruptionBudgetStatus :: Default PodDisruptionBudgetStatus where
  default = PodDisruptionBudgetStatus
    { currentHealthy: NullOrUndefined Nothing
    , desiredHealthy: NullOrUndefined Nothing
    , disruptedPods: NullOrUndefined Nothing
    , disruptionsAllowed: NullOrUndefined Nothing
    , expectedPods: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing }

-- | create a PodDisruptionBudget
createNamespacedPodDisruptionBudget :: forall e. Config -> String -> PodDisruptionBudget -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
createNamespacedPodDisruptionBudget cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets"
    encodedBody = encodeJSON body

-- | create eviction of a Pod
createNamespacedPodEviction :: forall e. Config -> String -> String -> Eviction -> Aff (http :: HTTP | e) (Either MetaV1.Status Eviction)
createNamespacedPodEviction cfg namespace name body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/eviction"
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
newtype DeleteCollectionNamespacedPodDisruptionBudgetOptions = DeleteCollectionNamespacedPodDisruptionBudgetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Newtype DeleteCollectionNamespacedPodDisruptionBudgetOptions _
derive instance genericDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Generic DeleteCollectionNamespacedPodDisruptionBudgetOptions _
instance showDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Show DeleteCollectionNamespacedPodDisruptionBudgetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Decode DeleteCollectionNamespacedPodDisruptionBudgetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Encode DeleteCollectionNamespacedPodDisruptionBudgetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Default DeleteCollectionNamespacedPodDisruptionBudgetOptions where
  default = DeleteCollectionNamespacedPodDisruptionBudgetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PodDisruptionBudget
deleteCollectionNamespacedPodDisruptionBudget :: forall e. Config -> String -> DeleteCollectionNamespacedPodDisruptionBudgetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedPodDisruptionBudget cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedPodDisruptionBudgetOptions = DeleteNamespacedPodDisruptionBudgetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedPodDisruptionBudgetOptions :: Newtype DeleteNamespacedPodDisruptionBudgetOptions _
derive instance genericDeleteNamespacedPodDisruptionBudgetOptions :: Generic DeleteNamespacedPodDisruptionBudgetOptions _
instance showDeleteNamespacedPodDisruptionBudgetOptions :: Show DeleteNamespacedPodDisruptionBudgetOptions where show a = genericShow a
instance decodeDeleteNamespacedPodDisruptionBudgetOptions :: Decode DeleteNamespacedPodDisruptionBudgetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedPodDisruptionBudgetOptions :: Encode DeleteNamespacedPodDisruptionBudgetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedPodDisruptionBudgetOptions :: Default DeleteNamespacedPodDisruptionBudgetOptions where
  default = DeleteNamespacedPodDisruptionBudgetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PodDisruptionBudget
deleteNamespacedPodDisruptionBudget :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedPodDisruptionBudgetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedPodDisruptionBudget cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/"

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
newtype ListNamespacedPodDisruptionBudgetOptions = ListNamespacedPodDisruptionBudgetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedPodDisruptionBudgetOptions :: Newtype ListNamespacedPodDisruptionBudgetOptions _
derive instance genericListNamespacedPodDisruptionBudgetOptions :: Generic ListNamespacedPodDisruptionBudgetOptions _
instance showListNamespacedPodDisruptionBudgetOptions :: Show ListNamespacedPodDisruptionBudgetOptions where show a = genericShow a
instance decodeListNamespacedPodDisruptionBudgetOptions :: Decode ListNamespacedPodDisruptionBudgetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedPodDisruptionBudgetOptions :: Encode ListNamespacedPodDisruptionBudgetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedPodDisruptionBudgetOptions :: Default ListNamespacedPodDisruptionBudgetOptions where
  default = ListNamespacedPodDisruptionBudgetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PodDisruptionBudget
listNamespacedPodDisruptionBudget :: forall e. Config -> String -> ListNamespacedPodDisruptionBudgetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudgetList)
listNamespacedPodDisruptionBudget cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets" <> formatQueryString options

-- | list or watch objects of kind PodDisruptionBudget
listPodDisruptionBudgetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudgetList)
listPodDisruptionBudgetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/poddisruptionbudgets"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedPodDisruptionBudgetOptions = ReadNamespacedPodDisruptionBudgetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedPodDisruptionBudgetOptions :: Newtype ReadNamespacedPodDisruptionBudgetOptions _
derive instance genericReadNamespacedPodDisruptionBudgetOptions :: Generic ReadNamespacedPodDisruptionBudgetOptions _
instance showReadNamespacedPodDisruptionBudgetOptions :: Show ReadNamespacedPodDisruptionBudgetOptions where show a = genericShow a
instance decodeReadNamespacedPodDisruptionBudgetOptions :: Decode ReadNamespacedPodDisruptionBudgetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedPodDisruptionBudgetOptions :: Encode ReadNamespacedPodDisruptionBudgetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedPodDisruptionBudgetOptions :: Default ReadNamespacedPodDisruptionBudgetOptions where
  default = ReadNamespacedPodDisruptionBudgetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PodDisruptionBudget
readNamespacedPodDisruptionBudget :: forall e. Config -> String -> String -> ReadNamespacedPodDisruptionBudgetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
readNamespacedPodDisruptionBudget cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> "" <> formatQueryString options

-- | read status of the specified PodDisruptionBudget
readNamespacedPodDisruptionBudgetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
readNamespacedPodDisruptionBudgetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> "/status"

-- | replace the specified PodDisruptionBudget
replaceNamespacedPodDisruptionBudget :: forall e. Config -> String -> String -> PodDisruptionBudget -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
replaceNamespacedPodDisruptionBudget cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified PodDisruptionBudget
replaceNamespacedPodDisruptionBudgetStatus :: forall e. Config -> String -> String -> PodDisruptionBudget -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
replaceNamespacedPodDisruptionBudgetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind PodDisruptionBudget
watchNamespacedPodDisruptionBudget :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodDisruptionBudget cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/watch/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> ""

-- | watch individual changes to a list of PodDisruptionBudget
watchNamespacedPodDisruptionBudgetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodDisruptionBudgetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/watch/namespaces/" <> namespace <> "/poddisruptionbudgets"

-- | watch individual changes to a list of PodDisruptionBudget
watchPodDisruptionBudgetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodDisruptionBudgetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/watch/poddisruptionbudgets"