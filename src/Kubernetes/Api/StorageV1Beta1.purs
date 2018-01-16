module Kubernetes.Api.StorageV1Beta1 where

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

-- | io.k8s.api.storage.v1beta1.StorageClass
-- | StorageClass describes the parameters for a class of storage for which PersistentVolumes can be dynamically provisioned.
-- | 
-- | StorageClasses are non-namespaced; the name of the storage class according to etcd is in ObjectMeta.Name.
newtype StorageClass = StorageClass
  { allowVolumeExpansion :: (NullOrUndefined Boolean)
  , apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , mountOptions :: (NullOrUndefined (Array String))
  , parameters :: (NullOrUndefined (StrMap String))
  , provisioner :: (NullOrUndefined String)
  , reclaimPolicy :: (NullOrUndefined String)
  , volumeBindingMode :: (NullOrUndefined String) }

derive instance newtypeStorageClass :: Newtype StorageClass _
derive instance genericStorageClass :: Generic StorageClass _
instance showStorageClass :: Show StorageClass where show a = genericShow a
instance decodeStorageClass :: Decode StorageClass where
  decode a = genericDecode jsonOptions a 
instance encodeStorageClass :: Encode StorageClass where
  encode a = genericEncode jsonOptions a

instance defaultStorageClass :: Default StorageClass where
  default = StorageClass
    { allowVolumeExpansion: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , mountOptions: NullOrUndefined Nothing
    , parameters: NullOrUndefined Nothing
    , provisioner: NullOrUndefined Nothing
    , reclaimPolicy: NullOrUndefined Nothing
    , volumeBindingMode: NullOrUndefined Nothing }

-- | io.k8s.api.storage.v1beta1.StorageClassList
-- | StorageClassList is a collection of storage classes.
newtype StorageClassList = StorageClassList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array StorageClass))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeStorageClassList :: Newtype StorageClassList _
derive instance genericStorageClassList :: Generic StorageClassList _
instance showStorageClassList :: Show StorageClassList where show a = genericShow a
instance decodeStorageClassList :: Decode StorageClassList where
  decode a = genericDecode jsonOptions a 
instance encodeStorageClassList :: Encode StorageClassList where
  encode a = genericEncode jsonOptions a

instance defaultStorageClassList :: Default StorageClassList where
  default = StorageClassList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | create a StorageClass
createStorageClass :: forall e. Config -> StorageClass -> Aff (http :: HTTP | e) (Either MetaV1.Status StorageClass)
createStorageClass cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses"
    encodedBody = encodeJSON body

-- | DeleteCollectionStorageClassOptions
newtype DeleteCollectionStorageClassOptions = DeleteCollectionStorageClassOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionStorageClassOptions :: Newtype DeleteCollectionStorageClassOptions _
derive instance genericDeleteCollectionStorageClassOptions :: Generic DeleteCollectionStorageClassOptions _
instance showDeleteCollectionStorageClassOptions :: Show DeleteCollectionStorageClassOptions where show a = genericShow a
instance decodeDeleteCollectionStorageClassOptions :: Decode DeleteCollectionStorageClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionStorageClassOptions :: Encode DeleteCollectionStorageClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionStorageClassOptions :: Default DeleteCollectionStorageClassOptions where
  default = DeleteCollectionStorageClassOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of StorageClass
deleteCollectionStorageClass :: forall e. Config -> DeleteCollectionStorageClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionStorageClass cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses" <> formatQueryString options

-- | DeleteStorageClassOptions
newtype DeleteStorageClassOptions = DeleteStorageClassOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteStorageClassOptions :: Newtype DeleteStorageClassOptions _
derive instance genericDeleteStorageClassOptions :: Generic DeleteStorageClassOptions _
instance showDeleteStorageClassOptions :: Show DeleteStorageClassOptions where show a = genericShow a
instance decodeDeleteStorageClassOptions :: Decode DeleteStorageClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteStorageClassOptions :: Encode DeleteStorageClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteStorageClassOptions :: Default DeleteStorageClassOptions where
  default = DeleteStorageClassOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a StorageClass
deleteStorageClass :: forall e. Config -> MetaV1.DeleteOptions -> DeleteStorageClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteStorageClass cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/"

-- | ListStorageClassOptions
newtype ListStorageClassOptions = ListStorageClassOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListStorageClassOptions :: Newtype ListStorageClassOptions _
derive instance genericListStorageClassOptions :: Generic ListStorageClassOptions _
instance showListStorageClassOptions :: Show ListStorageClassOptions where show a = genericShow a
instance decodeListStorageClassOptions :: Decode ListStorageClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListStorageClassOptions :: Encode ListStorageClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultListStorageClassOptions :: Default ListStorageClassOptions where
  default = ListStorageClassOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind StorageClass
listStorageClass :: forall e. Config -> ListStorageClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status StorageClassList)
listStorageClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses" <> formatQueryString options

-- | ReadStorageClassOptions
newtype ReadStorageClassOptions = ReadStorageClassOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadStorageClassOptions :: Newtype ReadStorageClassOptions _
derive instance genericReadStorageClassOptions :: Generic ReadStorageClassOptions _
instance showReadStorageClassOptions :: Show ReadStorageClassOptions where show a = genericShow a
instance decodeReadStorageClassOptions :: Decode ReadStorageClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadStorageClassOptions :: Encode ReadStorageClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadStorageClassOptions :: Default ReadStorageClassOptions where
  default = ReadStorageClassOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified StorageClass
readStorageClass :: forall e. Config -> ReadStorageClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status StorageClass)
readStorageClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses/{name}" <> formatQueryString options

-- | replace the specified StorageClass
replaceStorageClass :: forall e. Config -> StorageClass -> Aff (http :: HTTP | e) (Either MetaV1.Status StorageClass)
replaceStorageClass cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/storage.k8s.io/v1beta1/storageclasses/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind StorageClass
watchStorageClass :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchStorageClass cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/watch/storageclasses/{name}"

-- | watch individual changes to a list of StorageClass
watchStorageClassList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchStorageClassList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/watch/storageclasses"