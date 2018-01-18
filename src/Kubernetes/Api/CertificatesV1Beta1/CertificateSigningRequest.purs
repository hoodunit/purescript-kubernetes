module Kubernetes.Api.CertificatesV1Beta1.CertificateSigningRequest where

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
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.CertificatesV1Beta1 as CertificatesV1Beta1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a CertificateSigningRequest
createCertificateSigningRequest :: forall e. Config -> CertificatesV1Beta1.CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificatesV1Beta1.CertificateSigningRequest)
createCertificateSigningRequest cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteCertificateSigningRequestOptions = DeleteCertificateSigningRequestOptions
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeleteCertificateSigningRequestOptions :: Newtype DeleteCertificateSigningRequestOptions _
derive instance genericDeleteCertificateSigningRequestOptions :: Generic DeleteCertificateSigningRequestOptions _
instance showDeleteCertificateSigningRequestOptions :: Show DeleteCertificateSigningRequestOptions where show a = genericShow a
instance decodeDeleteCertificateSigningRequestOptions :: Decode DeleteCertificateSigningRequestOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeleteCertificateSigningRequestOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteCertificateSigningRequestOptions :: Encode DeleteCertificateSigningRequestOptions where
  encode (DeleteCertificateSigningRequestOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeleteCertificateSigningRequestOptions :: Default DeleteCertificateSigningRequestOptions where
  default = DeleteCertificateSigningRequestOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a CertificateSigningRequest
deleteCertificateSigningRequest :: forall e. Config -> MetaV1.DeleteOptions -> DeleteCertificateSigningRequestOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCertificateSigningRequest cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests/{name}" <> formatQueryString options
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
newtype DeleteCollectionCertificateSigningRequestOptions = DeleteCollectionCertificateSigningRequestOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionCertificateSigningRequestOptions :: Newtype DeleteCollectionCertificateSigningRequestOptions _
derive instance genericDeleteCollectionCertificateSigningRequestOptions :: Generic DeleteCollectionCertificateSigningRequestOptions _
instance showDeleteCollectionCertificateSigningRequestOptions :: Show DeleteCollectionCertificateSigningRequestOptions where show a = genericShow a
instance decodeDeleteCollectionCertificateSigningRequestOptions :: Decode DeleteCollectionCertificateSigningRequestOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionCertificateSigningRequestOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionCertificateSigningRequestOptions :: Encode DeleteCollectionCertificateSigningRequestOptions where
  encode (DeleteCollectionCertificateSigningRequestOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionCertificateSigningRequestOptions :: Default DeleteCollectionCertificateSigningRequestOptions where
  default = DeleteCollectionCertificateSigningRequestOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | delete collection of CertificateSigningRequest
deleteCollectionCertificateSigningRequest :: forall e. Config -> DeleteCollectionCertificateSigningRequestOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionCertificateSigningRequest cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests" <> formatQueryString options

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
newtype ListCertificateSigningRequestOptions = ListCertificateSigningRequestOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListCertificateSigningRequestOptions :: Newtype ListCertificateSigningRequestOptions _
derive instance genericListCertificateSigningRequestOptions :: Generic ListCertificateSigningRequestOptions _
instance showListCertificateSigningRequestOptions :: Show ListCertificateSigningRequestOptions where show a = genericShow a
instance decodeListCertificateSigningRequestOptions :: Decode ListCertificateSigningRequestOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListCertificateSigningRequestOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListCertificateSigningRequestOptions :: Encode ListCertificateSigningRequestOptions where
  encode (ListCertificateSigningRequestOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListCertificateSigningRequestOptions :: Default ListCertificateSigningRequestOptions where
  default = ListCertificateSigningRequestOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind CertificateSigningRequest
listCertificateSigningRequest :: forall e. Config -> ListCertificateSigningRequestOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificatesV1Beta1.CertificateSigningRequestList)
listCertificateSigningRequest cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadCertificateSigningRequestOptions = ReadCertificateSigningRequestOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadCertificateSigningRequestOptions :: Newtype ReadCertificateSigningRequestOptions _
derive instance genericReadCertificateSigningRequestOptions :: Generic ReadCertificateSigningRequestOptions _
instance showReadCertificateSigningRequestOptions :: Show ReadCertificateSigningRequestOptions where show a = genericShow a
instance decodeReadCertificateSigningRequestOptions :: Decode ReadCertificateSigningRequestOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadCertificateSigningRequestOptions { exact, export }
instance encodeReadCertificateSigningRequestOptions :: Encode ReadCertificateSigningRequestOptions where
  encode (ReadCertificateSigningRequestOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadCertificateSigningRequestOptions :: Default ReadCertificateSigningRequestOptions where
  default = ReadCertificateSigningRequestOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified CertificateSigningRequest
readCertificateSigningRequest :: forall e. Config -> ReadCertificateSigningRequestOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificatesV1Beta1.CertificateSigningRequest)
readCertificateSigningRequest cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests/{name}" <> formatQueryString options

-- | replace the specified CertificateSigningRequest
replaceCertificateSigningRequest :: forall e. Config -> CertificatesV1Beta1.CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificatesV1Beta1.CertificateSigningRequest)
replaceCertificateSigningRequest cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests/{name}"
    encodedBody = encodeJSON body

-- | replace approval of the specified CertificateSigningRequest
replaceCertificateSigningRequestApproval :: forall e. Config -> CertificatesV1Beta1.CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificatesV1Beta1.CertificateSigningRequest)
replaceCertificateSigningRequestApproval cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests/{name}/approval"
    encodedBody = encodeJSON body

-- | replace status of the specified CertificateSigningRequest
replaceCertificateSigningRequestStatus :: forall e. Config -> CertificatesV1Beta1.CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificatesV1Beta1.CertificateSigningRequest)
replaceCertificateSigningRequestStatus cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests/{name}/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind CertificateSigningRequest
watchCertificateSigningRequest :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchCertificateSigningRequest cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/watch/certificatesigningrequests/{name}"

-- | watch individual changes to a list of CertificateSigningRequest
watchCertificateSigningRequestList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchCertificateSigningRequestList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/watch/certificatesigningrequests"