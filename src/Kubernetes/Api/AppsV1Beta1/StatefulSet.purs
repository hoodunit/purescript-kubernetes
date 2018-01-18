module Kubernetes.Api.AppsV1Beta1.StatefulSet where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Kubernetes.Api.AppsV1Beta1 as AppsV1Beta1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a StatefulSet
createNamespacedStatefulSet :: forall e. Config -> String -> AppsV1Beta1.StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.StatefulSet)
createNamespacedStatefulSet cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets"
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
newtype DeleteCollectionNamespacedStatefulSetOptions = DeleteCollectionNamespacedStatefulSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedStatefulSetOptions :: Newtype DeleteCollectionNamespacedStatefulSetOptions _
derive instance genericDeleteCollectionNamespacedStatefulSetOptions :: Generic DeleteCollectionNamespacedStatefulSetOptions _
instance showDeleteCollectionNamespacedStatefulSetOptions :: Show DeleteCollectionNamespacedStatefulSetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedStatefulSetOptions :: Decode DeleteCollectionNamespacedStatefulSetOptions where
  decode a = do
               continue <- readProp "continue" a >>= decode
               fieldSelector <- readProp "fieldSelector" a >>= decode
               includeUninitialized <- readProp "includeUninitialized" a >>= decode
               labelSelector <- readProp "labelSelector" a >>= decode
               limit <- readProp "limit" a >>= decode
               resourceVersion <- readProp "resourceVersion" a >>= decode
               timeoutSeconds <- readProp "timeoutSeconds" a >>= decode
               watch <- readProp "watch" a >>= decode
               pure $ DeleteCollectionNamespacedStatefulSetOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionNamespacedStatefulSetOptions :: Encode DeleteCollectionNamespacedStatefulSetOptions where
  encode (DeleteCollectionNamespacedStatefulSetOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encode a.continue)
               , Tuple "fieldSelector" (encode a.fieldSelector)
               , Tuple "includeUninitialized" (encode a.includeUninitialized)
               , Tuple "labelSelector" (encode a.labelSelector)
               , Tuple "limit" (encode a.limit)
               , Tuple "resourceVersion" (encode a.resourceVersion)
               , Tuple "timeoutSeconds" (encode a.timeoutSeconds)
               , Tuple "watch" (encode a.watch) ]


instance defaultDeleteCollectionNamespacedStatefulSetOptions :: Default DeleteCollectionNamespacedStatefulSetOptions where
  default = DeleteCollectionNamespacedStatefulSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of StatefulSet
deleteCollectionNamespacedStatefulSet :: forall e. Config -> String -> DeleteCollectionNamespacedStatefulSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedStatefulSet cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedStatefulSetOptions = DeleteNamespacedStatefulSetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedStatefulSetOptions :: Newtype DeleteNamespacedStatefulSetOptions _
derive instance genericDeleteNamespacedStatefulSetOptions :: Generic DeleteNamespacedStatefulSetOptions _
instance showDeleteNamespacedStatefulSetOptions :: Show DeleteNamespacedStatefulSetOptions where show a = genericShow a
instance decodeDeleteNamespacedStatefulSetOptions :: Decode DeleteNamespacedStatefulSetOptions where
  decode a = do
               gracePeriodSeconds <- readProp "gracePeriodSeconds" a >>= decode
               orphanDependents <- readProp "orphanDependents" a >>= decode
               propagationPolicy <- readProp "propagationPolicy" a >>= decode
               pure $ DeleteNamespacedStatefulSetOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteNamespacedStatefulSetOptions :: Encode DeleteNamespacedStatefulSetOptions where
  encode (DeleteNamespacedStatefulSetOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encode a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encode a.orphanDependents)
               , Tuple "propagationPolicy" (encode a.propagationPolicy) ]


instance defaultDeleteNamespacedStatefulSetOptions :: Default DeleteNamespacedStatefulSetOptions where
  default = DeleteNamespacedStatefulSetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a StatefulSet
