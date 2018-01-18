module Kubernetes.Api.AppsV1.ControllerRevision where

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
import Kubernetes.Api.AppsV1 as AppsV1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a ControllerRevision
createNamespacedControllerRevision :: forall e. Config -> String -> AppsV1.ControllerRevision -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1.ControllerRevision)
createNamespacedControllerRevision cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions"
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
newtype DeleteCollectionNamespacedControllerRevisionOptions = DeleteCollectionNamespacedControllerRevisionOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedControllerRevisionOptions :: Newtype DeleteCollectionNamespacedControllerRevisionOptions _
derive instance genericDeleteCollectionNamespacedControllerRevisionOptions :: Generic DeleteCollectionNamespacedControllerRevisionOptions _
instance showDeleteCollectionNamespacedControllerRevisionOptions :: Show DeleteCollectionNamespacedControllerRevisionOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedControllerRevisionOptions :: Decode DeleteCollectionNamespacedControllerRevisionOptions where
  decode a = do
               continue <- readProp "continue" a >>= decode
               fieldSelector <- readProp "fieldSelector" a >>= decode
               includeUninitialized <- readProp "includeUninitialized" a >>= decode
               labelSelector <- readProp "labelSelector" a >>= decode
               limit <- readProp "limit" a >>= decode
               resourceVersion <- readProp "resourceVersion" a >>= decode
               timeoutSeconds <- readProp "timeoutSeconds" a >>= decode
               watch <- readProp "watch" a >>= decode
               pure $ DeleteCollectionNamespacedControllerRevisionOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionNamespacedControllerRevisionOptions :: Encode DeleteCollectionNamespacedControllerRevisionOptions where
  encode (DeleteCollectionNamespacedControllerRevisionOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encode a.continue)
               , Tuple "fieldSelector" (encode a.fieldSelector)
               , Tuple "includeUninitialized" (encode a.includeUninitialized)
               , Tuple "labelSelector" (encode a.labelSelector)
               , Tuple "limit" (encode a.limit)
               , Tuple "resourceVersion" (encode a.resourceVersion)
               , Tuple "timeoutSeconds" (encode a.timeoutSeconds)
               , Tuple "watch" (encode a.watch) ]


instance defaultDeleteCollectionNamespacedControllerRevisionOptions :: Default DeleteCollectionNamespacedControllerRevisionOptions where
  default = DeleteCollectionNamespacedControllerRevisionOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ControllerRevision
deleteCollectionNamespacedControllerRevision :: forall e. Config -> String -> DeleteCollectionNamespacedControllerRevisionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedControllerRevision cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedControllerRevisionOptions = DeleteNamespacedControllerRevisionOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedControllerRevisionOptions :: Newtype DeleteNamespacedControllerRevisionOptions _
derive instance genericDeleteNamespacedControllerRevisionOptions :: Generic DeleteNamespacedControllerRevisionOptions _
instance showDeleteNamespacedControllerRevisionOptions :: Show DeleteNamespacedControllerRevisionOptions where show a = genericShow a
instance decodeDeleteNamespacedControllerRevisionOptions :: Decode DeleteNamespacedControllerRevisionOptions where
  decode a = do
               gracePeriodSeconds <- readProp "gracePeriodSeconds" a >>= decode
               orphanDependents <- readProp "orphanDependents" a >>= decode
               propagationPolicy <- readProp "propagationPolicy" a >>= decode
               pure $ DeleteNamespacedControllerRevisionOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteNamespacedControllerRevisionOptions :: Encode DeleteNamespacedControllerRevisionOptions where
  encode (DeleteNamespacedControllerRevisionOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encode a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encode a.orphanDependents)
               , Tuple "propagationPolicy" (encode a.propagationPolicy) ]


instance defaultDeleteNamespacedControllerRevisionOptions :: Default DeleteNamespacedControllerRevisionOptions where
  default = DeleteNamespacedControllerRevisionOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ControllerRevision
