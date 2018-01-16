module Kubernetes.Api.AdmissionRegistrationV1Beta1 where

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
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | MutatingWebhookConfiguration describes the configuration of and admission webhook that accept or reject and may change the object.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
-- | - `webhooks`: Webhooks is a list of webhooks and the affected resources and operations.
newtype MutatingWebhookConfiguration = MutatingWebhookConfiguration
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , webhooks :: (NullOrUndefined (Array Webhook)) }

derive instance newtypeMutatingWebhookConfiguration :: Newtype MutatingWebhookConfiguration _
derive instance genericMutatingWebhookConfiguration :: Generic MutatingWebhookConfiguration _
instance showMutatingWebhookConfiguration :: Show MutatingWebhookConfiguration where show a = genericShow a
instance decodeMutatingWebhookConfiguration :: Decode MutatingWebhookConfiguration where
  decode a = genericDecode jsonOptions a 
instance encodeMutatingWebhookConfiguration :: Encode MutatingWebhookConfiguration where
  encode a = genericEncode jsonOptions a

instance defaultMutatingWebhookConfiguration :: Default MutatingWebhookConfiguration where
  default = MutatingWebhookConfiguration
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , webhooks: NullOrUndefined Nothing }

-- | MutatingWebhookConfigurationList is a list of MutatingWebhookConfiguration.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of MutatingWebhookConfiguration.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype MutatingWebhookConfigurationList = MutatingWebhookConfigurationList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array MutatingWebhookConfiguration))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeMutatingWebhookConfigurationList :: Newtype MutatingWebhookConfigurationList _
derive instance genericMutatingWebhookConfigurationList :: Generic MutatingWebhookConfigurationList _
instance showMutatingWebhookConfigurationList :: Show MutatingWebhookConfigurationList where show a = genericShow a
instance decodeMutatingWebhookConfigurationList :: Decode MutatingWebhookConfigurationList where
  decode a = genericDecode jsonOptions a 
instance encodeMutatingWebhookConfigurationList :: Encode MutatingWebhookConfigurationList where
  encode a = genericEncode jsonOptions a

instance defaultMutatingWebhookConfigurationList :: Default MutatingWebhookConfigurationList where
  default = MutatingWebhookConfigurationList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | RuleWithOperations is a tuple of Operations and Resources. It is recommended to make sure that all the tuple expansions are valid.
-- |
-- | Fields:
-- | - `apiGroups`: APIGroups is the API groups the resources belong to. '*' is all groups. If '*' is present, the length of the slice must be one. Required.
-- | - `apiVersions`: APIVersions is the API versions the resources belong to. '*' is all versions. If '*' is present, the length of the slice must be one. Required.
-- | - `operations`: Operations is the operations the admission hook cares about - CREATE, UPDATE, or * for all operations. If '*' is present, the length of the slice must be one. Required.
-- | - `resources`: Resources is a list of resources this rule applies to.
-- |    
-- |    For example: 'pods' means pods. 'pods/log' means the log subresource of pods. '*' means all resources, but not subresources. 'pods/*' means all subresources of pods. '*/scale' means all scale subresources. '*/*' means all resources and their subresources.
-- |    
-- |    If wildcard is present, the validation rule will ensure resources do not overlap with each other.
-- |    
-- |    Depending on the enclosing object, subresources might not be allowed. Required.
newtype RuleWithOperations = RuleWithOperations
  { apiGroups :: (NullOrUndefined (Array String))
  , apiVersions :: (NullOrUndefined (Array String))
  , operations :: (NullOrUndefined (Array String))
  , resources :: (NullOrUndefined (Array String)) }

derive instance newtypeRuleWithOperations :: Newtype RuleWithOperations _
derive instance genericRuleWithOperations :: Generic RuleWithOperations _
instance showRuleWithOperations :: Show RuleWithOperations where show a = genericShow a
instance decodeRuleWithOperations :: Decode RuleWithOperations where
  decode a = genericDecode jsonOptions a 
instance encodeRuleWithOperations :: Encode RuleWithOperations where
  encode a = genericEncode jsonOptions a

instance defaultRuleWithOperations :: Default RuleWithOperations where
  default = RuleWithOperations
    { apiGroups: NullOrUndefined Nothing
    , apiVersions: NullOrUndefined Nothing
    , operations: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing }

-- | ServiceReference holds a reference to Service.legacy.k8s.io
-- |
-- | Fields:
-- | - `name`: `name` is the name of the service. Required
-- | - `namespace`: `namespace` is the namespace of the service. Required
-- | - `path`: `path` is an optional URL path which will be sent in any request to this service.
newtype ServiceReference = ServiceReference
  { name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String)
  , path :: (NullOrUndefined String) }

