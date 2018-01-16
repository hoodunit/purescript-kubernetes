module Kubernetes.Api.ExtensionsV1Beta1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Kubernetes.Api.APIExtensionsV1Beta1 as APIExtensionsV1Beta1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | create a DaemonSet
createNamespacedDaemonSet :: forall e. Config -> String -> APIExtensionsV1Beta1.DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DaemonSet)
createNamespacedDaemonSet cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/daemonsets"
    encodedBody = encodeJSON body

-- | create a Deployment
createNamespacedDeployment :: forall e. Config -> String -> APIExtensionsV1Beta1.Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Deployment)
createNamespacedDeployment cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments"
    encodedBody = encodeJSON body

-- | create rollback of a Deployment
createNamespacedDeploymentRollback :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.DeploymentRollback -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DeploymentRollback)
createNamespacedDeploymentRollback cfg namespace name body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/rollback"
    encodedBody = encodeJSON body

-- | create an Ingress
createNamespacedIngress :: forall e. Config -> String -> APIExtensionsV1Beta1.Ingress -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Ingress)
createNamespacedIngress cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/ingresses"
    encodedBody = encodeJSON body

-- | create a NetworkPolicy
createNamespacedNetworkPolicy :: forall e. Config -> String -> APIExtensionsV1Beta1.NetworkPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.NetworkPolicy)
createNamespacedNetworkPolicy cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/networkpolicies"
    encodedBody = encodeJSON body

-- | create a ReplicaSet
createNamespacedReplicaSet :: forall e. Config -> String -> APIExtensionsV1Beta1.ReplicaSet -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.ReplicaSet)
createNamespacedReplicaSet cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets"
    encodedBody = encodeJSON body

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
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/daemonsets" <> formatQueryString options

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
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments" <> formatQueryString options

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
newtype DeleteCollectionNamespacedIngressOptions = DeleteCollectionNamespacedIngressOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedIngressOptions :: Newtype DeleteCollectionNamespacedIngressOptions _
derive instance genericDeleteCollectionNamespacedIngressOptions :: Generic DeleteCollectionNamespacedIngressOptions _
instance showDeleteCollectionNamespacedIngressOptions :: Show DeleteCollectionNamespacedIngressOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedIngressOptions :: Decode DeleteCollectionNamespacedIngressOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedIngressOptions :: Encode DeleteCollectionNamespacedIngressOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedIngressOptions :: Default DeleteCollectionNamespacedIngressOptions where
  default = DeleteCollectionNamespacedIngressOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Ingress
deleteCollectionNamespacedIngress :: forall e. Config -> String -> DeleteCollectionNamespacedIngressOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedIngress cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/ingresses" <> formatQueryString options

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
newtype DeleteCollectionNamespacedNetworkPolicyOptions = DeleteCollectionNamespacedNetworkPolicyOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedNetworkPolicyOptions :: Newtype DeleteCollectionNamespacedNetworkPolicyOptions _
derive instance genericDeleteCollectionNamespacedNetworkPolicyOptions :: Generic DeleteCollectionNamespacedNetworkPolicyOptions _
instance showDeleteCollectionNamespacedNetworkPolicyOptions :: Show DeleteCollectionNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedNetworkPolicyOptions :: Decode DeleteCollectionNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedNetworkPolicyOptions :: Encode DeleteCollectionNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedNetworkPolicyOptions :: Default DeleteCollectionNamespacedNetworkPolicyOptions where
  default = DeleteCollectionNamespacedNetworkPolicyOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of NetworkPolicy
deleteCollectionNamespacedNetworkPolicy :: forall e. Config -> String -> DeleteCollectionNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedNetworkPolicy cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/networkpolicies" <> formatQueryString options

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
newtype DeleteCollectionNamespacedReplicaSetOptions = DeleteCollectionNamespacedReplicaSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedReplicaSetOptions :: Newtype DeleteCollectionNamespacedReplicaSetOptions _
derive instance genericDeleteCollectionNamespacedReplicaSetOptions :: Generic DeleteCollectionNamespacedReplicaSetOptions _
instance showDeleteCollectionNamespacedReplicaSetOptions :: Show DeleteCollectionNamespacedReplicaSetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedReplicaSetOptions :: Decode DeleteCollectionNamespacedReplicaSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedReplicaSetOptions :: Encode DeleteCollectionNamespacedReplicaSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedReplicaSetOptions :: Default DeleteCollectionNamespacedReplicaSetOptions where
  default = DeleteCollectionNamespacedReplicaSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ReplicaSet
