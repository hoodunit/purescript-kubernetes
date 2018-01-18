module Kubernetes.Api.StorageV1Alpha1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
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
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | VolumeAttachment captures the intent to attach or detach the specified volume to/from the specified node.
-- | 
-- | VolumeAttachment objects are non-namespaced.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired attach/detach volume behavior. Populated by the Kubernetes system.
-- | - `status`: Status of the VolumeAttachment request. Populated by the entity completing the attach or detach operation, i.e. the external-attacher.
newtype VolumeAttachment = VolumeAttachment
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined VolumeAttachmentSpec)
  , status :: (NullOrUndefined VolumeAttachmentStatus) }

derive instance newtypeVolumeAttachment :: Newtype VolumeAttachment _
derive instance genericVolumeAttachment :: Generic VolumeAttachment _
instance showVolumeAttachment :: Show VolumeAttachment where show a = genericShow a
instance decodeVolumeAttachment :: Decode VolumeAttachment where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ VolumeAttachment { apiVersion, kind, metadata, spec, status }
instance encodeVolumeAttachment :: Encode VolumeAttachment where
  encode (VolumeAttachment a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultVolumeAttachment :: Default VolumeAttachment where
  default = VolumeAttachment
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | VolumeAttachmentList is a collection of VolumeAttachment objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of VolumeAttachments
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype VolumeAttachmentList = VolumeAttachmentList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array VolumeAttachment))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeVolumeAttachmentList :: Newtype VolumeAttachmentList _
derive instance genericVolumeAttachmentList :: Generic VolumeAttachmentList _
instance showVolumeAttachmentList :: Show VolumeAttachmentList where show a = genericShow a
instance decodeVolumeAttachmentList :: Decode VolumeAttachmentList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ VolumeAttachmentList { apiVersion, items, kind, metadata }
instance encodeVolumeAttachmentList :: Encode VolumeAttachmentList where
  encode (VolumeAttachmentList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultVolumeAttachmentList :: Default VolumeAttachmentList where
  default = VolumeAttachmentList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | VolumeAttachmentSource represents a volume that should be attached. Right now only PersistenVolumes can be attached via external attacher, in future we may allow also inline volumes in pods. Exactly one member can be set.
-- |
-- | Fields:
-- | - `persistentVolumeName`: Name of the persistent volume to attach.
newtype VolumeAttachmentSource = VolumeAttachmentSource
  { persistentVolumeName :: (NullOrUndefined String) }

derive instance newtypeVolumeAttachmentSource :: Newtype VolumeAttachmentSource _
derive instance genericVolumeAttachmentSource :: Generic VolumeAttachmentSource _
instance showVolumeAttachmentSource :: Show VolumeAttachmentSource where show a = genericShow a
instance decodeVolumeAttachmentSource :: Decode VolumeAttachmentSource where
  decode a = do
               persistentVolumeName <- readProp "persistentVolumeName" a >>= decode
               pure $ VolumeAttachmentSource { persistentVolumeName }
instance encodeVolumeAttachmentSource :: Encode VolumeAttachmentSource where
  encode (VolumeAttachmentSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "persistentVolumeName" (encode a.persistentVolumeName) ]


instance defaultVolumeAttachmentSource :: Default VolumeAttachmentSource where
  default = VolumeAttachmentSource
    { persistentVolumeName: NullOrUndefined Nothing }

-- | VolumeAttachmentSpec is the specification of a VolumeAttachment request.
-- |
-- | Fields:
-- | - `attacher`: Attacher indicates the name of the volume driver that MUST handle this request. This is the name returned by GetPluginName().
-- | - `nodeName`: The node that the volume should be attached to.
-- | - `source`: Source represents the volume that should be attached.
newtype VolumeAttachmentSpec = VolumeAttachmentSpec
  { attacher :: (NullOrUndefined String)
  , nodeName :: (NullOrUndefined String)
  , source :: (NullOrUndefined VolumeAttachmentSource) }

derive instance newtypeVolumeAttachmentSpec :: Newtype VolumeAttachmentSpec _
derive instance genericVolumeAttachmentSpec :: Generic VolumeAttachmentSpec _
instance showVolumeAttachmentSpec :: Show VolumeAttachmentSpec where show a = genericShow a
instance decodeVolumeAttachmentSpec :: Decode VolumeAttachmentSpec where
  decode a = do
               attacher <- readProp "attacher" a >>= decode
               nodeName <- readProp "nodeName" a >>= decode
               source <- readProp "source" a >>= decode
               pure $ VolumeAttachmentSpec { attacher, nodeName, source }
instance encodeVolumeAttachmentSpec :: Encode VolumeAttachmentSpec where
  encode (VolumeAttachmentSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "attacher" (encode a.attacher)
               , Tuple "nodeName" (encode a.nodeName)
               , Tuple "source" (encode a.source) ]


instance defaultVolumeAttachmentSpec :: Default VolumeAttachmentSpec where
  default = VolumeAttachmentSpec
    { attacher: NullOrUndefined Nothing
    , nodeName: NullOrUndefined Nothing
    , source: NullOrUndefined Nothing }

-- | VolumeAttachmentStatus is the status of a VolumeAttachment request.
-- |
-- | Fields:
-- | - `attachError`: The last error encountered during attach operation, if any. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
-- | - `attached`: Indicates the volume is successfully attached. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
-- | - `attachmentMetadata`: Upon successful attach, this field is populated with any information returned by the attach operation that must be passed into subsequent WaitForAttach or Mount calls. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
-- | - `detachError`: The last error encountered during detach operation, if any. This field must only be set by the entity completing the detach operation, i.e. the external-attacher.
newtype VolumeAttachmentStatus = VolumeAttachmentStatus
  { attachError :: (NullOrUndefined VolumeError)
  , attached :: (NullOrUndefined Boolean)
  , attachmentMetadata :: (NullOrUndefined (StrMap String))
  , detachError :: (NullOrUndefined VolumeError) }

derive instance newtypeVolumeAttachmentStatus :: Newtype VolumeAttachmentStatus _
derive instance genericVolumeAttachmentStatus :: Generic VolumeAttachmentStatus _
instance showVolumeAttachmentStatus :: Show VolumeAttachmentStatus where show a = genericShow a
instance decodeVolumeAttachmentStatus :: Decode VolumeAttachmentStatus where
  decode a = do
               attachError <- readProp "attachError" a >>= decode
               attached <- readProp "attached" a >>= decode
               attachmentMetadata <- readProp "attachmentMetadata" a >>= decode
               detachError <- readProp "detachError" a >>= decode
               pure $ VolumeAttachmentStatus { attachError, attached, attachmentMetadata, detachError }
instance encodeVolumeAttachmentStatus :: Encode VolumeAttachmentStatus where
  encode (VolumeAttachmentStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "attachError" (encode a.attachError)
               , Tuple "attached" (encode a.attached)
               , Tuple "attachmentMetadata" (encode a.attachmentMetadata)
               , Tuple "detachError" (encode a.detachError) ]


instance defaultVolumeAttachmentStatus :: Default VolumeAttachmentStatus where
  default = VolumeAttachmentStatus
    { attachError: NullOrUndefined Nothing
    , attached: NullOrUndefined Nothing
    , attachmentMetadata: NullOrUndefined Nothing
    , detachError: NullOrUndefined Nothing }

-- | VolumeError captures an error encountered during a volume operation.
-- |
-- | Fields:
-- | - `message`: String detailing the error encountered during Attach or Detach operation. This string maybe logged, so it should not contain sensitive information.
-- | - `time`: Time the error was encountered.
newtype VolumeError = VolumeError
  { message :: (NullOrUndefined String)
  , time :: (NullOrUndefined MetaV1.Time) }

derive instance newtypeVolumeError :: Newtype VolumeError _
derive instance genericVolumeError :: Generic VolumeError _
instance showVolumeError :: Show VolumeError where show a = genericShow a
instance decodeVolumeError :: Decode VolumeError where
  decode a = do
               message <- readProp "message" a >>= decode
               time <- readProp "time" a >>= decode
               pure $ VolumeError { message, time }
instance encodeVolumeError :: Encode VolumeError where
  encode (VolumeError a) = encode $ StrMap.fromFoldable $
               [ Tuple "message" (encode a.message)
               , Tuple "time" (encode a.time) ]


instance defaultVolumeError :: Default VolumeError where
  default = VolumeError
    { message: NullOrUndefined Nothing
    , time: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/"