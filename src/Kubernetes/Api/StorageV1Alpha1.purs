module Kubernetes.Api.StorageV1Alpha1 where

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

-- | VolumeAttachment captures the intent to attach or detach the specified volume to/from the specified node.
-- | 
-- | VolumeAttachment objects are non-namespaced.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired attach/detach volume behavior. Populated by the Kubernetes system.
-- | - `status`: Status of the VolumeAttachment request. Populated by the entity completing the attach or detach operation, i.e. the external-attacher.
newtype VolumeAttachment = VolumeAttachment
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined VolumeAttachmentSpec)
  , status :: (NullOrUndefined VolumeAttachmentStatus) }

derive instance newtypeVolumeAttachment :: Newtype VolumeAttachment _
derive instance genericVolumeAttachment :: Generic VolumeAttachment _
instance showVolumeAttachment :: Show VolumeAttachment where show a = genericShow a
instance decodeVolumeAttachment :: Decode VolumeAttachment where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachment :: Encode VolumeAttachment where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachment :: Default VolumeAttachment where
  default = VolumeAttachment
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | VolumeAttachmentList is a collection of VolumeAttachment objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of VolumeAttachments
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype VolumeAttachmentList = VolumeAttachmentList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array VolumeAttachment))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeVolumeAttachmentList :: Newtype VolumeAttachmentList _
derive instance genericVolumeAttachmentList :: Generic VolumeAttachmentList _
instance showVolumeAttachmentList :: Show VolumeAttachmentList where show a = genericShow a
instance decodeVolumeAttachmentList :: Decode VolumeAttachmentList where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachmentList :: Encode VolumeAttachmentList where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachmentList :: Default VolumeAttachmentList where
  default = VolumeAttachmentList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | VolumeAttachmentSource represents a volume that should be attached. Right now only PersistenVolumes can be attached via external attacher, in future we may allow also inline volumes in pods. Exactly one member can be set.
-- |
-- | Fields:
-- | - `persistentVolumeName`: Name of the persistent volume to attach.
newtype VolumeAttachmentSource = VolumeAttachmentSource
  { persistentVolumeName :: (NullOrUndefined String) }

derive instance newtypeVolumeAttachmentSource :: Newtype VolumeAttachmentSource _
derive instance genericVolumeAttachmentSource :: Generic VolumeAttachmentSource _
instance showVolumeAttachmentSource :: Show VolumeAttachmentSource where show a = genericShow a
instance decodeVolumeAttachmentSource :: Decode VolumeAttachmentSource where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachmentSource :: Encode VolumeAttachmentSource where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachmentSource :: Default VolumeAttachmentSource where
  default = VolumeAttachmentSource
    { persistentVolumeName: NullOrUndefined Nothing }

-- | VolumeAttachmentSpec is the specification of a VolumeAttachment request.
-- |
-- | Fields:
-- | - `attacher`: Attacher indicates the name of the volume driver that MUST handle this request. This is the name returned by GetPluginName().
-- | - `nodeName`: The node that the volume should be attached to.
-- | - `source`: Source represents the volume that should be attached.
newtype VolumeAttachmentSpec = VolumeAttachmentSpec
  { attacher :: (NullOrUndefined String)
  , nodeName :: (NullOrUndefined String)
  , source :: (NullOrUndefined VolumeAttachmentSource) }

derive instance newtypeVolumeAttachmentSpec :: Newtype VolumeAttachmentSpec _
derive instance genericVolumeAttachmentSpec :: Generic VolumeAttachmentSpec _
instance showVolumeAttachmentSpec :: Show VolumeAttachmentSpec where show a = genericShow a
instance decodeVolumeAttachmentSpec :: Decode VolumeAttachmentSpec where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachmentSpec :: Encode VolumeAttachmentSpec where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachmentSpec :: Default VolumeAttachmentSpec where
  default = VolumeAttachmentSpec
    { attacher: NullOrUndefined Nothing
    , nodeName: NullOrUndefined Nothing
    , source: NullOrUndefined Nothing }

-- | VolumeAttachmentStatus is the status of a VolumeAttachment request.
-- |
-- | Fields:
-- | - `attachError`: The last error encountered during attach operation, if any. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
-- | - `attached`: Indicates the volume is successfully attached. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
-- | - `attachmentMetadata`: Upon successful attach, this field is populated with any information returned by the attach operation that must be passed into subsequent WaitForAttach or Mount calls. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
-- | - `detachError`: The last error encountered during detach operation, if any. This field must only be set by the entity completing the detach operation, i.e. the external-attacher.
newtype VolumeAttachmentStatus = VolumeAttachmentStatus
  { attachError :: (NullOrUndefined VolumeError)
  , attached :: (NullOrUndefined Boolean)
  , attachmentMetadata :: (NullOrUndefined (StrMap String))
  , detachError :: (NullOrUndefined VolumeError) }

derive instance newtypeVolumeAttachmentStatus :: Newtype VolumeAttachmentStatus _
derive instance genericVolumeAttachmentStatus :: Generic VolumeAttachmentStatus _
instance showVolumeAttachmentStatus :: Show VolumeAttachmentStatus where show a = genericShow a
instance decodeVolumeAttachmentStatus :: Decode VolumeAttachmentStatus where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachmentStatus :: Encode VolumeAttachmentStatus where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachmentStatus :: Default VolumeAttachmentStatus where
  default = VolumeAttachmentStatus
    { attachError: NullOrUndefined Nothing
    , attached: NullOrUndefined Nothing
    , attachmentMetadata: NullOrUndefined Nothing
    , detachError: NullOrUndefined Nothing }