derive instance newtypeServiceReference :: Newtype ServiceReference _
derive instance genericServiceReference :: Generic ServiceReference _
instance showServiceReference :: Show ServiceReference where show a = genericShow a
instance decodeServiceReference :: Decode ServiceReference where
  decode a = genericDecode jsonOptions a 
instance encodeServiceReference :: Encode ServiceReference where
  encode a = genericEncode jsonOptions a

instance defaultServiceReference :: Default ServiceReference where
  default = ServiceReference
    { name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing }

-- | ValidatingWebhookConfiguration describes the configuration of and admission webhook that accept or reject and object without changing it.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
-- | - `webhooks`: Webhooks is a list of webhooks and the affected resources and operations.
newtype ValidatingWebhookConfiguration = ValidatingWebhookConfiguration
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , webhooks :: (NullOrUndefined (Array Webhook)) }

derive instance newtypeValidatingWebhookConfiguration :: Newtype ValidatingWebhookConfiguration _
derive instance genericValidatingWebhookConfiguration :: Generic ValidatingWebhookConfiguration _
instance showValidatingWebhookConfiguration :: Show ValidatingWebhookConfiguration where show a = genericShow a
instance decodeValidatingWebhookConfiguration :: Decode ValidatingWebhookConfiguration where
  decode a = genericDecode jsonOptions a 
instance encodeValidatingWebhookConfiguration :: Encode ValidatingWebhookConfiguration where
  encode a = genericEncode jsonOptions a

instance defaultValidatingWebhookConfiguration :: Default ValidatingWebhookConfiguration where
  default = ValidatingWebhookConfiguration
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , webhooks: NullOrUndefined Nothing }

-- | ValidatingWebhookConfigurationList is a list of ValidatingWebhookConfiguration.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of ValidatingWebhookConfiguration.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ValidatingWebhookConfigurationList = ValidatingWebhookConfigurationList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ValidatingWebhookConfiguration))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeValidatingWebhookConfigurationList :: Newtype ValidatingWebhookConfigurationList _
derive instance genericValidatingWebhookConfigurationList :: Generic ValidatingWebhookConfigurationList _
instance showValidatingWebhookConfigurationList :: Show ValidatingWebhookConfigurationList where show a = genericShow a
instance decodeValidatingWebhookConfigurationList :: Decode ValidatingWebhookConfigurationList where
  decode a = genericDecode jsonOptions a 
instance encodeValidatingWebhookConfigurationList :: Encode ValidatingWebhookConfigurationList where
  encode a = genericEncode jsonOptions a

instance defaultValidatingWebhookConfigurationList :: Default ValidatingWebhookConfigurationList where
  default = ValidatingWebhookConfigurationList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | Webhook describes an admission webhook and the resources and operations it applies to.
-- |
-- | Fields:
-- | - `clientConfig`: ClientConfig defines how to communicate with the hook. Required
-- | - `failurePolicy`: FailurePolicy defines how unrecognized errors from the admission endpoint are handled - allowed values are Ignore or Fail. Defaults to Ignore.
-- | - `name`: The name of the admission webhook. Name should be fully qualified, e.g., imagepolicy.kubernetes.io, where "imagepolicy" is the name of the webhook, and kubernetes.io is the name of the organization. Required.
-- | - `namespaceSelector`: NamespaceSelector decides whether to run the webhook on an object based on whether the namespace for that object matches the selector. If the object itself is a namespace, the matching is performed on object.metadata.labels. If the object is other cluster scoped resource, it is not subjected to the webhook.
-- |    
-- |    For example, to run the webhook on any objects whose namespace is not associated with "runlevel" of "0" or "1";  you will set the selector as follows: "namespaceSelector": {
-- |      "matchExpressions": [
-- |        {
-- |          "key": "runlevel",
-- |          "operator": "NotIn",
-- |          "values": [
-- |            "0",
-- |            "1"
-- |          ]
-- |        }
-- |      ]
-- |    }
-- |    
-- |    If instead you want to only run the webhook on any objects whose namespace is associated with the "environment" of "prod" or "staging"; you will set the selector as follows: "namespaceSelector": {
-- |      "matchExpressions": [
-- |        {
-- |          "key": "environment",
-- |          "operator": "In",
-- |          "values": [
-- |            "prod",
-- |            "staging"
-- |          ]
-- |        }
-- |      ]
-- |    }
-- |    
-- |    See https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ for more examples of label selectors.
-- |    
-- |    Default to the empty LabelSelector, which matches everything.
-- | - `rules`: Rules describes what operations on what resources/subresources the webhook cares about. The webhook cares about an operation if it matches _any_ Rule.
newtype Webhook = Webhook
  { clientConfig :: (NullOrUndefined WebhookClientConfig)
  , failurePolicy :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , namespaceSelector :: (NullOrUndefined MetaV1.LabelSelector)
  , rules :: (NullOrUndefined (Array RuleWithOperations)) }

