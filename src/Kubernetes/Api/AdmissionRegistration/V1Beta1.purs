module Kubernetes.Api.AdmissionRegistration.V1Beta1 where

import Prelude
import Prelude
import Prelude
import Control.Alt ((<|>))
import Data.Either (Either(Left,Right))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(Tuple))
import Effect.Aff (Aff)
import Foreign.Class (class Decode, class Encode, decode, encode)
import Prelude
import Data.Maybe (Maybe(Just,Nothing))
import Foreign.Class (class Decode, class Encode, encode, decode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Foreign.Generic.Types (Options)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Meta.V1 as MetaV1

-- | MutatingWebhookConfiguration describes the configuration of and admission webhook that accept or reject and may change the object.
-- |
-- | Fields:
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
-- | - `webhooks`: Webhooks is a list of webhooks and the affected resources and operations.
newtype MutatingWebhookConfiguration = MutatingWebhookConfiguration
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , webhooks :: (Maybe (Array Webhook)) }

derive instance newtypeMutatingWebhookConfiguration :: Newtype MutatingWebhookConfiguration _
derive instance genericMutatingWebhookConfiguration :: Generic MutatingWebhookConfiguration _
instance showMutatingWebhookConfiguration :: Show MutatingWebhookConfiguration where show a = genericShow a
instance decodeMutatingWebhookConfiguration :: Decode MutatingWebhookConfiguration where
  decode a = do
               assertPropEq "apiVersion" "admissionregistration.k8s.io/v1beta1" a
               assertPropEq "kind" "MutatingWebhookConfiguration" a
               metadata <- decodeMaybe "metadata" a
               webhooks <- decodeMaybe "webhooks" a
               pure $ MutatingWebhookConfiguration { metadata, webhooks }
instance encodeMutatingWebhookConfiguration :: Encode MutatingWebhookConfiguration where
  encode (MutatingWebhookConfiguration a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "admissionregistration.k8s.io/v1beta1")
               , Tuple "kind" (encode "MutatingWebhookConfiguration")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "webhooks" (encodeMaybe a.webhooks) ]


instance defaultMutatingWebhookConfiguration :: Default MutatingWebhookConfiguration where
  default = MutatingWebhookConfiguration
    { metadata: Nothing
    , webhooks: Nothing }