-- | VolumeError captures an error encountered during a volume operation.
-- |
-- | Fields:
-- | - `message`: String detailing the error encountered during Attach or Detach operation. This string maybe logged, so it should not contain sensitive information.
-- | - `time`: Time the error was encountered.
newtype VolumeError = VolumeError
  { message :: (NullOrUndefined String)
  , time :: (NullOrUndefined MetaV1.Time) }

derive instance newtypeVolumeError :: Newtype VolumeError _
derive instance genericVolumeError :: Generic VolumeError _
instance showVolumeError :: Show VolumeError where show a = genericShow a
instance decodeVolumeError :: Decode VolumeError where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeError :: Encode VolumeError where
  encode a = genericEncode jsonOptions a

instance defaultVolumeError :: Default VolumeError where
  default = VolumeError
    { message: NullOrUndefined Nothing
    , time: NullOrUndefined Nothing }

-- | create a VolumeAttachment
createVolumeAttachment :: forall e. Config -> VolumeAttachment -> Aff (http :: HTTP | e) (Either MetaV1.Status VolumeAttachment)
createVolumeAttachment cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments"
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
newtype DeleteCollectionVolumeAttachmentOptions = DeleteCollectionVolumeAttachmentOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionVolumeAttachmentOptions :: Newtype DeleteCollectionVolumeAttachmentOptions _
derive instance genericDeleteCollectionVolumeAttachmentOptions :: Generic DeleteCollectionVolumeAttachmentOptions _
instance showDeleteCollectionVolumeAttachmentOptions :: Show DeleteCollectionVolumeAttachmentOptions where show a = genericShow a
instance decodeDeleteCollectionVolumeAttachmentOptions :: Decode DeleteCollectionVolumeAttachmentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionVolumeAttachmentOptions :: Encode DeleteCollectionVolumeAttachmentOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionVolumeAttachmentOptions :: Default DeleteCollectionVolumeAttachmentOptions where
  default = DeleteCollectionVolumeAttachmentOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of VolumeAttachment
deleteCollectionVolumeAttachment :: forall e. Config -> DeleteCollectionVolumeAttachmentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionVolumeAttachment cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteVolumeAttachmentOptions = DeleteVolumeAttachmentOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteVolumeAttachmentOptions :: Newtype DeleteVolumeAttachmentOptions _
derive instance genericDeleteVolumeAttachmentOptions :: Generic DeleteVolumeAttachmentOptions _
instance showDeleteVolumeAttachmentOptions :: Show DeleteVolumeAttachmentOptions where show a = genericShow a
instance decodeDeleteVolumeAttachmentOptions :: Decode DeleteVolumeAttachmentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteVolumeAttachmentOptions :: Encode DeleteVolumeAttachmentOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteVolumeAttachmentOptions :: Default DeleteVolumeAttachmentOptions where
  default = DeleteVolumeAttachmentOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a VolumeAttachment
deleteVolumeAttachment :: forall e. Config -> MetaV1.DeleteOptions -> DeleteVolumeAttachmentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteVolumeAttachment cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/"

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
newtype ListVolumeAttachmentOptions = ListVolumeAttachmentOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListVolumeAttachmentOptions :: Newtype ListVolumeAttachmentOptions _
derive instance genericListVolumeAttachmentOptions :: Generic ListVolumeAttachmentOptions _
instance showListVolumeAttachmentOptions :: Show ListVolumeAttachmentOptions where show a = genericShow a
instance decodeListVolumeAttachmentOptions :: Decode ListVolumeAttachmentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListVolumeAttachmentOptions :: Encode ListVolumeAttachmentOptions where
  encode a = genericEncode jsonOptions a

instance defaultListVolumeAttachmentOptions :: Default ListVolumeAttachmentOptions where
  default = ListVolumeAttachmentOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind VolumeAttachment
listVolumeAttachment :: forall e. Config -> ListVolumeAttachmentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status VolumeAttachmentList)
listVolumeAttachment cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadVolumeAttachmentOptions = ReadVolumeAttachmentOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadVolumeAttachmentOptions :: Newtype ReadVolumeAttachmentOptions _
derive instance genericReadVolumeAttachmentOptions :: Generic ReadVolumeAttachmentOptions _
instance showReadVolumeAttachmentOptions :: Show ReadVolumeAttachmentOptions where show a = genericShow a
instance decodeReadVolumeAttachmentOptions :: Decode ReadVolumeAttachmentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadVolumeAttachmentOptions :: Encode ReadVolumeAttachmentOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadVolumeAttachmentOptions :: Default ReadVolumeAttachmentOptions where
  default = ReadVolumeAttachmentOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified VolumeAttachment
readVolumeAttachment :: forall e. Config -> ReadVolumeAttachmentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status VolumeAttachment)
readVolumeAttachment cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments/{name}" <> formatQueryString options

-- | replace the specified VolumeAttachment
replaceVolumeAttachment :: forall e. Config -> VolumeAttachment -> Aff (http :: HTTP | e) (Either MetaV1.Status VolumeAttachment)
replaceVolumeAttachment cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind VolumeAttachment
watchVolumeAttachment :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchVolumeAttachment cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/watch/volumeattachments/{name}"

-- | watch individual changes to a list of VolumeAttachment
watchVolumeAttachmentList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchVolumeAttachmentList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/watch/volumeattachments"