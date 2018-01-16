module Kubernetes.Api.CertificatesV1Beta1 where

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

-- | Describes a certificate signing request
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: The certificate request itself and any additional information.
-- | - `status`: Derived information about the request.
newtype CertificateSigningRequest = CertificateSigningRequest
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined CertificateSigningRequestSpec)
  , status :: (NullOrUndefined CertificateSigningRequestStatus) }

derive instance newtypeCertificateSigningRequest :: Newtype CertificateSigningRequest _
derive instance genericCertificateSigningRequest :: Generic CertificateSigningRequest _
instance showCertificateSigningRequest :: Show CertificateSigningRequest where show a = genericShow a
instance decodeCertificateSigningRequest :: Decode CertificateSigningRequest where
  decode a = genericDecode jsonOptions a 
instance encodeCertificateSigningRequest :: Encode CertificateSigningRequest where
  encode a = genericEncode jsonOptions a

instance defaultCertificateSigningRequest :: Default CertificateSigningRequest where
  default = CertificateSigningRequest
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | Fields:
-- | - `lastUpdateTime`: timestamp for the last update to this condition
-- | - `message`: human readable message with details about the request state
-- | - `reason`: brief reason for the request state
-- | - `_type`: request approval state, currently Approved or Denied.
newtype CertificateSigningRequestCondition = CertificateSigningRequestCondition
  { _type :: (NullOrUndefined String)
  , lastUpdateTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String) }

derive instance newtypeCertificateSigningRequestCondition :: Newtype CertificateSigningRequestCondition _
derive instance genericCertificateSigningRequestCondition :: Generic CertificateSigningRequestCondition _
instance showCertificateSigningRequestCondition :: Show CertificateSigningRequestCondition where show a = genericShow a
instance decodeCertificateSigningRequestCondition :: Decode CertificateSigningRequestCondition where
  decode a = genericDecode jsonOptions a 
instance encodeCertificateSigningRequestCondition :: Encode CertificateSigningRequestCondition where
  encode a = genericEncode jsonOptions a

instance defaultCertificateSigningRequestCondition :: Default CertificateSigningRequestCondition where
  default = CertificateSigningRequestCondition
    { _type: NullOrUndefined Nothing
    , lastUpdateTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing }

-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
newtype CertificateSigningRequestList = CertificateSigningRequestList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array CertificateSigningRequest))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeCertificateSigningRequestList :: Newtype CertificateSigningRequestList _
derive instance genericCertificateSigningRequestList :: Generic CertificateSigningRequestList _
instance showCertificateSigningRequestList :: Show CertificateSigningRequestList where show a = genericShow a
instance decodeCertificateSigningRequestList :: Decode CertificateSigningRequestList where
  decode a = genericDecode jsonOptions a 
instance encodeCertificateSigningRequestList :: Encode CertificateSigningRequestList where
  encode a = genericEncode jsonOptions a

instance defaultCertificateSigningRequestList :: Default CertificateSigningRequestList where
  default = CertificateSigningRequestList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | This information is immutable after the request is created. Only the Request and Usages fields can be set on creation, other fields are derived by Kubernetes and cannot be modified by users.
-- |
-- | Fields:
-- | - `extra`: Extra information about the requesting user. See user.Info interface for details.
-- | - `groups`: Group information about the requesting user. See user.Info interface for details.
-- | - `request`: Base64-encoded PKCS#10 CSR data
-- | - `uid`: UID information about the requesting user. See user.Info interface for details.
-- | - `usages`: allowedUsages specifies a set of usage contexts the key will be valid for. See: https://tools.ietf.org/html/rfc5280#section-4.2.1.3
-- |         https://tools.ietf.org/html/rfc5280#section-4.2.1.12
-- | - `username`: Information about the requesting user. See user.Info interface for details.
newtype CertificateSigningRequestSpec = CertificateSigningRequestSpec
  { extra :: (NullOrUndefined (StrMap (Array String)))
  , groups :: (NullOrUndefined (Array String))
  , request :: (NullOrUndefined String)
  , uid :: (NullOrUndefined String)
  , usages :: (NullOrUndefined (Array String))
  , username :: (NullOrUndefined String) }

derive instance newtypeCertificateSigningRequestSpec :: Newtype CertificateSigningRequestSpec _
derive instance genericCertificateSigningRequestSpec :: Generic CertificateSigningRequestSpec _
instance showCertificateSigningRequestSpec :: Show CertificateSigningRequestSpec where show a = genericShow a
instance decodeCertificateSigningRequestSpec :: Decode CertificateSigningRequestSpec where
  decode a = genericDecode jsonOptions a 
instance encodeCertificateSigningRequestSpec :: Encode CertificateSigningRequestSpec where
  encode a = genericEncode jsonOptions a

instance defaultCertificateSigningRequestSpec :: Default CertificateSigningRequestSpec where
  default = CertificateSigningRequestSpec
    { extra: NullOrUndefined Nothing
    , groups: NullOrUndefined Nothing
    , request: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing
    , usages: NullOrUndefined Nothing
    , username: NullOrUndefined Nothing }

-- | Fields:
-- | - `certificate`: If request was approved, the controller will place the issued certificate here.
-- | - `conditions`: Conditions applied to the request, such as approval or denial.
newtype CertificateSigningRequestStatus = CertificateSigningRequestStatus
  { certificate :: (NullOrUndefined String)
  , conditions :: (NullOrUndefined (Array CertificateSigningRequestCondition)) }