-- | MutatingWebhookConfigurationList is a list of MutatingWebhookConfiguration.
-- |
-- | Fields:
-- | - `items`: List of MutatingWebhookConfiguration.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype MutatingWebhookConfigurationList = MutatingWebhookConfigurationList
  { items :: (Maybe (Array MutatingWebhookConfiguration))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeMutatingWebhookConfigurationList :: Newtype MutatingWebhookConfigurationList _
derive instance genericMutatingWebhookConfigurationList :: Generic MutatingWebhookConfigurationList _
instance showMutatingWebhookConfigurationList :: Show MutatingWebhookConfigurationList where show a = genericShow a
instance decodeMutatingWebhookConfigurationList :: Decode MutatingWebhookConfigurationList where
  decode a = do
               assertPropEq "apiVersion" "admissionregistration.k8s.io/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "MutatingWebhookConfigurationList" a
               metadata <- decodeMaybe "metadata" a
               pure $ MutatingWebhookConfigurationList { items, metadata }
instance encodeMutatingWebhookConfigurationList :: Encode MutatingWebhookConfigurationList where
  encode (MutatingWebhookConfigurationList a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "admissionregistration.k8s.io/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "MutatingWebhookConfigurationList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultMutatingWebhookConfigurationList :: Default MutatingWebhookConfigurationList where
  default = MutatingWebhookConfigurationList
    { items: Nothing
    , metadata: Nothing }

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
  { apiGroups :: (Maybe (Array String))
  , apiVersions :: (Maybe (Array String))
  , operations :: (Maybe (Array String))
  , resources :: (Maybe (Array String)) }

derive instance newtypeRuleWithOperations :: Newtype RuleWithOperations _
derive instance genericRuleWithOperations :: Generic RuleWithOperations _
instance showRuleWithOperations :: Show RuleWithOperations where show a = genericShow a
instance decodeRuleWithOperations :: Decode RuleWithOperations where
  decode a = do
               apiGroups <- decodeMaybe "apiGroups" a
               apiVersions <- decodeMaybe "apiVersions" a
               operations <- decodeMaybe "operations" a
               resources <- decodeMaybe "resources" a
               pure $ RuleWithOperations { apiGroups, apiVersions, operations, resources }
instance encodeRuleWithOperations :: Encode RuleWithOperations where
  encode (RuleWithOperations a) = encode $ Object.fromFoldable $
               [ Tuple "apiGroups" (encodeMaybe a.apiGroups)
               , Tuple "apiVersions" (encodeMaybe a.apiVersions)
               , Tuple "operations" (encodeMaybe a.operations)
               , Tuple "resources" (encodeMaybe a.resources) ]


instance defaultRuleWithOperations :: Default RuleWithOperations where
  default = RuleWithOperations
    { apiGroups: Nothing
    , apiVersions: Nothing
    , operations: Nothing
    , resources: Nothing }

-- | ServiceReference holds a reference to Service.legacy.k8s.io
-- |
-- | Fields:
-- | - `name`: `name` is the name of the service. Required
-- | - `namespace`: `namespace` is the namespace of the service. Required
-- | - `path`: `path` is an optional URL path which will be sent in any request to this service.
newtype ServiceReference = ServiceReference
  { name :: (Maybe String)
  , namespace :: (Maybe String)
  , path :: (Maybe String) }

derive instance newtypeServiceReference :: Newtype ServiceReference _
derive instance genericServiceReference :: Generic ServiceReference _
instance showServiceReference :: Show ServiceReference where show a = genericShow a
instance decodeServiceReference :: Decode ServiceReference where
  decode a = do
               name <- decodeMaybe "name" a
               namespace <- decodeMaybe "namespace" a
               path <- decodeMaybe "path" a
               pure $ ServiceReference { name, namespace, path }
instance encodeServiceReference :: Encode ServiceReference where
  encode (ServiceReference a) = encode $ Object.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "namespace" (encodeMaybe a.namespace)
               , Tuple "path" (encodeMaybe a.path) ]


instance defaultServiceReference :: Default ServiceReference where
  default = ServiceReference
    { name: Nothing
    , namespace: Nothing
    , path: Nothing }

-- | ValidatingWebhookConfiguration describes the configuration of and admission webhook that accept or reject and object without changing it.
-- |
-- | Fields:
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
-- | - `webhooks`: Webhooks is a list of webhooks and the affected resources and operations.
newtype ValidatingWebhookConfiguration = ValidatingWebhookConfiguration
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , webhooks :: (Maybe (Array Webhook)) }

derive instance newtypeValidatingWebhookConfiguration :: Newtype ValidatingWebhookConfiguration _
derive instance genericValidatingWebhookConfiguration :: Generic ValidatingWebhookConfiguration _
instance showValidatingWebhookConfiguration :: Show ValidatingWebhookConfiguration where show a = genericShow a
instance decodeValidatingWebhookConfiguration :: Decode ValidatingWebhookConfiguration where
  decode a = do
               assertPropEq "apiVersion" "admissionregistration.k8s.io/v1beta1" a
               assertPropEq "kind" "ValidatingWebhookConfiguration" a
               metadata <- decodeMaybe "metadata" a
               webhooks <- decodeMaybe "webhooks" a
               pure $ ValidatingWebhookConfiguration { metadata, webhooks }
instance encodeValidatingWebhookConfiguration :: Encode ValidatingWebhookConfiguration where
  encode (ValidatingWebhookConfiguration a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "admissionregistration.k8s.io/v1beta1")
               , Tuple "kind" (encode "ValidatingWebhookConfiguration")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "webhooks" (encodeMaybe a.webhooks) ]


instance defaultValidatingWebhookConfiguration :: Default ValidatingWebhookConfiguration where
  default = ValidatingWebhookConfiguration
    { metadata: Nothing
    , webhooks: Nothing }