derive instance newtypeWebhook :: Newtype Webhook _
derive instance genericWebhook :: Generic Webhook _
instance showWebhook :: Show Webhook where show a = genericShow a
instance decodeWebhook :: Decode Webhook where
  decode a = genericDecode jsonOptions a 
instance encodeWebhook :: Encode Webhook where
  encode a = genericEncode jsonOptions a

instance defaultWebhook :: Default Webhook where
  default = Webhook
    { clientConfig: NullOrUndefined Nothing
    , failurePolicy: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespaceSelector: NullOrUndefined Nothing
    , rules: NullOrUndefined Nothing }

-- | WebhookClientConfig contains the information to make a TLS connection with the webhook
-- |
-- | Fields:
-- | - `caBundle`: `caBundle` is a PEM encoded CA bundle which will be used to validate the webhook's server certificate. Required.
-- | - `service`: `service` is a reference to the service for this webhook. Either `service` or `url` must be specified.
-- |    
-- |    If the webhook is running within the cluster, then you should use `service`.
-- |    
-- |    If there is only one port open for the service, that port will be used. If there are multiple ports open, port 443 will be used if it is open, otherwise it is an error.
-- | - `url`: `url` gives the location of the webhook, in standard URL form (`[scheme://]host:port/path`). Exactly one of `url` or `service` must be specified.
-- |    
-- |    The `host` should not refer to a service running in the cluster; use the `service` field instead. The host might be resolved via external DNS in some apiservers (e.g., `kube-apiserver` cannot resolve in-cluster DNS as that would be a layering violation). `host` may also be an IP address.
-- |    
-- |    Please note that using `localhost` or `127.0.0.1` as a `host` is risky unless you take great care to run this webhook on all hosts which run an apiserver which might need to make calls to this webhook. Such installs are likely to be non-portable, i.e., not easy to turn up in a new cluster.
-- |    
-- |    The scheme must be "https"; the URL must begin with "https://".
-- |    
-- |    A path is optional, and if present may be any string permissible in a URL. You may use the path to pass an arbitrary string to the webhook, for example, a cluster identifier.
-- |    
-- |    Attempting to use a user or basic auth e.g. "user:password@" is not allowed. Fragments ("#...") and query parameters ("?...") are not allowed, either.
newtype WebhookClientConfig = WebhookClientConfig
  { caBundle :: (NullOrUndefined String)
  , service :: (NullOrUndefined ServiceReference)
  , url :: (NullOrUndefined String) }

derive instance newtypeWebhookClientConfig :: Newtype WebhookClientConfig _
derive instance genericWebhookClientConfig :: Generic WebhookClientConfig _
instance showWebhookClientConfig :: Show WebhookClientConfig where show a = genericShow a
instance decodeWebhookClientConfig :: Decode WebhookClientConfig where
  decode a = genericDecode jsonOptions a 
instance encodeWebhookClientConfig :: Encode WebhookClientConfig where
  encode a = genericEncode jsonOptions a

instance defaultWebhookClientConfig :: Default WebhookClientConfig where
  default = WebhookClientConfig
    { caBundle: NullOrUndefined Nothing
    , service: NullOrUndefined Nothing
    , url: NullOrUndefined Nothing }

-- | create a MutatingWebhookConfiguration
createMutatingWebhookConfiguration :: forall e. Config -> MutatingWebhookConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status MutatingWebhookConfiguration)
createMutatingWebhookConfiguration cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations"
    encodedBody = encodeJSON body

-- | create a ValidatingWebhookConfiguration
createValidatingWebhookConfiguration :: forall e. Config -> ValidatingWebhookConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status ValidatingWebhookConfiguration)
createValidatingWebhookConfiguration cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations"
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
newtype DeleteCollectionMutatingWebhookConfigurationOptions = DeleteCollectionMutatingWebhookConfigurationOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionMutatingWebhookConfigurationOptions :: Newtype DeleteCollectionMutatingWebhookConfigurationOptions _
derive instance genericDeleteCollectionMutatingWebhookConfigurationOptions :: Generic DeleteCollectionMutatingWebhookConfigurationOptions _
instance showDeleteCollectionMutatingWebhookConfigurationOptions :: Show DeleteCollectionMutatingWebhookConfigurationOptions where show a = genericShow a
instance decodeDeleteCollectionMutatingWebhookConfigurationOptions :: Decode DeleteCollectionMutatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionMutatingWebhookConfigurationOptions :: Encode DeleteCollectionMutatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionMutatingWebhookConfigurationOptions :: Default DeleteCollectionMutatingWebhookConfigurationOptions where
  default = DeleteCollectionMutatingWebhookConfigurationOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of MutatingWebhookConfiguration