derive instance newtypeCertificateSigningRequestStatus :: Newtype CertificateSigningRequestStatus _
derive instance genericCertificateSigningRequestStatus :: Generic CertificateSigningRequestStatus _
instance showCertificateSigningRequestStatus :: Show CertificateSigningRequestStatus where show a = genericShow a
instance decodeCertificateSigningRequestStatus :: Decode CertificateSigningRequestStatus where
  decode a = genericDecode jsonOptions a 
instance encodeCertificateSigningRequestStatus :: Encode CertificateSigningRequestStatus where
  encode a = genericEncode jsonOptions a

instance defaultCertificateSigningRequestStatus :: Default CertificateSigningRequestStatus where
  default = CertificateSigningRequestStatus
    { certificate: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing }

-- | create a CertificateSigningRequest
createCertificateSigningRequest :: forall e. Config -> CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificateSigningRequest)
createCertificateSigningRequest cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteCertificateSigningRequestOptions = DeleteCertificateSigningRequestOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteCertificateSigningRequestOptions :: Newtype DeleteCertificateSigningRequestOptions _
derive instance genericDeleteCertificateSigningRequestOptions :: Generic DeleteCertificateSigningRequestOptions _
instance showDeleteCertificateSigningRequestOptions :: Show DeleteCertificateSigningRequestOptions where show a = genericShow a
instance decodeDeleteCertificateSigningRequestOptions :: Decode DeleteCertificateSigningRequestOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCertificateSigningRequestOptions :: Encode DeleteCertificateSigningRequestOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCertificateSigningRequestOptions :: Default DeleteCertificateSigningRequestOptions where
  default = DeleteCertificateSigningRequestOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

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
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionCertificateSigningRequestOptions :: Newtype DeleteCollectionCertificateSigningRequestOptions _
derive instance genericDeleteCollectionCertificateSigningRequestOptions :: Generic DeleteCollectionCertificateSigningRequestOptions _
instance showDeleteCollectionCertificateSigningRequestOptions :: Show DeleteCollectionCertificateSigningRequestOptions where show a = genericShow a
instance decodeDeleteCollectionCertificateSigningRequestOptions :: Decode DeleteCollectionCertificateSigningRequestOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionCertificateSigningRequestOptions :: Encode DeleteCollectionCertificateSigningRequestOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionCertificateSigningRequestOptions :: Default DeleteCollectionCertificateSigningRequestOptions where
  default = DeleteCollectionCertificateSigningRequestOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of CertificateSigningRequest
deleteCollectionCertificateSigningRequest :: forall e. Config -> DeleteCollectionCertificateSigningRequestOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionCertificateSigningRequest cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests" <> formatQueryString options

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/"

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
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListCertificateSigningRequestOptions :: Newtype ListCertificateSigningRequestOptions _
derive instance genericListCertificateSigningRequestOptions :: Generic ListCertificateSigningRequestOptions _
instance showListCertificateSigningRequestOptions :: Show ListCertificateSigningRequestOptions where show a = genericShow a
instance decodeListCertificateSigningRequestOptions :: Decode ListCertificateSigningRequestOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListCertificateSigningRequestOptions :: Encode ListCertificateSigningRequestOptions where
  encode a = genericEncode jsonOptions a

instance defaultListCertificateSigningRequestOptions :: Default ListCertificateSigningRequestOptions where
  default = ListCertificateSigningRequestOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind CertificateSigningRequest
listCertificateSigningRequest :: forall e. Config -> ListCertificateSigningRequestOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificateSigningRequestList)
listCertificateSigningRequest cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadCertificateSigningRequestOptions = ReadCertificateSigningRequestOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadCertificateSigningRequestOptions :: Newtype ReadCertificateSigningRequestOptions _
derive instance genericReadCertificateSigningRequestOptions :: Generic ReadCertificateSigningRequestOptions _
instance showReadCertificateSigningRequestOptions :: Show ReadCertificateSigningRequestOptions where show a = genericShow a
instance decodeReadCertificateSigningRequestOptions :: Decode ReadCertificateSigningRequestOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadCertificateSigningRequestOptions :: Encode ReadCertificateSigningRequestOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadCertificateSigningRequestOptions :: Default ReadCertificateSigningRequestOptions where
  default = ReadCertificateSigningRequestOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified CertificateSigningRequest
readCertificateSigningRequest :: forall e. Config -> ReadCertificateSigningRequestOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificateSigningRequest)
readCertificateSigningRequest cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests/{name}" <> formatQueryString options

-- | replace the specified CertificateSigningRequest
replaceCertificateSigningRequest :: forall e. Config -> CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificateSigningRequest)
replaceCertificateSigningRequest cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests/{name}"
    encodedBody = encodeJSON body

-- | replace approval of the specified CertificateSigningRequest
replaceCertificateSigningRequestApproval :: forall e. Config -> CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificateSigningRequest)
replaceCertificateSigningRequestApproval cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests/{name}/approval"
    encodedBody = encodeJSON body

-- | replace status of the specified CertificateSigningRequest
replaceCertificateSigningRequestStatus :: forall e. Config -> CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificateSigningRequest)
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