-- | ValidatingWebhookConfigurationList is a list of ValidatingWebhookConfiguration.
-- |
-- | Fields:
-- | - `items`: List of ValidatingWebhookConfiguration.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ValidatingWebhookConfigurationList = ValidatingWebhookConfigurationList
  { items :: (Maybe (Array ValidatingWebhookConfiguration))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeValidatingWebhookConfigurationList :: Newtype ValidatingWebhookConfigurationList _
derive instance genericValidatingWebhookConfigurationList :: Generic ValidatingWebhookConfigurationList _
instance showValidatingWebhookConfigurationList :: Show ValidatingWebhookConfigurationList where show a = genericShow a
instance decodeValidatingWebhookConfigurationList :: Decode ValidatingWebhookConfigurationList where
  decode a = do
               assertPropEq "apiVersion" "admissionregistration.k8s.io/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ValidatingWebhookConfigurationList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ValidatingWebhookConfigurationList { items, metadata }
instance encodeValidatingWebhookConfigurationList :: Encode ValidatingWebhookConfigurationList where
  encode (ValidatingWebhookConfigurationList a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "admissionregistration.k8s.io/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ValidatingWebhookConfigurationList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultValidatingWebhookConfigurationList :: Default ValidatingWebhookConfigurationList where
  default = ValidatingWebhookConfigurationList
    { items: Nothing
    , metadata: Nothing }

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
  { clientConfig :: (Maybe WebhookClientConfig)
  , failurePolicy :: (Maybe String)
  , name :: (Maybe String)
  , namespaceSelector :: (Maybe MetaV1.LabelSelector)
  , rules :: (Maybe (Array RuleWithOperations)) }

derive instance newtypeWebhook :: Newtype Webhook _
derive instance genericWebhook :: Generic Webhook _
instance showWebhook :: Show Webhook where show a = genericShow a
instance decodeWebhook :: Decode Webhook where
  decode a = do
               clientConfig <- decodeMaybe "clientConfig" a
               failurePolicy <- decodeMaybe "failurePolicy" a
               name <- decodeMaybe "name" a
               namespaceSelector <- decodeMaybe "namespaceSelector" a
               rules <- decodeMaybe "rules" a
               pure $ Webhook { clientConfig, failurePolicy, name, namespaceSelector, rules }
instance encodeWebhook :: Encode Webhook where
  encode (Webhook a) = encode $ Object.fromFoldable $
               [ Tuple "clientConfig" (encodeMaybe a.clientConfig)
               , Tuple "failurePolicy" (encodeMaybe a.failurePolicy)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "namespaceSelector" (encodeMaybe a.namespaceSelector)
               , Tuple "rules" (encodeMaybe a.rules) ]


instance defaultWebhook :: Default Webhook where
  default = Webhook
    { clientConfig: Nothing
    , failurePolicy: Nothing
    , name: Nothing
    , namespaceSelector: Nothing
    , rules: Nothing }

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
  { caBundle :: (Maybe String)
  , service :: (Maybe ServiceReference)
  , url :: (Maybe String) }

derive instance newtypeWebhookClientConfig :: Newtype WebhookClientConfig _
derive instance genericWebhookClientConfig :: Generic WebhookClientConfig _
instance showWebhookClientConfig :: Show WebhookClientConfig where show a = genericShow a
instance decodeWebhookClientConfig :: Decode WebhookClientConfig where
  decode a = do
               caBundle <- decodeMaybe "caBundle" a
               service <- decodeMaybe "service" a
               url <- decodeMaybe "url" a
               pure $ WebhookClientConfig { caBundle, service, url }
instance encodeWebhookClientConfig :: Encode WebhookClientConfig where
  encode (WebhookClientConfig a) = encode $ Object.fromFoldable $
               [ Tuple "caBundle" (encodeMaybe a.caBundle)
               , Tuple "service" (encodeMaybe a.service)
               , Tuple "url" (encodeMaybe a.url) ]


instance defaultWebhookClientConfig :: Default WebhookClientConfig where
  default = WebhookClientConfig
    { caBundle: Nothing
    , service: Nothing
    , url: Nothing }

-- | get available resources
getAPIResources :: Config -> Aff (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/"