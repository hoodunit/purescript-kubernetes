module Kubernetes.Api.AppsV1Beta2.DaemonSet where

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
import Kubernetes.Api.AppsV1Beta2 as AppsV1Beta2
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a DaemonSet
createNamespacedDaemonSet :: forall e. Config -> String -> AppsV1Beta2.DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DaemonSet)
createNamespacedDaemonSet cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/daemonsets"
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
newtype DeleteCollectionNamespacedDaemonSetOptions = DeleteCollectionNamespacedDaemonSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedDaemonSetOptions :: Newtype DeleteCollectionNamespacedDaemonSetOptions _
derive instance genericDeleteCollectionNamespacedDaemonSetOptions :: Generic DeleteCollectionNamespacedDaemonSetOptions _
instance showDeleteCollectionNamespacedDaemonSetOptions :: Show DeleteCollectionNamespacedDaemonSetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedDaemonSetOptions :: Decode DeleteCollectionNamespacedDaemonSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedDaemonSetOptions :: Encode DeleteCollectionNamespacedDaemonSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedDaemonSetOptions :: Default DeleteCollectionNamespacedDaemonSetOptions where
  default = DeleteCollectionNamespacedDaemonSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of DaemonSet
deleteCollectionNamespacedDaemonSet :: forall e. Config -> String -> DeleteCollectionNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedDaemonSet cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/daemonsets" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedDaemonSetOptions = DeleteNamespacedDaemonSetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedDaemonSetOptions :: Newtype DeleteNamespacedDaemonSetOptions _
derive instance genericDeleteNamespacedDaemonSetOptions :: Generic DeleteNamespacedDaemonSetOptions _
instance showDeleteNamespacedDaemonSetOptions :: Show DeleteNamespacedDaemonSetOptions where show a = genericShow a
instance decodeDeleteNamespacedDaemonSetOptions :: Decode DeleteNamespacedDaemonSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedDaemonSetOptions :: Encode DeleteNamespacedDaemonSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedDaemonSetOptions :: Default DeleteNamespacedDaemonSetOptions where
  default = DeleteNamespacedDaemonSetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a DaemonSet
deleteNamespacedDaemonSet :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedDaemonSet cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/daemonsets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | list or watch objects of kind DaemonSet
listDaemonSetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DaemonSetList)
listDaemonSetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/daemonsets"

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
newtype ListNamespacedDaemonSetOptions = ListNamespacedDaemonSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedDaemonSetOptions :: Newtype ListNamespacedDaemonSetOptions _
derive instance genericListNamespacedDaemonSetOptions :: Generic ListNamespacedDaemonSetOptions _
instance showListNamespacedDaemonSetOptions :: Show ListNamespacedDaemonSetOptions where show a = genericShow a
instance decodeListNamespacedDaemonSetOptions :: Decode ListNamespacedDaemonSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedDaemonSetOptions :: Encode ListNamespacedDaemonSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedDaemonSetOptions :: Default ListNamespacedDaemonSetOptions where
  default = ListNamespacedDaemonSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind DaemonSet
listNamespacedDaemonSet :: forall e. Config -> String -> ListNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DaemonSetList)
listNamespacedDaemonSet cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/daemonsets" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedDaemonSetOptions = ReadNamespacedDaemonSetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedDaemonSetOptions :: Newtype ReadNamespacedDaemonSetOptions _
derive instance genericReadNamespacedDaemonSetOptions :: Generic ReadNamespacedDaemonSetOptions _
instance showReadNamespacedDaemonSetOptions :: Show ReadNamespacedDaemonSetOptions where show a = genericShow a
instance decodeReadNamespacedDaemonSetOptions :: Decode ReadNamespacedDaemonSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedDaemonSetOptions :: Encode ReadNamespacedDaemonSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedDaemonSetOptions :: Default ReadNamespacedDaemonSetOptions where
  default = ReadNamespacedDaemonSetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified DaemonSet
readNamespacedDaemonSet :: forall e. Config -> String -> String -> ReadNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DaemonSet)
readNamespacedDaemonSet cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/daemonsets/" <> name <> "" <> formatQueryString options

-- | read status of the specified DaemonSet
readNamespacedDaemonSetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DaemonSet)
readNamespacedDaemonSetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/daemonsets/" <> name <> "/status"

-- | replace the specified DaemonSet
replaceNamespacedDaemonSet :: forall e. Config -> String -> String -> AppsV1Beta2.DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DaemonSet)
replaceNamespacedDaemonSet cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/daemonsets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified DaemonSet
replaceNamespacedDaemonSetStatus :: forall e. Config -> String -> String -> AppsV1Beta2.DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DaemonSet)
replaceNamespacedDaemonSetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/daemonsets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of DaemonSet
watchDaemonSetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchDaemonSetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/watch/daemonsets"

-- | watch changes to an object of kind DaemonSet
watchNamespacedDaemonSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDaemonSet cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/watch/namespaces/" <> namespace <> "/daemonsets/" <> name <> ""

-- | watch individual changes to a list of DaemonSet
watchNamespacedDaemonSetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDaemonSetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/watch/namespaces/" <> namespace <> "/daemonsets"