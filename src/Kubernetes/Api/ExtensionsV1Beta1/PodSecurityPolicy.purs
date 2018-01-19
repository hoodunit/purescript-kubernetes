module Kubernetes.Api.ExtensionsV1Beta1.PodSecurityPolicy where

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
import Kubernetes.Api.APIExtensionsV1Beta1 as APIExtensionsV1Beta1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a PodSecurityPolicy
createPodSecurityPolicy :: forall e. Config -> APIExtensionsV1Beta1.PodSecurityPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.PodSecurityPolicy)
createPodSecurityPolicy cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies"
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
newtype DeleteCollectionPodSecurityPolicyOptions = DeleteCollectionPodSecurityPolicyOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionPodSecurityPolicyOptions :: Newtype DeleteCollectionPodSecurityPolicyOptions _
derive instance genericDeleteCollectionPodSecurityPolicyOptions :: Generic DeleteCollectionPodSecurityPolicyOptions _
instance showDeleteCollectionPodSecurityPolicyOptions :: Show DeleteCollectionPodSecurityPolicyOptions where show a = genericShow a
instance decodeDeleteCollectionPodSecurityPolicyOptions :: Decode DeleteCollectionPodSecurityPolicyOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionPodSecurityPolicyOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionPodSecurityPolicyOptions :: Encode DeleteCollectionPodSecurityPolicyOptions where
  encode (DeleteCollectionPodSecurityPolicyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionPodSecurityPolicyOptions :: Default DeleteCollectionPodSecurityPolicyOptions where
  default = DeleteCollectionPodSecurityPolicyOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | delete collection of PodSecurityPolicy
deleteCollectionPodSecurityPolicy :: forall e. Config -> DeleteCollectionPodSecurityPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionPodSecurityPolicy cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeletePodSecurityPolicyOptions = DeletePodSecurityPolicyOptions
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeletePodSecurityPolicyOptions :: Newtype DeletePodSecurityPolicyOptions _
derive instance genericDeletePodSecurityPolicyOptions :: Generic DeletePodSecurityPolicyOptions _
instance showDeletePodSecurityPolicyOptions :: Show DeletePodSecurityPolicyOptions where show a = genericShow a
instance decodeDeletePodSecurityPolicyOptions :: Decode DeletePodSecurityPolicyOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeletePodSecurityPolicyOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeletePodSecurityPolicyOptions :: Encode DeletePodSecurityPolicyOptions where
  encode (DeletePodSecurityPolicyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeletePodSecurityPolicyOptions :: Default DeletePodSecurityPolicyOptions where
  default = DeletePodSecurityPolicyOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a PodSecurityPolicy
deletePodSecurityPolicy :: forall e. Config -> String -> MetaV1.DeleteOptions -> DeletePodSecurityPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deletePodSecurityPolicy cfg name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies/" <> name <> "" <> formatQueryString options
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
newtype ListPodSecurityPolicyOptions = ListPodSecurityPolicyOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListPodSecurityPolicyOptions :: Newtype ListPodSecurityPolicyOptions _
derive instance genericListPodSecurityPolicyOptions :: Generic ListPodSecurityPolicyOptions _
instance showListPodSecurityPolicyOptions :: Show ListPodSecurityPolicyOptions where show a = genericShow a
instance decodeListPodSecurityPolicyOptions :: Decode ListPodSecurityPolicyOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListPodSecurityPolicyOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListPodSecurityPolicyOptions :: Encode ListPodSecurityPolicyOptions where
  encode (ListPodSecurityPolicyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListPodSecurityPolicyOptions :: Default ListPodSecurityPolicyOptions where
  default = ListPodSecurityPolicyOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind PodSecurityPolicy
listPodSecurityPolicy :: forall e. Config -> ListPodSecurityPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.PodSecurityPolicyList)
listPodSecurityPolicy cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadPodSecurityPolicyOptions = ReadPodSecurityPolicyOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadPodSecurityPolicyOptions :: Newtype ReadPodSecurityPolicyOptions _
derive instance genericReadPodSecurityPolicyOptions :: Generic ReadPodSecurityPolicyOptions _
instance showReadPodSecurityPolicyOptions :: Show ReadPodSecurityPolicyOptions where show a = genericShow a
instance decodeReadPodSecurityPolicyOptions :: Decode ReadPodSecurityPolicyOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadPodSecurityPolicyOptions { exact, export }
instance encodeReadPodSecurityPolicyOptions :: Encode ReadPodSecurityPolicyOptions where
  encode (ReadPodSecurityPolicyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadPodSecurityPolicyOptions :: Default ReadPodSecurityPolicyOptions where
  default = ReadPodSecurityPolicyOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified PodSecurityPolicy
readPodSecurityPolicy :: forall e. Config -> String -> ReadPodSecurityPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.PodSecurityPolicy)
readPodSecurityPolicy cfg name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies/" <> name <> "" <> formatQueryString options

-- | replace the specified PodSecurityPolicy
replacePodSecurityPolicy :: forall e. Config -> String -> APIExtensionsV1Beta1.PodSecurityPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.PodSecurityPolicy)
replacePodSecurityPolicy cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies/" <> name <> ""
    encodedBody = encodeJSON body

-- | watch changes to an object of kind PodSecurityPolicy
watchPodSecurityPolicy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodSecurityPolicy cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/podsecuritypolicies/" <> name <> ""

-- | watch individual changes to a list of PodSecurityPolicy
watchPodSecurityPolicyList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodSecurityPolicyList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/podsecuritypolicies"