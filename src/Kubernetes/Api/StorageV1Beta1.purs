module Kubernetes.Api.StorageV1Beta1 where

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

-- | StorageClass describes the parameters for a class of storage for which PersistentVolumes can be dynamically provisioned.
-- | 
-- | StorageClasses are non-namespaced; the name of the storage class according to etcd is in ObjectMeta.Name.
-- |
-- | Fields:
-- | - `allowVolumeExpansion`: AllowVolumeExpansion shows whether the storage class allow volume expand
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `mountOptions`: Dynamically provisioned PersistentVolumes of this storage class are created with these mountOptions, e.g. ["ro", "soft"]. Not validated - mount of the PVs will simply fail if one is invalid.
-- | - `parameters`: Parameters holds the parameters for the provisioner that should create volumes of this storage class.
-- | - `provisioner`: Provisioner indicates the type of the provisioner.
-- | - `reclaimPolicy`: Dynamically provisioned PersistentVolumes of this storage class are created with this reclaimPolicy. Defaults to Delete.
-- | - `volumeBindingMode`: VolumeBindingMode indicates how PersistentVolumeClaims should be provisioned and bound.  When unset, VolumeBindingImmediate is used. This field is alpha-level and is only honored by servers that enable the VolumeScheduling feature.
newtype StorageClass = StorageClass
  { allowVolumeExpansion :: (NullOrUndefined Boolean)
  , apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , mountOptions :: (NullOrUndefined (Array String))
  , parameters :: (NullOrUndefined (StrMap String))
  , provisioner :: (NullOrUndefined String)
  , reclaimPolicy :: (NullOrUndefined String)
  , volumeBindingMode :: (NullOrUndefined String) }

derive instance newtypeStorageClass :: Newtype StorageClass _
derive instance genericStorageClass :: Generic StorageClass _
instance showStorageClass :: Show StorageClass where show a = genericShow a
instance decodeStorageClass :: Decode StorageClass where
  decode a = genericDecode jsonOptions a 
instance encodeStorageClass :: Encode StorageClass where
  encode a = genericEncode jsonOptions a

instance defaultStorageClass :: Default StorageClass where
  default = StorageClass
    { allowVolumeExpansion: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , mountOptions: NullOrUndefined Nothing
    , parameters: NullOrUndefined Nothing
    , provisioner: NullOrUndefined Nothing
    , reclaimPolicy: NullOrUndefined Nothing
    , volumeBindingMode: NullOrUndefined Nothing }

-- | StorageClassList is a collection of storage classes.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of StorageClasses
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype StorageClassList = StorageClassList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array StorageClass))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeStorageClassList :: Newtype StorageClassList _
derive instance genericStorageClassList :: Generic StorageClassList _
instance showStorageClassList :: Show StorageClassList where show a = genericShow a
instance decodeStorageClassList :: Decode StorageClassList where
  decode a = genericDecode jsonOptions a 
instance encodeStorageClassList :: Encode StorageClassList where
  encode a = genericEncode jsonOptions a

instance defaultStorageClassList :: Default StorageClassList where
  default = StorageClassList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | create a StorageClass
createStorageClass :: forall e. Config -> StorageClass -> Aff (http :: HTTP | e) (Either MetaV1.Status StorageClass)
createStorageClass cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses"
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
newtype DeleteCollectionStorageClassOptions = DeleteCollectionStorageClassOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionStorageClassOptions :: Newtype DeleteCollectionStorageClassOptions _
derive instance genericDeleteCollectionStorageClassOptions :: Generic DeleteCollectionStorageClassOptions _
instance showDeleteCollectionStorageClassOptions :: Show DeleteCollectionStorageClassOptions where show a = genericShow a
instance decodeDeleteCollectionStorageClassOptions :: Decode DeleteCollectionStorageClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionStorageClassOptions :: Encode DeleteCollectionStorageClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionStorageClassOptions :: Default DeleteCollectionStorageClassOptions where
  default = DeleteCollectionStorageClassOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of StorageClass
deleteCollectionStorageClass :: forall e. Config -> DeleteCollectionStorageClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionStorageClass cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteStorageClassOptions = DeleteStorageClassOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteStorageClassOptions :: Newtype DeleteStorageClassOptions _
derive instance genericDeleteStorageClassOptions :: Generic DeleteStorageClassOptions _
instance showDeleteStorageClassOptions :: Show DeleteStorageClassOptions where show a = genericShow a
instance decodeDeleteStorageClassOptions :: Decode DeleteStorageClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteStorageClassOptions :: Encode DeleteStorageClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteStorageClassOptions :: Default DeleteStorageClassOptions where
  default = DeleteStorageClassOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a StorageClass
deleteStorageClass :: forall e. Config -> MetaV1.DeleteOptions -> DeleteStorageClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteStorageClass cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/"

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
newtype ListStorageClassOptions = ListStorageClassOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListStorageClassOptions :: Newtype ListStorageClassOptions _
derive instance genericListStorageClassOptions :: Generic ListStorageClassOptions _
instance showListStorageClassOptions :: Show ListStorageClassOptions where show a = genericShow a
instance decodeListStorageClassOptions :: Decode ListStorageClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListStorageClassOptions :: Encode ListStorageClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultListStorageClassOptions :: Default ListStorageClassOptions where
  default = ListStorageClassOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind StorageClass
listStorageClass :: forall e. Config -> ListStorageClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status StorageClassList)
listStorageClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadStorageClassOptions = ReadStorageClassOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadStorageClassOptions :: Newtype ReadStorageClassOptions _
derive instance genericReadStorageClassOptions :: Generic ReadStorageClassOptions _
instance showReadStorageClassOptions :: Show ReadStorageClassOptions where show a = genericShow a
instance decodeReadStorageClassOptions :: Decode ReadStorageClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadStorageClassOptions :: Encode ReadStorageClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadStorageClassOptions :: Default ReadStorageClassOptions where
  default = ReadStorageClassOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified StorageClass
readStorageClass :: forall e. Config -> ReadStorageClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status StorageClass)
readStorageClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses/{name}" <> formatQueryString options

-- | replace the specified StorageClass
replaceStorageClass :: forall e. Config -> StorageClass -> Aff (http :: HTTP | e) (Either MetaV1.Status StorageClass)
replaceStorageClass cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind StorageClass
watchStorageClass :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchStorageClass cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/watch/storageclasses/{name}"

-- | watch individual changes to a list of StorageClass
watchStorageClassList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchStorageClassList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/watch/storageclasses"