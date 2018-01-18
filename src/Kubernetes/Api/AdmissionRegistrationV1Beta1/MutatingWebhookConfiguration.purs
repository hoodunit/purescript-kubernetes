module Kubernetes.Api.AdmissionRegistrationV1Beta1.MutatingWebhookConfiguration where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Kubernetes.Api.AdmissionRegistrationV1Beta1 as AdmissionRegistrationV1Beta1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a MutatingWebhookConfiguration
createMutatingWebhookConfiguration :: forall e. Config -> AdmissionRegistrationV1Beta1.MutatingWebhookConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status AdmissionRegistrationV1Beta1.MutatingWebhookConfiguration)
createMutatingWebhookConfiguration cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations"
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
newtype DeleteCollectionMutatingWebhookConfigurationOptions = DeleteCollectionMutatingWebhookConfigurationOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionMutatingWebhookConfigurationOptions :: Newtype DeleteCollectionMutatingWebhookConfigurationOptions _
derive instance genericDeleteCollectionMutatingWebhookConfigurationOptions :: Generic DeleteCollectionMutatingWebhookConfigurationOptions _
instance showDeleteCollectionMutatingWebhookConfigurationOptions :: Show DeleteCollectionMutatingWebhookConfigurationOptions where show a = genericShow a
instance decodeDeleteCollectionMutatingWebhookConfigurationOptions :: Decode DeleteCollectionMutatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionMutatingWebhookConfigurationOptions :: Encode DeleteCollectionMutatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionMutatingWebhookConfigurationOptions :: Default DeleteCollectionMutatingWebhookConfigurationOptions where
  default = DeleteCollectionMutatingWebhookConfigurationOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of MutatingWebhookConfiguration
deleteCollectionMutatingWebhookConfiguration :: forall e. Config -> DeleteCollectionMutatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionMutatingWebhookConfiguration cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteMutatingWebhookConfigurationOptions = DeleteMutatingWebhookConfigurationOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteMutatingWebhookConfigurationOptions :: Newtype DeleteMutatingWebhookConfigurationOptions _
derive instance genericDeleteMutatingWebhookConfigurationOptions :: Generic DeleteMutatingWebhookConfigurationOptions _
instance showDeleteMutatingWebhookConfigurationOptions :: Show DeleteMutatingWebhookConfigurationOptions where show a = genericShow a
instance decodeDeleteMutatingWebhookConfigurationOptions :: Decode DeleteMutatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteMutatingWebhookConfigurationOptions :: Encode DeleteMutatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteMutatingWebhookConfigurationOptions :: Default DeleteMutatingWebhookConfigurationOptions where
  default = DeleteMutatingWebhookConfigurationOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a MutatingWebhookConfiguration
deleteMutatingWebhookConfiguration :: forall e. Config -> MetaV1.DeleteOptions -> DeleteMutatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteMutatingWebhookConfiguration cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations/{name}" <> formatQueryString options
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
newtype ListMutatingWebhookConfigurationOptions = ListMutatingWebhookConfigurationOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListMutatingWebhookConfigurationOptions :: Newtype ListMutatingWebhookConfigurationOptions _
derive instance genericListMutatingWebhookConfigurationOptions :: Generic ListMutatingWebhookConfigurationOptions _
instance showListMutatingWebhookConfigurationOptions :: Show ListMutatingWebhookConfigurationOptions where show a = genericShow a
instance decodeListMutatingWebhookConfigurationOptions :: Decode ListMutatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListMutatingWebhookConfigurationOptions :: Encode ListMutatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultListMutatingWebhookConfigurationOptions :: Default ListMutatingWebhookConfigurationOptions where
  default = ListMutatingWebhookConfigurationOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind MutatingWebhookConfiguration
listMutatingWebhookConfiguration :: forall e. Config -> ListMutatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AdmissionRegistrationV1Beta1.MutatingWebhookConfigurationList)
listMutatingWebhookConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadMutatingWebhookConfigurationOptions = ReadMutatingWebhookConfigurationOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadMutatingWebhookConfigurationOptions :: Newtype ReadMutatingWebhookConfigurationOptions _
derive instance genericReadMutatingWebhookConfigurationOptions :: Generic ReadMutatingWebhookConfigurationOptions _
instance showReadMutatingWebhookConfigurationOptions :: Show ReadMutatingWebhookConfigurationOptions where show a = genericShow a
instance decodeReadMutatingWebhookConfigurationOptions :: Decode ReadMutatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadMutatingWebhookConfigurationOptions :: Encode ReadMutatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadMutatingWebhookConfigurationOptions :: Default ReadMutatingWebhookConfigurationOptions where
  default = ReadMutatingWebhookConfigurationOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified MutatingWebhookConfiguration
readMutatingWebhookConfiguration :: forall e. Config -> ReadMutatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AdmissionRegistrationV1Beta1.MutatingWebhookConfiguration)
readMutatingWebhookConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations/{name}" <> formatQueryString options

-- | replace the specified MutatingWebhookConfiguration
replaceMutatingWebhookConfiguration :: forall e. Config -> AdmissionRegistrationV1Beta1.MutatingWebhookConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status AdmissionRegistrationV1Beta1.MutatingWebhookConfiguration)
replaceMutatingWebhookConfiguration cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind MutatingWebhookConfiguration
watchMutatingWebhookConfiguration :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchMutatingWebhookConfiguration cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/watch/mutatingwebhookconfigurations/{name}"

-- | watch individual changes to a list of MutatingWebhookConfiguration
watchMutatingWebhookConfigurationList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchMutatingWebhookConfigurationList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/watch/mutatingwebhookconfigurations"