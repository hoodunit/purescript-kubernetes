module Kubernetes.Api.StorageV1Alpha1 where

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

-- | io.k8s.api.storage.v1alpha1.VolumeAttachment
-- | VolumeAttachment captures the intent to attach or detach the specified volume to/from the specified node.
-- | 
-- | VolumeAttachment objects are non-namespaced.
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
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachment :: Encode VolumeAttachment where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachment :: Default VolumeAttachment where
  default = VolumeAttachment
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.storage.v1alpha1.VolumeAttachmentList
-- | VolumeAttachmentList is a collection of VolumeAttachment objects.
newtype VolumeAttachmentList = VolumeAttachmentList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array VolumeAttachment))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeVolumeAttachmentList :: Newtype VolumeAttachmentList _
derive instance genericVolumeAttachmentList :: Generic VolumeAttachmentList _
instance showVolumeAttachmentList :: Show VolumeAttachmentList where show a = genericShow a
instance decodeVolumeAttachmentList :: Decode VolumeAttachmentList where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachmentList :: Encode VolumeAttachmentList where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachmentList :: Default VolumeAttachmentList where
  default = VolumeAttachmentList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.storage.v1alpha1.VolumeAttachmentSource
-- | VolumeAttachmentSource represents a volume that should be attached. Right now only PersistenVolumes can be attached via external attacher, in future we may allow also inline volumes in pods. Exactly one member can be set.
newtype VolumeAttachmentSource = VolumeAttachmentSource
  { persistentVolumeName :: (NullOrUndefined String) }

derive instance newtypeVolumeAttachmentSource :: Newtype VolumeAttachmentSource _
derive instance genericVolumeAttachmentSource :: Generic VolumeAttachmentSource _
instance showVolumeAttachmentSource :: Show VolumeAttachmentSource where show a = genericShow a
instance decodeVolumeAttachmentSource :: Decode VolumeAttachmentSource where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachmentSource :: Encode VolumeAttachmentSource where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachmentSource :: Default VolumeAttachmentSource where
  default = VolumeAttachmentSource
    { persistentVolumeName: NullOrUndefined Nothing }

-- | io.k8s.api.storage.v1alpha1.VolumeAttachmentSpec
-- | VolumeAttachmentSpec is the specification of a VolumeAttachment request.
newtype VolumeAttachmentSpec = VolumeAttachmentSpec
  { attacher :: (NullOrUndefined String)
  , nodeName :: (NullOrUndefined String)
  , source :: (NullOrUndefined VolumeAttachmentSource) }

derive instance newtypeVolumeAttachmentSpec :: Newtype VolumeAttachmentSpec _
derive instance genericVolumeAttachmentSpec :: Generic VolumeAttachmentSpec _
instance showVolumeAttachmentSpec :: Show VolumeAttachmentSpec where show a = genericShow a
instance decodeVolumeAttachmentSpec :: Decode VolumeAttachmentSpec where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachmentSpec :: Encode VolumeAttachmentSpec where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachmentSpec :: Default VolumeAttachmentSpec where
  default = VolumeAttachmentSpec
    { attacher: NullOrUndefined Nothing
    , nodeName: NullOrUndefined Nothing
    , source: NullOrUndefined Nothing }

-- | io.k8s.api.storage.v1alpha1.VolumeAttachmentStatus
-- | VolumeAttachmentStatus is the status of a VolumeAttachment request.
newtype VolumeAttachmentStatus = VolumeAttachmentStatus
  { attachError :: (NullOrUndefined VolumeError)
  , attached :: (NullOrUndefined Boolean)
  , attachmentMetadata :: (NullOrUndefined (StrMap String))
  , detachError :: (NullOrUndefined VolumeError) }

derive instance newtypeVolumeAttachmentStatus :: Newtype VolumeAttachmentStatus _
derive instance genericVolumeAttachmentStatus :: Generic VolumeAttachmentStatus _
instance showVolumeAttachmentStatus :: Show VolumeAttachmentStatus where show a = genericShow a
instance decodeVolumeAttachmentStatus :: Decode VolumeAttachmentStatus where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeAttachmentStatus :: Encode VolumeAttachmentStatus where
  encode a = genericEncode jsonOptions a

instance defaultVolumeAttachmentStatus :: Default VolumeAttachmentStatus where
  default = VolumeAttachmentStatus
    { attachError: NullOrUndefined Nothing
    , attached: NullOrUndefined Nothing
    , attachmentMetadata: NullOrUndefined Nothing
    , detachError: NullOrUndefined Nothing }

-- | io.k8s.api.storage.v1alpha1.VolumeError
-- | VolumeError captures an error encountered during a volume operation.
newtype VolumeError = VolumeError
  { message :: (NullOrUndefined String)
  , time :: (NullOrUndefined MetaV1.Time) }

derive instance newtypeVolumeError :: Newtype VolumeError _
derive instance genericVolumeError :: Generic VolumeError _
instance showVolumeError :: Show VolumeError where show a = genericShow a
instance decodeVolumeError :: Decode VolumeError where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeError :: Encode VolumeError where
  encode a = genericEncode jsonOptions a

