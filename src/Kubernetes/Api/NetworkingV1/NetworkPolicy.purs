module Kubernetes.Api.NetworkingV1.NetworkPolicy where

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
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.NetworkingV1 as NetworkingV1

-- | create a NetworkPolicy
createNamespacedNetworkPolicy :: forall e. Config -> NetworkingV1.NetworkPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkingV1.NetworkPolicy)
createNamespacedNetworkPolicy cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies"
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
newtype DeleteCollectionNamespacedNetworkPolicyOptions = DeleteCollectionNamespacedNetworkPolicyOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedNetworkPolicyOptions :: Newtype DeleteCollectionNamespacedNetworkPolicyOptions _
derive instance genericDeleteCollectionNamespacedNetworkPolicyOptions :: Generic DeleteCollectionNamespacedNetworkPolicyOptions _
instance showDeleteCollectionNamespacedNetworkPolicyOptions :: Show DeleteCollectionNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedNetworkPolicyOptions :: Decode DeleteCollectionNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedNetworkPolicyOptions :: Encode DeleteCollectionNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedNetworkPolicyOptions :: Default DeleteCollectionNamespacedNetworkPolicyOptions where
  default = DeleteCollectionNamespacedNetworkPolicyOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of NetworkPolicy
deleteCollectionNamespacedNetworkPolicy :: forall e. Config -> DeleteCollectionNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedNetworkPolicy cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedNetworkPolicyOptions = DeleteNamespacedNetworkPolicyOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedNetworkPolicyOptions :: Newtype DeleteNamespacedNetworkPolicyOptions _
derive instance genericDeleteNamespacedNetworkPolicyOptions :: Generic DeleteNamespacedNetworkPolicyOptions _
instance showDeleteNamespacedNetworkPolicyOptions :: Show DeleteNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeDeleteNamespacedNetworkPolicyOptions :: Decode DeleteNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedNetworkPolicyOptions :: Encode DeleteNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedNetworkPolicyOptions :: Default DeleteNamespacedNetworkPolicyOptions where
  default = DeleteNamespacedNetworkPolicyOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a NetworkPolicy
deleteNamespacedNetworkPolicy :: forall e. Config -> MetaV1.DeleteOptions -> DeleteNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedNetworkPolicy cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies/{name}" <> formatQueryString options
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
newtype ListNamespacedNetworkPolicyOptions = ListNamespacedNetworkPolicyOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedNetworkPolicyOptions :: Newtype ListNamespacedNetworkPolicyOptions _
derive instance genericListNamespacedNetworkPolicyOptions :: Generic ListNamespacedNetworkPolicyOptions _
instance showListNamespacedNetworkPolicyOptions :: Show ListNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeListNamespacedNetworkPolicyOptions :: Decode ListNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedNetworkPolicyOptions :: Encode ListNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedNetworkPolicyOptions :: Default ListNamespacedNetworkPolicyOptions where
  default = ListNamespacedNetworkPolicyOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind NetworkPolicy
listNamespacedNetworkPolicy :: forall e. Config -> ListNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkingV1.NetworkPolicyList)
listNamespacedNetworkPolicy cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies" <> formatQueryString options

-- | list or watch objects of kind NetworkPolicy
listNetworkPolicyForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkingV1.NetworkPolicyList)
listNetworkPolicyForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/networkpolicies"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedNetworkPolicyOptions = ReadNamespacedNetworkPolicyOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedNetworkPolicyOptions :: Newtype ReadNamespacedNetworkPolicyOptions _
derive instance genericReadNamespacedNetworkPolicyOptions :: Generic ReadNamespacedNetworkPolicyOptions _
instance showReadNamespacedNetworkPolicyOptions :: Show ReadNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeReadNamespacedNetworkPolicyOptions :: Decode ReadNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedNetworkPolicyOptions :: Encode ReadNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedNetworkPolicyOptions :: Default ReadNamespacedNetworkPolicyOptions where
  default = ReadNamespacedNetworkPolicyOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified NetworkPolicy
readNamespacedNetworkPolicy :: forall e. Config -> ReadNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkingV1.NetworkPolicy)
readNamespacedNetworkPolicy cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies/{name}" <> formatQueryString options

-- | replace the specified NetworkPolicy
replaceNamespacedNetworkPolicy :: forall e. Config -> NetworkingV1.NetworkPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkingV1.NetworkPolicy)
replaceNamespacedNetworkPolicy cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind NetworkPolicy
watchNamespacedNetworkPolicy :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedNetworkPolicy cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/watch/namespaces/{namespace}/networkpolicies/{name}"

-- | watch individual changes to a list of NetworkPolicy
watchNamespacedNetworkPolicyList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedNetworkPolicyList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/watch/namespaces/{namespace}/networkpolicies"

-- | watch individual changes to a list of NetworkPolicy
watchNetworkPolicyListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNetworkPolicyListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/watch/networkpolicies"