deleteCollectionNamespacedReplicaSet :: forall e. Config -> String -> DeleteCollectionNamespacedReplicaSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedReplicaSet cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets" <> formatQueryString options

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
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionPodSecurityPolicyOptions :: Newtype DeleteCollectionPodSecurityPolicyOptions _
derive instance genericDeleteCollectionPodSecurityPolicyOptions :: Generic DeleteCollectionPodSecurityPolicyOptions _
instance showDeleteCollectionPodSecurityPolicyOptions :: Show DeleteCollectionPodSecurityPolicyOptions where show a = genericShow a
instance decodeDeleteCollectionPodSecurityPolicyOptions :: Decode DeleteCollectionPodSecurityPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionPodSecurityPolicyOptions :: Encode DeleteCollectionPodSecurityPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionPodSecurityPolicyOptions :: Default DeleteCollectionPodSecurityPolicyOptions where
  default = DeleteCollectionPodSecurityPolicyOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PodSecurityPolicy
deleteCollectionPodSecurityPolicy :: forall e. Config -> DeleteCollectionPodSecurityPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionPodSecurityPolicy cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies" <> formatQueryString options

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
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/daemonsets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

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
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedIngressOptions = DeleteNamespacedIngressOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedIngressOptions :: Newtype DeleteNamespacedIngressOptions _
derive instance genericDeleteNamespacedIngressOptions :: Generic DeleteNamespacedIngressOptions _
instance showDeleteNamespacedIngressOptions :: Show DeleteNamespacedIngressOptions where show a = genericShow a
instance decodeDeleteNamespacedIngressOptions :: Decode DeleteNamespacedIngressOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedIngressOptions :: Encode DeleteNamespacedIngressOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedIngressOptions :: Default DeleteNamespacedIngressOptions where
  default = DeleteNamespacedIngressOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete an Ingress
deleteNamespacedIngress :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedIngressOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedIngress cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/ingresses/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedNetworkPolicyOptions = DeleteNamespacedNetworkPolicyOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedNetworkPolicyOptions :: Newtype DeleteNamespacedNetworkPolicyOptions _
derive instance genericDeleteNamespacedNetworkPolicyOptions :: Generic DeleteNamespacedNetworkPolicyOptions _
instance showDeleteNamespacedNetworkPolicyOptions :: Show DeleteNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeDeleteNamespacedNetworkPolicyOptions :: Decode DeleteNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedNetworkPolicyOptions :: Encode DeleteNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedNetworkPolicyOptions :: Default DeleteNamespacedNetworkPolicyOptions where
  default = DeleteNamespacedNetworkPolicyOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a NetworkPolicy
deleteNamespacedNetworkPolicy :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedNetworkPolicy cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/networkpolicies/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedReplicaSetOptions = DeleteNamespacedReplicaSetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedReplicaSetOptions :: Newtype DeleteNamespacedReplicaSetOptions _
derive instance genericDeleteNamespacedReplicaSetOptions :: Generic DeleteNamespacedReplicaSetOptions _
instance showDeleteNamespacedReplicaSetOptions :: Show DeleteNamespacedReplicaSetOptions where show a = genericShow a
instance decodeDeleteNamespacedReplicaSetOptions :: Decode DeleteNamespacedReplicaSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedReplicaSetOptions :: Encode DeleteNamespacedReplicaSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedReplicaSetOptions :: Default DeleteNamespacedReplicaSetOptions where
  default = DeleteNamespacedReplicaSetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ReplicaSet
deleteNamespacedReplicaSet :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedReplicaSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedReplicaSet cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeletePodSecurityPolicyOptions = DeletePodSecurityPolicyOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeletePodSecurityPolicyOptions :: Newtype DeletePodSecurityPolicyOptions _
derive instance genericDeletePodSecurityPolicyOptions :: Generic DeletePodSecurityPolicyOptions _
instance showDeletePodSecurityPolicyOptions :: Show DeletePodSecurityPolicyOptions where show a = genericShow a
instance decodeDeletePodSecurityPolicyOptions :: Decode DeletePodSecurityPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeletePodSecurityPolicyOptions :: Encode DeletePodSecurityPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeletePodSecurityPolicyOptions :: Default DeletePodSecurityPolicyOptions where
  default = DeletePodSecurityPolicyOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PodSecurityPolicy
deletePodSecurityPolicy :: forall e. Config -> String -> MetaV1.DeleteOptions -> DeletePodSecurityPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deletePodSecurityPolicy cfg name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/"

