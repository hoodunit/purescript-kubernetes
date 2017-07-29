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

-- | create a CertificateSigningRequest
createCertificateSigningRequest :: forall e. Config -> CertificateSigningRequest -> Aff (http :: HTTP | e) (Either MetaV1.Status CertificateSigningRequest)
createCertificateSigningRequest cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/certificates.k8s.io/v1beta1/certificatesigningrequests"
    encodedBody = encodeJSON body

-- | DeleteCertificateSigningRequestOptions
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

-- | DeleteCollectionCertificateSigningRequestOptions
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

-- | io.k8s.api.certificates.v1beta1.CertificateSigningRequest
-- | Describes a certificate signing request
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

-- | io.k8s.api.certificates.v1beta1.CertificateSigningRequestCondition
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

-- | io.k8s.api.certificates.v1beta1.CertificateSigningRequestList
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

-- | io.k8s.api.certificates.v1beta1.CertificateSigningRequestSpec
-- | This information is immutable after the request is created. Only the Request and Usages fields can be set on creation, other fields are derived by Kubernetes and cannot be modified by users.
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

-- | io.k8s.api.certificates.v1beta1.CertificateSigningRequestStatus
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

-- | ListCertificateSigningRequestOptions
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

-- | ReadCertificateSigningRequestOptions
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