deleteCollectionMutatingWebhookConfiguration :: forall e. Config -> DeleteCollectionMutatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionMutatingWebhookConfiguration cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations" <> formatQueryString options

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
newtype DeleteCollectionValidatingWebhookConfigurationOptions = DeleteCollectionValidatingWebhookConfigurationOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionValidatingWebhookConfigurationOptions :: Newtype DeleteCollectionValidatingWebhookConfigurationOptions _
derive instance genericDeleteCollectionValidatingWebhookConfigurationOptions :: Generic DeleteCollectionValidatingWebhookConfigurationOptions _
instance showDeleteCollectionValidatingWebhookConfigurationOptions :: Show DeleteCollectionValidatingWebhookConfigurationOptions where show a = genericShow a
instance decodeDeleteCollectionValidatingWebhookConfigurationOptions :: Decode DeleteCollectionValidatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionValidatingWebhookConfigurationOptions :: Encode DeleteCollectionValidatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionValidatingWebhookConfigurationOptions :: Default DeleteCollectionValidatingWebhookConfigurationOptions where
  default = DeleteCollectionValidatingWebhookConfigurationOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ValidatingWebhookConfiguration
deleteCollectionValidatingWebhookConfiguration :: forall e. Config -> DeleteCollectionValidatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionValidatingWebhookConfiguration cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteMutatingWebhookConfigurationOptions = DeleteMutatingWebhookConfigurationOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteMutatingWebhookConfigurationOptions :: Newtype DeleteMutatingWebhookConfigurationOptions _
derive instance genericDeleteMutatingWebhookConfigurationOptions :: Generic DeleteMutatingWebhookConfigurationOptions _
instance showDeleteMutatingWebhookConfigurationOptions :: Show DeleteMutatingWebhookConfigurationOptions where show a = genericShow a
instance decodeDeleteMutatingWebhookConfigurationOptions :: Decode DeleteMutatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteMutatingWebhookConfigurationOptions :: Encode DeleteMutatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteMutatingWebhookConfigurationOptions :: Default DeleteMutatingWebhookConfigurationOptions where
  default = DeleteMutatingWebhookConfigurationOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a MutatingWebhookConfiguration
deleteMutatingWebhookConfiguration :: forall e. Config -> MetaV1.DeleteOptions -> DeleteMutatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteMutatingWebhookConfiguration cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteValidatingWebhookConfigurationOptions = DeleteValidatingWebhookConfigurationOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteValidatingWebhookConfigurationOptions :: Newtype DeleteValidatingWebhookConfigurationOptions _
derive instance genericDeleteValidatingWebhookConfigurationOptions :: Generic DeleteValidatingWebhookConfigurationOptions _
instance showDeleteValidatingWebhookConfigurationOptions :: Show DeleteValidatingWebhookConfigurationOptions where show a = genericShow a
instance decodeDeleteValidatingWebhookConfigurationOptions :: Decode DeleteValidatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteValidatingWebhookConfigurationOptions :: Encode DeleteValidatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteValidatingWebhookConfigurationOptions :: Default DeleteValidatingWebhookConfigurationOptions where
  default = DeleteValidatingWebhookConfigurationOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ValidatingWebhookConfiguration
deleteValidatingWebhookConfiguration :: forall e. Config -> MetaV1.DeleteOptions -> DeleteValidatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteValidatingWebhookConfiguration cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/"

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
newtype ListMutatingWebhookConfigurationOptions = ListMutatingWebhookConfigurationOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListMutatingWebhookConfigurationOptions :: Newtype ListMutatingWebhookConfigurationOptions _
derive instance genericListMutatingWebhookConfigurationOptions :: Generic ListMutatingWebhookConfigurationOptions _
instance showListMutatingWebhookConfigurationOptions :: Show ListMutatingWebhookConfigurationOptions where show a = genericShow a
instance decodeListMutatingWebhookConfigurationOptions :: Decode ListMutatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListMutatingWebhookConfigurationOptions :: Encode ListMutatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultListMutatingWebhookConfigurationOptions :: Default ListMutatingWebhookConfigurationOptions where
  default = ListMutatingWebhookConfigurationOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind MutatingWebhookConfiguration