-- | list or watch objects of kind DaemonSet
listDaemonSetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DaemonSetList)
listDaemonSetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/daemonsets"

-- | list or watch objects of kind Deployment
listDeploymentForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DeploymentList)
listDeploymentForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/deployments"

-- | list or watch objects of kind Ingress
listIngressForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.IngressList)
listIngressForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/ingresses"

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
listNamespacedDaemonSet :: forall e. Config -> String -> ListNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DaemonSetList)
listNamespacedDaemonSet cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/daemonsets" <> formatQueryString options

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
listNamespacedDeployment :: forall e. Config -> String -> ListNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DeploymentList)
listNamespacedDeployment cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments" <> formatQueryString options

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
newtype ListNamespacedIngressOptions = ListNamespacedIngressOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedIngressOptions :: Newtype ListNamespacedIngressOptions _
derive instance genericListNamespacedIngressOptions :: Generic ListNamespacedIngressOptions _
instance showListNamespacedIngressOptions :: Show ListNamespacedIngressOptions where show a = genericShow a
instance decodeListNamespacedIngressOptions :: Decode ListNamespacedIngressOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedIngressOptions :: Encode ListNamespacedIngressOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedIngressOptions :: Default ListNamespacedIngressOptions where
  default = ListNamespacedIngressOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Ingress
listNamespacedIngress :: forall e. Config -> String -> ListNamespacedIngressOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.IngressList)
listNamespacedIngress cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/ingresses" <> formatQueryString options

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
newtype ListNamespacedNetworkPolicyOptions = ListNamespacedNetworkPolicyOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedNetworkPolicyOptions :: Newtype ListNamespacedNetworkPolicyOptions _
derive instance genericListNamespacedNetworkPolicyOptions :: Generic ListNamespacedNetworkPolicyOptions _
instance showListNamespacedNetworkPolicyOptions :: Show ListNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeListNamespacedNetworkPolicyOptions :: Decode ListNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedNetworkPolicyOptions :: Encode ListNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedNetworkPolicyOptions :: Default ListNamespacedNetworkPolicyOptions where
  default = ListNamespacedNetworkPolicyOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind NetworkPolicy
listNamespacedNetworkPolicy :: forall e. Config -> String -> ListNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.NetworkPolicyList)
listNamespacedNetworkPolicy cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/networkpolicies" <> formatQueryString options

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
newtype ListNamespacedReplicaSetOptions = ListNamespacedReplicaSetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedReplicaSetOptions :: Newtype ListNamespacedReplicaSetOptions _
derive instance genericListNamespacedReplicaSetOptions :: Generic ListNamespacedReplicaSetOptions _
instance showListNamespacedReplicaSetOptions :: Show ListNamespacedReplicaSetOptions where show a = genericShow a
instance decodeListNamespacedReplicaSetOptions :: Decode ListNamespacedReplicaSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedReplicaSetOptions :: Encode ListNamespacedReplicaSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedReplicaSetOptions :: Default ListNamespacedReplicaSetOptions where
  default = ListNamespacedReplicaSetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ReplicaSet
listNamespacedReplicaSet :: forall e. Config -> String -> ListNamespacedReplicaSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.ReplicaSetList)
listNamespacedReplicaSet cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets" <> formatQueryString options

-- | list or watch objects of kind NetworkPolicy
listNetworkPolicyForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.NetworkPolicyList)
listNetworkPolicyForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/networkpolicies"

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
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListPodSecurityPolicyOptions :: Newtype ListPodSecurityPolicyOptions _
derive instance genericListPodSecurityPolicyOptions :: Generic ListPodSecurityPolicyOptions _
instance showListPodSecurityPolicyOptions :: Show ListPodSecurityPolicyOptions where show a = genericShow a
instance decodeListPodSecurityPolicyOptions :: Decode ListPodSecurityPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListPodSecurityPolicyOptions :: Encode ListPodSecurityPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultListPodSecurityPolicyOptions :: Default ListPodSecurityPolicyOptions where
  default = ListPodSecurityPolicyOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PodSecurityPolicy
listPodSecurityPolicy :: forall e. Config -> ListPodSecurityPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.PodSecurityPolicyList)
listPodSecurityPolicy cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies" <> formatQueryString options

-- | list or watch objects of kind ReplicaSet
listReplicaSetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.ReplicaSetList)
listReplicaSetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/replicasets"

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
readNamespacedDaemonSet :: forall e. Config -> String -> String -> ReadNamespacedDaemonSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DaemonSet)
readNamespacedDaemonSet cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/daemonsets/" <> name <> "" <> formatQueryString options