deleteNamespacedControllerRevision :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedControllerRevisionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedControllerRevision cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | list or watch objects of kind ControllerRevision
listControllerRevisionForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1.ControllerRevisionList)
listControllerRevisionForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/controllerrevisions"

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
newtype ListNamespacedControllerRevisionOptions = ListNamespacedControllerRevisionOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedControllerRevisionOptions :: Newtype ListNamespacedControllerRevisionOptions _
derive instance genericListNamespacedControllerRevisionOptions :: Generic ListNamespacedControllerRevisionOptions _
instance showListNamespacedControllerRevisionOptions :: Show ListNamespacedControllerRevisionOptions where show a = genericShow a
instance decodeListNamespacedControllerRevisionOptions :: Decode ListNamespacedControllerRevisionOptions where
  decode a = do
               continue <- readProp "continue" a >>= decode
               fieldSelector <- readProp "fieldSelector" a >>= decode
               includeUninitialized <- readProp "includeUninitialized" a >>= decode
               labelSelector <- readProp "labelSelector" a >>= decode
               limit <- readProp "limit" a >>= decode
               resourceVersion <- readProp "resourceVersion" a >>= decode
               timeoutSeconds <- readProp "timeoutSeconds" a >>= decode
               watch <- readProp "watch" a >>= decode
               pure $ ListNamespacedControllerRevisionOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListNamespacedControllerRevisionOptions :: Encode ListNamespacedControllerRevisionOptions where
  encode (ListNamespacedControllerRevisionOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encode a.continue)
               , Tuple "fieldSelector" (encode a.fieldSelector)
               , Tuple "includeUninitialized" (encode a.includeUninitialized)
               , Tuple "labelSelector" (encode a.labelSelector)
               , Tuple "limit" (encode a.limit)
               , Tuple "resourceVersion" (encode a.resourceVersion)
               , Tuple "timeoutSeconds" (encode a.timeoutSeconds)
               , Tuple "watch" (encode a.watch) ]


instance defaultListNamespacedControllerRevisionOptions :: Default ListNamespacedControllerRevisionOptions where
  default = ListNamespacedControllerRevisionOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ControllerRevision
listNamespacedControllerRevision :: forall e. Config -> String -> ListNamespacedControllerRevisionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1.ControllerRevisionList)
listNamespacedControllerRevision cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedControllerRevisionOptions = ReadNamespacedControllerRevisionOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedControllerRevisionOptions :: Newtype ReadNamespacedControllerRevisionOptions _
derive instance genericReadNamespacedControllerRevisionOptions :: Generic ReadNamespacedControllerRevisionOptions _
instance showReadNamespacedControllerRevisionOptions :: Show ReadNamespacedControllerRevisionOptions where show a = genericShow a
instance decodeReadNamespacedControllerRevisionOptions :: Decode ReadNamespacedControllerRevisionOptions where
  decode a = do
               exact <- readProp "exact" a >>= decode
               export <- readProp "export" a >>= decode
               pure $ ReadNamespacedControllerRevisionOptions { exact, export }
instance encodeReadNamespacedControllerRevisionOptions :: Encode ReadNamespacedControllerRevisionOptions where
  encode (ReadNamespacedControllerRevisionOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encode a.exact)
               , Tuple "export" (encode a.export) ]


instance defaultReadNamespacedControllerRevisionOptions :: Default ReadNamespacedControllerRevisionOptions where
  default = ReadNamespacedControllerRevisionOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ControllerRevision
readNamespacedControllerRevision :: forall e. Config -> String -> String -> ReadNamespacedControllerRevisionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1.ControllerRevision)
readNamespacedControllerRevision cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> "" <> formatQueryString options

-- | replace the specified ControllerRevision
replaceNamespacedControllerRevision :: forall e. Config -> String -> String -> AppsV1.ControllerRevision -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1.ControllerRevision)
replaceNamespacedControllerRevision cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> ""
    encodedBody = encodeJSON body

-- | watch individual changes to a list of ControllerRevision
watchControllerRevisionListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchControllerRevisionListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/controllerrevisions"

-- | watch changes to an object of kind ControllerRevision
watchNamespacedControllerRevision :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedControllerRevision cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/controllerrevisions/" <> name <> ""

-- | watch individual changes to a list of ControllerRevision
watchNamespacedControllerRevisionList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedControllerRevisionList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1/watch/namespaces/" <> namespace <> "/controllerrevisions"