listMutatingWebhookConfiguration :: forall e. Config -> ListMutatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MutatingWebhookConfigurationList)
listMutatingWebhookConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations" <> formatQueryString options

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
newtype ListValidatingWebhookConfigurationOptions = ListValidatingWebhookConfigurationOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListValidatingWebhookConfigurationOptions :: Newtype ListValidatingWebhookConfigurationOptions _
derive instance genericListValidatingWebhookConfigurationOptions :: Generic ListValidatingWebhookConfigurationOptions _
instance showListValidatingWebhookConfigurationOptions :: Show ListValidatingWebhookConfigurationOptions where show a = genericShow a
instance decodeListValidatingWebhookConfigurationOptions :: Decode ListValidatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListValidatingWebhookConfigurationOptions :: Encode ListValidatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultListValidatingWebhookConfigurationOptions :: Default ListValidatingWebhookConfigurationOptions where
  default = ListValidatingWebhookConfigurationOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ValidatingWebhookConfiguration
listValidatingWebhookConfiguration :: forall e. Config -> ListValidatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ValidatingWebhookConfigurationList)
listValidatingWebhookConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadMutatingWebhookConfigurationOptions = ReadMutatingWebhookConfigurationOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadMutatingWebhookConfigurationOptions :: Newtype ReadMutatingWebhookConfigurationOptions _
derive instance genericReadMutatingWebhookConfigurationOptions :: Generic ReadMutatingWebhookConfigurationOptions _
instance showReadMutatingWebhookConfigurationOptions :: Show ReadMutatingWebhookConfigurationOptions where show a = genericShow a
instance decodeReadMutatingWebhookConfigurationOptions :: Decode ReadMutatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadMutatingWebhookConfigurationOptions :: Encode ReadMutatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadMutatingWebhookConfigurationOptions :: Default ReadMutatingWebhookConfigurationOptions where
  default = ReadMutatingWebhookConfigurationOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified MutatingWebhookConfiguration
readMutatingWebhookConfiguration :: forall e. Config -> ReadMutatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MutatingWebhookConfiguration)
readMutatingWebhookConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations/{name}" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadValidatingWebhookConfigurationOptions = ReadValidatingWebhookConfigurationOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadValidatingWebhookConfigurationOptions :: Newtype ReadValidatingWebhookConfigurationOptions _
derive instance genericReadValidatingWebhookConfigurationOptions :: Generic ReadValidatingWebhookConfigurationOptions _
instance showReadValidatingWebhookConfigurationOptions :: Show ReadValidatingWebhookConfigurationOptions where show a = genericShow a
instance decodeReadValidatingWebhookConfigurationOptions :: Decode ReadValidatingWebhookConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadValidatingWebhookConfigurationOptions :: Encode ReadValidatingWebhookConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadValidatingWebhookConfigurationOptions :: Default ReadValidatingWebhookConfigurationOptions where
  default = ReadValidatingWebhookConfigurationOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ValidatingWebhookConfiguration
readValidatingWebhookConfiguration :: forall e. Config -> ReadValidatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ValidatingWebhookConfiguration)
readValidatingWebhookConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations/{name}" <> formatQueryString options

-- | replace the specified MutatingWebhookConfiguration
replaceMutatingWebhookConfiguration :: forall e. Config -> MutatingWebhookConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status MutatingWebhookConfiguration)
replaceMutatingWebhookConfiguration cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/mutatingwebhookconfigurations/{name}"
    encodedBody = encodeJSON body

-- | replace the specified ValidatingWebhookConfiguration
replaceValidatingWebhookConfiguration :: forall e. Config -> ValidatingWebhookConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status ValidatingWebhookConfiguration)
replaceValidatingWebhookConfiguration cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind MutatingWebhookConfiguration
watchMutatingWebhookConfiguration :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchMutatingWebhookConfiguration cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/watch/mutatingwebhookconfigurations/{name}"

-- | watch individual changes to a list of MutatingWebhookConfiguration
watchMutatingWebhookConfigurationList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchMutatingWebhookConfigurationList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/watch/mutatingwebhookconfigurations"

-- | watch changes to an object of kind ValidatingWebhookConfiguration
watchValidatingWebhookConfiguration :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchValidatingWebhookConfiguration cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/watch/validatingwebhookconfigurations/{name}"

-- | watch individual changes to a list of ValidatingWebhookConfiguration
watchValidatingWebhookConfigurationList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchValidatingWebhookConfigurationList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/watch/validatingwebhookconfigurations"