-- | read status of the specified DaemonSet
readNamespacedDaemonSetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DaemonSet)
readNamespacedDaemonSetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/daemonsets/" <> name <> "/status"

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
readNamespacedDeployment :: forall e. Config -> String -> String -> ReadNamespacedDeploymentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Deployment)
readNamespacedDeployment cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "" <> formatQueryString options

-- | read scale of the specified Deployment
readNamespacedDeploymentScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedDeploymentScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"

-- | read status of the specified Deployment
readNamespacedDeploymentStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Deployment)
readNamespacedDeploymentStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/status"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedIngressOptions = ReadNamespacedIngressOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedIngressOptions :: Newtype ReadNamespacedIngressOptions _
derive instance genericReadNamespacedIngressOptions :: Generic ReadNamespacedIngressOptions _
instance showReadNamespacedIngressOptions :: Show ReadNamespacedIngressOptions where show a = genericShow a
instance decodeReadNamespacedIngressOptions :: Decode ReadNamespacedIngressOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedIngressOptions :: Encode ReadNamespacedIngressOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedIngressOptions :: Default ReadNamespacedIngressOptions where
  default = ReadNamespacedIngressOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Ingress
readNamespacedIngress :: forall e. Config -> String -> String -> ReadNamespacedIngressOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Ingress)
readNamespacedIngress cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/ingresses/" <> name <> "" <> formatQueryString options

-- | read status of the specified Ingress
readNamespacedIngressStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Ingress)
readNamespacedIngressStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/ingresses/" <> name <> "/status"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedNetworkPolicyOptions = ReadNamespacedNetworkPolicyOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedNetworkPolicyOptions :: Newtype ReadNamespacedNetworkPolicyOptions _
derive instance genericReadNamespacedNetworkPolicyOptions :: Generic ReadNamespacedNetworkPolicyOptions _
instance showReadNamespacedNetworkPolicyOptions :: Show ReadNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeReadNamespacedNetworkPolicyOptions :: Decode ReadNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedNetworkPolicyOptions :: Encode ReadNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedNetworkPolicyOptions :: Default ReadNamespacedNetworkPolicyOptions where
  default = ReadNamespacedNetworkPolicyOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified NetworkPolicy
readNamespacedNetworkPolicy :: forall e. Config -> String -> String -> ReadNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.NetworkPolicy)
readNamespacedNetworkPolicy cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/networkpolicies/" <> name <> "" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedReplicaSetOptions = ReadNamespacedReplicaSetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedReplicaSetOptions :: Newtype ReadNamespacedReplicaSetOptions _
derive instance genericReadNamespacedReplicaSetOptions :: Generic ReadNamespacedReplicaSetOptions _
instance showReadNamespacedReplicaSetOptions :: Show ReadNamespacedReplicaSetOptions where show a = genericShow a
instance decodeReadNamespacedReplicaSetOptions :: Decode ReadNamespacedReplicaSetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedReplicaSetOptions :: Encode ReadNamespacedReplicaSetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedReplicaSetOptions :: Default ReadNamespacedReplicaSetOptions where
  default = ReadNamespacedReplicaSetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ReplicaSet
readNamespacedReplicaSet :: forall e. Config -> String -> String -> ReadNamespacedReplicaSetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.ReplicaSet)
readNamespacedReplicaSet cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "" <> formatQueryString options

-- | read scale of the specified ReplicaSet
readNamespacedReplicaSetScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedReplicaSetScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"

-- | read status of the specified ReplicaSet
readNamespacedReplicaSetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.ReplicaSet)
readNamespacedReplicaSetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/status"

-- | read scale of the specified ReplicationControllerDummy
readNamespacedReplicationControllerDummyScale :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
readNamespacedReplicationControllerDummyScale cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadPodSecurityPolicyOptions = ReadPodSecurityPolicyOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadPodSecurityPolicyOptions :: Newtype ReadPodSecurityPolicyOptions _
derive instance genericReadPodSecurityPolicyOptions :: Generic ReadPodSecurityPolicyOptions _
instance showReadPodSecurityPolicyOptions :: Show ReadPodSecurityPolicyOptions where show a = genericShow a
instance decodeReadPodSecurityPolicyOptions :: Decode ReadPodSecurityPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadPodSecurityPolicyOptions :: Encode ReadPodSecurityPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadPodSecurityPolicyOptions :: Default ReadPodSecurityPolicyOptions where
  default = ReadPodSecurityPolicyOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PodSecurityPolicy
