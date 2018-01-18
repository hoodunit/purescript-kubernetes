module Kubernetes.Api.RbacV1Alpha1.ClusterRole where

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
import Kubernetes.Api.RbacV1Alpha1 as RbacV1Alpha1

-- | create a ClusterRole
createClusterRole :: forall e. Config -> RbacV1Alpha1.ClusterRole -> Aff (http :: HTTP | e) (Either MetaV1.Status RbacV1Alpha1.ClusterRole)
createClusterRole cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteClusterRoleOptions = DeleteClusterRoleOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteClusterRoleOptions :: Newtype DeleteClusterRoleOptions _
derive instance genericDeleteClusterRoleOptions :: Generic DeleteClusterRoleOptions _
instance showDeleteClusterRoleOptions :: Show DeleteClusterRoleOptions where show a = genericShow a
instance decodeDeleteClusterRoleOptions :: Decode DeleteClusterRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteClusterRoleOptions :: Encode DeleteClusterRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteClusterRoleOptions :: Default DeleteClusterRoleOptions where
  default = DeleteClusterRoleOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ClusterRole
deleteClusterRole :: forall e. Config -> MetaV1.DeleteOptions -> DeleteClusterRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteClusterRole cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles/{name}" <> formatQueryString options
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
newtype DeleteCollectionClusterRoleOptions = DeleteCollectionClusterRoleOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionClusterRoleOptions :: Newtype DeleteCollectionClusterRoleOptions _
derive instance genericDeleteCollectionClusterRoleOptions :: Generic DeleteCollectionClusterRoleOptions _
instance showDeleteCollectionClusterRoleOptions :: Show DeleteCollectionClusterRoleOptions where show a = genericShow a
instance decodeDeleteCollectionClusterRoleOptions :: Decode DeleteCollectionClusterRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionClusterRoleOptions :: Encode DeleteCollectionClusterRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionClusterRoleOptions :: Default DeleteCollectionClusterRoleOptions where
  default = DeleteCollectionClusterRoleOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ClusterRole
deleteCollectionClusterRole :: forall e. Config -> DeleteCollectionClusterRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionClusterRole cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles" <> formatQueryString options

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
newtype ListClusterRoleOptions = ListClusterRoleOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListClusterRoleOptions :: Newtype ListClusterRoleOptions _
derive instance genericListClusterRoleOptions :: Generic ListClusterRoleOptions _
instance showListClusterRoleOptions :: Show ListClusterRoleOptions where show a = genericShow a
instance decodeListClusterRoleOptions :: Decode ListClusterRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListClusterRoleOptions :: Encode ListClusterRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultListClusterRoleOptions :: Default ListClusterRoleOptions where
  default = ListClusterRoleOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ClusterRole
listClusterRole :: forall e. Config -> ListClusterRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status RbacV1Alpha1.ClusterRoleList)
listClusterRole cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles" <> formatQueryString options

-- | read the specified ClusterRole
readClusterRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status RbacV1Alpha1.ClusterRole)
readClusterRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles/{name}"

-- | replace the specified ClusterRole
replaceClusterRole :: forall e. Config -> RbacV1Alpha1.ClusterRole -> Aff (http :: HTTP | e) (Either MetaV1.Status RbacV1Alpha1.ClusterRole)
replaceClusterRole cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind ClusterRole
watchClusterRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/clusterroles/{name}"

-- | watch individual changes to a list of ClusterRole
watchClusterRoleList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/clusterroles"