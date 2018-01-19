module Kubernetes.Api.AutoscalingV2Beta1.HorizontalPodAutoscaler where

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
import Kubernetes.Json (decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.AutoscalingV2Beta1 as AutoscalingV2Beta1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a HorizontalPodAutoscaler
createNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> AutoscalingV2Beta1.HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV2Beta1.HorizontalPodAutoscaler)
createNamespacedHorizontalPodAutoscaler cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers"
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
newtype DeleteCollectionNamespacedHorizontalPodAutoscalerOptions = DeleteCollectionNamespacedHorizontalPodAutoscalerOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Newtype DeleteCollectionNamespacedHorizontalPodAutoscalerOptions _
derive instance genericDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Generic DeleteCollectionNamespacedHorizontalPodAutoscalerOptions _
instance showDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Show DeleteCollectionNamespacedHorizontalPodAutoscalerOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Decode DeleteCollectionNamespacedHorizontalPodAutoscalerOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionNamespacedHorizontalPodAutoscalerOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Encode DeleteCollectionNamespacedHorizontalPodAutoscalerOptions where
  encode (DeleteCollectionNamespacedHorizontalPodAutoscalerOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionNamespacedHorizontalPodAutoscalerOptions :: Default DeleteCollectionNamespacedHorizontalPodAutoscalerOptions where
  default = DeleteCollectionNamespacedHorizontalPodAutoscalerOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | delete collection of HorizontalPodAutoscaler
deleteCollectionNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> DeleteCollectionNamespacedHorizontalPodAutoscalerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedHorizontalPodAutoscaler cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedHorizontalPodAutoscalerOptions = DeleteNamespacedHorizontalPodAutoscalerOptions
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeleteNamespacedHorizontalPodAutoscalerOptions :: Newtype DeleteNamespacedHorizontalPodAutoscalerOptions _
derive instance genericDeleteNamespacedHorizontalPodAutoscalerOptions :: Generic DeleteNamespacedHorizontalPodAutoscalerOptions _
instance showDeleteNamespacedHorizontalPodAutoscalerOptions :: Show DeleteNamespacedHorizontalPodAutoscalerOptions where show a = genericShow a
instance decodeDeleteNamespacedHorizontalPodAutoscalerOptions :: Decode DeleteNamespacedHorizontalPodAutoscalerOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeleteNamespacedHorizontalPodAutoscalerOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteNamespacedHorizontalPodAutoscalerOptions :: Encode DeleteNamespacedHorizontalPodAutoscalerOptions where
  encode (DeleteNamespacedHorizontalPodAutoscalerOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeleteNamespacedHorizontalPodAutoscalerOptions :: Default DeleteNamespacedHorizontalPodAutoscalerOptions where
  default = DeleteNamespacedHorizontalPodAutoscalerOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a HorizontalPodAutoscaler
deleteNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedHorizontalPodAutoscalerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedHorizontalPodAutoscaler cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | list or watch objects of kind HorizontalPodAutoscaler
listHorizontalPodAutoscalerForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV2Beta1.HorizontalPodAutoscalerList)
listHorizontalPodAutoscalerForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/horizontalpodautoscalers"

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
newtype ListNamespacedHorizontalPodAutoscalerOptions = ListNamespacedHorizontalPodAutoscalerOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListNamespacedHorizontalPodAutoscalerOptions :: Newtype ListNamespacedHorizontalPodAutoscalerOptions _
derive instance genericListNamespacedHorizontalPodAutoscalerOptions :: Generic ListNamespacedHorizontalPodAutoscalerOptions _
instance showListNamespacedHorizontalPodAutoscalerOptions :: Show ListNamespacedHorizontalPodAutoscalerOptions where show a = genericShow a
instance decodeListNamespacedHorizontalPodAutoscalerOptions :: Decode ListNamespacedHorizontalPodAutoscalerOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListNamespacedHorizontalPodAutoscalerOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListNamespacedHorizontalPodAutoscalerOptions :: Encode ListNamespacedHorizontalPodAutoscalerOptions where
  encode (ListNamespacedHorizontalPodAutoscalerOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListNamespacedHorizontalPodAutoscalerOptions :: Default ListNamespacedHorizontalPodAutoscalerOptions where
  default = ListNamespacedHorizontalPodAutoscalerOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind HorizontalPodAutoscaler
listNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> ListNamespacedHorizontalPodAutoscalerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV2Beta1.HorizontalPodAutoscalerList)
listNamespacedHorizontalPodAutoscaler cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedHorizontalPodAutoscalerOptions = ReadNamespacedHorizontalPodAutoscalerOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadNamespacedHorizontalPodAutoscalerOptions :: Newtype ReadNamespacedHorizontalPodAutoscalerOptions _
derive instance genericReadNamespacedHorizontalPodAutoscalerOptions :: Generic ReadNamespacedHorizontalPodAutoscalerOptions _
instance showReadNamespacedHorizontalPodAutoscalerOptions :: Show ReadNamespacedHorizontalPodAutoscalerOptions where show a = genericShow a
instance decodeReadNamespacedHorizontalPodAutoscalerOptions :: Decode ReadNamespacedHorizontalPodAutoscalerOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadNamespacedHorizontalPodAutoscalerOptions { exact, export }
instance encodeReadNamespacedHorizontalPodAutoscalerOptions :: Encode ReadNamespacedHorizontalPodAutoscalerOptions where
  encode (ReadNamespacedHorizontalPodAutoscalerOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadNamespacedHorizontalPodAutoscalerOptions :: Default ReadNamespacedHorizontalPodAutoscalerOptions where
  default = ReadNamespacedHorizontalPodAutoscalerOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified HorizontalPodAutoscaler
readNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> ReadNamespacedHorizontalPodAutoscalerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV2Beta1.HorizontalPodAutoscaler)
readNamespacedHorizontalPodAutoscaler cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "" <> formatQueryString options

-- | read status of the specified HorizontalPodAutoscaler
readNamespacedHorizontalPodAutoscalerStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV2Beta1.HorizontalPodAutoscaler)
readNamespacedHorizontalPodAutoscalerStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "/status"

-- | replace the specified HorizontalPodAutoscaler
replaceNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> AutoscalingV2Beta1.HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV2Beta1.HorizontalPodAutoscaler)
replaceNamespacedHorizontalPodAutoscaler cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified HorizontalPodAutoscaler
replaceNamespacedHorizontalPodAutoscalerStatus :: forall e. Config -> String -> String -> AutoscalingV2Beta1.HorizontalPodAutoscaler -> Aff (http :: HTTP | e) (Either MetaV1.Status AutoscalingV2Beta1.HorizontalPodAutoscaler)
replaceNamespacedHorizontalPodAutoscalerStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/autoscaling/v2beta1/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of HorizontalPodAutoscaler
watchHorizontalPodAutoscalerListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchHorizontalPodAutoscalerListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/watch/horizontalpodautoscalers"

-- | watch changes to an object of kind HorizontalPodAutoscaler
watchNamespacedHorizontalPodAutoscaler :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedHorizontalPodAutoscaler cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/watch/namespaces/" <> namespace <> "/horizontalpodautoscalers/" <> name <> ""

-- | watch individual changes to a list of HorizontalPodAutoscaler
watchNamespacedHorizontalPodAutoscalerList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedHorizontalPodAutoscalerList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v2beta1/watch/namespaces/" <> namespace <> "/horizontalpodautoscalers"