module Kubernetes.Api.CertificatesV1Beta1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (decodeMaybe, encodeMaybe, jsonOptions)
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
  { apiVersion :: (Maybe String)
  , kind :: (Maybe String)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe CertificateSigningRequestSpec)
  , status :: (Maybe CertificateSigningRequestStatus) }

derive instance newtypeCertificateSigningRequest :: Newtype CertificateSigningRequest _
derive instance genericCertificateSigningRequest :: Generic CertificateSigningRequest _
instance showCertificateSigningRequest :: Show CertificateSigningRequest where show a = genericShow a
instance decodeCertificateSigningRequest :: Decode CertificateSigningRequest where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               kind <- decodeMaybe "kind" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ CertificateSigningRequest { apiVersion, kind, metadata, spec, status }
instance encodeCertificateSigningRequest :: Encode CertificateSigningRequest where
  encode (CertificateSigningRequest a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultCertificateSigningRequest :: Default CertificateSigningRequest where
  default = CertificateSigningRequest
    { apiVersion: Nothing
    , kind: Nothing
    , metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | Fields:
-- | - `lastUpdateTime`: timestamp for the last update to this condition
-- | - `message`: human readable message with details about the request state
-- | - `reason`: brief reason for the request state
-- | - `_type`: request approval state, currently Approved or Denied.
newtype CertificateSigningRequestCondition = CertificateSigningRequestCondition
  { _type :: (Maybe String)
  , lastUpdateTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String) }

derive instance newtypeCertificateSigningRequestCondition :: Newtype CertificateSigningRequestCondition _
derive instance genericCertificateSigningRequestCondition :: Generic CertificateSigningRequestCondition _
instance showCertificateSigningRequestCondition :: Show CertificateSigningRequestCondition where show a = genericShow a
instance decodeCertificateSigningRequestCondition :: Decode CertificateSigningRequestCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastUpdateTime <- decodeMaybe "lastUpdateTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               pure $ CertificateSigningRequestCondition { _type, lastUpdateTime, message, reason }
instance encodeCertificateSigningRequestCondition :: Encode CertificateSigningRequestCondition where
  encode (CertificateSigningRequestCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastUpdateTime" (encodeMaybe a.lastUpdateTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason) ]


instance defaultCertificateSigningRequestCondition :: Default CertificateSigningRequestCondition where
  default = CertificateSigningRequestCondition
    { _type: Nothing
    , lastUpdateTime: Nothing
    , message: Nothing
    , reason: Nothing }

-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
newtype CertificateSigningRequestList = CertificateSigningRequestList
  { apiVersion :: (Maybe String)
  , items :: (Maybe (Array CertificateSigningRequest))
  , kind :: (Maybe String)
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeCertificateSigningRequestList :: Newtype CertificateSigningRequestList _
derive instance genericCertificateSigningRequestList :: Generic CertificateSigningRequestList _
instance showCertificateSigningRequestList :: Show CertificateSigningRequestList where show a = genericShow a
instance decodeCertificateSigningRequestList :: Decode CertificateSigningRequestList where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               items <- decodeMaybe "items" a
               kind <- decodeMaybe "kind" a
               metadata <- decodeMaybe "metadata" a
               pure $ CertificateSigningRequestList { apiVersion, items, kind, metadata }
instance encodeCertificateSigningRequestList :: Encode CertificateSigningRequestList where
  encode (CertificateSigningRequestList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultCertificateSigningRequestList :: Default CertificateSigningRequestList where
  default = CertificateSigningRequestList
    { apiVersion: Nothing
    , items: Nothing
    , kind: Nothing
    , metadata: Nothing }

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
  { extra :: (Maybe (StrMap (Array String)))
  , groups :: (Maybe (Array String))
  , request :: (Maybe String)
  , uid :: (Maybe String)
  , usages :: (Maybe (Array String))
  , username :: (Maybe String) }

derive instance newtypeCertificateSigningRequestSpec :: Newtype CertificateSigningRequestSpec _
derive instance genericCertificateSigningRequestSpec :: Generic CertificateSigningRequestSpec _
instance showCertificateSigningRequestSpec :: Show CertificateSigningRequestSpec where show a = genericShow a
instance decodeCertificateSigningRequestSpec :: Decode CertificateSigningRequestSpec where
  decode a = do
               extra <- decodeMaybe "extra" a
               groups <- decodeMaybe "groups" a
               request <- decodeMaybe "request" a
               uid <- decodeMaybe "uid" a
               usages <- decodeMaybe "usages" a
               username <- decodeMaybe "username" a
               pure $ CertificateSigningRequestSpec { extra, groups, request, uid, usages, username }
instance encodeCertificateSigningRequestSpec :: Encode CertificateSigningRequestSpec where
  encode (CertificateSigningRequestSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "extra" (encodeMaybe a.extra)
               , Tuple "groups" (encodeMaybe a.groups)
               , Tuple "request" (encodeMaybe a.request)
               , Tuple "uid" (encodeMaybe a.uid)
               , Tuple "usages" (encodeMaybe a.usages)
               , Tuple "username" (encodeMaybe a.username) ]


instance defaultCertificateSigningRequestSpec :: Default CertificateSigningRequestSpec where
  default = CertificateSigningRequestSpec
    { extra: Nothing
    , groups: Nothing
    , request: Nothing
    , uid: Nothing
    , usages: Nothing
    , username: Nothing }

-- | Fields:
-- | - `certificate`: If request was approved, the controller will place the issued certificate here.
-- | - `conditions`: Conditions applied to the request, such as approval or denial.
newtype CertificateSigningRequestStatus = CertificateSigningRequestStatus
  { certificate :: (Maybe String)
  , conditions :: (Maybe (Array CertificateSigningRequestCondition)) }

derive instance newtypeCertificateSigningRequestStatus :: Newtype CertificateSigningRequestStatus _
derive instance genericCertificateSigningRequestStatus :: Generic CertificateSigningRequestStatus _
instance showCertificateSigningRequestStatus :: Show CertificateSigningRequestStatus where show a = genericShow a
instance decodeCertificateSigningRequestStatus :: Decode CertificateSigningRequestStatus where
  decode a = do
               certificate <- decodeMaybe "certificate" a
               conditions <- decodeMaybe "conditions" a
               pure $ CertificateSigningRequestStatus { certificate, conditions }
instance encodeCertificateSigningRequestStatus :: Encode CertificateSigningRequestStatus where
  encode (CertificateSigningRequestStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "certificate" (encodeMaybe a.certificate)
               , Tuple "conditions" (encodeMaybe a.conditions) ]


instance defaultCertificateSigningRequestStatus :: Default CertificateSigningRequestStatus where
  default = CertificateSigningRequestStatus
    { certificate: Nothing
    , conditions: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/certificates.k8s.io/v1beta1/"