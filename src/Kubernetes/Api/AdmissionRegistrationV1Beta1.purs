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

-- | DeleteCollectionMutatingWebhookConfigurationOptions
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

-- | DeleteCollectionValidatingWebhookConfigurationOptions
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

-- | DeleteMutatingWebhookConfigurationOptions
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

-- | DeleteValidatingWebhookConfigurationOptions
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

-- | io.k8s.api.admissionregistration.v1beta1.MutatingWebhookConfiguration
-- | MutatingWebhookConfiguration describes the configuration of and admission webhook that accept or reject and may change the object.
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

-- | io.k8s.api.admissionregistration.v1beta1.MutatingWebhookConfigurationList
-- | MutatingWebhookConfigurationList is a list of MutatingWebhookConfiguration.
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

-- | io.k8s.api.admissionregistration.v1beta1.RuleWithOperations
-- | RuleWithOperations is a tuple of Operations and Resources. It is recommended to make sure that all the tuple expansions are valid.
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

-- | io.k8s.api.admissionregistration.v1beta1.ServiceReference
-- | ServiceReference holds a reference to Service.legacy.k8s.io
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

-- | io.k8s.api.admissionregistration.v1beta1.ValidatingWebhookConfiguration
-- | ValidatingWebhookConfiguration describes the configuration of and admission webhook that accept or reject and object without changing it.
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

-- | io.k8s.api.admissionregistration.v1beta1.ValidatingWebhookConfigurationList
-- | ValidatingWebhookConfigurationList is a list of ValidatingWebhookConfiguration.
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

-- | io.k8s.api.admissionregistration.v1beta1.Webhook
-- | Webhook describes an admission webhook and the resources and operations it applies to.
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

-- | io.k8s.api.admissionregistration.v1beta1.WebhookClientConfig
-- | WebhookClientConfig contains the information to make a TLS connection with the webhook
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

-- | ListMutatingWebhookConfigurationOptions
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

-- | ListValidatingWebhookConfigurationOptions
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

-- | ReadMutatingWebhookConfigurationOptions
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

-- | ReadValidatingWebhookConfigurationOptions
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