module Kubernetes.Api.SchedulingV1Alpha1 where

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

-- | PriorityClass defines mapping from a priority class name to the priority integer value. The value can be any valid integer.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `description`: description is an arbitrary string that usually provides guidelines on when this priority class should be used.
-- | - `globalDefault`: globalDefault specifies whether this PriorityClass should be considered as the default priority for pods that do not have any priority class.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#metadata
-- | - `value`: The value of this priority class. This is the actual priority that pods receive when they have the name of this class in their pod spec.
newtype PriorityClass = PriorityClass
  { apiVersion :: (NullOrUndefined String)
  , description :: (NullOrUndefined String)
  , globalDefault :: (NullOrUndefined Boolean)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , value :: (NullOrUndefined Int) }

derive instance newtypePriorityClass :: Newtype PriorityClass _
derive instance genericPriorityClass :: Generic PriorityClass _
instance showPriorityClass :: Show PriorityClass where show a = genericShow a
instance decodePriorityClass :: Decode PriorityClass where
  decode a = genericDecode jsonOptions a 
instance encodePriorityClass :: Encode PriorityClass where
  encode a = genericEncode jsonOptions a

instance defaultPriorityClass :: Default PriorityClass where
  default = PriorityClass
    { apiVersion: NullOrUndefined Nothing
    , description: NullOrUndefined Nothing
    , globalDefault: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | PriorityClassList is a collection of priority classes.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: items is the list of PriorityClasses
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#metadata
newtype PriorityClassList = PriorityClassList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PriorityClass))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePriorityClassList :: Newtype PriorityClassList _
derive instance genericPriorityClassList :: Generic PriorityClassList _
instance showPriorityClassList :: Show PriorityClassList where show a = genericShow a
instance decodePriorityClassList :: Decode PriorityClassList where
  decode a = genericDecode jsonOptions a 
instance encodePriorityClassList :: Encode PriorityClassList where
  encode a = genericEncode jsonOptions a

instance defaultPriorityClassList :: Default PriorityClassList where
  default = PriorityClassList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | create a PriorityClass
createPriorityClass :: forall e. Config -> PriorityClass -> Aff (http :: HTTP | e) (Either MetaV1.Status PriorityClass)
createPriorityClass cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses"
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
newtype DeleteCollectionPriorityClassOptions = DeleteCollectionPriorityClassOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionPriorityClassOptions :: Newtype DeleteCollectionPriorityClassOptions _
derive instance genericDeleteCollectionPriorityClassOptions :: Generic DeleteCollectionPriorityClassOptions _
instance showDeleteCollectionPriorityClassOptions :: Show DeleteCollectionPriorityClassOptions where show a = genericShow a
instance decodeDeleteCollectionPriorityClassOptions :: Decode DeleteCollectionPriorityClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionPriorityClassOptions :: Encode DeleteCollectionPriorityClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionPriorityClassOptions :: Default DeleteCollectionPriorityClassOptions where
  default = DeleteCollectionPriorityClassOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PriorityClass
deleteCollectionPriorityClass :: forall e. Config -> DeleteCollectionPriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionPriorityClass cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeletePriorityClassOptions = DeletePriorityClassOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeletePriorityClassOptions :: Newtype DeletePriorityClassOptions _
derive instance genericDeletePriorityClassOptions :: Generic DeletePriorityClassOptions _
instance showDeletePriorityClassOptions :: Show DeletePriorityClassOptions where show a = genericShow a
instance decodeDeletePriorityClassOptions :: Decode DeletePriorityClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeletePriorityClassOptions :: Encode DeletePriorityClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeletePriorityClassOptions :: Default DeletePriorityClassOptions where
  default = DeletePriorityClassOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PriorityClass
deletePriorityClass :: forall e. Config -> MetaV1.DeleteOptions -> DeletePriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deletePriorityClass cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/"

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
newtype ListPriorityClassOptions = ListPriorityClassOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListPriorityClassOptions :: Newtype ListPriorityClassOptions _
derive instance genericListPriorityClassOptions :: Generic ListPriorityClassOptions _
instance showListPriorityClassOptions :: Show ListPriorityClassOptions where show a = genericShow a
instance decodeListPriorityClassOptions :: Decode ListPriorityClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListPriorityClassOptions :: Encode ListPriorityClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultListPriorityClassOptions :: Default ListPriorityClassOptions where
  default = ListPriorityClassOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PriorityClass
listPriorityClass :: forall e. Config -> ListPriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PriorityClassList)
listPriorityClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadPriorityClassOptions = ReadPriorityClassOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadPriorityClassOptions :: Newtype ReadPriorityClassOptions _
derive instance genericReadPriorityClassOptions :: Generic ReadPriorityClassOptions _
instance showReadPriorityClassOptions :: Show ReadPriorityClassOptions where show a = genericShow a
instance decodeReadPriorityClassOptions :: Decode ReadPriorityClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadPriorityClassOptions :: Encode ReadPriorityClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadPriorityClassOptions :: Default ReadPriorityClassOptions where
  default = ReadPriorityClassOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PriorityClass
readPriorityClass :: forall e. Config -> ReadPriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PriorityClass)
readPriorityClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses/{name}" <> formatQueryString options

-- | replace the specified PriorityClass
replacePriorityClass :: forall e. Config -> PriorityClass -> Aff (http :: HTTP | e) (Either MetaV1.Status PriorityClass)
replacePriorityClass cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind PriorityClass
watchPriorityClass :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPriorityClass cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/watch/priorityclasses/{name}"

-- | watch individual changes to a list of PriorityClass
watchPriorityClassList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPriorityClassList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/watch/priorityclasses"