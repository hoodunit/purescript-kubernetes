module Kubernetes.Api.RbacV1.ClusterRoleBinding where

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
import Kubernetes.Api.RbacV1 as RbacV1

-- | create a ClusterRoleBinding
createClusterRoleBinding :: forall e. Config -> RbacV1.ClusterRoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status RbacV1.ClusterRoleBinding)
createClusterRoleBinding cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteClusterRoleBindingOptions = DeleteClusterRoleBindingOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteClusterRoleBindingOptions :: Newtype DeleteClusterRoleBindingOptions _
derive instance genericDeleteClusterRoleBindingOptions :: Generic DeleteClusterRoleBindingOptions _
instance showDeleteClusterRoleBindingOptions :: Show DeleteClusterRoleBindingOptions where show a = genericShow a
instance decodeDeleteClusterRoleBindingOptions :: Decode DeleteClusterRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteClusterRoleBindingOptions :: Encode DeleteClusterRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteClusterRoleBindingOptions :: Default DeleteClusterRoleBindingOptions where
  default = DeleteClusterRoleBindingOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ClusterRoleBinding
deleteClusterRoleBinding :: forall e. Config -> MetaV1.DeleteOptions -> DeleteClusterRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteClusterRoleBinding cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/{name}" <> formatQueryString options
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
newtype DeleteCollectionClusterRoleBindingOptions = DeleteCollectionClusterRoleBindingOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionClusterRoleBindingOptions :: Newtype DeleteCollectionClusterRoleBindingOptions _
derive instance genericDeleteCollectionClusterRoleBindingOptions :: Generic DeleteCollectionClusterRoleBindingOptions _
instance showDeleteCollectionClusterRoleBindingOptions :: Show DeleteCollectionClusterRoleBindingOptions where show a = genericShow a
instance decodeDeleteCollectionClusterRoleBindingOptions :: Decode DeleteCollectionClusterRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionClusterRoleBindingOptions :: Encode DeleteCollectionClusterRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionClusterRoleBindingOptions :: Default DeleteCollectionClusterRoleBindingOptions where
  default = DeleteCollectionClusterRoleBindingOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ClusterRoleBinding
deleteCollectionClusterRoleBinding :: forall e. Config -> DeleteCollectionClusterRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionClusterRoleBinding cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings" <> formatQueryString options

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
newtype ListClusterRoleBindingOptions = ListClusterRoleBindingOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListClusterRoleBindingOptions :: Newtype ListClusterRoleBindingOptions _
derive instance genericListClusterRoleBindingOptions :: Generic ListClusterRoleBindingOptions _
instance showListClusterRoleBindingOptions :: Show ListClusterRoleBindingOptions where show a = genericShow a
instance decodeListClusterRoleBindingOptions :: Decode ListClusterRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListClusterRoleBindingOptions :: Encode ListClusterRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultListClusterRoleBindingOptions :: Default ListClusterRoleBindingOptions where
  default = ListClusterRoleBindingOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ClusterRoleBinding
listClusterRoleBinding :: forall e. Config -> ListClusterRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status RbacV1.ClusterRoleBindingList)
listClusterRoleBinding cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings" <> formatQueryString options

-- | read the specified ClusterRoleBinding
readClusterRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status RbacV1.ClusterRoleBinding)
readClusterRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/{name}"

-- | replace the specified ClusterRoleBinding
replaceClusterRoleBinding :: forall e. Config -> RbacV1.ClusterRoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status RbacV1.ClusterRoleBinding)
replaceClusterRoleBinding cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind ClusterRoleBinding
watchClusterRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/clusterrolebindings/{name}"

-- | watch individual changes to a list of ClusterRoleBinding
watchClusterRoleBindingList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleBindingList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/clusterrolebindings"