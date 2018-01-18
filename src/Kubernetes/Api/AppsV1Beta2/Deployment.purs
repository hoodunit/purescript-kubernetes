module Kubernetes.Api.AppsV1Beta2.Deployment where

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

-- | create a Deployment
createNamespacedDeployment :: forall e. Config -> String -> AppsV1Beta2.Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.Deployment)
createNamespacedDeployment cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/deployments"
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
newtype DeleteCollectionNamespacedDeploymentOptions = DeleteCollectionNamespacedDeploymentOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedDeploymentOptions :: Newtype DeleteCollectionNamespacedDeploymentOptions _
derive instance genericDeleteCollectionNamespacedDeploymentOptions :: Generic DeleteCollectionNamespacedDeploymentOptions _
instance showDeleteCollectionNamespacedDeploymentOptions :: Show DeleteCollectionNamespacedDeploymentOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedDeploymentOptions :: Decode DeleteCollectionNamespacedDeploymentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedDeploymentOptions :: Encode DeleteCollectionNamespacedDeploymentOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedDeploymentOptions :: Default DeleteCollectionNamespacedDeploymentOptions where
  default = DeleteCollectionNamespacedDeploymentOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Deployment
deleteCollectionNamespacedDeployment :: forall e. Config -> String -> DeleteCollectionNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedDeployment cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/deployments" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedDeploymentOptions = DeleteNamespacedDeploymentOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedDeploymentOptions :: Newtype DeleteNamespacedDeploymentOptions _
derive instance genericDeleteNamespacedDeploymentOptions :: Generic DeleteNamespacedDeploymentOptions _
instance showDeleteNamespacedDeploymentOptions :: Show DeleteNamespacedDeploymentOptions where show a = genericShow a
instance decodeDeleteNamespacedDeploymentOptions :: Decode DeleteNamespacedDeploymentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedDeploymentOptions :: Encode DeleteNamespacedDeploymentOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedDeploymentOptions :: Default DeleteNamespacedDeploymentOptions where
  default = DeleteNamespacedDeploymentOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a Deployment
deleteNamespacedDeployment :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedDeployment cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/deployments/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | list or watch objects of kind Deployment
listDeploymentForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DeploymentList)
listDeploymentForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/deployments"

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
newtype ListNamespacedDeploymentOptions = ListNamespacedDeploymentOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedDeploymentOptions :: Newtype ListNamespacedDeploymentOptions _
derive instance genericListNamespacedDeploymentOptions :: Generic ListNamespacedDeploymentOptions _
instance showListNamespacedDeploymentOptions :: Show ListNamespacedDeploymentOptions where show a = genericShow a
instance decodeListNamespacedDeploymentOptions :: Decode ListNamespacedDeploymentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedDeploymentOptions :: Encode ListNamespacedDeploymentOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedDeploymentOptions :: Default ListNamespacedDeploymentOptions where
  default = ListNamespacedDeploymentOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Deployment
listNamespacedDeployment :: forall e. Config -> String -> ListNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.DeploymentList)
listNamespacedDeployment cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/deployments" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedDeploymentOptions = ReadNamespacedDeploymentOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedDeploymentOptions :: Newtype ReadNamespacedDeploymentOptions _
derive instance genericReadNamespacedDeploymentOptions :: Generic ReadNamespacedDeploymentOptions _
instance showReadNamespacedDeploymentOptions :: Show ReadNamespacedDeploymentOptions where show a = genericShow a
instance decodeReadNamespacedDeploymentOptions :: Decode ReadNamespacedDeploymentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedDeploymentOptions :: Encode ReadNamespacedDeploymentOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedDeploymentOptions :: Default ReadNamespacedDeploymentOptions where
  default = ReadNamespacedDeploymentOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Deployment
readNamespacedDeployment :: forall e. Config -> String -> String -> ReadNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.Deployment)
readNamespacedDeployment cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/deployments/" <> name <> "" <> formatQueryString options

-- | read status of the specified Deployment
readNamespacedDeploymentStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.Deployment)
readNamespacedDeploymentStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/deployments/" <> name <> "/status"

-- | replace the specified Deployment
replaceNamespacedDeployment :: forall e. Config -> String -> String -> AppsV1Beta2.Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.Deployment)
replaceNamespacedDeployment cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/deployments/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Deployment
replaceNamespacedDeploymentStatus :: forall e. Config -> String -> String -> AppsV1Beta2.Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta2.Deployment)
replaceNamespacedDeploymentStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta2/namespaces/" <> namespace <> "/deployments/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of Deployment
watchDeploymentListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchDeploymentListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/watch/deployments"

-- | watch changes to an object of kind Deployment
watchNamespacedDeployment :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDeployment cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/watch/namespaces/" <> namespace <> "/deployments/" <> name <> ""

-- | watch individual changes to a list of Deployment
watchNamespacedDeploymentList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDeploymentList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apps/v1beta2/watch/namespaces/" <> namespace <> "/deployments"