readPodSecurityPolicy :: forall e. Config -> String -> ReadPodSecurityPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.PodSecurityPolicy)
readPodSecurityPolicy cfg name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies/" <> name <> "" <> formatQueryString options

-- | replace the specified DaemonSet
replaceNamespacedDaemonSet :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DaemonSet)
replaceNamespacedDaemonSet cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/daemonsets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified DaemonSet
replaceNamespacedDaemonSetStatus :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.DaemonSet -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.DaemonSet)
replaceNamespacedDaemonSetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/daemonsets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified Deployment
replaceNamespacedDeployment :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Deployment)
replaceNamespacedDeployment cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace scale of the specified Deployment
replaceNamespacedDeploymentScale :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedDeploymentScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace status of the specified Deployment
replaceNamespacedDeploymentStatus :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Deployment -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Deployment)
replaceNamespacedDeploymentStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified Ingress
replaceNamespacedIngress :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Ingress -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Ingress)
replaceNamespacedIngress cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/ingresses/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Ingress
replaceNamespacedIngressStatus :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Ingress -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Ingress)
replaceNamespacedIngressStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/ingresses/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified NetworkPolicy
replaceNamespacedNetworkPolicy :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.NetworkPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.NetworkPolicy)
replaceNamespacedNetworkPolicy cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/networkpolicies/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified ReplicaSet
replaceNamespacedReplicaSet :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.ReplicaSet -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.ReplicaSet)
replaceNamespacedReplicaSet cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicaSet
replaceNamespacedReplicaSetScale :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedReplicaSetScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace status of the specified ReplicaSet
replaceNamespacedReplicaSetStatus :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.ReplicaSet -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.ReplicaSet)
replaceNamespacedReplicaSetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicasets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace scale of the specified ReplicationControllerDummy
replaceNamespacedReplicationControllerDummyScale :: forall e. Config -> String -> String -> APIExtensionsV1Beta1.Scale -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.Scale)
replaceNamespacedReplicationControllerDummyScale cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/scale"
    encodedBody = encodeJSON body

-- | replace the specified PodSecurityPolicy
replacePodSecurityPolicy :: forall e. Config -> String -> APIExtensionsV1Beta1.PodSecurityPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status APIExtensionsV1Beta1.PodSecurityPolicy)
replacePodSecurityPolicy cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/extensions/v1beta1/podsecuritypolicies/" <> name <> ""
    encodedBody = encodeJSON body

-- | watch individual changes to a list of DaemonSet
watchDaemonSetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchDaemonSetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/daemonsets"

-- | watch individual changes to a list of Deployment
watchDeploymentListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchDeploymentListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/deployments"

-- | watch individual changes to a list of Ingress
watchIngressListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchIngressListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/ingresses"

-- | watch changes to an object of kind DaemonSet
watchNamespacedDaemonSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDaemonSet cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/daemonsets/" <> name <> ""

-- | watch individual changes to a list of DaemonSet
watchNamespacedDaemonSetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDaemonSetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/daemonsets"

-- | watch changes to an object of kind Deployment
watchNamespacedDeployment :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDeployment cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/deployments/" <> name <> ""

-- | watch individual changes to a list of Deployment
watchNamespacedDeploymentList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedDeploymentList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/deployments"

-- | watch changes to an object of kind Ingress
watchNamespacedIngress :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedIngress cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/ingresses/" <> name <> ""

-- | watch individual changes to a list of Ingress
watchNamespacedIngressList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedIngressList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/ingresses"

-- | watch changes to an object of kind NetworkPolicy
watchNamespacedNetworkPolicy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedNetworkPolicy cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/networkpolicies/" <> name <> ""

-- | watch individual changes to a list of NetworkPolicy
watchNamespacedNetworkPolicyList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedNetworkPolicyList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/networkpolicies"

-- | watch changes to an object of kind ReplicaSet
watchNamespacedReplicaSet :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedReplicaSet cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/replicasets/" <> name <> ""

-- | watch individual changes to a list of ReplicaSet
watchNamespacedReplicaSetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedReplicaSetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/namespaces/" <> namespace <> "/replicasets"

-- | watch individual changes to a list of NetworkPolicy
watchNetworkPolicyListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNetworkPolicyListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/networkpolicies"

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

-- | watch individual changes to a list of ReplicaSet
watchReplicaSetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchReplicaSetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/extensions/v1beta1/watch/replicasets"