deleteNamespacedStatefulSet :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedStatefulSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedStatefulSet cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "" <> formatQueryString options
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
newtype ListNamespacedStatefulSetOptions = ListNamespacedStatefulSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedStatefulSetOptions :: Newtype ListNamespacedStatefulSetOptions _
derive instance genericListNamespacedStatefulSetOptions :: Generic ListNamespacedStatefulSetOptions _
instance showListNamespacedStatefulSetOptions :: Show ListNamespacedStatefulSetOptions where show a = genericShow a
instance decodeListNamespacedStatefulSetOptions :: Decode ListNamespacedStatefulSetOptions where
  decode a = do
               continue <- readProp "continue" a >>= decode
               fieldSelector <- readProp "fieldSelector" a >>= decode
               includeUninitialized <- readProp "includeUninitialized" a >>= decode
               labelSelector <- readProp "labelSelector" a >>= decode
               limit <- readProp "limit" a >>= decode
               resourceVersion <- readProp "resourceVersion" a >>= decode
               timeoutSeconds <- readProp "timeoutSeconds" a >>= decode
               watch <- readProp "watch" a >>= decode
               pure $ ListNamespacedStatefulSetOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListNamespacedStatefulSetOptions :: Encode ListNamespacedStatefulSetOptions where
  encode (ListNamespacedStatefulSetOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encode a.continue)
               , Tuple "fieldSelector" (encode a.fieldSelector)
               , Tuple "includeUninitialized" (encode a.includeUninitialized)
               , Tuple "labelSelector" (encode a.labelSelector)
               , Tuple "limit" (encode a.limit)
               , Tuple "resourceVersion" (encode a.resourceVersion)
               , Tuple "timeoutSeconds" (encode a.timeoutSeconds)
               , Tuple "watch" (encode a.watch) ]


instance defaultListNamespacedStatefulSetOptions :: Default ListNamespacedStatefulSetOptions where
  default = ListNamespacedStatefulSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind StatefulSet
listNamespacedStatefulSet :: forall e. Config -> String -> ListNamespacedStatefulSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.StatefulSetList)
listNamespacedStatefulSet cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets" <> formatQueryString options

-- | list or watch objects of kind StatefulSet
listStatefulSetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.StatefulSetList)
listStatefulSetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/statefulsets"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedStatefulSetOptions = ReadNamespacedStatefulSetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedStatefulSetOptions :: Newtype ReadNamespacedStatefulSetOptions _
derive instance genericReadNamespacedStatefulSetOptions :: Generic ReadNamespacedStatefulSetOptions _
instance showReadNamespacedStatefulSetOptions :: Show ReadNamespacedStatefulSetOptions where show a = genericShow a
instance decodeReadNamespacedStatefulSetOptions :: Decode ReadNamespacedStatefulSetOptions where
  decode a = do
               exact <- readProp "exact" a >>= decode
               export <- readProp "export" a >>= decode
               pure $ ReadNamespacedStatefulSetOptions { exact, export }
instance encodeReadNamespacedStatefulSetOptions :: Encode ReadNamespacedStatefulSetOptions where
  encode (ReadNamespacedStatefulSetOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encode a.exact)
               , Tuple "export" (encode a.export) ]


instance defaultReadNamespacedStatefulSetOptions :: Default ReadNamespacedStatefulSetOptions where
  default = ReadNamespacedStatefulSetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified StatefulSet
readNamespacedStatefulSet :: forall e. Config -> String -> String -> ReadNamespacedStatefulSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.StatefulSet)
readNamespacedStatefulSet cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "" <> formatQueryString options

-- | read status of the specified StatefulSet
readNamespacedStatefulSetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.StatefulSet)
readNamespacedStatefulSetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/status"

-- | replace the specified StatefulSet
replaceNamespacedStatefulSet :: forall e. Config -> String -> String -> AppsV1Beta1.StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.StatefulSet)
replaceNamespacedStatefulSet cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified StatefulSet
replaceNamespacedStatefulSetStatus :: forall e. Config -> String -> String -> AppsV1Beta1.StatefulSet -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.StatefulSet)
replaceNamespacedStatefulSetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/statefulsets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind StatefulSet
watchNamespacedStatefulSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedStatefulSet cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/namespaces/" <> namespace <> "/statefulsets/" <> name <> ""

-- | watch individual changes to a list of StatefulSet
watchNamespacedStatefulSetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedStatefulSetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/namespaces/" <> namespace <> "/statefulsets"

-- | watch individual changes to a list of StatefulSet
watchStatefulSetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchStatefulSetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta1/watch/statefulsets"