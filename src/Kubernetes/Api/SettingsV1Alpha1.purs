module Kubernetes.Api.SettingsV1Alpha1 where

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
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | PodPreset is a policy resource that defines additional runtime requirements for a Pod.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`
newtype PodPreset = PodPreset
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodPresetSpec) }

derive instance newtypePodPreset :: Newtype PodPreset _
derive instance genericPodPreset :: Generic PodPreset _
instance showPodPreset :: Show PodPreset where show a = genericShow a
instance decodePodPreset :: Decode PodPreset where
  decode a = genericDecode jsonOptions a 
instance encodePodPreset :: Encode PodPreset where
  encode a = genericEncode jsonOptions a

instance defaultPodPreset :: Default PodPreset where
  default = PodPreset
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | PodPresetList is a list of PodPreset objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of schema objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype PodPresetList = PodPresetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PodPreset))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodPresetList :: Newtype PodPresetList _
derive instance genericPodPresetList :: Generic PodPresetList _
instance showPodPresetList :: Show PodPresetList where show a = genericShow a
instance decodePodPresetList :: Decode PodPresetList where
  decode a = genericDecode jsonOptions a 
instance encodePodPresetList :: Encode PodPresetList where
  encode a = genericEncode jsonOptions a

instance defaultPodPresetList :: Default PodPresetList where
  default = PodPresetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PodPresetSpec is a description of a pod preset.
-- |
-- | Fields:
-- | - `env`: Env defines the collection of EnvVar to inject into containers.
-- | - `envFrom`: EnvFrom defines the collection of EnvFromSource to inject into containers.
-- | - `selector`: Selector is a label query over a set of resources, in this case pods. Required.
-- | - `volumeMounts`: VolumeMounts defines the collection of VolumeMount to inject into containers.
-- | - `volumes`: Volumes defines the collection of Volume to inject into the pod.
newtype PodPresetSpec = PodPresetSpec
  { env :: (NullOrUndefined (Array CoreV1.EnvVar))
  , envFrom :: (NullOrUndefined (Array CoreV1.EnvFromSource))
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , volumeMounts :: (NullOrUndefined (Array CoreV1.VolumeMount))
  , volumes :: (NullOrUndefined (Array CoreV1.Volume)) }

derive instance newtypePodPresetSpec :: Newtype PodPresetSpec _
derive instance genericPodPresetSpec :: Generic PodPresetSpec _
instance showPodPresetSpec :: Show PodPresetSpec where show a = genericShow a
instance decodePodPresetSpec :: Decode PodPresetSpec where
  decode a = genericDecode jsonOptions a 
instance encodePodPresetSpec :: Encode PodPresetSpec where
  encode a = genericEncode jsonOptions a

instance defaultPodPresetSpec :: Default PodPresetSpec where
  default = PodPresetSpec
    { env: NullOrUndefined Nothing
    , envFrom: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , volumeMounts: NullOrUndefined Nothing
    , volumes: NullOrUndefined Nothing }

-- | create a PodPreset
createNamespacedPodPreset :: forall e. Config -> PodPreset -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPreset)
createNamespacedPodPreset cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets"
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
newtype DeleteCollectionNamespacedPodPresetOptions = DeleteCollectionNamespacedPodPresetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedPodPresetOptions :: Newtype DeleteCollectionNamespacedPodPresetOptions _
derive instance genericDeleteCollectionNamespacedPodPresetOptions :: Generic DeleteCollectionNamespacedPodPresetOptions _
instance showDeleteCollectionNamespacedPodPresetOptions :: Show DeleteCollectionNamespacedPodPresetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedPodPresetOptions :: Decode DeleteCollectionNamespacedPodPresetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedPodPresetOptions :: Encode DeleteCollectionNamespacedPodPresetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedPodPresetOptions :: Default DeleteCollectionNamespacedPodPresetOptions where
  default = DeleteCollectionNamespacedPodPresetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PodPreset
deleteCollectionNamespacedPodPreset :: forall e. Config -> DeleteCollectionNamespacedPodPresetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedPodPreset cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedPodPresetOptions = DeleteNamespacedPodPresetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedPodPresetOptions :: Newtype DeleteNamespacedPodPresetOptions _
derive instance genericDeleteNamespacedPodPresetOptions :: Generic DeleteNamespacedPodPresetOptions _
instance showDeleteNamespacedPodPresetOptions :: Show DeleteNamespacedPodPresetOptions where show a = genericShow a
instance decodeDeleteNamespacedPodPresetOptions :: Decode DeleteNamespacedPodPresetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedPodPresetOptions :: Encode DeleteNamespacedPodPresetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedPodPresetOptions :: Default DeleteNamespacedPodPresetOptions where
  default = DeleteNamespacedPodPresetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PodPreset
deleteNamespacedPodPreset :: forall e. Config -> MetaV1.DeleteOptions -> DeleteNamespacedPodPresetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedPodPreset cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/"

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
newtype ListNamespacedPodPresetOptions = ListNamespacedPodPresetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedPodPresetOptions :: Newtype ListNamespacedPodPresetOptions _
derive instance genericListNamespacedPodPresetOptions :: Generic ListNamespacedPodPresetOptions _
instance showListNamespacedPodPresetOptions :: Show ListNamespacedPodPresetOptions where show a = genericShow a
instance decodeListNamespacedPodPresetOptions :: Decode ListNamespacedPodPresetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedPodPresetOptions :: Encode ListNamespacedPodPresetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedPodPresetOptions :: Default ListNamespacedPodPresetOptions where
  default = ListNamespacedPodPresetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PodPreset
listNamespacedPodPreset :: forall e. Config -> ListNamespacedPodPresetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPresetList)
listNamespacedPodPreset cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets" <> formatQueryString options

-- | list or watch objects of kind PodPreset
listPodPresetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPresetList)
listPodPresetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/podpresets"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedPodPresetOptions = ReadNamespacedPodPresetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedPodPresetOptions :: Newtype ReadNamespacedPodPresetOptions _
derive instance genericReadNamespacedPodPresetOptions :: Generic ReadNamespacedPodPresetOptions _
instance showReadNamespacedPodPresetOptions :: Show ReadNamespacedPodPresetOptions where show a = genericShow a
instance decodeReadNamespacedPodPresetOptions :: Decode ReadNamespacedPodPresetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedPodPresetOptions :: Encode ReadNamespacedPodPresetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedPodPresetOptions :: Default ReadNamespacedPodPresetOptions where
  default = ReadNamespacedPodPresetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PodPreset
readNamespacedPodPreset :: forall e. Config -> ReadNamespacedPodPresetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPreset)
readNamespacedPodPreset cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets/{name}" <> formatQueryString options

-- | replace the specified PodPreset
replaceNamespacedPodPreset :: forall e. Config -> PodPreset -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPreset)
replaceNamespacedPodPreset cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind PodPreset
watchNamespacedPodPreset :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodPreset cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/watch/namespaces/{namespace}/podpresets/{name}"

-- | watch individual changes to a list of PodPreset
watchNamespacedPodPresetList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodPresetList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/watch/namespaces/{namespace}/podpresets"

-- | watch individual changes to a list of PodPreset
watchPodPresetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodPresetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/watch/podpresets"