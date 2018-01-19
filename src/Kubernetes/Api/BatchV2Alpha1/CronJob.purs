module Kubernetes.Api.BatchV2Alpha1.CronJob where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Index (readProp)
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
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.BatchV2Alpha1 as BatchV2Alpha1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a CronJob
createNamespacedCronJob :: forall e. Config -> String -> BatchV2Alpha1.CronJob -> Aff (http :: HTTP | e) (Either MetaV1.Status BatchV2Alpha1.CronJob)
createNamespacedCronJob cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/batch/v2alpha1/namespaces/" <> namespace <> "/cronjobs"
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
newtype DeleteCollectionNamespacedCronJobOptions = DeleteCollectionNamespacedCronJobOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionNamespacedCronJobOptions :: Newtype DeleteCollectionNamespacedCronJobOptions _
derive instance genericDeleteCollectionNamespacedCronJobOptions :: Generic DeleteCollectionNamespacedCronJobOptions _
instance showDeleteCollectionNamespacedCronJobOptions :: Show DeleteCollectionNamespacedCronJobOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedCronJobOptions :: Decode DeleteCollectionNamespacedCronJobOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionNamespacedCronJobOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionNamespacedCronJobOptions :: Encode DeleteCollectionNamespacedCronJobOptions where
  encode (DeleteCollectionNamespacedCronJobOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionNamespacedCronJobOptions :: Default DeleteCollectionNamespacedCronJobOptions where
  default = DeleteCollectionNamespacedCronJobOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | delete collection of CronJob
deleteCollectionNamespacedCronJob :: forall e. Config -> String -> DeleteCollectionNamespacedCronJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedCronJob cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/namespaces/" <> namespace <> "/cronjobs" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedCronJobOptions = DeleteNamespacedCronJobOptions
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeleteNamespacedCronJobOptions :: Newtype DeleteNamespacedCronJobOptions _
derive instance genericDeleteNamespacedCronJobOptions :: Generic DeleteNamespacedCronJobOptions _
instance showDeleteNamespacedCronJobOptions :: Show DeleteNamespacedCronJobOptions where show a = genericShow a
instance decodeDeleteNamespacedCronJobOptions :: Decode DeleteNamespacedCronJobOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeleteNamespacedCronJobOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteNamespacedCronJobOptions :: Encode DeleteNamespacedCronJobOptions where
  encode (DeleteNamespacedCronJobOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeleteNamespacedCronJobOptions :: Default DeleteNamespacedCronJobOptions where
  default = DeleteNamespacedCronJobOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a CronJob
deleteNamespacedCronJob :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedCronJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedCronJob cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/batch/v2alpha1/namespaces/" <> namespace <> "/cronjobs/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | list or watch objects of kind CronJob
listCronJobForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status BatchV2Alpha1.CronJobList)
listCronJobForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/cronjobs"

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
newtype ListNamespacedCronJobOptions = ListNamespacedCronJobOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListNamespacedCronJobOptions :: Newtype ListNamespacedCronJobOptions _
derive instance genericListNamespacedCronJobOptions :: Generic ListNamespacedCronJobOptions _
instance showListNamespacedCronJobOptions :: Show ListNamespacedCronJobOptions where show a = genericShow a
instance decodeListNamespacedCronJobOptions :: Decode ListNamespacedCronJobOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListNamespacedCronJobOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListNamespacedCronJobOptions :: Encode ListNamespacedCronJobOptions where
  encode (ListNamespacedCronJobOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListNamespacedCronJobOptions :: Default ListNamespacedCronJobOptions where
  default = ListNamespacedCronJobOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind CronJob
listNamespacedCronJob :: forall e. Config -> String -> ListNamespacedCronJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status BatchV2Alpha1.CronJobList)
listNamespacedCronJob cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/namespaces/" <> namespace <> "/cronjobs" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedCronJobOptions = ReadNamespacedCronJobOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadNamespacedCronJobOptions :: Newtype ReadNamespacedCronJobOptions _
derive instance genericReadNamespacedCronJobOptions :: Generic ReadNamespacedCronJobOptions _
instance showReadNamespacedCronJobOptions :: Show ReadNamespacedCronJobOptions where show a = genericShow a
instance decodeReadNamespacedCronJobOptions :: Decode ReadNamespacedCronJobOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadNamespacedCronJobOptions { exact, export }
instance encodeReadNamespacedCronJobOptions :: Encode ReadNamespacedCronJobOptions where
  encode (ReadNamespacedCronJobOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadNamespacedCronJobOptions :: Default ReadNamespacedCronJobOptions where
  default = ReadNamespacedCronJobOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified CronJob
readNamespacedCronJob :: forall e. Config -> String -> String -> ReadNamespacedCronJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status BatchV2Alpha1.CronJob)
readNamespacedCronJob cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/namespaces/" <> namespace <> "/cronjobs/" <> name <> "" <> formatQueryString options

-- | read status of the specified CronJob
readNamespacedCronJobStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status BatchV2Alpha1.CronJob)
readNamespacedCronJobStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/namespaces/" <> namespace <> "/cronjobs/" <> name <> "/status"

-- | replace the specified CronJob
replaceNamespacedCronJob :: forall e. Config -> String -> String -> BatchV2Alpha1.CronJob -> Aff (http :: HTTP | e) (Either MetaV1.Status BatchV2Alpha1.CronJob)
replaceNamespacedCronJob cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/batch/v2alpha1/namespaces/" <> namespace <> "/cronjobs/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified CronJob
replaceNamespacedCronJobStatus :: forall e. Config -> String -> String -> BatchV2Alpha1.CronJob -> Aff (http :: HTTP | e) (Either MetaV1.Status BatchV2Alpha1.CronJob)
replaceNamespacedCronJobStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/batch/v2alpha1/namespaces/" <> namespace <> "/cronjobs/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of CronJob
watchCronJobListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchCronJobListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/watch/cronjobs"

-- | watch changes to an object of kind CronJob
watchNamespacedCronJob :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedCronJob cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/watch/namespaces/" <> namespace <> "/cronjobs/" <> name <> ""

-- | watch individual changes to a list of CronJob
watchNamespacedCronJobList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedCronJobList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/watch/namespaces/" <> namespace <> "/cronjobs"