instance defaultVolumeError :: Default VolumeError where
  default = VolumeError
    { message: NullOrUndefined Nothing
    , time: NullOrUndefined Nothing }

-- | create a VolumeAttachment
createVolumeAttachment :: forall e. Config -> VolumeAttachment -> Aff (http :: HTTP | e) (Either MetaV1.Status VolumeAttachment)
createVolumeAttachment cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments"
    encodedBody = encodeJSON body

-- | DeleteCollectionVolumeAttachmentOptions
newtype DeleteCollectionVolumeAttachmentOptions = DeleteCollectionVolumeAttachmentOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionVolumeAttachmentOptions :: Newtype DeleteCollectionVolumeAttachmentOptions _
derive instance genericDeleteCollectionVolumeAttachmentOptions :: Generic DeleteCollectionVolumeAttachmentOptions _
instance showDeleteCollectionVolumeAttachmentOptions :: Show DeleteCollectionVolumeAttachmentOptions where show a = genericShow a
instance decodeDeleteCollectionVolumeAttachmentOptions :: Decode DeleteCollectionVolumeAttachmentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionVolumeAttachmentOptions :: Encode DeleteCollectionVolumeAttachmentOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionVolumeAttachmentOptions :: Default DeleteCollectionVolumeAttachmentOptions where
  default = DeleteCollectionVolumeAttachmentOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of VolumeAttachment
deleteCollectionVolumeAttachment :: forall e. Config -> DeleteCollectionVolumeAttachmentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionVolumeAttachment cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments" <> formatQueryString options

-- | DeleteVolumeAttachmentOptions
newtype DeleteVolumeAttachmentOptions = DeleteVolumeAttachmentOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteVolumeAttachmentOptions :: Newtype DeleteVolumeAttachmentOptions _
derive instance genericDeleteVolumeAttachmentOptions :: Generic DeleteVolumeAttachmentOptions _
instance showDeleteVolumeAttachmentOptions :: Show DeleteVolumeAttachmentOptions where show a = genericShow a
instance decodeDeleteVolumeAttachmentOptions :: Decode DeleteVolumeAttachmentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteVolumeAttachmentOptions :: Encode DeleteVolumeAttachmentOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteVolumeAttachmentOptions :: Default DeleteVolumeAttachmentOptions where
  default = DeleteVolumeAttachmentOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a VolumeAttachment
deleteVolumeAttachment :: forall e. Config -> MetaV1.DeleteOptions -> DeleteVolumeAttachmentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteVolumeAttachment cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/"

-- | ListVolumeAttachmentOptions
newtype ListVolumeAttachmentOptions = ListVolumeAttachmentOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListVolumeAttachmentOptions :: Newtype ListVolumeAttachmentOptions _
derive instance genericListVolumeAttachmentOptions :: Generic ListVolumeAttachmentOptions _
instance showListVolumeAttachmentOptions :: Show ListVolumeAttachmentOptions where show a = genericShow a
instance decodeListVolumeAttachmentOptions :: Decode ListVolumeAttachmentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListVolumeAttachmentOptions :: Encode ListVolumeAttachmentOptions where
  encode a = genericEncode jsonOptions a

instance defaultListVolumeAttachmentOptions :: Default ListVolumeAttachmentOptions where
  default = ListVolumeAttachmentOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind VolumeAttachment
listVolumeAttachment :: forall e. Config -> ListVolumeAttachmentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status VolumeAttachmentList)
listVolumeAttachment cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments" <> formatQueryString options

-- | ReadVolumeAttachmentOptions
newtype ReadVolumeAttachmentOptions = ReadVolumeAttachmentOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadVolumeAttachmentOptions :: Newtype ReadVolumeAttachmentOptions _
derive instance genericReadVolumeAttachmentOptions :: Generic ReadVolumeAttachmentOptions _
instance showReadVolumeAttachmentOptions :: Show ReadVolumeAttachmentOptions where show a = genericShow a
instance decodeReadVolumeAttachmentOptions :: Decode ReadVolumeAttachmentOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadVolumeAttachmentOptions :: Encode ReadVolumeAttachmentOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadVolumeAttachmentOptions :: Default ReadVolumeAttachmentOptions where
  default = ReadVolumeAttachmentOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified VolumeAttachment
readVolumeAttachment :: forall e. Config -> ReadVolumeAttachmentOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status VolumeAttachment)
readVolumeAttachment cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments/{name}" <> formatQueryString options

-- | replace the specified VolumeAttachment
replaceVolumeAttachment :: forall e. Config -> VolumeAttachment -> Aff (http :: HTTP | e) (Either MetaV1.Status VolumeAttachment)
replaceVolumeAttachment cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1alpha1/volumeattachments/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind VolumeAttachment
watchVolumeAttachment :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchVolumeAttachment cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/watch/volumeattachments/{name}"

-- | watch individual changes to a list of VolumeAttachment
watchVolumeAttachmentList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchVolumeAttachmentList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1alpha1/watch/volumeattachments"