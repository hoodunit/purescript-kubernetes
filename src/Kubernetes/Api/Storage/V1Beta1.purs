module Kubernetes.Api.Storage.V1Beta1 where

import Prelude
import Prelude
import Prelude
import Control.Alt ((<|>))
import Data.Either (Either(Left,Right))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(Tuple))
import Effect.Aff (Aff)
import Foreign.Class (class Decode, class Encode, decode, encode)
import Prelude
import Data.Maybe (Maybe(Just,Nothing))
import Foreign.Class (class Decode, class Encode, encode, decode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Foreign.Generic.Types (Options)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Meta.V1 as MetaV1

-- | StorageClass describes the parameters for a class of storage for which PersistentVolumes can be dynamically provisioned.
-- | 
-- | StorageClasses are non-namespaced; the name of the storage class according to etcd is in ObjectMeta.Name.
-- |
-- | Fields:
-- | - `allowVolumeExpansion`: AllowVolumeExpansion shows whether the storage class allow volume expand
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `mountOptions`: Dynamically provisioned PersistentVolumes of this storage class are created with these mountOptions, e.g. ["ro", "soft"]. Not validated - mount of the PVs will simply fail if one is invalid.
-- | - `parameters`: Parameters holds the parameters for the provisioner that should create volumes of this storage class.
-- | - `provisioner`: Provisioner indicates the type of the provisioner.
-- | - `reclaimPolicy`: Dynamically provisioned PersistentVolumes of this storage class are created with this reclaimPolicy. Defaults to Delete.
-- | - `volumeBindingMode`: VolumeBindingMode indicates how PersistentVolumeClaims should be provisioned and bound.  When unset, VolumeBindingImmediate is used. This field is alpha-level and is only honored by servers that enable the VolumeScheduling feature.
newtype StorageClass = StorageClass
  { allowVolumeExpansion :: (Maybe Boolean)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , mountOptions :: (Maybe (Array String))
  , parameters :: (Maybe (Object String))
  , provisioner :: (Maybe String)
  , reclaimPolicy :: (Maybe String)
  , volumeBindingMode :: (Maybe String) }

derive instance newtypeStorageClass :: Newtype StorageClass _
derive instance genericStorageClass :: Generic StorageClass _
instance showStorageClass :: Show StorageClass where show a = genericShow a
instance decodeStorageClass :: Decode StorageClass where
  decode a = do
               allowVolumeExpansion <- decodeMaybe "allowVolumeExpansion" a
               assertPropEq "apiVersion" "storage.k8s.io/v1beta1" a
               assertPropEq "kind" "StorageClass" a
               metadata <- decodeMaybe "metadata" a
               mountOptions <- decodeMaybe "mountOptions" a
               parameters <- decodeMaybe "parameters" a
               provisioner <- decodeMaybe "provisioner" a
               reclaimPolicy <- decodeMaybe "reclaimPolicy" a
               volumeBindingMode <- decodeMaybe "volumeBindingMode" a
               pure $ StorageClass { allowVolumeExpansion, metadata, mountOptions, parameters, provisioner, reclaimPolicy, volumeBindingMode }
instance encodeStorageClass :: Encode StorageClass where
  encode (StorageClass a) = encode $ Object.fromFoldable $
               [ Tuple "allowVolumeExpansion" (encodeMaybe a.allowVolumeExpansion)
               , Tuple "apiVersion" (encode "storage.k8s.io/v1beta1")
               , Tuple "kind" (encode "StorageClass")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "mountOptions" (encodeMaybe a.mountOptions)
               , Tuple "parameters" (encodeMaybe a.parameters)
               , Tuple "provisioner" (encodeMaybe a.provisioner)
               , Tuple "reclaimPolicy" (encodeMaybe a.reclaimPolicy)
               , Tuple "volumeBindingMode" (encodeMaybe a.volumeBindingMode) ]


instance defaultStorageClass :: Default StorageClass where
  default = StorageClass
    { allowVolumeExpansion: Nothing
    , metadata: Nothing
    , mountOptions: Nothing
    , parameters: Nothing
    , provisioner: Nothing
    , reclaimPolicy: Nothing
    , volumeBindingMode: Nothing }

-- | StorageClassList is a collection of storage classes.
-- |
-- | Fields:
-- | - `items`: Items is the list of StorageClasses
-- | - `metadata`: Standard list metadata More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype StorageClassList = StorageClassList
  { items :: (Maybe (Array StorageClass))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeStorageClassList :: Newtype StorageClassList _
derive instance genericStorageClassList :: Generic StorageClassList _
instance showStorageClassList :: Show StorageClassList where show a = genericShow a
instance decodeStorageClassList :: Decode StorageClassList where
  decode a = do
               assertPropEq "apiVersion" "storage.k8s.io/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "StorageClassList" a
               metadata <- decodeMaybe "metadata" a
               pure $ StorageClassList { items, metadata }
instance encodeStorageClassList :: Encode StorageClassList where
  encode (StorageClassList a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "storage.k8s.io/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "StorageClassList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultStorageClassList :: Default StorageClassList where
  default = StorageClassList
    { items: Nothing
    , metadata: Nothing }

-- | get available resources
getAPIResources :: Config -> Aff (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/storage.k8s.io/v1beta1/"