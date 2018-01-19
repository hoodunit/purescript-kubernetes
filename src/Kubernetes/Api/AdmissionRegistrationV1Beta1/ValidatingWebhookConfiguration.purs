module Kubernetes.Api.AdmissionRegistrationV1Beta1.ValidatingWebhookConfiguration where

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
import Kubernetes.Api.AdmissionRegistrationV1Beta1 as AdmissionRegistrationV1Beta1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a ValidatingWebhookConfiguration
createValidatingWebhookConfiguration :: forall e. Config -> AdmissionRegistrationV1Beta1.ValidatingWebhookConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status AdmissionRegistrationV1Beta1.ValidatingWebhookConfiguration)
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
newtype DeleteCollectionValidatingWebhookConfigurationOptions = DeleteCollectionValidatingWebhookConfigurationOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionValidatingWebhookConfigurationOptions :: Newtype DeleteCollectionValidatingWebhookConfigurationOptions _
derive instance genericDeleteCollectionValidatingWebhookConfigurationOptions :: Generic DeleteCollectionValidatingWebhookConfigurationOptions _
instance showDeleteCollectionValidatingWebhookConfigurationOptions :: Show DeleteCollectionValidatingWebhookConfigurationOptions where show a = genericShow a
instance decodeDeleteCollectionValidatingWebhookConfigurationOptions :: Decode DeleteCollectionValidatingWebhookConfigurationOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionValidatingWebhookConfigurationOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionValidatingWebhookConfigurationOptions :: Encode DeleteCollectionValidatingWebhookConfigurationOptions where
  encode (DeleteCollectionValidatingWebhookConfigurationOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionValidatingWebhookConfigurationOptions :: Default DeleteCollectionValidatingWebhookConfigurationOptions where
  default = DeleteCollectionValidatingWebhookConfigurationOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | delete collection of ValidatingWebhookConfiguration
deleteCollectionValidatingWebhookConfiguration :: forall e. Config -> DeleteCollectionValidatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionValidatingWebhookConfiguration cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteValidatingWebhookConfigurationOptions = DeleteValidatingWebhookConfigurationOptions
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeleteValidatingWebhookConfigurationOptions :: Newtype DeleteValidatingWebhookConfigurationOptions _
derive instance genericDeleteValidatingWebhookConfigurationOptions :: Generic DeleteValidatingWebhookConfigurationOptions _
instance showDeleteValidatingWebhookConfigurationOptions :: Show DeleteValidatingWebhookConfigurationOptions where show a = genericShow a
instance decodeDeleteValidatingWebhookConfigurationOptions :: Decode DeleteValidatingWebhookConfigurationOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeleteValidatingWebhookConfigurationOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteValidatingWebhookConfigurationOptions :: Encode DeleteValidatingWebhookConfigurationOptions where
  encode (DeleteValidatingWebhookConfigurationOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeleteValidatingWebhookConfigurationOptions :: Default DeleteValidatingWebhookConfigurationOptions where
  default = DeleteValidatingWebhookConfigurationOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a ValidatingWebhookConfiguration
deleteValidatingWebhookConfiguration :: forall e. Config -> MetaV1.DeleteOptions -> DeleteValidatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteValidatingWebhookConfiguration cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations/{name}" <> formatQueryString options
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
newtype ListValidatingWebhookConfigurationOptions = ListValidatingWebhookConfigurationOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListValidatingWebhookConfigurationOptions :: Newtype ListValidatingWebhookConfigurationOptions _
derive instance genericListValidatingWebhookConfigurationOptions :: Generic ListValidatingWebhookConfigurationOptions _
instance showListValidatingWebhookConfigurationOptions :: Show ListValidatingWebhookConfigurationOptions where show a = genericShow a
instance decodeListValidatingWebhookConfigurationOptions :: Decode ListValidatingWebhookConfigurationOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListValidatingWebhookConfigurationOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListValidatingWebhookConfigurationOptions :: Encode ListValidatingWebhookConfigurationOptions where
  encode (ListValidatingWebhookConfigurationOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListValidatingWebhookConfigurationOptions :: Default ListValidatingWebhookConfigurationOptions where
  default = ListValidatingWebhookConfigurationOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind ValidatingWebhookConfiguration
listValidatingWebhookConfiguration :: forall e. Config -> ListValidatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AdmissionRegistrationV1Beta1.ValidatingWebhookConfigurationList)
listValidatingWebhookConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadValidatingWebhookConfigurationOptions = ReadValidatingWebhookConfigurationOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadValidatingWebhookConfigurationOptions :: Newtype ReadValidatingWebhookConfigurationOptions _
derive instance genericReadValidatingWebhookConfigurationOptions :: Generic ReadValidatingWebhookConfigurationOptions _
instance showReadValidatingWebhookConfigurationOptions :: Show ReadValidatingWebhookConfigurationOptions where show a = genericShow a
instance decodeReadValidatingWebhookConfigurationOptions :: Decode ReadValidatingWebhookConfigurationOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadValidatingWebhookConfigurationOptions { exact, export }
instance encodeReadValidatingWebhookConfigurationOptions :: Encode ReadValidatingWebhookConfigurationOptions where
  encode (ReadValidatingWebhookConfigurationOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadValidatingWebhookConfigurationOptions :: Default ReadValidatingWebhookConfigurationOptions where
  default = ReadValidatingWebhookConfigurationOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified ValidatingWebhookConfiguration
readValidatingWebhookConfiguration :: forall e. Config -> ReadValidatingWebhookConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status AdmissionRegistrationV1Beta1.ValidatingWebhookConfiguration)
readValidatingWebhookConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations/{name}" <> formatQueryString options

-- | replace the specified ValidatingWebhookConfiguration
replaceValidatingWebhookConfiguration :: forall e. Config -> AdmissionRegistrationV1Beta1.ValidatingWebhookConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status AdmissionRegistrationV1Beta1.ValidatingWebhookConfiguration)
replaceValidatingWebhookConfiguration cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1beta1/validatingwebhookconfigurations/{name}"
    encodedBody = encodeJSON body

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