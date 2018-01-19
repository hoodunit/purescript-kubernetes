module Kubernetes.Api.SchedulingV1Alpha1.PriorityClass where

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
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.SchedulingV1Alpha1 as SchedulingV1Alpha1

-- | create a PriorityClass
createPriorityClass :: forall e. Config -> SchedulingV1Alpha1.PriorityClass -> Aff (http :: HTTP | e) (Either MetaV1.Status SchedulingV1Alpha1.PriorityClass)
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
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionPriorityClassOptions :: Newtype DeleteCollectionPriorityClassOptions _
derive instance genericDeleteCollectionPriorityClassOptions :: Generic DeleteCollectionPriorityClassOptions _
instance showDeleteCollectionPriorityClassOptions :: Show DeleteCollectionPriorityClassOptions where show a = genericShow a
instance decodeDeleteCollectionPriorityClassOptions :: Decode DeleteCollectionPriorityClassOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionPriorityClassOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionPriorityClassOptions :: Encode DeleteCollectionPriorityClassOptions where
  encode (DeleteCollectionPriorityClassOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionPriorityClassOptions :: Default DeleteCollectionPriorityClassOptions where
  default = DeleteCollectionPriorityClassOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

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
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeletePriorityClassOptions :: Newtype DeletePriorityClassOptions _
derive instance genericDeletePriorityClassOptions :: Generic DeletePriorityClassOptions _
instance showDeletePriorityClassOptions :: Show DeletePriorityClassOptions where show a = genericShow a
instance decodeDeletePriorityClassOptions :: Decode DeletePriorityClassOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeletePriorityClassOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeletePriorityClassOptions :: Encode DeletePriorityClassOptions where
  encode (DeletePriorityClassOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeletePriorityClassOptions :: Default DeletePriorityClassOptions where
  default = DeletePriorityClassOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a PriorityClass
deletePriorityClass :: forall e. Config -> MetaV1.DeleteOptions -> DeletePriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deletePriorityClass cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses/{name}" <> formatQueryString options
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
newtype ListPriorityClassOptions = ListPriorityClassOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListPriorityClassOptions :: Newtype ListPriorityClassOptions _
derive instance genericListPriorityClassOptions :: Generic ListPriorityClassOptions _
instance showListPriorityClassOptions :: Show ListPriorityClassOptions where show a = genericShow a
instance decodeListPriorityClassOptions :: Decode ListPriorityClassOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListPriorityClassOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListPriorityClassOptions :: Encode ListPriorityClassOptions where
  encode (ListPriorityClassOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListPriorityClassOptions :: Default ListPriorityClassOptions where
  default = ListPriorityClassOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind PriorityClass
listPriorityClass :: forall e. Config -> ListPriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status SchedulingV1Alpha1.PriorityClassList)
listPriorityClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadPriorityClassOptions = ReadPriorityClassOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadPriorityClassOptions :: Newtype ReadPriorityClassOptions _
derive instance genericReadPriorityClassOptions :: Generic ReadPriorityClassOptions _
instance showReadPriorityClassOptions :: Show ReadPriorityClassOptions where show a = genericShow a
instance decodeReadPriorityClassOptions :: Decode ReadPriorityClassOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadPriorityClassOptions { exact, export }
instance encodeReadPriorityClassOptions :: Encode ReadPriorityClassOptions where
  encode (ReadPriorityClassOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadPriorityClassOptions :: Default ReadPriorityClassOptions where
  default = ReadPriorityClassOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified PriorityClass
readPriorityClass :: forall e. Config -> ReadPriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status SchedulingV1Alpha1.PriorityClass)
readPriorityClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses/{name}" <> formatQueryString options

-- | replace the specified PriorityClass
replacePriorityClass :: forall e. Config -> SchedulingV1Alpha1.PriorityClass -> Aff (http :: HTTP | e) (Either MetaV1.Status SchedulingV1Alpha1.PriorityClass)
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