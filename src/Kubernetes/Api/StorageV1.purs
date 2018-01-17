module Kubernetes.Api.StorageV1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
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

-- | StorageClass describes the parameters for a class of storage for which PersistentVolumes can be dynamically provisioned.
-- | 
-- | StorageClasses are non-namespaced; the name of the storage class according to etcd is in ObjectMeta.Name.
-- |
-- | Fields:
-- | - `allowVolumeExpansion`: AllowVolumeExpansion shows whether the storage class allow volume expand
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `mountOptions`: Dynamically provisioned PersistentVolumes of this storage class are created with these mountOptions, e.g. ["ro", "soft"]. Not validated - mount of the PVs will simply fail if one is invalid.
-- | - `parameters`: Parameters holds the parameters for the provisioner that should create volumes of this storage class.
-- | - `provisioner`: Provisioner indicates the type of the provisioner.
-- | - `reclaimPolicy`: Dynamically provisioned PersistentVolumes of this storage class are created with this reclaimPolicy. Defaults to Delete.
-- | - `volumeBindingMode`: VolumeBindingMode indicates how PersistentVolumeClaims should be provisioned and bound.  When unset, VolumeBindingImmediate is used. This field is alpha-level and is only honored by servers that enable the VolumeScheduling feature.
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

-- | StorageClassList is a collection of storage classes.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of StorageClasses
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
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

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1/"