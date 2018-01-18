module Kubernetes.Api.CoreV1 where

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
import Kubernetes.Api.Resource as Resource
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Represents a Persistent Disk resource in AWS.
-- | 
-- | An AWS EBS disk must exist before mounting to a container. The disk must also be in the same AWS zone as the kubelet. An AWS EBS disk can only be mounted as read/write once. AWS EBS volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
-- | - `partition`: The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty).
-- | - `readOnly`: Specify "true" to force and set the ReadOnly property in VolumeMounts to "true". If omitted, the default is "false". More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
-- | - `volumeID`: Unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
newtype AWSElasticBlockStoreVolumeSource = AWSElasticBlockStoreVolumeSource
  { fsType :: (NullOrUndefined String)
  , partition :: (NullOrUndefined Int)
  , readOnly :: (NullOrUndefined Boolean)
  , volumeID :: (NullOrUndefined String) }

derive instance newtypeAWSElasticBlockStoreVolumeSource :: Newtype AWSElasticBlockStoreVolumeSource _
derive instance genericAWSElasticBlockStoreVolumeSource :: Generic AWSElasticBlockStoreVolumeSource _
instance showAWSElasticBlockStoreVolumeSource :: Show AWSElasticBlockStoreVolumeSource where show a = genericShow a
instance decodeAWSElasticBlockStoreVolumeSource :: Decode AWSElasticBlockStoreVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               partition <- readProp "partition" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               volumeID <- readProp "volumeID" a >>= decode
               pure $ AWSElasticBlockStoreVolumeSource { fsType, partition, readOnly, volumeID }
instance encodeAWSElasticBlockStoreVolumeSource :: Encode AWSElasticBlockStoreVolumeSource where
  encode (AWSElasticBlockStoreVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "partition" (encode a.partition)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "volumeID" (encode a.volumeID) ]


instance defaultAWSElasticBlockStoreVolumeSource :: Default AWSElasticBlockStoreVolumeSource where
  default = AWSElasticBlockStoreVolumeSource
    { fsType: NullOrUndefined Nothing
    , partition: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , volumeID: NullOrUndefined Nothing }

-- | Affinity is a group of affinity scheduling rules.
-- |
-- | Fields:
-- | - `nodeAffinity`: Describes node affinity scheduling rules for the pod.
-- | - `podAffinity`: Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone, etc. as some other pod(s)).
-- | - `podAntiAffinity`: Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same node, zone, etc. as some other pod(s)).
newtype Affinity = Affinity
  { nodeAffinity :: (NullOrUndefined NodeAffinity)
  , podAffinity :: (NullOrUndefined PodAffinity)
  , podAntiAffinity :: (NullOrUndefined PodAntiAffinity) }

derive instance newtypeAffinity :: Newtype Affinity _
derive instance genericAffinity :: Generic Affinity _
instance showAffinity :: Show Affinity where show a = genericShow a
instance decodeAffinity :: Decode Affinity where
  decode a = do
               nodeAffinity <- readProp "nodeAffinity" a >>= decode
               podAffinity <- readProp "podAffinity" a >>= decode
               podAntiAffinity <- readProp "podAntiAffinity" a >>= decode
               pure $ Affinity { nodeAffinity, podAffinity, podAntiAffinity }
instance encodeAffinity :: Encode Affinity where
  encode (Affinity a) = encode $ StrMap.fromFoldable $
               [ Tuple "nodeAffinity" (encode a.nodeAffinity)
               , Tuple "podAffinity" (encode a.podAffinity)
               , Tuple "podAntiAffinity" (encode a.podAntiAffinity) ]


instance defaultAffinity :: Default Affinity where
  default = Affinity
    { nodeAffinity: NullOrUndefined Nothing
    , podAffinity: NullOrUndefined Nothing
    , podAntiAffinity: NullOrUndefined Nothing }

-- | AttachedVolume describes a volume attached to a node
-- |
-- | Fields:
-- | - `devicePath`: DevicePath represents the device path where the volume should be available
-- | - `name`: Name of the attached volume
newtype AttachedVolume = AttachedVolume
  { devicePath :: (NullOrUndefined String)
  , name :: (NullOrUndefined String) }

derive instance newtypeAttachedVolume :: Newtype AttachedVolume _
derive instance genericAttachedVolume :: Generic AttachedVolume _
instance showAttachedVolume :: Show AttachedVolume where show a = genericShow a
instance decodeAttachedVolume :: Decode AttachedVolume where
  decode a = do
               devicePath <- readProp "devicePath" a >>= decode
               name <- readProp "name" a >>= decode
               pure $ AttachedVolume { devicePath, name }
instance encodeAttachedVolume :: Encode AttachedVolume where
  encode (AttachedVolume a) = encode $ StrMap.fromFoldable $
               [ Tuple "devicePath" (encode a.devicePath)
               , Tuple "name" (encode a.name) ]


instance defaultAttachedVolume :: Default AttachedVolume where
  default = AttachedVolume
    { devicePath: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | AzureDisk represents an Azure Data Disk mount on the host and bind mount to the pod.
-- |
-- | Fields:
-- | - `cachingMode`: Host Caching mode: None, Read Only, Read Write.
-- | - `diskName`: The Name of the data disk in the blob storage
-- | - `diskURI`: The URI the data disk in the blob storage
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `kind`: Expected values Shared: multiple blob disks per storage account  Dedicated: single blob disk per storage account  Managed: azure managed data disk (only in managed availability set). defaults to shared
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
newtype AzureDiskVolumeSource = AzureDiskVolumeSource
  { cachingMode :: (NullOrUndefined String)
  , diskName :: (NullOrUndefined String)
  , diskURI :: (NullOrUndefined String)
  , fsType :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean) }

derive instance newtypeAzureDiskVolumeSource :: Newtype AzureDiskVolumeSource _
derive instance genericAzureDiskVolumeSource :: Generic AzureDiskVolumeSource _
instance showAzureDiskVolumeSource :: Show AzureDiskVolumeSource where show a = genericShow a
instance decodeAzureDiskVolumeSource :: Decode AzureDiskVolumeSource where
  decode a = do
               cachingMode <- readProp "cachingMode" a >>= decode
               diskName <- readProp "diskName" a >>= decode
               diskURI <- readProp "diskURI" a >>= decode
               fsType <- readProp "fsType" a >>= decode
               kind <- readProp "kind" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               pure $ AzureDiskVolumeSource { cachingMode, diskName, diskURI, fsType, kind, readOnly }
instance encodeAzureDiskVolumeSource :: Encode AzureDiskVolumeSource where
  encode (AzureDiskVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "cachingMode" (encode a.cachingMode)
               , Tuple "diskName" (encode a.diskName)
               , Tuple "diskURI" (encode a.diskURI)
               , Tuple "fsType" (encode a.fsType)
               , Tuple "kind" (encode a.kind)
               , Tuple "readOnly" (encode a.readOnly) ]


instance defaultAzureDiskVolumeSource :: Default AzureDiskVolumeSource where
  default = AzureDiskVolumeSource
    { cachingMode: NullOrUndefined Nothing
    , diskName: NullOrUndefined Nothing
    , diskURI: NullOrUndefined Nothing
    , fsType: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing }

-- | AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
-- |
-- | Fields:
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretName`: the name of secret that contains Azure Storage Account Name and Key
-- | - `secretNamespace`: the namespace of the secret that contains Azure Storage Account Name and Key default is the same as the Pod
-- | - `shareName`: Share Name
newtype AzureFilePersistentVolumeSource = AzureFilePersistentVolumeSource
  { readOnly :: (NullOrUndefined Boolean)
  , secretName :: (NullOrUndefined String)
  , secretNamespace :: (NullOrUndefined String)
  , shareName :: (NullOrUndefined String) }

derive instance newtypeAzureFilePersistentVolumeSource :: Newtype AzureFilePersistentVolumeSource _
derive instance genericAzureFilePersistentVolumeSource :: Generic AzureFilePersistentVolumeSource _
instance showAzureFilePersistentVolumeSource :: Show AzureFilePersistentVolumeSource where show a = genericShow a
instance decodeAzureFilePersistentVolumeSource :: Decode AzureFilePersistentVolumeSource where
  decode a = do
               readOnly <- readProp "readOnly" a >>= decode
               secretName <- readProp "secretName" a >>= decode
               secretNamespace <- readProp "secretNamespace" a >>= decode
               shareName <- readProp "shareName" a >>= decode
               pure $ AzureFilePersistentVolumeSource { readOnly, secretName, secretNamespace, shareName }
instance encodeAzureFilePersistentVolumeSource :: Encode AzureFilePersistentVolumeSource where
  encode (AzureFilePersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretName" (encode a.secretName)
               , Tuple "secretNamespace" (encode a.secretNamespace)
               , Tuple "shareName" (encode a.shareName) ]


instance defaultAzureFilePersistentVolumeSource :: Default AzureFilePersistentVolumeSource where
  default = AzureFilePersistentVolumeSource
    { readOnly: NullOrUndefined Nothing
    , secretName: NullOrUndefined Nothing
    , secretNamespace: NullOrUndefined Nothing
    , shareName: NullOrUndefined Nothing }

-- | AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
-- |
-- | Fields:
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretName`: the name of secret that contains Azure Storage Account Name and Key
-- | - `shareName`: Share Name
newtype AzureFileVolumeSource = AzureFileVolumeSource
  { readOnly :: (NullOrUndefined Boolean)
  , secretName :: (NullOrUndefined String)
  , shareName :: (NullOrUndefined String) }

derive instance newtypeAzureFileVolumeSource :: Newtype AzureFileVolumeSource _
derive instance genericAzureFileVolumeSource :: Generic AzureFileVolumeSource _
instance showAzureFileVolumeSource :: Show AzureFileVolumeSource where show a = genericShow a
instance decodeAzureFileVolumeSource :: Decode AzureFileVolumeSource where
  decode a = do
               readOnly <- readProp "readOnly" a >>= decode
               secretName <- readProp "secretName" a >>= decode
               shareName <- readProp "shareName" a >>= decode
               pure $ AzureFileVolumeSource { readOnly, secretName, shareName }
instance encodeAzureFileVolumeSource :: Encode AzureFileVolumeSource where
  encode (AzureFileVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretName" (encode a.secretName)
               , Tuple "shareName" (encode a.shareName) ]


instance defaultAzureFileVolumeSource :: Default AzureFileVolumeSource where
  default = AzureFileVolumeSource
    { readOnly: NullOrUndefined Nothing
    , secretName: NullOrUndefined Nothing
    , shareName: NullOrUndefined Nothing }

-- | Binding ties one object to another; for example, a pod is bound to a node by a scheduler. Deprecated in 1.7, please use the bindings subresource of pods instead.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `target`: The target object that you want to bind to the standard object.
newtype Binding = Binding
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , target :: (NullOrUndefined ObjectReference) }

derive instance newtypeBinding :: Newtype Binding _
derive instance genericBinding :: Generic Binding _
instance showBinding :: Show Binding where show a = genericShow a
instance decodeBinding :: Decode Binding where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               target <- readProp "target" a >>= decode
               pure $ Binding { apiVersion, kind, metadata, target }
instance encodeBinding :: Encode Binding where
  encode (Binding a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "target" (encode a.target) ]


instance defaultBinding :: Default Binding where
  default = Binding
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , target: NullOrUndefined Nothing }

-- | Represents storage that is managed by an external CSI volume driver
-- |
-- | Fields:
-- | - `driver`: Driver is the name of the driver to use for this volume. Required.
-- | - `readOnly`: Optional: The value to pass to ControllerPublishVolumeRequest. Defaults to false (read/write).
-- | - `volumeHandle`: VolumeHandle is the unique volume name returned by the CSI volume plugin’s CreateVolume to refer to the volume on all subsequent calls. Required.
newtype CSIPersistentVolumeSource = CSIPersistentVolumeSource
  { driver :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , volumeHandle :: (NullOrUndefined String) }

derive instance newtypeCSIPersistentVolumeSource :: Newtype CSIPersistentVolumeSource _
derive instance genericCSIPersistentVolumeSource :: Generic CSIPersistentVolumeSource _
instance showCSIPersistentVolumeSource :: Show CSIPersistentVolumeSource where show a = genericShow a
instance decodeCSIPersistentVolumeSource :: Decode CSIPersistentVolumeSource where
  decode a = do
               driver <- readProp "driver" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               volumeHandle <- readProp "volumeHandle" a >>= decode
               pure $ CSIPersistentVolumeSource { driver, readOnly, volumeHandle }
instance encodeCSIPersistentVolumeSource :: Encode CSIPersistentVolumeSource where
  encode (CSIPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "driver" (encode a.driver)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "volumeHandle" (encode a.volumeHandle) ]


instance defaultCSIPersistentVolumeSource :: Default CSIPersistentVolumeSource where
  default = CSIPersistentVolumeSource
    { driver: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , volumeHandle: NullOrUndefined Nothing }

-- | Adds and removes POSIX capabilities from running containers.
-- |
-- | Fields:
-- | - `add`: Added capabilities
-- | - `drop`: Removed capabilities
newtype Capabilities = Capabilities
  { add :: (NullOrUndefined (Array String))
  , drop :: (NullOrUndefined (Array String)) }

derive instance newtypeCapabilities :: Newtype Capabilities _
derive instance genericCapabilities :: Generic Capabilities _
instance showCapabilities :: Show Capabilities where show a = genericShow a
instance decodeCapabilities :: Decode Capabilities where
  decode a = do
               add <- readProp "add" a >>= decode
               drop <- readProp "drop" a >>= decode
               pure $ Capabilities { add, drop }
instance encodeCapabilities :: Encode Capabilities where
  encode (Capabilities a) = encode $ StrMap.fromFoldable $
               [ Tuple "add" (encode a.add)
               , Tuple "drop" (encode a.drop) ]


instance defaultCapabilities :: Default Capabilities where
  default = Capabilities
    { add: NullOrUndefined Nothing
    , drop: NullOrUndefined Nothing }

-- | Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `monitors`: Required: Monitors is a collection of Ceph monitors More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
-- | - `path`: Optional: Used as the mounted root, rather than the full Ceph tree, default is /
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
-- | - `secretFile`: Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
-- | - `secretRef`: Optional: SecretRef is reference to the authentication secret for User, default is empty. More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
-- | - `user`: Optional: User is the rados user name, default is admin More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
newtype CephFSPersistentVolumeSource = CephFSPersistentVolumeSource
  { monitors :: (NullOrUndefined (Array String))
  , path :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , secretFile :: (NullOrUndefined String)
  , secretRef :: (NullOrUndefined SecretReference)
  , user :: (NullOrUndefined String) }

derive instance newtypeCephFSPersistentVolumeSource :: Newtype CephFSPersistentVolumeSource _
derive instance genericCephFSPersistentVolumeSource :: Generic CephFSPersistentVolumeSource _
instance showCephFSPersistentVolumeSource :: Show CephFSPersistentVolumeSource where show a = genericShow a
instance decodeCephFSPersistentVolumeSource :: Decode CephFSPersistentVolumeSource where
  decode a = do
               monitors <- readProp "monitors" a >>= decode
               path <- readProp "path" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretFile <- readProp "secretFile" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               user <- readProp "user" a >>= decode
               pure $ CephFSPersistentVolumeSource { monitors, path, readOnly, secretFile, secretRef, user }
instance encodeCephFSPersistentVolumeSource :: Encode CephFSPersistentVolumeSource where
  encode (CephFSPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "monitors" (encode a.monitors)
               , Tuple "path" (encode a.path)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretFile" (encode a.secretFile)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "user" (encode a.user) ]


instance defaultCephFSPersistentVolumeSource :: Default CephFSPersistentVolumeSource where
  default = CephFSPersistentVolumeSource
    { monitors: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretFile: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `monitors`: Required: Monitors is a collection of Ceph monitors More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
-- | - `path`: Optional: Used as the mounted root, rather than the full Ceph tree, default is /
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
-- | - `secretFile`: Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
-- | - `secretRef`: Optional: SecretRef is reference to the authentication secret for User, default is empty. More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
-- | - `user`: Optional: User is the rados user name, default is admin More info: https://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it
newtype CephFSVolumeSource = CephFSVolumeSource
  { monitors :: (NullOrUndefined (Array String))
  , path :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , secretFile :: (NullOrUndefined String)
  , secretRef :: (NullOrUndefined LocalObjectReference)
  , user :: (NullOrUndefined String) }

derive instance newtypeCephFSVolumeSource :: Newtype CephFSVolumeSource _
derive instance genericCephFSVolumeSource :: Generic CephFSVolumeSource _
instance showCephFSVolumeSource :: Show CephFSVolumeSource where show a = genericShow a
instance decodeCephFSVolumeSource :: Decode CephFSVolumeSource where
  decode a = do
               monitors <- readProp "monitors" a >>= decode
               path <- readProp "path" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretFile <- readProp "secretFile" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               user <- readProp "user" a >>= decode
               pure $ CephFSVolumeSource { monitors, path, readOnly, secretFile, secretRef, user }
instance encodeCephFSVolumeSource :: Encode CephFSVolumeSource where
  encode (CephFSVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "monitors" (encode a.monitors)
               , Tuple "path" (encode a.path)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretFile" (encode a.secretFile)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "user" (encode a.user) ]


instance defaultCephFSVolumeSource :: Default CephFSVolumeSource where
  default = CephFSVolumeSource
    { monitors: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretFile: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md
-- | - `volumeID`: volume id used to identify the volume in cinder More info: https://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md
newtype CinderVolumeSource = CinderVolumeSource
  { fsType :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , volumeID :: (NullOrUndefined String) }

derive instance newtypeCinderVolumeSource :: Newtype CinderVolumeSource _
derive instance genericCinderVolumeSource :: Generic CinderVolumeSource _
instance showCinderVolumeSource :: Show CinderVolumeSource where show a = genericShow a
instance decodeCinderVolumeSource :: Decode CinderVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               volumeID <- readProp "volumeID" a >>= decode
               pure $ CinderVolumeSource { fsType, readOnly, volumeID }
instance encodeCinderVolumeSource :: Encode CinderVolumeSource where
  encode (CinderVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "volumeID" (encode a.volumeID) ]


instance defaultCinderVolumeSource :: Default CinderVolumeSource where
  default = CinderVolumeSource
    { fsType: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , volumeID: NullOrUndefined Nothing }

-- | ClientIPConfig represents the configurations of Client IP based session affinity.
-- |
-- | Fields:
-- | - `timeoutSeconds`: timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for 3 hours).
newtype ClientIPConfig = ClientIPConfig
  { timeoutSeconds :: (NullOrUndefined Int) }

derive instance newtypeClientIPConfig :: Newtype ClientIPConfig _
derive instance genericClientIPConfig :: Generic ClientIPConfig _
instance showClientIPConfig :: Show ClientIPConfig where show a = genericShow a
instance decodeClientIPConfig :: Decode ClientIPConfig where
  decode a = do
               timeoutSeconds <- readProp "timeoutSeconds" a >>= decode
               pure $ ClientIPConfig { timeoutSeconds }
instance encodeClientIPConfig :: Encode ClientIPConfig where
  encode (ClientIPConfig a) = encode $ StrMap.fromFoldable $
               [ Tuple "timeoutSeconds" (encode a.timeoutSeconds) ]


instance defaultClientIPConfig :: Default ClientIPConfig where
  default = ClientIPConfig
    { timeoutSeconds: NullOrUndefined Nothing }

-- | Information about the condition of a component.
-- |
-- | Fields:
-- | - `error`: Condition error code for a component. For example, a health check error code.
-- | - `message`: Message about the condition for a component. For example, information about a health check.
-- | - `status`: Status of the condition for a component. Valid values for "Healthy": "True", "False", or "Unknown".
-- | - `_type`: Type of condition for a component. Valid value: "Healthy"
newtype ComponentCondition = ComponentCondition
  { _type :: (NullOrUndefined String)
  , error :: (NullOrUndefined String)
  , message :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeComponentCondition :: Newtype ComponentCondition _
derive instance genericComponentCondition :: Generic ComponentCondition _
instance showComponentCondition :: Show ComponentCondition where show a = genericShow a
instance decodeComponentCondition :: Decode ComponentCondition where
  decode a = do
               _type <- readProp "_type" a >>= decode
               error <- readProp "error" a >>= decode
               message <- readProp "message" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ ComponentCondition { _type, error, message, status }
instance encodeComponentCondition :: Encode ComponentCondition where
  encode (ComponentCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "error" (encode a.error)
               , Tuple "message" (encode a.message)
               , Tuple "status" (encode a.status) ]


instance defaultComponentCondition :: Default ComponentCondition where
  default = ComponentCondition
    { _type: NullOrUndefined Nothing
    , error: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | ComponentStatus (and ComponentStatusList) holds the cluster validation info.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `conditions`: List of component conditions observed
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype ComponentStatus = ComponentStatus
  { apiVersion :: (NullOrUndefined String)
  , conditions :: (NullOrUndefined (Array ComponentCondition))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta) }

derive instance newtypeComponentStatus :: Newtype ComponentStatus _
derive instance genericComponentStatus :: Generic ComponentStatus _
instance showComponentStatus :: Show ComponentStatus where show a = genericShow a
instance decodeComponentStatus :: Decode ComponentStatus where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               conditions <- readProp "conditions" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ComponentStatus { apiVersion, conditions, kind, metadata }
instance encodeComponentStatus :: Encode ComponentStatus where
  encode (ComponentStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "conditions" (encode a.conditions)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultComponentStatus :: Default ComponentStatus where
  default = ComponentStatus
    { apiVersion: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | Status of all the conditions for the component as a list of ComponentStatus objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of ComponentStatus objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ComponentStatusList = ComponentStatusList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ComponentStatus))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeComponentStatusList :: Newtype ComponentStatusList _
derive instance genericComponentStatusList :: Generic ComponentStatusList _
instance showComponentStatusList :: Show ComponentStatusList where show a = genericShow a
instance decodeComponentStatusList :: Decode ComponentStatusList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ComponentStatusList { apiVersion, items, kind, metadata }
instance encodeComponentStatusList :: Encode ComponentStatusList where
  encode (ComponentStatusList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultComponentStatusList :: Default ComponentStatusList where
  default = ComponentStatusList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | ConfigMap holds configuration data for pods to consume.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `_data`: Data contains the configuration data. Each key must consist of alphanumeric characters, '-', '_' or '.'.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype ConfigMap = ConfigMap
  { _data :: (NullOrUndefined (StrMap String))
  , apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta) }

derive instance newtypeConfigMap :: Newtype ConfigMap _
derive instance genericConfigMap :: Generic ConfigMap _
instance showConfigMap :: Show ConfigMap where show a = genericShow a
instance decodeConfigMap :: Decode ConfigMap where
  decode a = do
               _data <- readProp "_data" a >>= decode
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ConfigMap { _data, apiVersion, kind, metadata }
instance encodeConfigMap :: Encode ConfigMap where
  encode (ConfigMap a) = encode $ StrMap.fromFoldable $
               [ Tuple "_data" (encode a._data)
               , Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultConfigMap :: Default ConfigMap where
  default = ConfigMap
    { _data: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.
-- | 
-- | The contents of the target ConfigMap's Data field will represent the key-value pairs as environment variables.
-- |
-- | Fields:
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the ConfigMap must be defined
newtype ConfigMapEnvSource = ConfigMapEnvSource
  { name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeConfigMapEnvSource :: Newtype ConfigMapEnvSource _
derive instance genericConfigMapEnvSource :: Generic ConfigMapEnvSource _
instance showConfigMapEnvSource :: Show ConfigMapEnvSource where show a = genericShow a
instance decodeConfigMapEnvSource :: Decode ConfigMapEnvSource where
  decode a = do
               name <- readProp "name" a >>= decode
               optional <- readProp "optional" a >>= decode
               pure $ ConfigMapEnvSource { name, optional }
instance encodeConfigMapEnvSource :: Encode ConfigMapEnvSource where
  encode (ConfigMapEnvSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "optional" (encode a.optional) ]


instance defaultConfigMapEnvSource :: Default ConfigMapEnvSource where
  default = ConfigMapEnvSource
    { name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | Selects a key from a ConfigMap.
-- |
-- | Fields:
-- | - `key`: The key to select.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the ConfigMap or it's key must be defined
newtype ConfigMapKeySelector = ConfigMapKeySelector
  { key :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeConfigMapKeySelector :: Newtype ConfigMapKeySelector _
derive instance genericConfigMapKeySelector :: Generic ConfigMapKeySelector _
instance showConfigMapKeySelector :: Show ConfigMapKeySelector where show a = genericShow a
instance decodeConfigMapKeySelector :: Decode ConfigMapKeySelector where
  decode a = do
               key <- readProp "key" a >>= decode
               name <- readProp "name" a >>= decode
               optional <- readProp "optional" a >>= decode
               pure $ ConfigMapKeySelector { key, name, optional }
instance encodeConfigMapKeySelector :: Encode ConfigMapKeySelector where
  encode (ConfigMapKeySelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "key" (encode a.key)
               , Tuple "name" (encode a.name)
               , Tuple "optional" (encode a.optional) ]


instance defaultConfigMapKeySelector :: Default ConfigMapKeySelector where
  default = ConfigMapKeySelector
    { key: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | ConfigMapList is a resource containing a list of ConfigMap objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of ConfigMaps.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype ConfigMapList = ConfigMapList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ConfigMap))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeConfigMapList :: Newtype ConfigMapList _
derive instance genericConfigMapList :: Generic ConfigMapList _
instance showConfigMapList :: Show ConfigMapList where show a = genericShow a
instance decodeConfigMapList :: Decode ConfigMapList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ConfigMapList { apiVersion, items, kind, metadata }
instance encodeConfigMapList :: Encode ConfigMapList where
  encode (ConfigMapList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultConfigMapList :: Default ConfigMapList where
  default = ConfigMapList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | Adapts a ConfigMap into a projected volume.
-- | 
-- | The contents of the target ConfigMap's Data field will be presented in a projected volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. Note that this is identical to a configmap volume source without the default mode.
-- |
-- | Fields:
-- | - `items`: If unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the ConfigMap, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the ConfigMap or it's keys must be defined
newtype ConfigMapProjection = ConfigMapProjection
  { items :: (NullOrUndefined (Array KeyToPath))
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeConfigMapProjection :: Newtype ConfigMapProjection _
derive instance genericConfigMapProjection :: Generic ConfigMapProjection _
instance showConfigMapProjection :: Show ConfigMapProjection where show a = genericShow a
instance decodeConfigMapProjection :: Decode ConfigMapProjection where
  decode a = do
               items <- readProp "items" a >>= decode
               name <- readProp "name" a >>= decode
               optional <- readProp "optional" a >>= decode
               pure $ ConfigMapProjection { items, name, optional }
instance encodeConfigMapProjection :: Encode ConfigMapProjection where
  encode (ConfigMapProjection a) = encode $ StrMap.fromFoldable $
               [ Tuple "items" (encode a.items)
               , Tuple "name" (encode a.name)
               , Tuple "optional" (encode a.optional) ]


instance defaultConfigMapProjection :: Default ConfigMapProjection where
  default = ConfigMapProjection
    { items: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | Adapts a ConfigMap into a volume.
-- | 
-- | The contents of the target ConfigMap's Data field will be presented in a volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. ConfigMap volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `defaultMode`: Optional: mode bits to use on created files by default. Must be a value between 0 and 0777. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `items`: If unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the ConfigMap, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the ConfigMap or it's keys must be defined
newtype ConfigMapVolumeSource = ConfigMapVolumeSource
  { defaultMode :: (NullOrUndefined Int)
  , items :: (NullOrUndefined (Array KeyToPath))
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeConfigMapVolumeSource :: Newtype ConfigMapVolumeSource _
derive instance genericConfigMapVolumeSource :: Generic ConfigMapVolumeSource _
instance showConfigMapVolumeSource :: Show ConfigMapVolumeSource where show a = genericShow a
instance decodeConfigMapVolumeSource :: Decode ConfigMapVolumeSource where
  decode a = do
               defaultMode <- readProp "defaultMode" a >>= decode
               items <- readProp "items" a >>= decode
               name <- readProp "name" a >>= decode
               optional <- readProp "optional" a >>= decode
               pure $ ConfigMapVolumeSource { defaultMode, items, name, optional }
instance encodeConfigMapVolumeSource :: Encode ConfigMapVolumeSource where
  encode (ConfigMapVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "defaultMode" (encode a.defaultMode)
               , Tuple "items" (encode a.items)
               , Tuple "name" (encode a.name)
               , Tuple "optional" (encode a.optional) ]


instance defaultConfigMapVolumeSource :: Default ConfigMapVolumeSource where
  default = ConfigMapVolumeSource
    { defaultMode: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | A single application container that you want to run within a pod.
-- |
-- | Fields:
-- | - `args`: Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
-- | - `command`: Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
-- | - `env`: List of environment variables to set in the container. Cannot be updated.
-- | - `envFrom`: List of sources to populate environment variables in the container. The keys defined within a source must be a C_IDENTIFIER. All invalid keys will be reported as an event when the container is starting. When a key exists in multiple sources, the value associated with the last source will take precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be updated.
-- | - `image`: Docker image name. More info: https://kubernetes.io/docs/concepts/containers/images This field is optional to allow higher level config management to default or override container images in workload controllers like Deployments and StatefulSets.
-- | - `imagePullPolicy`: Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes.io/docs/concepts/containers/images#updating-images
-- | - `lifecycle`: Actions that the management system should take in response to container lifecycle events. Cannot be updated.
-- | - `livenessProbe`: Periodic probe of container liveness. Container will be restarted if the probe fails. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
-- | - `name`: Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL). Cannot be updated.
-- | - `ports`: List of ports to expose from the container. Exposing a port here gives the system additional information about the network connections a container uses, but is primarily informational. Not specifying a port here DOES NOT prevent that port from being exposed. Any port which is listening on the default "0.0.0.0" address inside a container will be accessible from the network. Cannot be updated.
-- | - `readinessProbe`: Periodic probe of container service readiness. Container will be removed from service endpoints if the probe fails. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
-- | - `resources`: Compute Resources required by this container. Cannot be updated. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources
-- | - `securityContext`: Security options the pod should run with. More info: https://kubernetes.io/docs/concepts/policy/security-context/ More info: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
-- | - `stdin`: Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false.
-- | - `stdinOnce`: Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF. Default is false
-- | - `terminationMessagePath`: Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Will be truncated by the node if greater than 4096 bytes. The total message length across all containers will be limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
-- | - `terminationMessagePolicy`: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.
-- | - `tty`: Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false.
-- | - `volumeDevices`: volumeDevices is the list of block devices to be used by the container. This is an alpha feature and may change in the future.
-- | - `volumeMounts`: Pod volumes to mount into the container's filesystem. Cannot be updated.
-- | - `workingDir`: Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated.
newtype Container = Container
  { args :: (NullOrUndefined (Array String))
  , command :: (NullOrUndefined (Array String))
  , env :: (NullOrUndefined (Array EnvVar))
  , envFrom :: (NullOrUndefined (Array EnvFromSource))
  , image :: (NullOrUndefined String)
  , imagePullPolicy :: (NullOrUndefined String)
  , lifecycle :: (NullOrUndefined Lifecycle)
  , livenessProbe :: (NullOrUndefined Probe)
  , name :: (NullOrUndefined String)
  , ports :: (NullOrUndefined (Array ContainerPort))
  , readinessProbe :: (NullOrUndefined Probe)
  , resources :: (NullOrUndefined ResourceRequirements)
  , securityContext :: (NullOrUndefined SecurityContext)
  , stdin :: (NullOrUndefined Boolean)
  , stdinOnce :: (NullOrUndefined Boolean)
  , terminationMessagePath :: (NullOrUndefined String)
  , terminationMessagePolicy :: (NullOrUndefined String)
  , tty :: (NullOrUndefined Boolean)
  , volumeDevices :: (NullOrUndefined (Array VolumeDevice))
  , volumeMounts :: (NullOrUndefined (Array VolumeMount))
  , workingDir :: (NullOrUndefined String) }

derive instance newtypeContainer :: Newtype Container _
derive instance genericContainer :: Generic Container _
instance showContainer :: Show Container where show a = genericShow a
instance decodeContainer :: Decode Container where
  decode a = do
               args <- readProp "args" a >>= decode
               command <- readProp "command" a >>= decode
               env <- readProp "env" a >>= decode
               envFrom <- readProp "envFrom" a >>= decode
               image <- readProp "image" a >>= decode
               imagePullPolicy <- readProp "imagePullPolicy" a >>= decode
               lifecycle <- readProp "lifecycle" a >>= decode
               livenessProbe <- readProp "livenessProbe" a >>= decode
               name <- readProp "name" a >>= decode
               ports <- readProp "ports" a >>= decode
               readinessProbe <- readProp "readinessProbe" a >>= decode
               resources <- readProp "resources" a >>= decode
               securityContext <- readProp "securityContext" a >>= decode
               stdin <- readProp "stdin" a >>= decode
               stdinOnce <- readProp "stdinOnce" a >>= decode
               terminationMessagePath <- readProp "terminationMessagePath" a >>= decode
               terminationMessagePolicy <- readProp "terminationMessagePolicy" a >>= decode
               tty <- readProp "tty" a >>= decode
               volumeDevices <- readProp "volumeDevices" a >>= decode
               volumeMounts <- readProp "volumeMounts" a >>= decode
               workingDir <- readProp "workingDir" a >>= decode
               pure $ Container { args, command, env, envFrom, image, imagePullPolicy, lifecycle, livenessProbe, name, ports, readinessProbe, resources, securityContext, stdin, stdinOnce, terminationMessagePath, terminationMessagePolicy, tty, volumeDevices, volumeMounts, workingDir }
instance encodeContainer :: Encode Container where
  encode (Container a) = encode $ StrMap.fromFoldable $
               [ Tuple "args" (encode a.args)
               , Tuple "command" (encode a.command)
               , Tuple "env" (encode a.env)
               , Tuple "envFrom" (encode a.envFrom)
               , Tuple "image" (encode a.image)
               , Tuple "imagePullPolicy" (encode a.imagePullPolicy)
               , Tuple "lifecycle" (encode a.lifecycle)
               , Tuple "livenessProbe" (encode a.livenessProbe)
               , Tuple "name" (encode a.name)
               , Tuple "ports" (encode a.ports)
               , Tuple "readinessProbe" (encode a.readinessProbe)
               , Tuple "resources" (encode a.resources)
               , Tuple "securityContext" (encode a.securityContext)
               , Tuple "stdin" (encode a.stdin)
               , Tuple "stdinOnce" (encode a.stdinOnce)
               , Tuple "terminationMessagePath" (encode a.terminationMessagePath)
               , Tuple "terminationMessagePolicy" (encode a.terminationMessagePolicy)
               , Tuple "tty" (encode a.tty)
               , Tuple "volumeDevices" (encode a.volumeDevices)
               , Tuple "volumeMounts" (encode a.volumeMounts)
               , Tuple "workingDir" (encode a.workingDir) ]


instance defaultContainer :: Default Container where
  default = Container
    { args: NullOrUndefined Nothing
    , command: NullOrUndefined Nothing
    , env: NullOrUndefined Nothing
    , envFrom: NullOrUndefined Nothing
    , image: NullOrUndefined Nothing
    , imagePullPolicy: NullOrUndefined Nothing
    , lifecycle: NullOrUndefined Nothing
    , livenessProbe: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , ports: NullOrUndefined Nothing
    , readinessProbe: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing
    , securityContext: NullOrUndefined Nothing
    , stdin: NullOrUndefined Nothing
    , stdinOnce: NullOrUndefined Nothing
    , terminationMessagePath: NullOrUndefined Nothing
    , terminationMessagePolicy: NullOrUndefined Nothing
    , tty: NullOrUndefined Nothing
    , volumeDevices: NullOrUndefined Nothing
    , volumeMounts: NullOrUndefined Nothing
    , workingDir: NullOrUndefined Nothing }

-- | Describe a container image
-- |
-- | Fields:
-- | - `names`: Names by which this image is known. e.g. ["gcr.io/google_containers/hyperkube:v1.0.7", "dockerhub.io/google_containers/hyperkube:v1.0.7"]
-- | - `sizeBytes`: The size of the image in bytes.
newtype ContainerImage = ContainerImage
  { names :: (NullOrUndefined (Array String))
  , sizeBytes :: (NullOrUndefined Int) }

derive instance newtypeContainerImage :: Newtype ContainerImage _
derive instance genericContainerImage :: Generic ContainerImage _
instance showContainerImage :: Show ContainerImage where show a = genericShow a
instance decodeContainerImage :: Decode ContainerImage where
  decode a = do
               names <- readProp "names" a >>= decode
               sizeBytes <- readProp "sizeBytes" a >>= decode
               pure $ ContainerImage { names, sizeBytes }
instance encodeContainerImage :: Encode ContainerImage where
  encode (ContainerImage a) = encode $ StrMap.fromFoldable $
               [ Tuple "names" (encode a.names)
               , Tuple "sizeBytes" (encode a.sizeBytes) ]


instance defaultContainerImage :: Default ContainerImage where
  default = ContainerImage
    { names: NullOrUndefined Nothing
    , sizeBytes: NullOrUndefined Nothing }

-- | ContainerPort represents a network port in a single container.
-- |
-- | Fields:
-- | - `containerPort`: Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x < 65536.
-- | - `hostIP`: What host IP to bind the external port to.
-- | - `hostPort`: Number of port to expose on the host. If specified, this must be a valid port number, 0 < x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do not need this.
-- | - `name`: If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in a pod must have a unique name. Name for the port that can be referred to by services.
-- | - `protocol`: Protocol for port. Must be UDP or TCP. Defaults to "TCP".
newtype ContainerPort = ContainerPort
  { containerPort :: (NullOrUndefined Int)
  , hostIP :: (NullOrUndefined String)
  , hostPort :: (NullOrUndefined Int)
  , name :: (NullOrUndefined String)
  , protocol :: (NullOrUndefined String) }

derive instance newtypeContainerPort :: Newtype ContainerPort _
derive instance genericContainerPort :: Generic ContainerPort _
instance showContainerPort :: Show ContainerPort where show a = genericShow a
instance decodeContainerPort :: Decode ContainerPort where
  decode a = do
               containerPort <- readProp "containerPort" a >>= decode
               hostIP <- readProp "hostIP" a >>= decode
               hostPort <- readProp "hostPort" a >>= decode
               name <- readProp "name" a >>= decode
               protocol <- readProp "protocol" a >>= decode
               pure $ ContainerPort { containerPort, hostIP, hostPort, name, protocol }
instance encodeContainerPort :: Encode ContainerPort where
  encode (ContainerPort a) = encode $ StrMap.fromFoldable $
               [ Tuple "containerPort" (encode a.containerPort)
               , Tuple "hostIP" (encode a.hostIP)
               , Tuple "hostPort" (encode a.hostPort)
               , Tuple "name" (encode a.name)
               , Tuple "protocol" (encode a.protocol) ]


instance defaultContainerPort :: Default ContainerPort where
  default = ContainerPort
    { containerPort: NullOrUndefined Nothing
    , hostIP: NullOrUndefined Nothing
    , hostPort: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , protocol: NullOrUndefined Nothing }

-- | ContainerState holds a possible state of container. Only one of its members may be specified. If none of them is specified, the default one is ContainerStateWaiting.
-- |
-- | Fields:
-- | - `running`: Details about a running container
-- | - `terminated`: Details about a terminated container
-- | - `waiting`: Details about a waiting container
newtype ContainerState = ContainerState
  { running :: (NullOrUndefined ContainerStateRunning)
  , terminated :: (NullOrUndefined ContainerStateTerminated)
  , waiting :: (NullOrUndefined ContainerStateWaiting) }

derive instance newtypeContainerState :: Newtype ContainerState _
derive instance genericContainerState :: Generic ContainerState _
instance showContainerState :: Show ContainerState where show a = genericShow a
instance decodeContainerState :: Decode ContainerState where
  decode a = do
               running <- readProp "running" a >>= decode
               terminated <- readProp "terminated" a >>= decode
               waiting <- readProp "waiting" a >>= decode
               pure $ ContainerState { running, terminated, waiting }
instance encodeContainerState :: Encode ContainerState where
  encode (ContainerState a) = encode $ StrMap.fromFoldable $
               [ Tuple "running" (encode a.running)
               , Tuple "terminated" (encode a.terminated)
               , Tuple "waiting" (encode a.waiting) ]


instance defaultContainerState :: Default ContainerState where
  default = ContainerState
    { running: NullOrUndefined Nothing
    , terminated: NullOrUndefined Nothing
    , waiting: NullOrUndefined Nothing }

-- | ContainerStateRunning is a running state of a container.
-- |
-- | Fields:
-- | - `startedAt`: Time at which the container was last (re-)started
newtype ContainerStateRunning = ContainerStateRunning
  { startedAt :: (NullOrUndefined MetaV1.Time) }

derive instance newtypeContainerStateRunning :: Newtype ContainerStateRunning _
derive instance genericContainerStateRunning :: Generic ContainerStateRunning _
instance showContainerStateRunning :: Show ContainerStateRunning where show a = genericShow a
instance decodeContainerStateRunning :: Decode ContainerStateRunning where
  decode a = do
               startedAt <- readProp "startedAt" a >>= decode
               pure $ ContainerStateRunning { startedAt }
instance encodeContainerStateRunning :: Encode ContainerStateRunning where
  encode (ContainerStateRunning a) = encode $ StrMap.fromFoldable $
               [ Tuple "startedAt" (encode a.startedAt) ]


instance defaultContainerStateRunning :: Default ContainerStateRunning where
  default = ContainerStateRunning
    { startedAt: NullOrUndefined Nothing }

-- | ContainerStateTerminated is a terminated state of a container.
-- |
-- | Fields:
-- | - `containerID`: Container's ID in the format 'docker://<container_id>'
-- | - `exitCode`: Exit status from the last termination of the container
-- | - `finishedAt`: Time at which the container last terminated
-- | - `message`: Message regarding the last termination of the container
-- | - `reason`: (brief) reason from the last termination of the container
-- | - `signal`: Signal from the last termination of the container
-- | - `startedAt`: Time at which previous execution of the container started
newtype ContainerStateTerminated = ContainerStateTerminated
  { containerID :: (NullOrUndefined String)
  , exitCode :: (NullOrUndefined Int)
  , finishedAt :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , signal :: (NullOrUndefined Int)
  , startedAt :: (NullOrUndefined MetaV1.Time) }

derive instance newtypeContainerStateTerminated :: Newtype ContainerStateTerminated _
derive instance genericContainerStateTerminated :: Generic ContainerStateTerminated _
instance showContainerStateTerminated :: Show ContainerStateTerminated where show a = genericShow a
instance decodeContainerStateTerminated :: Decode ContainerStateTerminated where
  decode a = do
               containerID <- readProp "containerID" a >>= decode
               exitCode <- readProp "exitCode" a >>= decode
               finishedAt <- readProp "finishedAt" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               signal <- readProp "signal" a >>= decode
               startedAt <- readProp "startedAt" a >>= decode
               pure $ ContainerStateTerminated { containerID, exitCode, finishedAt, message, reason, signal, startedAt }
instance encodeContainerStateTerminated :: Encode ContainerStateTerminated where
  encode (ContainerStateTerminated a) = encode $ StrMap.fromFoldable $
               [ Tuple "containerID" (encode a.containerID)
               , Tuple "exitCode" (encode a.exitCode)
               , Tuple "finishedAt" (encode a.finishedAt)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "signal" (encode a.signal)
               , Tuple "startedAt" (encode a.startedAt) ]


instance defaultContainerStateTerminated :: Default ContainerStateTerminated where
  default = ContainerStateTerminated
    { containerID: NullOrUndefined Nothing
    , exitCode: NullOrUndefined Nothing
    , finishedAt: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , signal: NullOrUndefined Nothing
    , startedAt: NullOrUndefined Nothing }

-- | ContainerStateWaiting is a waiting state of a container.
-- |
-- | Fields:
-- | - `message`: Message regarding why the container is not yet running.
-- | - `reason`: (brief) reason the container is not yet running.
newtype ContainerStateWaiting = ContainerStateWaiting
  { message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String) }

derive instance newtypeContainerStateWaiting :: Newtype ContainerStateWaiting _
derive instance genericContainerStateWaiting :: Generic ContainerStateWaiting _
instance showContainerStateWaiting :: Show ContainerStateWaiting where show a = genericShow a
instance decodeContainerStateWaiting :: Decode ContainerStateWaiting where
  decode a = do
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               pure $ ContainerStateWaiting { message, reason }
instance encodeContainerStateWaiting :: Encode ContainerStateWaiting where
  encode (ContainerStateWaiting a) = encode $ StrMap.fromFoldable $
               [ Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason) ]


instance defaultContainerStateWaiting :: Default ContainerStateWaiting where
  default = ContainerStateWaiting
    { message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing }

-- | ContainerStatus contains details for the current status of this container.
-- |
-- | Fields:
-- | - `containerID`: Container's ID in the format 'docker://<container_id>'.
-- | - `image`: The image the container is running. More info: https://kubernetes.io/docs/concepts/containers/images
-- | - `imageID`: ImageID of the container's image.
-- | - `lastState`: Details about the container's last termination condition.
-- | - `name`: This must be a DNS_LABEL. Each container in a pod must have a unique name. Cannot be updated.
-- | - `ready`: Specifies whether the container has passed its readiness probe.
-- | - `restartCount`: The number of times the container has been restarted, currently based on the number of dead containers that have not yet been removed. Note that this is calculated from dead containers. But those containers are subject to garbage collection. This value will get capped at 5 by GC.
-- | - `state`: Details about the container's current condition.
newtype ContainerStatus = ContainerStatus
  { containerID :: (NullOrUndefined String)
  , image :: (NullOrUndefined String)
  , imageID :: (NullOrUndefined String)
  , lastState :: (NullOrUndefined ContainerState)
  , name :: (NullOrUndefined String)
  , ready :: (NullOrUndefined Boolean)
  , restartCount :: (NullOrUndefined Int)
  , state :: (NullOrUndefined ContainerState) }

derive instance newtypeContainerStatus :: Newtype ContainerStatus _
derive instance genericContainerStatus :: Generic ContainerStatus _
instance showContainerStatus :: Show ContainerStatus where show a = genericShow a
instance decodeContainerStatus :: Decode ContainerStatus where
  decode a = do
               containerID <- readProp "containerID" a >>= decode
               image <- readProp "image" a >>= decode
               imageID <- readProp "imageID" a >>= decode
               lastState <- readProp "lastState" a >>= decode
               name <- readProp "name" a >>= decode
               ready <- readProp "ready" a >>= decode
               restartCount <- readProp "restartCount" a >>= decode
               state <- readProp "state" a >>= decode
               pure $ ContainerStatus { containerID, image, imageID, lastState, name, ready, restartCount, state }
instance encodeContainerStatus :: Encode ContainerStatus where
  encode (ContainerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "containerID" (encode a.containerID)
               , Tuple "image" (encode a.image)
               , Tuple "imageID" (encode a.imageID)
               , Tuple "lastState" (encode a.lastState)
               , Tuple "name" (encode a.name)
               , Tuple "ready" (encode a.ready)
               , Tuple "restartCount" (encode a.restartCount)
               , Tuple "state" (encode a.state) ]


instance defaultContainerStatus :: Default ContainerStatus where
  default = ContainerStatus
    { containerID: NullOrUndefined Nothing
    , image: NullOrUndefined Nothing
    , imageID: NullOrUndefined Nothing
    , lastState: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , ready: NullOrUndefined Nothing
    , restartCount: NullOrUndefined Nothing
    , state: NullOrUndefined Nothing }

-- | DaemonEndpoint contains information about a single Daemon endpoint.
-- |
-- | Fields:
-- | - `_Port`: Port number of the given endpoint.
newtype DaemonEndpoint = DaemonEndpoint
  { _Port :: (NullOrUndefined Int) }

derive instance newtypeDaemonEndpoint :: Newtype DaemonEndpoint _
derive instance genericDaemonEndpoint :: Generic DaemonEndpoint _
instance showDaemonEndpoint :: Show DaemonEndpoint where show a = genericShow a
instance decodeDaemonEndpoint :: Decode DaemonEndpoint where
  decode a = do
               _Port <- readProp "_Port" a >>= decode
               pure $ DaemonEndpoint { _Port }
instance encodeDaemonEndpoint :: Encode DaemonEndpoint where
  encode (DaemonEndpoint a) = encode $ StrMap.fromFoldable $
               [ Tuple "_Port" (encode a._Port) ]


instance defaultDaemonEndpoint :: Default DaemonEndpoint where
  default = DaemonEndpoint
    { _Port: NullOrUndefined Nothing }

-- | Represents downward API info for projecting into a projected volume. Note that this is identical to a downwardAPI volume source without the default mode.
-- |
-- | Fields:
-- | - `items`: Items is a list of DownwardAPIVolume file
newtype DownwardAPIProjection = DownwardAPIProjection
  { items :: (NullOrUndefined (Array DownwardAPIVolumeFile)) }

derive instance newtypeDownwardAPIProjection :: Newtype DownwardAPIProjection _
derive instance genericDownwardAPIProjection :: Generic DownwardAPIProjection _
instance showDownwardAPIProjection :: Show DownwardAPIProjection where show a = genericShow a
instance decodeDownwardAPIProjection :: Decode DownwardAPIProjection where
  decode a = do
               items <- readProp "items" a >>= decode
               pure $ DownwardAPIProjection { items }
instance encodeDownwardAPIProjection :: Encode DownwardAPIProjection where
  encode (DownwardAPIProjection a) = encode $ StrMap.fromFoldable $
               [ Tuple "items" (encode a.items) ]


instance defaultDownwardAPIProjection :: Default DownwardAPIProjection where
  default = DownwardAPIProjection
    { items: NullOrUndefined Nothing }

-- | DownwardAPIVolumeFile represents information to create the file containing the pod field
-- |
-- | Fields:
-- | - `fieldRef`: Required: Selects a field of the pod: only annotations, labels, name and namespace are supported.
-- | - `mode`: Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `path`: Required: Path is  the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'
-- | - `resourceFieldRef`: Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, requests.cpu and requests.memory) are currently supported.
newtype DownwardAPIVolumeFile = DownwardAPIVolumeFile
  { fieldRef :: (NullOrUndefined ObjectFieldSelector)
  , mode :: (NullOrUndefined Int)
  , path :: (NullOrUndefined String)
  , resourceFieldRef :: (NullOrUndefined ResourceFieldSelector) }

derive instance newtypeDownwardAPIVolumeFile :: Newtype DownwardAPIVolumeFile _
derive instance genericDownwardAPIVolumeFile :: Generic DownwardAPIVolumeFile _
instance showDownwardAPIVolumeFile :: Show DownwardAPIVolumeFile where show a = genericShow a
instance decodeDownwardAPIVolumeFile :: Decode DownwardAPIVolumeFile where
  decode a = do
               fieldRef <- readProp "fieldRef" a >>= decode
               mode <- readProp "mode" a >>= decode
               path <- readProp "path" a >>= decode
               resourceFieldRef <- readProp "resourceFieldRef" a >>= decode
               pure $ DownwardAPIVolumeFile { fieldRef, mode, path, resourceFieldRef }
instance encodeDownwardAPIVolumeFile :: Encode DownwardAPIVolumeFile where
  encode (DownwardAPIVolumeFile a) = encode $ StrMap.fromFoldable $
               [ Tuple "fieldRef" (encode a.fieldRef)
               , Tuple "mode" (encode a.mode)
               , Tuple "path" (encode a.path)
               , Tuple "resourceFieldRef" (encode a.resourceFieldRef) ]


instance defaultDownwardAPIVolumeFile :: Default DownwardAPIVolumeFile where
  default = DownwardAPIVolumeFile
    { fieldRef: NullOrUndefined Nothing
    , mode: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , resourceFieldRef: NullOrUndefined Nothing }

-- | DownwardAPIVolumeSource represents a volume containing downward API info. Downward API volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `defaultMode`: Optional: mode bits to use on created files by default. Must be a value between 0 and 0777. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `items`: Items is a list of downward API volume file
newtype DownwardAPIVolumeSource = DownwardAPIVolumeSource
  { defaultMode :: (NullOrUndefined Int)
  , items :: (NullOrUndefined (Array DownwardAPIVolumeFile)) }

derive instance newtypeDownwardAPIVolumeSource :: Newtype DownwardAPIVolumeSource _
derive instance genericDownwardAPIVolumeSource :: Generic DownwardAPIVolumeSource _
instance showDownwardAPIVolumeSource :: Show DownwardAPIVolumeSource where show a = genericShow a
instance decodeDownwardAPIVolumeSource :: Decode DownwardAPIVolumeSource where
  decode a = do
               defaultMode <- readProp "defaultMode" a >>= decode
               items <- readProp "items" a >>= decode
               pure $ DownwardAPIVolumeSource { defaultMode, items }
instance encodeDownwardAPIVolumeSource :: Encode DownwardAPIVolumeSource where
  encode (DownwardAPIVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "defaultMode" (encode a.defaultMode)
               , Tuple "items" (encode a.items) ]


instance defaultDownwardAPIVolumeSource :: Default DownwardAPIVolumeSource where
  default = DownwardAPIVolumeSource
    { defaultMode: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing }

-- | Represents an empty directory for a pod. Empty directory volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `medium`: What type of storage medium should back this directory. The default is "" which means to use the node's default medium. Must be an empty string (default) or Memory. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir
-- | - `sizeLimit`: Total amount of local storage required for this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. The default is nil which means that the limit is undefined. More info: http://kubernetes.io/docs/user-guide/volumes#emptydir
newtype EmptyDirVolumeSource = EmptyDirVolumeSource
  { medium :: (NullOrUndefined String)
  , sizeLimit :: (NullOrUndefined Resource.Quantity) }

derive instance newtypeEmptyDirVolumeSource :: Newtype EmptyDirVolumeSource _
derive instance genericEmptyDirVolumeSource :: Generic EmptyDirVolumeSource _
instance showEmptyDirVolumeSource :: Show EmptyDirVolumeSource where show a = genericShow a
instance decodeEmptyDirVolumeSource :: Decode EmptyDirVolumeSource where
  decode a = do
               medium <- readProp "medium" a >>= decode
               sizeLimit <- readProp "sizeLimit" a >>= decode
               pure $ EmptyDirVolumeSource { medium, sizeLimit }
instance encodeEmptyDirVolumeSource :: Encode EmptyDirVolumeSource where
  encode (EmptyDirVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "medium" (encode a.medium)
               , Tuple "sizeLimit" (encode a.sizeLimit) ]


instance defaultEmptyDirVolumeSource :: Default EmptyDirVolumeSource where
  default = EmptyDirVolumeSource
    { medium: NullOrUndefined Nothing
    , sizeLimit: NullOrUndefined Nothing }

-- | EndpointAddress is a tuple that describes single IP address.
-- |
-- | Fields:
-- | - `hostname`: The Hostname of this endpoint
-- | - `ip`: The IP of this endpoint. May not be loopback (127.0.0.0/8), link-local (169.254.0.0/16), or link-local multicast ((224.0.0.0/24). IPv6 is also accepted but not fully supported on all platforms. Also, certain kubernetes components, like kube-proxy, are not IPv6 ready.
-- | - `nodeName`: Optional: Node hosting this endpoint. This can be used to determine endpoints local to a node.
-- | - `targetRef`: Reference to object providing the endpoint.
newtype EndpointAddress = EndpointAddress
  { hostname :: (NullOrUndefined String)
  , ip :: (NullOrUndefined String)
  , nodeName :: (NullOrUndefined String)
  , targetRef :: (NullOrUndefined ObjectReference) }

derive instance newtypeEndpointAddress :: Newtype EndpointAddress _
derive instance genericEndpointAddress :: Generic EndpointAddress _
instance showEndpointAddress :: Show EndpointAddress where show a = genericShow a
instance decodeEndpointAddress :: Decode EndpointAddress where
  decode a = do
               hostname <- readProp "hostname" a >>= decode
               ip <- readProp "ip" a >>= decode
               nodeName <- readProp "nodeName" a >>= decode
               targetRef <- readProp "targetRef" a >>= decode
               pure $ EndpointAddress { hostname, ip, nodeName, targetRef }
instance encodeEndpointAddress :: Encode EndpointAddress where
  encode (EndpointAddress a) = encode $ StrMap.fromFoldable $
               [ Tuple "hostname" (encode a.hostname)
               , Tuple "ip" (encode a.ip)
               , Tuple "nodeName" (encode a.nodeName)
               , Tuple "targetRef" (encode a.targetRef) ]


instance defaultEndpointAddress :: Default EndpointAddress where
  default = EndpointAddress
    { hostname: NullOrUndefined Nothing
    , ip: NullOrUndefined Nothing
    , nodeName: NullOrUndefined Nothing
    , targetRef: NullOrUndefined Nothing }

-- | EndpointPort is a tuple that describes a single port.
-- |
-- | Fields:
-- | - `name`: The name of this port (corresponds to ServicePort.Name). Must be a DNS_LABEL. Optional only if one port is defined.
-- | - `port`: The port number of the endpoint.
-- | - `protocol`: The IP protocol for this port. Must be UDP or TCP. Default is TCP.
newtype EndpointPort = EndpointPort
  { name :: (NullOrUndefined String)
  , port :: (NullOrUndefined Int)
  , protocol :: (NullOrUndefined String) }

derive instance newtypeEndpointPort :: Newtype EndpointPort _
derive instance genericEndpointPort :: Generic EndpointPort _
instance showEndpointPort :: Show EndpointPort where show a = genericShow a
instance decodeEndpointPort :: Decode EndpointPort where
  decode a = do
               name <- readProp "name" a >>= decode
               port <- readProp "port" a >>= decode
               protocol <- readProp "protocol" a >>= decode
               pure $ EndpointPort { name, port, protocol }
instance encodeEndpointPort :: Encode EndpointPort where
  encode (EndpointPort a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "port" (encode a.port)
               , Tuple "protocol" (encode a.protocol) ]


instance defaultEndpointPort :: Default EndpointPort where
  default = EndpointPort
    { name: NullOrUndefined Nothing
    , port: NullOrUndefined Nothing
    , protocol: NullOrUndefined Nothing }

-- | EndpointSubset is a group of addresses with a common set of ports. The expanded set of endpoints is the Cartesian product of Addresses x Ports. For example, given:
-- |   {
-- |     Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
-- |     Ports:     [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
-- |   }
-- | The resulting set of endpoints can be viewed as:
-- |     a: [ 10.10.1.1:8675, 10.10.2.2:8675 ],
-- |     b: [ 10.10.1.1:309, 10.10.2.2:309 ]
-- |
-- | Fields:
-- | - `addresses`: IP addresses which offer the related ports that are marked as ready. These endpoints should be considered safe for load balancers and clients to utilize.
-- | - `notReadyAddresses`: IP addresses which offer the related ports but are not currently marked as ready because they have not yet finished starting, have recently failed a readiness check, or have recently failed a liveness check.
-- | - `ports`: Port numbers available on the related IP addresses.
newtype EndpointSubset = EndpointSubset
  { addresses :: (NullOrUndefined (Array EndpointAddress))
  , notReadyAddresses :: (NullOrUndefined (Array EndpointAddress))
  , ports :: (NullOrUndefined (Array EndpointPort)) }

derive instance newtypeEndpointSubset :: Newtype EndpointSubset _
derive instance genericEndpointSubset :: Generic EndpointSubset _
instance showEndpointSubset :: Show EndpointSubset where show a = genericShow a
instance decodeEndpointSubset :: Decode EndpointSubset where
  decode a = do
               addresses <- readProp "addresses" a >>= decode
               notReadyAddresses <- readProp "notReadyAddresses" a >>= decode
               ports <- readProp "ports" a >>= decode
               pure $ EndpointSubset { addresses, notReadyAddresses, ports }
instance encodeEndpointSubset :: Encode EndpointSubset where
  encode (EndpointSubset a) = encode $ StrMap.fromFoldable $
               [ Tuple "addresses" (encode a.addresses)
               , Tuple "notReadyAddresses" (encode a.notReadyAddresses)
               , Tuple "ports" (encode a.ports) ]


instance defaultEndpointSubset :: Default EndpointSubset where
  default = EndpointSubset
    { addresses: NullOrUndefined Nothing
    , notReadyAddresses: NullOrUndefined Nothing
    , ports: NullOrUndefined Nothing }

-- | Endpoints is a collection of endpoints that implement the actual service. Example:
-- |   Name: "mysvc",
-- |   Subsets: [
-- |     {
-- |       Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
-- |       Ports: [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
-- |     },
-- |     {
-- |       Addresses: [{"ip": "10.10.3.3"}],
-- |       Ports: [{"name": "a", "port": 93}, {"name": "b", "port": 76}]
-- |     },
-- |  ]
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `subsets`: The set of all endpoints is the union of all subsets. Addresses are placed into subsets according to the IPs they share. A single address with multiple ports, some of which are ready and some of which are not (because they come from different containers) will result in the address being displayed in different subsets for the different ports. No address will appear in both Addresses and NotReadyAddresses in the same subset. Sets of addresses and ports that comprise a service.
newtype Endpoints = Endpoints
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , subsets :: (NullOrUndefined (Array EndpointSubset)) }

derive instance newtypeEndpoints :: Newtype Endpoints _
derive instance genericEndpoints :: Generic Endpoints _
instance showEndpoints :: Show Endpoints where show a = genericShow a
instance decodeEndpoints :: Decode Endpoints where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               subsets <- readProp "subsets" a >>= decode
               pure $ Endpoints { apiVersion, kind, metadata, subsets }
instance encodeEndpoints :: Encode Endpoints where
  encode (Endpoints a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "subsets" (encode a.subsets) ]


instance defaultEndpoints :: Default Endpoints where
  default = Endpoints
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , subsets: NullOrUndefined Nothing }

-- | EndpointsList is a list of endpoints.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of endpoints.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype EndpointsList = EndpointsList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Endpoints))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeEndpointsList :: Newtype EndpointsList _
derive instance genericEndpointsList :: Generic EndpointsList _
instance showEndpointsList :: Show EndpointsList where show a = genericShow a
instance decodeEndpointsList :: Decode EndpointsList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ EndpointsList { apiVersion, items, kind, metadata }
instance encodeEndpointsList :: Encode EndpointsList where
  encode (EndpointsList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultEndpointsList :: Default EndpointsList where
  default = EndpointsList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | EnvFromSource represents the source of a set of ConfigMaps
-- |
-- | Fields:
-- | - `configMapRef`: The ConfigMap to select from
-- | - `prefix`: An optional identifer to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER.
-- | - `secretRef`: The Secret to select from
newtype EnvFromSource = EnvFromSource
  { configMapRef :: (NullOrUndefined ConfigMapEnvSource)
  , prefix :: (NullOrUndefined String)
  , secretRef :: (NullOrUndefined SecretEnvSource) }

derive instance newtypeEnvFromSource :: Newtype EnvFromSource _
derive instance genericEnvFromSource :: Generic EnvFromSource _
instance showEnvFromSource :: Show EnvFromSource where show a = genericShow a
instance decodeEnvFromSource :: Decode EnvFromSource where
  decode a = do
               configMapRef <- readProp "configMapRef" a >>= decode
               prefix <- readProp "prefix" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               pure $ EnvFromSource { configMapRef, prefix, secretRef }
instance encodeEnvFromSource :: Encode EnvFromSource where
  encode (EnvFromSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "configMapRef" (encode a.configMapRef)
               , Tuple "prefix" (encode a.prefix)
               , Tuple "secretRef" (encode a.secretRef) ]


instance defaultEnvFromSource :: Default EnvFromSource where
  default = EnvFromSource
    { configMapRef: NullOrUndefined Nothing
    , prefix: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing }

-- | EnvVar represents an environment variable present in a Container.
-- |
-- | Fields:
-- | - `name`: Name of the environment variable. Must be a C_IDENTIFIER.
-- | - `value`: Variable references $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Defaults to "".
-- | - `valueFrom`: Source for the environment variable's value. Cannot be used if value is not empty.
newtype EnvVar = EnvVar
  { name :: (NullOrUndefined String)
  , value :: (NullOrUndefined String)
  , valueFrom :: (NullOrUndefined EnvVarSource) }

derive instance newtypeEnvVar :: Newtype EnvVar _
derive instance genericEnvVar :: Generic EnvVar _
instance showEnvVar :: Show EnvVar where show a = genericShow a
instance decodeEnvVar :: Decode EnvVar where
  decode a = do
               name <- readProp "name" a >>= decode
               value <- readProp "value" a >>= decode
               valueFrom <- readProp "valueFrom" a >>= decode
               pure $ EnvVar { name, value, valueFrom }
instance encodeEnvVar :: Encode EnvVar where
  encode (EnvVar a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "value" (encode a.value)
               , Tuple "valueFrom" (encode a.valueFrom) ]


instance defaultEnvVar :: Default EnvVar where
  default = EnvVar
    { name: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing
    , valueFrom: NullOrUndefined Nothing }

-- | EnvVarSource represents a source for the value of an EnvVar.
-- |
-- | Fields:
-- | - `configMapKeyRef`: Selects a key of a ConfigMap.
-- | - `fieldRef`: Selects a field of the pod: supports metadata.name, metadata.namespace, metadata.labels, metadata.annotations, spec.nodeName, spec.serviceAccountName, status.hostIP, status.podIP.
-- | - `resourceFieldRef`: Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests.ephemeral-storage) are currently supported.
-- | - `secretKeyRef`: Selects a key of a secret in the pod's namespace
newtype EnvVarSource = EnvVarSource
  { configMapKeyRef :: (NullOrUndefined ConfigMapKeySelector)
  , fieldRef :: (NullOrUndefined ObjectFieldSelector)
  , resourceFieldRef :: (NullOrUndefined ResourceFieldSelector)
  , secretKeyRef :: (NullOrUndefined SecretKeySelector) }

derive instance newtypeEnvVarSource :: Newtype EnvVarSource _
derive instance genericEnvVarSource :: Generic EnvVarSource _
instance showEnvVarSource :: Show EnvVarSource where show a = genericShow a
instance decodeEnvVarSource :: Decode EnvVarSource where
  decode a = do
               configMapKeyRef <- readProp "configMapKeyRef" a >>= decode
               fieldRef <- readProp "fieldRef" a >>= decode
               resourceFieldRef <- readProp "resourceFieldRef" a >>= decode
               secretKeyRef <- readProp "secretKeyRef" a >>= decode
               pure $ EnvVarSource { configMapKeyRef, fieldRef, resourceFieldRef, secretKeyRef }
instance encodeEnvVarSource :: Encode EnvVarSource where
  encode (EnvVarSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "configMapKeyRef" (encode a.configMapKeyRef)
               , Tuple "fieldRef" (encode a.fieldRef)
               , Tuple "resourceFieldRef" (encode a.resourceFieldRef)
               , Tuple "secretKeyRef" (encode a.secretKeyRef) ]


instance defaultEnvVarSource :: Default EnvVarSource where
  default = EnvVarSource
    { configMapKeyRef: NullOrUndefined Nothing
    , fieldRef: NullOrUndefined Nothing
    , resourceFieldRef: NullOrUndefined Nothing
    , secretKeyRef: NullOrUndefined Nothing }

-- | Event is a report of an event somewhere in the cluster.
-- |
-- | Fields:
-- | - `action`: What action was taken/failed regarding to the Regarding object.
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `count`: The number of times this event has occurred.
-- | - `eventTime`: Time when this Event was first observed.
-- | - `firstTimestamp`: The time at which the event was first recorded. (Time of server receipt is in TypeMeta.)
-- | - `involvedObject`: The object that this event is about.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `lastTimestamp`: The time at which the most recent occurrence of this event was recorded.
-- | - `message`: A human-readable description of the status of this operation.
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `reason`: This should be a short, machine understandable string that gives the reason for the transition into the object's current status.
-- | - `related`: Optional secondary object for more complex actions.
-- | - `reportingComponent`: Name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`.
-- | - `reportingInstance`: ID of the controller instance, e.g. `kubelet-xyzf`.
-- | - `series`: Data about the Event series this event represents or nil if it's a singleton Event.
-- | - `source`: The component reporting this event. Should be a short machine understandable string.
-- | - `_type`: Type of this event (Normal, Warning), new types could be added in the future
newtype Event = Event
  { _type :: (NullOrUndefined String)
  , action :: (NullOrUndefined String)
  , apiVersion :: (NullOrUndefined String)
  , count :: (NullOrUndefined Int)
  , eventTime :: (NullOrUndefined MetaV1.MicroTime)
  , firstTimestamp :: (NullOrUndefined MetaV1.Time)
  , involvedObject :: (NullOrUndefined ObjectReference)
  , kind :: (NullOrUndefined String)
  , lastTimestamp :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , reason :: (NullOrUndefined String)
  , related :: (NullOrUndefined ObjectReference)
  , reportingComponent :: (NullOrUndefined String)
  , reportingInstance :: (NullOrUndefined String)
  , series :: (NullOrUndefined EventSeries)
  , source :: (NullOrUndefined EventSource) }

derive instance newtypeEvent :: Newtype Event _
derive instance genericEvent :: Generic Event _
instance showEvent :: Show Event where show a = genericShow a
instance decodeEvent :: Decode Event where
  decode a = do
               _type <- readProp "_type" a >>= decode
               action <- readProp "action" a >>= decode
               apiVersion <- readProp "apiVersion" a >>= decode
               count <- readProp "count" a >>= decode
               eventTime <- readProp "eventTime" a >>= decode
               firstTimestamp <- readProp "firstTimestamp" a >>= decode
               involvedObject <- readProp "involvedObject" a >>= decode
               kind <- readProp "kind" a >>= decode
               lastTimestamp <- readProp "lastTimestamp" a >>= decode
               message <- readProp "message" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               reason <- readProp "reason" a >>= decode
               related <- readProp "related" a >>= decode
               reportingComponent <- readProp "reportingComponent" a >>= decode
               reportingInstance <- readProp "reportingInstance" a >>= decode
               series <- readProp "series" a >>= decode
               source <- readProp "source" a >>= decode
               pure $ Event { _type, action, apiVersion, count, eventTime, firstTimestamp, involvedObject, kind, lastTimestamp, message, metadata, reason, related, reportingComponent, reportingInstance, series, source }
instance encodeEvent :: Encode Event where
  encode (Event a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "action" (encode a.action)
               , Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "count" (encode a.count)
               , Tuple "eventTime" (encode a.eventTime)
               , Tuple "firstTimestamp" (encode a.firstTimestamp)
               , Tuple "involvedObject" (encode a.involvedObject)
               , Tuple "kind" (encode a.kind)
               , Tuple "lastTimestamp" (encode a.lastTimestamp)
               , Tuple "message" (encode a.message)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "reason" (encode a.reason)
               , Tuple "related" (encode a.related)
               , Tuple "reportingComponent" (encode a.reportingComponent)
               , Tuple "reportingInstance" (encode a.reportingInstance)
               , Tuple "series" (encode a.series)
               , Tuple "source" (encode a.source) ]


instance defaultEvent :: Default Event where
  default = Event
    { _type: NullOrUndefined Nothing
    , action: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , count: NullOrUndefined Nothing
    , eventTime: NullOrUndefined Nothing
    , firstTimestamp: NullOrUndefined Nothing
    , involvedObject: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , lastTimestamp: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , related: NullOrUndefined Nothing
    , reportingComponent: NullOrUndefined Nothing
    , reportingInstance: NullOrUndefined Nothing
    , series: NullOrUndefined Nothing
    , source: NullOrUndefined Nothing }

-- | EventList is a list of events.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of events
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype EventList = EventList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Event))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeEventList :: Newtype EventList _
derive instance genericEventList :: Generic EventList _
instance showEventList :: Show EventList where show a = genericShow a
instance decodeEventList :: Decode EventList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ EventList { apiVersion, items, kind, metadata }
instance encodeEventList :: Encode EventList where
  encode (EventList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultEventList :: Default EventList where
  default = EventList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | EventSeries contain information on series of events, i.e. thing that was/is happening continously for some time.
-- |
-- | Fields:
-- | - `count`: Number of occurrences in this series up to the last heartbeat time
-- | - `lastObservedTime`: Time of the last occurence observed
-- | - `state`: State of this Series: Ongoing or Finished
newtype EventSeries = EventSeries
  { count :: (NullOrUndefined Int)
  , lastObservedTime :: (NullOrUndefined MetaV1.MicroTime)
  , state :: (NullOrUndefined String) }

derive instance newtypeEventSeries :: Newtype EventSeries _
derive instance genericEventSeries :: Generic EventSeries _
instance showEventSeries :: Show EventSeries where show a = genericShow a
instance decodeEventSeries :: Decode EventSeries where
  decode a = do
               count <- readProp "count" a >>= decode
               lastObservedTime <- readProp "lastObservedTime" a >>= decode
               state <- readProp "state" a >>= decode
               pure $ EventSeries { count, lastObservedTime, state }
instance encodeEventSeries :: Encode EventSeries where
  encode (EventSeries a) = encode $ StrMap.fromFoldable $
               [ Tuple "count" (encode a.count)
               , Tuple "lastObservedTime" (encode a.lastObservedTime)
               , Tuple "state" (encode a.state) ]


instance defaultEventSeries :: Default EventSeries where
  default = EventSeries
    { count: NullOrUndefined Nothing
    , lastObservedTime: NullOrUndefined Nothing
    , state: NullOrUndefined Nothing }

-- | EventSource contains information for an event.
-- |
-- | Fields:
-- | - `component`: Component from which the event is generated.
-- | - `host`: Node name on which the event is generated.
newtype EventSource = EventSource
  { component :: (NullOrUndefined String)
  , host :: (NullOrUndefined String) }

derive instance newtypeEventSource :: Newtype EventSource _
derive instance genericEventSource :: Generic EventSource _
instance showEventSource :: Show EventSource where show a = genericShow a
instance decodeEventSource :: Decode EventSource where
  decode a = do
               component <- readProp "component" a >>= decode
               host <- readProp "host" a >>= decode
               pure $ EventSource { component, host }
instance encodeEventSource :: Encode EventSource where
  encode (EventSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "component" (encode a.component)
               , Tuple "host" (encode a.host) ]


instance defaultEventSource :: Default EventSource where
  default = EventSource
    { component: NullOrUndefined Nothing
    , host: NullOrUndefined Nothing }

-- | ExecAction describes a "run in container" action.
-- |
-- | Fields:
-- | - `command`: Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.
newtype ExecAction = ExecAction
  { command :: (NullOrUndefined (Array String)) }

derive instance newtypeExecAction :: Newtype ExecAction _
derive instance genericExecAction :: Generic ExecAction _
instance showExecAction :: Show ExecAction where show a = genericShow a
instance decodeExecAction :: Decode ExecAction where
  decode a = do
               command <- readProp "command" a >>= decode
               pure $ ExecAction { command }
instance encodeExecAction :: Encode ExecAction where
  encode (ExecAction a) = encode $ StrMap.fromFoldable $
               [ Tuple "command" (encode a.command) ]


instance defaultExecAction :: Default ExecAction where
  default = ExecAction
    { command: NullOrUndefined Nothing }

-- | Represents a Fibre Channel volume. Fibre Channel volumes can only be mounted as read/write once. Fibre Channel volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `lun`: Optional: FC target lun number
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `targetWWNs`: Optional: FC target worldwide names (WWNs)
-- | - `wwids`: Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously.
newtype FCVolumeSource = FCVolumeSource
  { fsType :: (NullOrUndefined String)
  , lun :: (NullOrUndefined Int)
  , readOnly :: (NullOrUndefined Boolean)
  , targetWWNs :: (NullOrUndefined (Array String))
  , wwids :: (NullOrUndefined (Array String)) }

derive instance newtypeFCVolumeSource :: Newtype FCVolumeSource _
derive instance genericFCVolumeSource :: Generic FCVolumeSource _
instance showFCVolumeSource :: Show FCVolumeSource where show a = genericShow a
instance decodeFCVolumeSource :: Decode FCVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               lun <- readProp "lun" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               targetWWNs <- readProp "targetWWNs" a >>= decode
               wwids <- readProp "wwids" a >>= decode
               pure $ FCVolumeSource { fsType, lun, readOnly, targetWWNs, wwids }
instance encodeFCVolumeSource :: Encode FCVolumeSource where
  encode (FCVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "lun" (encode a.lun)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "targetWWNs" (encode a.targetWWNs)
               , Tuple "wwids" (encode a.wwids) ]


instance defaultFCVolumeSource :: Default FCVolumeSource where
  default = FCVolumeSource
    { fsType: NullOrUndefined Nothing
    , lun: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , targetWWNs: NullOrUndefined Nothing
    , wwids: NullOrUndefined Nothing }

-- | FlexPersistentVolumeSource represents a generic persistent volume resource that is provisioned/attached using an exec based plugin.
-- |
-- | Fields:
-- | - `driver`: Driver is the name of the driver to use for this volume.
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
-- | - `options`: Optional: Extra command options if any.
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: Optional: SecretRef is reference to the secret object containing sensitive information to pass to the plugin scripts. This may be empty if no secret object is specified. If the secret object contains more than one secret, all secrets are passed to the plugin scripts.
newtype FlexPersistentVolumeSource = FlexPersistentVolumeSource
  { driver :: (NullOrUndefined String)
  , fsType :: (NullOrUndefined String)
  , options :: (NullOrUndefined (StrMap String))
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined SecretReference) }

derive instance newtypeFlexPersistentVolumeSource :: Newtype FlexPersistentVolumeSource _
derive instance genericFlexPersistentVolumeSource :: Generic FlexPersistentVolumeSource _
instance showFlexPersistentVolumeSource :: Show FlexPersistentVolumeSource where show a = genericShow a
instance decodeFlexPersistentVolumeSource :: Decode FlexPersistentVolumeSource where
  decode a = do
               driver <- readProp "driver" a >>= decode
               fsType <- readProp "fsType" a >>= decode
               options <- readProp "options" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               pure $ FlexPersistentVolumeSource { driver, fsType, options, readOnly, secretRef }
instance encodeFlexPersistentVolumeSource :: Encode FlexPersistentVolumeSource where
  encode (FlexPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "driver" (encode a.driver)
               , Tuple "fsType" (encode a.fsType)
               , Tuple "options" (encode a.options)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef) ]


instance defaultFlexPersistentVolumeSource :: Default FlexPersistentVolumeSource where
  default = FlexPersistentVolumeSource
    { driver: NullOrUndefined Nothing
    , fsType: NullOrUndefined Nothing
    , options: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing }

-- | FlexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin.
-- |
-- | Fields:
-- | - `driver`: Driver is the name of the driver to use for this volume.
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
-- | - `options`: Optional: Extra command options if any.
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: Optional: SecretRef is reference to the secret object containing sensitive information to pass to the plugin scripts. This may be empty if no secret object is specified. If the secret object contains more than one secret, all secrets are passed to the plugin scripts.
newtype FlexVolumeSource = FlexVolumeSource
  { driver :: (NullOrUndefined String)
  , fsType :: (NullOrUndefined String)
  , options :: (NullOrUndefined (StrMap String))
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined LocalObjectReference) }

derive instance newtypeFlexVolumeSource :: Newtype FlexVolumeSource _
derive instance genericFlexVolumeSource :: Generic FlexVolumeSource _
instance showFlexVolumeSource :: Show FlexVolumeSource where show a = genericShow a
instance decodeFlexVolumeSource :: Decode FlexVolumeSource where
  decode a = do
               driver <- readProp "driver" a >>= decode
               fsType <- readProp "fsType" a >>= decode
               options <- readProp "options" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               pure $ FlexVolumeSource { driver, fsType, options, readOnly, secretRef }
instance encodeFlexVolumeSource :: Encode FlexVolumeSource where
  encode (FlexVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "driver" (encode a.driver)
               , Tuple "fsType" (encode a.fsType)
               , Tuple "options" (encode a.options)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef) ]


instance defaultFlexVolumeSource :: Default FlexVolumeSource where
  default = FlexVolumeSource
    { driver: NullOrUndefined Nothing
    , fsType: NullOrUndefined Nothing
    , options: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing }

-- | Represents a Flocker volume mounted by the Flocker agent. One and only one of datasetName and datasetUUID should be set. Flocker volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `datasetName`: Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated
-- | - `datasetUUID`: UUID of the dataset. This is unique identifier of a Flocker dataset
newtype FlockerVolumeSource = FlockerVolumeSource
  { datasetName :: (NullOrUndefined String)
  , datasetUUID :: (NullOrUndefined String) }

derive instance newtypeFlockerVolumeSource :: Newtype FlockerVolumeSource _
derive instance genericFlockerVolumeSource :: Generic FlockerVolumeSource _
instance showFlockerVolumeSource :: Show FlockerVolumeSource where show a = genericShow a
instance decodeFlockerVolumeSource :: Decode FlockerVolumeSource where
  decode a = do
               datasetName <- readProp "datasetName" a >>= decode
               datasetUUID <- readProp "datasetUUID" a >>= decode
               pure $ FlockerVolumeSource { datasetName, datasetUUID }
instance encodeFlockerVolumeSource :: Encode FlockerVolumeSource where
  encode (FlockerVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "datasetName" (encode a.datasetName)
               , Tuple "datasetUUID" (encode a.datasetUUID) ]


instance defaultFlockerVolumeSource :: Default FlockerVolumeSource where
  default = FlockerVolumeSource
    { datasetName: NullOrUndefined Nothing
    , datasetUUID: NullOrUndefined Nothing }

-- | Represents a Persistent Disk resource in Google Compute Engine.
-- | 
-- | A GCE PD must exist before mounting to a container. The disk must also be in the same GCE project and zone as the kubelet. A GCE PD can only be mounted as read/write once or read-only many times. GCE PDs support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
-- | - `partition`: The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty). More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
-- | - `pdName`: Unique name of the PD resource in GCE. Used to identify the disk in GCE. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
-- | - `readOnly`: ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
newtype GCEPersistentDiskVolumeSource = GCEPersistentDiskVolumeSource
  { fsType :: (NullOrUndefined String)
  , partition :: (NullOrUndefined Int)
  , pdName :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean) }

derive instance newtypeGCEPersistentDiskVolumeSource :: Newtype GCEPersistentDiskVolumeSource _
derive instance genericGCEPersistentDiskVolumeSource :: Generic GCEPersistentDiskVolumeSource _
instance showGCEPersistentDiskVolumeSource :: Show GCEPersistentDiskVolumeSource where show a = genericShow a
instance decodeGCEPersistentDiskVolumeSource :: Decode GCEPersistentDiskVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               partition <- readProp "partition" a >>= decode
               pdName <- readProp "pdName" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               pure $ GCEPersistentDiskVolumeSource { fsType, partition, pdName, readOnly }
instance encodeGCEPersistentDiskVolumeSource :: Encode GCEPersistentDiskVolumeSource where
  encode (GCEPersistentDiskVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "partition" (encode a.partition)
               , Tuple "pdName" (encode a.pdName)
               , Tuple "readOnly" (encode a.readOnly) ]


instance defaultGCEPersistentDiskVolumeSource :: Default GCEPersistentDiskVolumeSource where
  default = GCEPersistentDiskVolumeSource
    { fsType: NullOrUndefined Nothing
    , partition: NullOrUndefined Nothing
    , pdName: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing }

-- | Represents a volume that is populated with the contents of a git repository. Git repo volumes do not support ownership management. Git repo volumes support SELinux relabeling.
-- |
-- | Fields:
-- | - `directory`: Target directory name. Must not contain or start with '..'.  If '.' is supplied, the volume directory will be the git repository.  Otherwise, if specified, the volume will contain the git repository in the subdirectory with the given name.
-- | - `repository`: Repository URL
-- | - `revision`: Commit hash for the specified revision.
newtype GitRepoVolumeSource = GitRepoVolumeSource
  { directory :: (NullOrUndefined String)
  , repository :: (NullOrUndefined String)
  , revision :: (NullOrUndefined String) }

derive instance newtypeGitRepoVolumeSource :: Newtype GitRepoVolumeSource _
derive instance genericGitRepoVolumeSource :: Generic GitRepoVolumeSource _
instance showGitRepoVolumeSource :: Show GitRepoVolumeSource where show a = genericShow a
instance decodeGitRepoVolumeSource :: Decode GitRepoVolumeSource where
  decode a = do
               directory <- readProp "directory" a >>= decode
               repository <- readProp "repository" a >>= decode
               revision <- readProp "revision" a >>= decode
               pure $ GitRepoVolumeSource { directory, repository, revision }
instance encodeGitRepoVolumeSource :: Encode GitRepoVolumeSource where
  encode (GitRepoVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "directory" (encode a.directory)
               , Tuple "repository" (encode a.repository)
               , Tuple "revision" (encode a.revision) ]


instance defaultGitRepoVolumeSource :: Default GitRepoVolumeSource where
  default = GitRepoVolumeSource
    { directory: NullOrUndefined Nothing
    , repository: NullOrUndefined Nothing
    , revision: NullOrUndefined Nothing }

-- | Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `endpoints`: EndpointsName is the endpoint name that details Glusterfs topology. More info: https://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod
-- | - `path`: Path is the Glusterfs volume path. More info: https://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod
-- | - `readOnly`: ReadOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod
newtype GlusterfsVolumeSource = GlusterfsVolumeSource
  { endpoints :: (NullOrUndefined String)
  , path :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean) }

derive instance newtypeGlusterfsVolumeSource :: Newtype GlusterfsVolumeSource _
derive instance genericGlusterfsVolumeSource :: Generic GlusterfsVolumeSource _
instance showGlusterfsVolumeSource :: Show GlusterfsVolumeSource where show a = genericShow a
instance decodeGlusterfsVolumeSource :: Decode GlusterfsVolumeSource where
  decode a = do
               endpoints <- readProp "endpoints" a >>= decode
               path <- readProp "path" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               pure $ GlusterfsVolumeSource { endpoints, path, readOnly }
instance encodeGlusterfsVolumeSource :: Encode GlusterfsVolumeSource where
  encode (GlusterfsVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "endpoints" (encode a.endpoints)
               , Tuple "path" (encode a.path)
               , Tuple "readOnly" (encode a.readOnly) ]


instance defaultGlusterfsVolumeSource :: Default GlusterfsVolumeSource where
  default = GlusterfsVolumeSource
    { endpoints: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing }

-- | HTTPGetAction describes an action based on HTTP Get requests.
-- |
-- | Fields:
-- | - `host`: Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.
-- | - `httpHeaders`: Custom headers to set in the request. HTTP allows repeated headers.
-- | - `path`: Path to access on the HTTP server.
-- | - `port`: Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.
-- | - `scheme`: Scheme to use for connecting to the host. Defaults to HTTP.
newtype HTTPGetAction = HTTPGetAction
  { host :: (NullOrUndefined String)
  , httpHeaders :: (NullOrUndefined (Array HTTPHeader))
  , path :: (NullOrUndefined String)
  , port :: (NullOrUndefined Util.IntOrString)
  , scheme :: (NullOrUndefined String) }

derive instance newtypeHTTPGetAction :: Newtype HTTPGetAction _
derive instance genericHTTPGetAction :: Generic HTTPGetAction _
instance showHTTPGetAction :: Show HTTPGetAction where show a = genericShow a
instance decodeHTTPGetAction :: Decode HTTPGetAction where
  decode a = do
               host <- readProp "host" a >>= decode
               httpHeaders <- readProp "httpHeaders" a >>= decode
               path <- readProp "path" a >>= decode
               port <- readProp "port" a >>= decode
               scheme <- readProp "scheme" a >>= decode
               pure $ HTTPGetAction { host, httpHeaders, path, port, scheme }
instance encodeHTTPGetAction :: Encode HTTPGetAction where
  encode (HTTPGetAction a) = encode $ StrMap.fromFoldable $
               [ Tuple "host" (encode a.host)
               , Tuple "httpHeaders" (encode a.httpHeaders)
               , Tuple "path" (encode a.path)
               , Tuple "port" (encode a.port)
               , Tuple "scheme" (encode a.scheme) ]


instance defaultHTTPGetAction :: Default HTTPGetAction where
  default = HTTPGetAction
    { host: NullOrUndefined Nothing
    , httpHeaders: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , port: NullOrUndefined Nothing
    , scheme: NullOrUndefined Nothing }

-- | HTTPHeader describes a custom header to be used in HTTP probes
-- |
-- | Fields:
-- | - `name`: The header field name
-- | - `value`: The header field value
newtype HTTPHeader = HTTPHeader
  { name :: (NullOrUndefined String)
  , value :: (NullOrUndefined String) }

derive instance newtypeHTTPHeader :: Newtype HTTPHeader _
derive instance genericHTTPHeader :: Generic HTTPHeader _
instance showHTTPHeader :: Show HTTPHeader where show a = genericShow a
instance decodeHTTPHeader :: Decode HTTPHeader where
  decode a = do
               name <- readProp "name" a >>= decode
               value <- readProp "value" a >>= decode
               pure $ HTTPHeader { name, value }
instance encodeHTTPHeader :: Encode HTTPHeader where
  encode (HTTPHeader a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "value" (encode a.value) ]


instance defaultHTTPHeader :: Default HTTPHeader where
  default = HTTPHeader
    { name: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | Handler defines a specific action that should be taken
-- |
-- | Fields:
-- | - `exec`: One and only one of the following should be specified. Exec specifies the action to take.
-- | - `httpGet`: HTTPGet specifies the http request to perform.
-- | - `tcpSocket`: TCPSocket specifies an action involving a TCP port. TCP hooks not yet supported
newtype Handler = Handler
  { exec :: (NullOrUndefined ExecAction)
  , httpGet :: (NullOrUndefined HTTPGetAction)
  , tcpSocket :: (NullOrUndefined TCPSocketAction) }

derive instance newtypeHandler :: Newtype Handler _
derive instance genericHandler :: Generic Handler _
instance showHandler :: Show Handler where show a = genericShow a
instance decodeHandler :: Decode Handler where
  decode a = do
               exec <- readProp "exec" a >>= decode
               httpGet <- readProp "httpGet" a >>= decode
               tcpSocket <- readProp "tcpSocket" a >>= decode
               pure $ Handler { exec, httpGet, tcpSocket }
instance encodeHandler :: Encode Handler where
  encode (Handler a) = encode $ StrMap.fromFoldable $
               [ Tuple "exec" (encode a.exec)
               , Tuple "httpGet" (encode a.httpGet)
               , Tuple "tcpSocket" (encode a.tcpSocket) ]


instance defaultHandler :: Default Handler where
  default = Handler
    { exec: NullOrUndefined Nothing
    , httpGet: NullOrUndefined Nothing
    , tcpSocket: NullOrUndefined Nothing }

-- | HostAlias holds the mapping between IP and hostnames that will be injected as an entry in the pod's hosts file.
-- |
-- | Fields:
-- | - `hostnames`: Hostnames for the above IP address.
-- | - `ip`: IP address of the host file entry.
newtype HostAlias = HostAlias
  { hostnames :: (NullOrUndefined (Array String))
  , ip :: (NullOrUndefined String) }

derive instance newtypeHostAlias :: Newtype HostAlias _
derive instance genericHostAlias :: Generic HostAlias _
instance showHostAlias :: Show HostAlias where show a = genericShow a
instance decodeHostAlias :: Decode HostAlias where
  decode a = do
               hostnames <- readProp "hostnames" a >>= decode
               ip <- readProp "ip" a >>= decode
               pure $ HostAlias { hostnames, ip }
instance encodeHostAlias :: Encode HostAlias where
  encode (HostAlias a) = encode $ StrMap.fromFoldable $
               [ Tuple "hostnames" (encode a.hostnames)
               , Tuple "ip" (encode a.ip) ]


instance defaultHostAlias :: Default HostAlias where
  default = HostAlias
    { hostnames: NullOrUndefined Nothing
    , ip: NullOrUndefined Nothing }

-- | Represents a host path mapped into a pod. Host path volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `path`: Path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
-- | - `_type`: Type for HostPath Volume Defaults to "" More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
newtype HostPathVolumeSource = HostPathVolumeSource
  { _type :: (NullOrUndefined String)
  , path :: (NullOrUndefined String) }

derive instance newtypeHostPathVolumeSource :: Newtype HostPathVolumeSource _
derive instance genericHostPathVolumeSource :: Generic HostPathVolumeSource _
instance showHostPathVolumeSource :: Show HostPathVolumeSource where show a = genericShow a
instance decodeHostPathVolumeSource :: Decode HostPathVolumeSource where
  decode a = do
               _type <- readProp "_type" a >>= decode
               path <- readProp "path" a >>= decode
               pure $ HostPathVolumeSource { _type, path }
instance encodeHostPathVolumeSource :: Encode HostPathVolumeSource where
  encode (HostPathVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "path" (encode a.path) ]


instance defaultHostPathVolumeSource :: Default HostPathVolumeSource where
  default = HostPathVolumeSource
    { _type: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing }

-- | ISCSIPersistentVolumeSource represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `chapAuthDiscovery`: whether support iSCSI Discovery CHAP authentication
-- | - `chapAuthSession`: whether support iSCSI Session CHAP authentication
-- | - `fsType`: Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#iscsi
-- | - `initiatorName`: Custom iSCSI Initiator Name. If initiatorName is specified with iscsiInterface simultaneously, new iSCSI interface <target portal>:<volume name> will be created for the connection.
-- | - `iqn`: Target iSCSI Qualified Name.
-- | - `iscsiInterface`: iSCSI Interface Name that uses an iSCSI transport. Defaults to 'default' (tcp).
-- | - `lun`: iSCSI Target Lun number.
-- | - `portals`: iSCSI Target Portal List. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
-- | - `readOnly`: ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
-- | - `secretRef`: CHAP Secret for iSCSI target and initiator authentication
-- | - `targetPortal`: iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
newtype ISCSIPersistentVolumeSource = ISCSIPersistentVolumeSource
  { chapAuthDiscovery :: (NullOrUndefined Boolean)
  , chapAuthSession :: (NullOrUndefined Boolean)
  , fsType :: (NullOrUndefined String)
  , initiatorName :: (NullOrUndefined String)
  , iqn :: (NullOrUndefined String)
  , iscsiInterface :: (NullOrUndefined String)
  , lun :: (NullOrUndefined Int)
  , portals :: (NullOrUndefined (Array String))
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined SecretReference)
  , targetPortal :: (NullOrUndefined String) }

derive instance newtypeISCSIPersistentVolumeSource :: Newtype ISCSIPersistentVolumeSource _
derive instance genericISCSIPersistentVolumeSource :: Generic ISCSIPersistentVolumeSource _
instance showISCSIPersistentVolumeSource :: Show ISCSIPersistentVolumeSource where show a = genericShow a
instance decodeISCSIPersistentVolumeSource :: Decode ISCSIPersistentVolumeSource where
  decode a = do
               chapAuthDiscovery <- readProp "chapAuthDiscovery" a >>= decode
               chapAuthSession <- readProp "chapAuthSession" a >>= decode
               fsType <- readProp "fsType" a >>= decode
               initiatorName <- readProp "initiatorName" a >>= decode
               iqn <- readProp "iqn" a >>= decode
               iscsiInterface <- readProp "iscsiInterface" a >>= decode
               lun <- readProp "lun" a >>= decode
               portals <- readProp "portals" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               targetPortal <- readProp "targetPortal" a >>= decode
               pure $ ISCSIPersistentVolumeSource { chapAuthDiscovery, chapAuthSession, fsType, initiatorName, iqn, iscsiInterface, lun, portals, readOnly, secretRef, targetPortal }
instance encodeISCSIPersistentVolumeSource :: Encode ISCSIPersistentVolumeSource where
  encode (ISCSIPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "chapAuthDiscovery" (encode a.chapAuthDiscovery)
               , Tuple "chapAuthSession" (encode a.chapAuthSession)
               , Tuple "fsType" (encode a.fsType)
               , Tuple "initiatorName" (encode a.initiatorName)
               , Tuple "iqn" (encode a.iqn)
               , Tuple "iscsiInterface" (encode a.iscsiInterface)
               , Tuple "lun" (encode a.lun)
               , Tuple "portals" (encode a.portals)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "targetPortal" (encode a.targetPortal) ]


instance defaultISCSIPersistentVolumeSource :: Default ISCSIPersistentVolumeSource where
  default = ISCSIPersistentVolumeSource
    { chapAuthDiscovery: NullOrUndefined Nothing
    , chapAuthSession: NullOrUndefined Nothing
    , fsType: NullOrUndefined Nothing
    , initiatorName: NullOrUndefined Nothing
    , iqn: NullOrUndefined Nothing
    , iscsiInterface: NullOrUndefined Nothing
    , lun: NullOrUndefined Nothing
    , portals: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , targetPortal: NullOrUndefined Nothing }

-- | Represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `chapAuthDiscovery`: whether support iSCSI Discovery CHAP authentication
-- | - `chapAuthSession`: whether support iSCSI Session CHAP authentication
-- | - `fsType`: Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#iscsi
-- | - `initiatorName`: Custom iSCSI Initiator Name. If initiatorName is specified with iscsiInterface simultaneously, new iSCSI interface <target portal>:<volume name> will be created for the connection.
-- | - `iqn`: Target iSCSI Qualified Name.
-- | - `iscsiInterface`: iSCSI Interface Name that uses an iSCSI transport. Defaults to 'default' (tcp).
-- | - `lun`: iSCSI Target Lun number.
-- | - `portals`: iSCSI Target Portal List. The portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
-- | - `readOnly`: ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
-- | - `secretRef`: CHAP Secret for iSCSI target and initiator authentication
-- | - `targetPortal`: iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
newtype ISCSIVolumeSource = ISCSIVolumeSource
  { chapAuthDiscovery :: (NullOrUndefined Boolean)
  , chapAuthSession :: (NullOrUndefined Boolean)
  , fsType :: (NullOrUndefined String)
  , initiatorName :: (NullOrUndefined String)
  , iqn :: (NullOrUndefined String)
  , iscsiInterface :: (NullOrUndefined String)
  , lun :: (NullOrUndefined Int)
  , portals :: (NullOrUndefined (Array String))
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined LocalObjectReference)
  , targetPortal :: (NullOrUndefined String) }

derive instance newtypeISCSIVolumeSource :: Newtype ISCSIVolumeSource _
derive instance genericISCSIVolumeSource :: Generic ISCSIVolumeSource _
instance showISCSIVolumeSource :: Show ISCSIVolumeSource where show a = genericShow a
instance decodeISCSIVolumeSource :: Decode ISCSIVolumeSource where
  decode a = do
               chapAuthDiscovery <- readProp "chapAuthDiscovery" a >>= decode
               chapAuthSession <- readProp "chapAuthSession" a >>= decode
               fsType <- readProp "fsType" a >>= decode
               initiatorName <- readProp "initiatorName" a >>= decode
               iqn <- readProp "iqn" a >>= decode
               iscsiInterface <- readProp "iscsiInterface" a >>= decode
               lun <- readProp "lun" a >>= decode
               portals <- readProp "portals" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               targetPortal <- readProp "targetPortal" a >>= decode
               pure $ ISCSIVolumeSource { chapAuthDiscovery, chapAuthSession, fsType, initiatorName, iqn, iscsiInterface, lun, portals, readOnly, secretRef, targetPortal }
instance encodeISCSIVolumeSource :: Encode ISCSIVolumeSource where
  encode (ISCSIVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "chapAuthDiscovery" (encode a.chapAuthDiscovery)
               , Tuple "chapAuthSession" (encode a.chapAuthSession)
               , Tuple "fsType" (encode a.fsType)
               , Tuple "initiatorName" (encode a.initiatorName)
               , Tuple "iqn" (encode a.iqn)
               , Tuple "iscsiInterface" (encode a.iscsiInterface)
               , Tuple "lun" (encode a.lun)
               , Tuple "portals" (encode a.portals)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "targetPortal" (encode a.targetPortal) ]


instance defaultISCSIVolumeSource :: Default ISCSIVolumeSource where
  default = ISCSIVolumeSource
    { chapAuthDiscovery: NullOrUndefined Nothing
    , chapAuthSession: NullOrUndefined Nothing
    , fsType: NullOrUndefined Nothing
    , initiatorName: NullOrUndefined Nothing
    , iqn: NullOrUndefined Nothing
    , iscsiInterface: NullOrUndefined Nothing
    , lun: NullOrUndefined Nothing
    , portals: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , targetPortal: NullOrUndefined Nothing }

-- | Maps a string key to a path within a volume.
-- |
-- | Fields:
-- | - `key`: The key to project.
-- | - `mode`: Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `path`: The relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.
newtype KeyToPath = KeyToPath
  { key :: (NullOrUndefined String)
  , mode :: (NullOrUndefined Int)
  , path :: (NullOrUndefined String) }

derive instance newtypeKeyToPath :: Newtype KeyToPath _
derive instance genericKeyToPath :: Generic KeyToPath _
instance showKeyToPath :: Show KeyToPath where show a = genericShow a
instance decodeKeyToPath :: Decode KeyToPath where
  decode a = do
               key <- readProp "key" a >>= decode
               mode <- readProp "mode" a >>= decode
               path <- readProp "path" a >>= decode
               pure $ KeyToPath { key, mode, path }
instance encodeKeyToPath :: Encode KeyToPath where
  encode (KeyToPath a) = encode $ StrMap.fromFoldable $
               [ Tuple "key" (encode a.key)
               , Tuple "mode" (encode a.mode)
               , Tuple "path" (encode a.path) ]


instance defaultKeyToPath :: Default KeyToPath where
  default = KeyToPath
    { key: NullOrUndefined Nothing
    , mode: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing }

-- | Lifecycle describes actions that the management system should take in response to container lifecycle events. For the PostStart and PreStop lifecycle handlers, management of the container blocks until the action is complete, unless the container process fails, in which case the handler is aborted.
-- |
-- | Fields:
-- | - `postStart`: PostStart is called immediately after a container is created. If the handler fails, the container is terminated and restarted according to its restart policy. Other management of the container blocks until the hook completes. More info: https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#container-hooks
-- | - `preStop`: PreStop is called immediately before a container is terminated. The container is terminated after the handler completes. The reason for termination is passed to the handler. Regardless of the outcome of the handler, the container is eventually terminated. Other management of the container blocks until the hook completes. More info: https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#container-hooks
newtype Lifecycle = Lifecycle
  { postStart :: (NullOrUndefined Handler)
  , preStop :: (NullOrUndefined Handler) }

derive instance newtypeLifecycle :: Newtype Lifecycle _
derive instance genericLifecycle :: Generic Lifecycle _
instance showLifecycle :: Show Lifecycle where show a = genericShow a
instance decodeLifecycle :: Decode Lifecycle where
  decode a = do
               postStart <- readProp "postStart" a >>= decode
               preStop <- readProp "preStop" a >>= decode
               pure $ Lifecycle { postStart, preStop }
instance encodeLifecycle :: Encode Lifecycle where
  encode (Lifecycle a) = encode $ StrMap.fromFoldable $
               [ Tuple "postStart" (encode a.postStart)
               , Tuple "preStop" (encode a.preStop) ]


instance defaultLifecycle :: Default Lifecycle where
  default = Lifecycle
    { postStart: NullOrUndefined Nothing
    , preStop: NullOrUndefined Nothing }

-- | LimitRange sets resource usage limits for each kind of resource in a Namespace.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the limits enforced. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype LimitRange = LimitRange
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined LimitRangeSpec) }

derive instance newtypeLimitRange :: Newtype LimitRange _
derive instance genericLimitRange :: Generic LimitRange _
instance showLimitRange :: Show LimitRange where show a = genericShow a
instance decodeLimitRange :: Decode LimitRange where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               pure $ LimitRange { apiVersion, kind, metadata, spec }
instance encodeLimitRange :: Encode LimitRange where
  encode (LimitRange a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec) ]


instance defaultLimitRange :: Default LimitRange where
  default = LimitRange
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | LimitRangeItem defines a min/max usage limit for any resource that matches on kind.
-- |
-- | Fields:
-- | - `_default`: Default resource requirement limit value by resource name if resource limit is omitted.
-- | - `defaultRequest`: DefaultRequest is the default resource requirement request value by resource name if resource request is omitted.
-- | - `max`: Max usage constraints on this kind by resource name.
-- | - `maxLimitRequestRatio`: MaxLimitRequestRatio if specified, the named resource must have a request and limit that are both non-zero where limit divided by request is less than or equal to the enumerated value; this represents the max burst for the named resource.
-- | - `min`: Min usage constraints on this kind by resource name.
-- | - `_type`: Type of resource that this limit applies to.
newtype LimitRangeItem = LimitRangeItem
  { _default :: (NullOrUndefined (StrMap Resource.Quantity))
  , _type :: (NullOrUndefined String)
  , defaultRequest :: (NullOrUndefined (StrMap Resource.Quantity))
  , max :: (NullOrUndefined (StrMap Resource.Quantity))
  , maxLimitRequestRatio :: (NullOrUndefined (StrMap Resource.Quantity))
  , min :: (NullOrUndefined (StrMap Resource.Quantity)) }

derive instance newtypeLimitRangeItem :: Newtype LimitRangeItem _
derive instance genericLimitRangeItem :: Generic LimitRangeItem _
instance showLimitRangeItem :: Show LimitRangeItem where show a = genericShow a
instance decodeLimitRangeItem :: Decode LimitRangeItem where
  decode a = do
               _default <- readProp "_default" a >>= decode
               _type <- readProp "_type" a >>= decode
               defaultRequest <- readProp "defaultRequest" a >>= decode
               max <- readProp "max" a >>= decode
               maxLimitRequestRatio <- readProp "maxLimitRequestRatio" a >>= decode
               min <- readProp "min" a >>= decode
               pure $ LimitRangeItem { _default, _type, defaultRequest, max, maxLimitRequestRatio, min }
instance encodeLimitRangeItem :: Encode LimitRangeItem where
  encode (LimitRangeItem a) = encode $ StrMap.fromFoldable $
               [ Tuple "_default" (encode a._default)
               , Tuple "_type" (encode a._type)
               , Tuple "defaultRequest" (encode a.defaultRequest)
               , Tuple "max" (encode a.max)
               , Tuple "maxLimitRequestRatio" (encode a.maxLimitRequestRatio)
               , Tuple "min" (encode a.min) ]


instance defaultLimitRangeItem :: Default LimitRangeItem where
  default = LimitRangeItem
    { _default: NullOrUndefined Nothing
    , _type: NullOrUndefined Nothing
    , defaultRequest: NullOrUndefined Nothing
    , max: NullOrUndefined Nothing
    , maxLimitRequestRatio: NullOrUndefined Nothing
    , min: NullOrUndefined Nothing }

-- | LimitRangeList is a list of LimitRange items.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of LimitRange objects. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype LimitRangeList = LimitRangeList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array LimitRange))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeLimitRangeList :: Newtype LimitRangeList _
derive instance genericLimitRangeList :: Generic LimitRangeList _
instance showLimitRangeList :: Show LimitRangeList where show a = genericShow a
instance decodeLimitRangeList :: Decode LimitRangeList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ LimitRangeList { apiVersion, items, kind, metadata }
instance encodeLimitRangeList :: Encode LimitRangeList where
  encode (LimitRangeList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultLimitRangeList :: Default LimitRangeList where
  default = LimitRangeList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | LimitRangeSpec defines a min/max usage limit for resources that match on kind.
-- |
-- | Fields:
-- | - `limits`: Limits is the list of LimitRangeItem objects that are enforced.
newtype LimitRangeSpec = LimitRangeSpec
  { limits :: (NullOrUndefined (Array LimitRangeItem)) }

derive instance newtypeLimitRangeSpec :: Newtype LimitRangeSpec _
derive instance genericLimitRangeSpec :: Generic LimitRangeSpec _
instance showLimitRangeSpec :: Show LimitRangeSpec where show a = genericShow a
instance decodeLimitRangeSpec :: Decode LimitRangeSpec where
  decode a = do
               limits <- readProp "limits" a >>= decode
               pure $ LimitRangeSpec { limits }
instance encodeLimitRangeSpec :: Encode LimitRangeSpec where
  encode (LimitRangeSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "limits" (encode a.limits) ]


instance defaultLimitRangeSpec :: Default LimitRangeSpec where
  default = LimitRangeSpec
    { limits: NullOrUndefined Nothing }

-- | LoadBalancerIngress represents the status of a load-balancer ingress point: traffic intended for the service should be sent to an ingress point.
-- |
-- | Fields:
-- | - `hostname`: Hostname is set for load-balancer ingress points that are DNS based (typically AWS load-balancers)
-- | - `ip`: IP is set for load-balancer ingress points that are IP based (typically GCE or OpenStack load-balancers)
newtype LoadBalancerIngress = LoadBalancerIngress
  { hostname :: (NullOrUndefined String)
  , ip :: (NullOrUndefined String) }

derive instance newtypeLoadBalancerIngress :: Newtype LoadBalancerIngress _
derive instance genericLoadBalancerIngress :: Generic LoadBalancerIngress _
instance showLoadBalancerIngress :: Show LoadBalancerIngress where show a = genericShow a
instance decodeLoadBalancerIngress :: Decode LoadBalancerIngress where
  decode a = do
               hostname <- readProp "hostname" a >>= decode
               ip <- readProp "ip" a >>= decode
               pure $ LoadBalancerIngress { hostname, ip }
instance encodeLoadBalancerIngress :: Encode LoadBalancerIngress where
  encode (LoadBalancerIngress a) = encode $ StrMap.fromFoldable $
               [ Tuple "hostname" (encode a.hostname)
               , Tuple "ip" (encode a.ip) ]


instance defaultLoadBalancerIngress :: Default LoadBalancerIngress where
  default = LoadBalancerIngress
    { hostname: NullOrUndefined Nothing
    , ip: NullOrUndefined Nothing }

-- | LoadBalancerStatus represents the status of a load-balancer.
-- |
-- | Fields:
-- | - `ingress`: Ingress is a list containing ingress points for the load-balancer. Traffic intended for the service should be sent to these ingress points.
newtype LoadBalancerStatus = LoadBalancerStatus
  { ingress :: (NullOrUndefined (Array LoadBalancerIngress)) }

derive instance newtypeLoadBalancerStatus :: Newtype LoadBalancerStatus _
derive instance genericLoadBalancerStatus :: Generic LoadBalancerStatus _
instance showLoadBalancerStatus :: Show LoadBalancerStatus where show a = genericShow a
instance decodeLoadBalancerStatus :: Decode LoadBalancerStatus where
  decode a = do
               ingress <- readProp "ingress" a >>= decode
               pure $ LoadBalancerStatus { ingress }
instance encodeLoadBalancerStatus :: Encode LoadBalancerStatus where
  encode (LoadBalancerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "ingress" (encode a.ingress) ]


instance defaultLoadBalancerStatus :: Default LoadBalancerStatus where
  default = LoadBalancerStatus
    { ingress: NullOrUndefined Nothing }

-- | LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.
-- |
-- | Fields:
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
newtype LocalObjectReference = LocalObjectReference
  { name :: (NullOrUndefined String) }

derive instance newtypeLocalObjectReference :: Newtype LocalObjectReference _
derive instance genericLocalObjectReference :: Generic LocalObjectReference _
instance showLocalObjectReference :: Show LocalObjectReference where show a = genericShow a
instance decodeLocalObjectReference :: Decode LocalObjectReference where
  decode a = do
               name <- readProp "name" a >>= decode
               pure $ LocalObjectReference { name }
instance encodeLocalObjectReference :: Encode LocalObjectReference where
  encode (LocalObjectReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name) ]


instance defaultLocalObjectReference :: Default LocalObjectReference where
  default = LocalObjectReference
    { name: NullOrUndefined Nothing }

-- | Local represents directly-attached storage with node affinity
-- |
-- | Fields:
-- | - `path`: The full path to the volume on the node For alpha, this path must be a directory Once block as a source is supported, then this path can point to a block device
newtype LocalVolumeSource = LocalVolumeSource
  { path :: (NullOrUndefined String) }

derive instance newtypeLocalVolumeSource :: Newtype LocalVolumeSource _
derive instance genericLocalVolumeSource :: Generic LocalVolumeSource _
instance showLocalVolumeSource :: Show LocalVolumeSource where show a = genericShow a
instance decodeLocalVolumeSource :: Decode LocalVolumeSource where
  decode a = do
               path <- readProp "path" a >>= decode
               pure $ LocalVolumeSource { path }
instance encodeLocalVolumeSource :: Encode LocalVolumeSource where
  encode (LocalVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "path" (encode a.path) ]


instance defaultLocalVolumeSource :: Default LocalVolumeSource where
  default = LocalVolumeSource
    { path: NullOrUndefined Nothing }

-- | Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `path`: Path that is exported by the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
-- | - `readOnly`: ReadOnly here will force the NFS export to be mounted with read-only permissions. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
-- | - `server`: Server is the hostname or IP address of the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
newtype NFSVolumeSource = NFSVolumeSource
  { path :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , server :: (NullOrUndefined String) }

derive instance newtypeNFSVolumeSource :: Newtype NFSVolumeSource _
derive instance genericNFSVolumeSource :: Generic NFSVolumeSource _
instance showNFSVolumeSource :: Show NFSVolumeSource where show a = genericShow a
instance decodeNFSVolumeSource :: Decode NFSVolumeSource where
  decode a = do
               path <- readProp "path" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               server <- readProp "server" a >>= decode
               pure $ NFSVolumeSource { path, readOnly, server }
instance encodeNFSVolumeSource :: Encode NFSVolumeSource where
  encode (NFSVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "path" (encode a.path)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "server" (encode a.server) ]


instance defaultNFSVolumeSource :: Default NFSVolumeSource where
  default = NFSVolumeSource
    { path: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , server: NullOrUndefined Nothing }

-- | Namespace provides a scope for Names. Use of multiple namespaces is optional.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the behavior of the Namespace. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status describes the current status of a Namespace. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Namespace = Namespace
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined NamespaceSpec)
  , status :: (NullOrUndefined NamespaceStatus) }

derive instance newtypeNamespace :: Newtype Namespace _
derive instance genericNamespace :: Generic Namespace _
instance showNamespace :: Show Namespace where show a = genericShow a
instance decodeNamespace :: Decode Namespace where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ Namespace { apiVersion, kind, metadata, spec, status }
instance encodeNamespace :: Encode Namespace where
  encode (Namespace a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultNamespace :: Default Namespace where
  default = Namespace
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | NamespaceList is a list of Namespaces.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is the list of Namespace objects in the list. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype NamespaceList = NamespaceList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Namespace))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeNamespaceList :: Newtype NamespaceList _
derive instance genericNamespaceList :: Generic NamespaceList _
instance showNamespaceList :: Show NamespaceList where show a = genericShow a
instance decodeNamespaceList :: Decode NamespaceList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ NamespaceList { apiVersion, items, kind, metadata }
instance encodeNamespaceList :: Encode NamespaceList where
  encode (NamespaceList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultNamespaceList :: Default NamespaceList where
  default = NamespaceList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | NamespaceSpec describes the attributes on a Namespace.
-- |
-- | Fields:
-- | - `finalizers`: Finalizers is an opaque list of values that must be empty to permanently remove object from storage. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
newtype NamespaceSpec = NamespaceSpec
  { finalizers :: (NullOrUndefined (Array String)) }

derive instance newtypeNamespaceSpec :: Newtype NamespaceSpec _
derive instance genericNamespaceSpec :: Generic NamespaceSpec _
instance showNamespaceSpec :: Show NamespaceSpec where show a = genericShow a
instance decodeNamespaceSpec :: Decode NamespaceSpec where
  decode a = do
               finalizers <- readProp "finalizers" a >>= decode
               pure $ NamespaceSpec { finalizers }
instance encodeNamespaceSpec :: Encode NamespaceSpec where
  encode (NamespaceSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "finalizers" (encode a.finalizers) ]


instance defaultNamespaceSpec :: Default NamespaceSpec where
  default = NamespaceSpec
    { finalizers: NullOrUndefined Nothing }

-- | NamespaceStatus is information about the current status of a Namespace.
-- |
-- | Fields:
-- | - `phase`: Phase is the current lifecycle phase of the namespace. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
newtype NamespaceStatus = NamespaceStatus
  { phase :: (NullOrUndefined String) }

derive instance newtypeNamespaceStatus :: Newtype NamespaceStatus _
derive instance genericNamespaceStatus :: Generic NamespaceStatus _
instance showNamespaceStatus :: Show NamespaceStatus where show a = genericShow a
instance decodeNamespaceStatus :: Decode NamespaceStatus where
  decode a = do
               phase <- readProp "phase" a >>= decode
               pure $ NamespaceStatus { phase }
instance encodeNamespaceStatus :: Encode NamespaceStatus where
  encode (NamespaceStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "phase" (encode a.phase) ]


instance defaultNamespaceStatus :: Default NamespaceStatus where
  default = NamespaceStatus
    { phase: NullOrUndefined Nothing }

-- | Node is a worker node in Kubernetes. Each node will have a unique identifier in the cache (i.e. in etcd).
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the behavior of a node. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Most recently observed status of the node. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Node = Node
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined NodeSpec)
  , status :: (NullOrUndefined NodeStatus) }

derive instance newtypeNode :: Newtype Node _
derive instance genericNode :: Generic Node _
instance showNode :: Show Node where show a = genericShow a
instance decodeNode :: Decode Node where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ Node { apiVersion, kind, metadata, spec, status }
instance encodeNode :: Encode Node where
  encode (Node a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultNode :: Default Node where
  default = Node
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | NodeAddress contains information for the node's address.
-- |
-- | Fields:
-- | - `address`: The node address.
-- | - `_type`: Node address type, one of Hostname, ExternalIP or InternalIP.
newtype NodeAddress = NodeAddress
  { _type :: (NullOrUndefined String)
  , address :: (NullOrUndefined String) }

derive instance newtypeNodeAddress :: Newtype NodeAddress _
derive instance genericNodeAddress :: Generic NodeAddress _
instance showNodeAddress :: Show NodeAddress where show a = genericShow a
instance decodeNodeAddress :: Decode NodeAddress where
  decode a = do
               _type <- readProp "_type" a >>= decode
               address <- readProp "address" a >>= decode
               pure $ NodeAddress { _type, address }
instance encodeNodeAddress :: Encode NodeAddress where
  encode (NodeAddress a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "address" (encode a.address) ]


instance defaultNodeAddress :: Default NodeAddress where
  default = NodeAddress
    { _type: NullOrUndefined Nothing
    , address: NullOrUndefined Nothing }

-- | Node affinity is a group of node affinity scheduling rules.
-- |
-- | Fields:
-- | - `preferredDuringSchedulingIgnoredDuringExecution`: The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred.
-- | - `requiredDuringSchedulingIgnoredDuringExecution`: If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to an update), the system may or may not try to eventually evict the pod from its node.
newtype NodeAffinity = NodeAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array PreferredSchedulingTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined NodeSelector) }

derive instance newtypeNodeAffinity :: Newtype NodeAffinity _
derive instance genericNodeAffinity :: Generic NodeAffinity _
instance showNodeAffinity :: Show NodeAffinity where show a = genericShow a
instance decodeNodeAffinity :: Decode NodeAffinity where
  decode a = do
               preferredDuringSchedulingIgnoredDuringExecution <- readProp "preferredDuringSchedulingIgnoredDuringExecution" a >>= decode
               requiredDuringSchedulingIgnoredDuringExecution <- readProp "requiredDuringSchedulingIgnoredDuringExecution" a >>= decode
               pure $ NodeAffinity { preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution }
instance encodeNodeAffinity :: Encode NodeAffinity where
  encode (NodeAffinity a) = encode $ StrMap.fromFoldable $
               [ Tuple "preferredDuringSchedulingIgnoredDuringExecution" (encode a.preferredDuringSchedulingIgnoredDuringExecution)
               , Tuple "requiredDuringSchedulingIgnoredDuringExecution" (encode a.requiredDuringSchedulingIgnoredDuringExecution) ]


instance defaultNodeAffinity :: Default NodeAffinity where
  default = NodeAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing }

-- | NodeCondition contains condition information for a node.
-- |
-- | Fields:
-- | - `lastHeartbeatTime`: Last time we got an update on a given condition.
-- | - `lastTransitionTime`: Last time the condition transit from one status to another.
-- | - `message`: Human readable message indicating details about last transition.
-- | - `reason`: (brief) reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
-- | - `_type`: Type of node condition.
newtype NodeCondition = NodeCondition
  { _type :: (NullOrUndefined String)
  , lastHeartbeatTime :: (NullOrUndefined MetaV1.Time)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeNodeCondition :: Newtype NodeCondition _
derive instance genericNodeCondition :: Generic NodeCondition _
instance showNodeCondition :: Show NodeCondition where show a = genericShow a
instance decodeNodeCondition :: Decode NodeCondition where
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastHeartbeatTime <- readProp "lastHeartbeatTime" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ NodeCondition { _type, lastHeartbeatTime, lastTransitionTime, message, reason, status }
instance encodeNodeCondition :: Encode NodeCondition where
  encode (NodeCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastHeartbeatTime" (encode a.lastHeartbeatTime)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


instance defaultNodeCondition :: Default NodeCondition where
  default = NodeCondition
    { _type: NullOrUndefined Nothing
    , lastHeartbeatTime: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | NodeConfigSource specifies a source of node configuration. Exactly one subfield (excluding metadata) must be non-nil.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `configMapRef`
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype NodeConfigSource = NodeConfigSource
  { apiVersion :: (NullOrUndefined String)
  , configMapRef :: (NullOrUndefined ObjectReference)
  , kind :: (NullOrUndefined String) }

derive instance newtypeNodeConfigSource :: Newtype NodeConfigSource _
derive instance genericNodeConfigSource :: Generic NodeConfigSource _
instance showNodeConfigSource :: Show NodeConfigSource where show a = genericShow a
instance decodeNodeConfigSource :: Decode NodeConfigSource where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               configMapRef <- readProp "configMapRef" a >>= decode
               kind <- readProp "kind" a >>= decode
               pure $ NodeConfigSource { apiVersion, configMapRef, kind }
instance encodeNodeConfigSource :: Encode NodeConfigSource where
  encode (NodeConfigSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "configMapRef" (encode a.configMapRef)
               , Tuple "kind" (encode a.kind) ]


instance defaultNodeConfigSource :: Default NodeConfigSource where
  default = NodeConfigSource
    { apiVersion: NullOrUndefined Nothing
    , configMapRef: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing }

-- | NodeDaemonEndpoints lists ports opened by daemons running on the Node.
-- |
-- | Fields:
-- | - `kubeletEndpoint`: Endpoint on which Kubelet is listening.
newtype NodeDaemonEndpoints = NodeDaemonEndpoints
  { kubeletEndpoint :: (NullOrUndefined DaemonEndpoint) }

derive instance newtypeNodeDaemonEndpoints :: Newtype NodeDaemonEndpoints _
derive instance genericNodeDaemonEndpoints :: Generic NodeDaemonEndpoints _
instance showNodeDaemonEndpoints :: Show NodeDaemonEndpoints where show a = genericShow a
instance decodeNodeDaemonEndpoints :: Decode NodeDaemonEndpoints where
  decode a = do
               kubeletEndpoint <- readProp "kubeletEndpoint" a >>= decode
               pure $ NodeDaemonEndpoints { kubeletEndpoint }
instance encodeNodeDaemonEndpoints :: Encode NodeDaemonEndpoints where
  encode (NodeDaemonEndpoints a) = encode $ StrMap.fromFoldable $
               [ Tuple "kubeletEndpoint" (encode a.kubeletEndpoint) ]


instance defaultNodeDaemonEndpoints :: Default NodeDaemonEndpoints where
  default = NodeDaemonEndpoints
    { kubeletEndpoint: NullOrUndefined Nothing }

-- | NodeList is the whole list of all Nodes which have been registered with master.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of nodes
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype NodeList = NodeList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Node))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeNodeList :: Newtype NodeList _
derive instance genericNodeList :: Generic NodeList _
instance showNodeList :: Show NodeList where show a = genericShow a
instance decodeNodeList :: Decode NodeList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ NodeList { apiVersion, items, kind, metadata }
instance encodeNodeList :: Encode NodeList where
  encode (NodeList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultNodeList :: Default NodeList where
  default = NodeList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms.
-- |
-- | Fields:
-- | - `nodeSelectorTerms`: Required. A list of node selector terms. The terms are ORed.
newtype NodeSelector = NodeSelector
  { nodeSelectorTerms :: (NullOrUndefined (Array NodeSelectorTerm)) }

derive instance newtypeNodeSelector :: Newtype NodeSelector _
derive instance genericNodeSelector :: Generic NodeSelector _
instance showNodeSelector :: Show NodeSelector where show a = genericShow a
instance decodeNodeSelector :: Decode NodeSelector where
  decode a = do
               nodeSelectorTerms <- readProp "nodeSelectorTerms" a >>= decode
               pure $ NodeSelector { nodeSelectorTerms }
instance encodeNodeSelector :: Encode NodeSelector where
  encode (NodeSelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "nodeSelectorTerms" (encode a.nodeSelectorTerms) ]


instance defaultNodeSelector :: Default NodeSelector where
  default = NodeSelector
    { nodeSelectorTerms: NullOrUndefined Nothing }

-- | A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values.
-- |
-- | Fields:
-- | - `key`: The label key that the selector applies to.
-- | - `operator`: Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
-- | - `values`: An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch.
newtype NodeSelectorRequirement = NodeSelectorRequirement
  { key :: (NullOrUndefined String)
  , operator :: (NullOrUndefined String)
  , values :: (NullOrUndefined (Array String)) }

derive instance newtypeNodeSelectorRequirement :: Newtype NodeSelectorRequirement _
derive instance genericNodeSelectorRequirement :: Generic NodeSelectorRequirement _
instance showNodeSelectorRequirement :: Show NodeSelectorRequirement where show a = genericShow a
instance decodeNodeSelectorRequirement :: Decode NodeSelectorRequirement where
  decode a = do
               key <- readProp "key" a >>= decode
               operator <- readProp "operator" a >>= decode
               values <- readProp "values" a >>= decode
               pure $ NodeSelectorRequirement { key, operator, values }
instance encodeNodeSelectorRequirement :: Encode NodeSelectorRequirement where
  encode (NodeSelectorRequirement a) = encode $ StrMap.fromFoldable $
               [ Tuple "key" (encode a.key)
               , Tuple "operator" (encode a.operator)
               , Tuple "values" (encode a.values) ]


instance defaultNodeSelectorRequirement :: Default NodeSelectorRequirement where
  default = NodeSelectorRequirement
    { key: NullOrUndefined Nothing
    , operator: NullOrUndefined Nothing
    , values: NullOrUndefined Nothing }

-- | A null or empty node selector term matches no objects.
-- |
-- | Fields:
-- | - `matchExpressions`: Required. A list of node selector requirements. The requirements are ANDed.
newtype NodeSelectorTerm = NodeSelectorTerm
  { matchExpressions :: (NullOrUndefined (Array NodeSelectorRequirement)) }

derive instance newtypeNodeSelectorTerm :: Newtype NodeSelectorTerm _
derive instance genericNodeSelectorTerm :: Generic NodeSelectorTerm _
instance showNodeSelectorTerm :: Show NodeSelectorTerm where show a = genericShow a
instance decodeNodeSelectorTerm :: Decode NodeSelectorTerm where
  decode a = do
               matchExpressions <- readProp "matchExpressions" a >>= decode
               pure $ NodeSelectorTerm { matchExpressions }
instance encodeNodeSelectorTerm :: Encode NodeSelectorTerm where
  encode (NodeSelectorTerm a) = encode $ StrMap.fromFoldable $
               [ Tuple "matchExpressions" (encode a.matchExpressions) ]


instance defaultNodeSelectorTerm :: Default NodeSelectorTerm where
  default = NodeSelectorTerm
    { matchExpressions: NullOrUndefined Nothing }

-- | NodeSpec describes the attributes that a node is created with.
-- |
-- | Fields:
-- | - `configSource`: If specified, the source to get node configuration from The DynamicKubeletConfig feature gate must be enabled for the Kubelet to use this field
-- | - `externalID`: External ID of the node assigned by some machine database (e.g. a cloud provider). Deprecated.
-- | - `podCIDR`: PodCIDR represents the pod IP range assigned to the node.
-- | - `providerID`: ID of the node assigned by the cloud provider in the format: <ProviderName>://<ProviderSpecificNodeID>
-- | - `taints`: If specified, the node's taints.
-- | - `unschedulable`: Unschedulable controls node schedulability of new pods. By default, node is schedulable. More info: https://kubernetes.io/docs/concepts/nodes/node/#manual-node-administration
newtype NodeSpec = NodeSpec
  { configSource :: (NullOrUndefined NodeConfigSource)
  , externalID :: (NullOrUndefined String)
  , podCIDR :: (NullOrUndefined String)
  , providerID :: (NullOrUndefined String)
  , taints :: (NullOrUndefined (Array Taint))
  , unschedulable :: (NullOrUndefined Boolean) }

derive instance newtypeNodeSpec :: Newtype NodeSpec _
derive instance genericNodeSpec :: Generic NodeSpec _
instance showNodeSpec :: Show NodeSpec where show a = genericShow a
instance decodeNodeSpec :: Decode NodeSpec where
  decode a = do
               configSource <- readProp "configSource" a >>= decode
               externalID <- readProp "externalID" a >>= decode
               podCIDR <- readProp "podCIDR" a >>= decode
               providerID <- readProp "providerID" a >>= decode
               taints <- readProp "taints" a >>= decode
               unschedulable <- readProp "unschedulable" a >>= decode
               pure $ NodeSpec { configSource, externalID, podCIDR, providerID, taints, unschedulable }
instance encodeNodeSpec :: Encode NodeSpec where
  encode (NodeSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "configSource" (encode a.configSource)
               , Tuple "externalID" (encode a.externalID)
               , Tuple "podCIDR" (encode a.podCIDR)
               , Tuple "providerID" (encode a.providerID)
               , Tuple "taints" (encode a.taints)
               , Tuple "unschedulable" (encode a.unschedulable) ]


instance defaultNodeSpec :: Default NodeSpec where
  default = NodeSpec
    { configSource: NullOrUndefined Nothing
    , externalID: NullOrUndefined Nothing
    , podCIDR: NullOrUndefined Nothing
    , providerID: NullOrUndefined Nothing
    , taints: NullOrUndefined Nothing
    , unschedulable: NullOrUndefined Nothing }

-- | NodeStatus is information about the current status of a node.
-- |
-- | Fields:
-- | - `addresses`: List of addresses reachable to the node. Queried from cloud provider, if available. More info: https://kubernetes.io/docs/concepts/nodes/node/#addresses
-- | - `allocatable`: Allocatable represents the resources of a node that are available for scheduling. Defaults to Capacity.
-- | - `capacity`: Capacity represents the total resources of a node. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
-- | - `conditions`: Conditions is an array of current observed node conditions. More info: https://kubernetes.io/docs/concepts/nodes/node/#condition
-- | - `daemonEndpoints`: Endpoints of daemons running on the Node.
-- | - `images`: List of container images on this node
-- | - `nodeInfo`: Set of ids/uuids to uniquely identify the node. More info: https://kubernetes.io/docs/concepts/nodes/node/#info
-- | - `phase`: NodePhase is the recently observed lifecycle phase of the node. More info: https://kubernetes.io/docs/concepts/nodes/node/#phase The field is never populated, and now is deprecated.
-- | - `volumesAttached`: List of volumes that are attached to the node.
-- | - `volumesInUse`: List of attachable volumes in use (mounted) by the node.
newtype NodeStatus = NodeStatus
  { addresses :: (NullOrUndefined (Array NodeAddress))
  , allocatable :: (NullOrUndefined (StrMap Resource.Quantity))
  , capacity :: (NullOrUndefined (StrMap Resource.Quantity))
  , conditions :: (NullOrUndefined (Array NodeCondition))
  , daemonEndpoints :: (NullOrUndefined NodeDaemonEndpoints)
  , images :: (NullOrUndefined (Array ContainerImage))
  , nodeInfo :: (NullOrUndefined NodeSystemInfo)
  , phase :: (NullOrUndefined String)
  , volumesAttached :: (NullOrUndefined (Array AttachedVolume))
  , volumesInUse :: (NullOrUndefined (Array String)) }

derive instance newtypeNodeStatus :: Newtype NodeStatus _
derive instance genericNodeStatus :: Generic NodeStatus _
instance showNodeStatus :: Show NodeStatus where show a = genericShow a
instance decodeNodeStatus :: Decode NodeStatus where
  decode a = do
               addresses <- readProp "addresses" a >>= decode
               allocatable <- readProp "allocatable" a >>= decode
               capacity <- readProp "capacity" a >>= decode
               conditions <- readProp "conditions" a >>= decode
               daemonEndpoints <- readProp "daemonEndpoints" a >>= decode
               images <- readProp "images" a >>= decode
               nodeInfo <- readProp "nodeInfo" a >>= decode
               phase <- readProp "phase" a >>= decode
               volumesAttached <- readProp "volumesAttached" a >>= decode
               volumesInUse <- readProp "volumesInUse" a >>= decode
               pure $ NodeStatus { addresses, allocatable, capacity, conditions, daemonEndpoints, images, nodeInfo, phase, volumesAttached, volumesInUse }
instance encodeNodeStatus :: Encode NodeStatus where
  encode (NodeStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "addresses" (encode a.addresses)
               , Tuple "allocatable" (encode a.allocatable)
               , Tuple "capacity" (encode a.capacity)
               , Tuple "conditions" (encode a.conditions)
               , Tuple "daemonEndpoints" (encode a.daemonEndpoints)
               , Tuple "images" (encode a.images)
               , Tuple "nodeInfo" (encode a.nodeInfo)
               , Tuple "phase" (encode a.phase)
               , Tuple "volumesAttached" (encode a.volumesAttached)
               , Tuple "volumesInUse" (encode a.volumesInUse) ]


instance defaultNodeStatus :: Default NodeStatus where
  default = NodeStatus
    { addresses: NullOrUndefined Nothing
    , allocatable: NullOrUndefined Nothing
    , capacity: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , daemonEndpoints: NullOrUndefined Nothing
    , images: NullOrUndefined Nothing
    , nodeInfo: NullOrUndefined Nothing
    , phase: NullOrUndefined Nothing
    , volumesAttached: NullOrUndefined Nothing
    , volumesInUse: NullOrUndefined Nothing }

-- | NodeSystemInfo is a set of ids/uuids to uniquely identify the node.
-- |
-- | Fields:
-- | - `architecture`: The Architecture reported by the node
-- | - `bootID`: Boot ID reported by the node.
-- | - `containerRuntimeVersion`: ContainerRuntime Version reported by the node through runtime remote API (e.g. docker://1.5.0).
-- | - `kernelVersion`: Kernel Version reported by the node from 'uname -r' (e.g. 3.16.0-0.bpo.4-amd64).
-- | - `kubeProxyVersion`: KubeProxy Version reported by the node.
-- | - `kubeletVersion`: Kubelet Version reported by the node.
-- | - `machineID`: MachineID reported by the node. For unique machine identification in the cluster this field is preferred. Learn more from man(5) machine-id: http://man7.org/linux/man-pages/man5/machine-id.5.html
-- | - `operatingSystem`: The Operating System reported by the node
-- | - `osImage`: OS Image reported by the node from /etc/os-release (e.g. Debian GNU/Linux 7 (wheezy)).
-- | - `systemUUID`: SystemUUID reported by the node. For unique machine identification MachineID is preferred. This field is specific to Red Hat hosts https://access.redhat.com/documentation/en-US/Red_Hat_Subscription_Management/1/html/RHSM/getting-system-uuid.html
newtype NodeSystemInfo = NodeSystemInfo
  { architecture :: (NullOrUndefined String)
  , bootID :: (NullOrUndefined String)
  , containerRuntimeVersion :: (NullOrUndefined String)
  , kernelVersion :: (NullOrUndefined String)
  , kubeProxyVersion :: (NullOrUndefined String)
  , kubeletVersion :: (NullOrUndefined String)
  , machineID :: (NullOrUndefined String)
  , operatingSystem :: (NullOrUndefined String)
  , osImage :: (NullOrUndefined String)
  , systemUUID :: (NullOrUndefined String) }

derive instance newtypeNodeSystemInfo :: Newtype NodeSystemInfo _
derive instance genericNodeSystemInfo :: Generic NodeSystemInfo _
instance showNodeSystemInfo :: Show NodeSystemInfo where show a = genericShow a
instance decodeNodeSystemInfo :: Decode NodeSystemInfo where
  decode a = do
               architecture <- readProp "architecture" a >>= decode
               bootID <- readProp "bootID" a >>= decode
               containerRuntimeVersion <- readProp "containerRuntimeVersion" a >>= decode
               kernelVersion <- readProp "kernelVersion" a >>= decode
               kubeProxyVersion <- readProp "kubeProxyVersion" a >>= decode
               kubeletVersion <- readProp "kubeletVersion" a >>= decode
               machineID <- readProp "machineID" a >>= decode
               operatingSystem <- readProp "operatingSystem" a >>= decode
               osImage <- readProp "osImage" a >>= decode
               systemUUID <- readProp "systemUUID" a >>= decode
               pure $ NodeSystemInfo { architecture, bootID, containerRuntimeVersion, kernelVersion, kubeProxyVersion, kubeletVersion, machineID, operatingSystem, osImage, systemUUID }
instance encodeNodeSystemInfo :: Encode NodeSystemInfo where
  encode (NodeSystemInfo a) = encode $ StrMap.fromFoldable $
               [ Tuple "architecture" (encode a.architecture)
               , Tuple "bootID" (encode a.bootID)
               , Tuple "containerRuntimeVersion" (encode a.containerRuntimeVersion)
               , Tuple "kernelVersion" (encode a.kernelVersion)
               , Tuple "kubeProxyVersion" (encode a.kubeProxyVersion)
               , Tuple "kubeletVersion" (encode a.kubeletVersion)
               , Tuple "machineID" (encode a.machineID)
               , Tuple "operatingSystem" (encode a.operatingSystem)
               , Tuple "osImage" (encode a.osImage)
               , Tuple "systemUUID" (encode a.systemUUID) ]


instance defaultNodeSystemInfo :: Default NodeSystemInfo where
  default = NodeSystemInfo
    { architecture: NullOrUndefined Nothing
    , bootID: NullOrUndefined Nothing
    , containerRuntimeVersion: NullOrUndefined Nothing
    , kernelVersion: NullOrUndefined Nothing
    , kubeProxyVersion: NullOrUndefined Nothing
    , kubeletVersion: NullOrUndefined Nothing
    , machineID: NullOrUndefined Nothing
    , operatingSystem: NullOrUndefined Nothing
    , osImage: NullOrUndefined Nothing
    , systemUUID: NullOrUndefined Nothing }

-- | ObjectFieldSelector selects an APIVersioned field of an object.
-- |
-- | Fields:
-- | - `apiVersion`: Version of the schema the FieldPath is written in terms of, defaults to "v1".
-- | - `fieldPath`: Path of the field to select in the specified API version.
newtype ObjectFieldSelector = ObjectFieldSelector
  { apiVersion :: (NullOrUndefined String)
  , fieldPath :: (NullOrUndefined String) }

derive instance newtypeObjectFieldSelector :: Newtype ObjectFieldSelector _
derive instance genericObjectFieldSelector :: Generic ObjectFieldSelector _
instance showObjectFieldSelector :: Show ObjectFieldSelector where show a = genericShow a
instance decodeObjectFieldSelector :: Decode ObjectFieldSelector where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               fieldPath <- readProp "fieldPath" a >>= decode
               pure $ ObjectFieldSelector { apiVersion, fieldPath }
instance encodeObjectFieldSelector :: Encode ObjectFieldSelector where
  encode (ObjectFieldSelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "fieldPath" (encode a.fieldPath) ]


instance defaultObjectFieldSelector :: Default ObjectFieldSelector where
  default = ObjectFieldSelector
    { apiVersion: NullOrUndefined Nothing
    , fieldPath: NullOrUndefined Nothing }

-- | ObjectReference contains enough information to let you inspect or modify the referred object.
-- |
-- | Fields:
-- | - `apiVersion`: API version of the referent.
-- | - `fieldPath`: If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
-- | - `kind`: Kind of the referent. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `namespace`: Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
-- | - `resourceVersion`: Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#concurrency-control-and-consistency
-- | - `uid`: UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
newtype ObjectReference = ObjectReference
  { apiVersion :: (NullOrUndefined String)
  , fieldPath :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String)
  , resourceVersion :: (NullOrUndefined String)
  , uid :: (NullOrUndefined String) }

derive instance newtypeObjectReference :: Newtype ObjectReference _
derive instance genericObjectReference :: Generic ObjectReference _
instance showObjectReference :: Show ObjectReference where show a = genericShow a
instance decodeObjectReference :: Decode ObjectReference where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               fieldPath <- readProp "fieldPath" a >>= decode
               kind <- readProp "kind" a >>= decode
               name <- readProp "name" a >>= decode
               namespace <- readProp "namespace" a >>= decode
               resourceVersion <- readProp "resourceVersion" a >>= decode
               uid <- readProp "uid" a >>= decode
               pure $ ObjectReference { apiVersion, fieldPath, kind, name, namespace, resourceVersion, uid }
instance encodeObjectReference :: Encode ObjectReference where
  encode (ObjectReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "fieldPath" (encode a.fieldPath)
               , Tuple "kind" (encode a.kind)
               , Tuple "name" (encode a.name)
               , Tuple "namespace" (encode a.namespace)
               , Tuple "resourceVersion" (encode a.resourceVersion)
               , Tuple "uid" (encode a.uid) ]


instance defaultObjectReference :: Default ObjectReference where
  default = ObjectReference
    { apiVersion: NullOrUndefined Nothing
    , fieldPath: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing }

-- | PersistentVolume (PV) is a storage resource provisioned by an administrator. It is analogous to a node. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines a specification of a persistent volume owned by the cluster. Provisioned by an administrator. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistent-volumes
-- | - `status`: Status represents the current information/status for the persistent volume. Populated by the system. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistent-volumes
newtype PersistentVolume = PersistentVolume
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PersistentVolumeSpec)
  , status :: (NullOrUndefined PersistentVolumeStatus) }

derive instance newtypePersistentVolume :: Newtype PersistentVolume _
derive instance genericPersistentVolume :: Generic PersistentVolume _
instance showPersistentVolume :: Show PersistentVolume where show a = genericShow a
instance decodePersistentVolume :: Decode PersistentVolume where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ PersistentVolume { apiVersion, kind, metadata, spec, status }
instance encodePersistentVolume :: Encode PersistentVolume where
  encode (PersistentVolume a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultPersistentVolume :: Default PersistentVolume where
  default = PersistentVolume
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | PersistentVolumeClaim is a user's request for and claim to a persistent volume
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the desired characteristics of a volume requested by a pod author. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
-- | - `status`: Status represents the current information/status of a persistent volume claim. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
newtype PersistentVolumeClaim = PersistentVolumeClaim
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PersistentVolumeClaimSpec)
  , status :: (NullOrUndefined PersistentVolumeClaimStatus) }

derive instance newtypePersistentVolumeClaim :: Newtype PersistentVolumeClaim _
derive instance genericPersistentVolumeClaim :: Generic PersistentVolumeClaim _
instance showPersistentVolumeClaim :: Show PersistentVolumeClaim where show a = genericShow a
instance decodePersistentVolumeClaim :: Decode PersistentVolumeClaim where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ PersistentVolumeClaim { apiVersion, kind, metadata, spec, status }
instance encodePersistentVolumeClaim :: Encode PersistentVolumeClaim where
  encode (PersistentVolumeClaim a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultPersistentVolumeClaim :: Default PersistentVolumeClaim where
  default = PersistentVolumeClaim
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | PersistentVolumeClaimCondition contails details about state of pvc
-- |
-- | Fields:
-- | - `lastProbeTime`: Last time we probed the condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: Human-readable message indicating details about last transition.
-- | - `reason`: Unique, this should be a short, machine understandable string that gives the reason for condition's last transition. If it reports "ResizeStarted" that means the underlying persistent volume is being resized.
-- | - `status`
-- | - `_type`
newtype PersistentVolumeClaimCondition = PersistentVolumeClaimCondition
  { _type :: (NullOrUndefined String)
  , lastProbeTime :: (NullOrUndefined MetaV1.Time)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypePersistentVolumeClaimCondition :: Newtype PersistentVolumeClaimCondition _
derive instance genericPersistentVolumeClaimCondition :: Generic PersistentVolumeClaimCondition _
instance showPersistentVolumeClaimCondition :: Show PersistentVolumeClaimCondition where show a = genericShow a
instance decodePersistentVolumeClaimCondition :: Decode PersistentVolumeClaimCondition where
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastProbeTime <- readProp "lastProbeTime" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ PersistentVolumeClaimCondition { _type, lastProbeTime, lastTransitionTime, message, reason, status }
instance encodePersistentVolumeClaimCondition :: Encode PersistentVolumeClaimCondition where
  encode (PersistentVolumeClaimCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastProbeTime" (encode a.lastProbeTime)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


instance defaultPersistentVolumeClaimCondition :: Default PersistentVolumeClaimCondition where
  default = PersistentVolumeClaimCondition
    { _type: NullOrUndefined Nothing
    , lastProbeTime: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | PersistentVolumeClaimList is a list of PersistentVolumeClaim items.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: A list of persistent volume claims. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype PersistentVolumeClaimList = PersistentVolumeClaimList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PersistentVolumeClaim))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePersistentVolumeClaimList :: Newtype PersistentVolumeClaimList _
derive instance genericPersistentVolumeClaimList :: Generic PersistentVolumeClaimList _
instance showPersistentVolumeClaimList :: Show PersistentVolumeClaimList where show a = genericShow a
instance decodePersistentVolumeClaimList :: Decode PersistentVolumeClaimList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ PersistentVolumeClaimList { apiVersion, items, kind, metadata }
instance encodePersistentVolumeClaimList :: Encode PersistentVolumeClaimList where
  encode (PersistentVolumeClaimList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultPersistentVolumeClaimList :: Default PersistentVolumeClaimList where
  default = PersistentVolumeClaimList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PersistentVolumeClaimSpec describes the common attributes of storage devices and allows a Source for provider-specific attributes
-- |
-- | Fields:
-- | - `accessModes`: AccessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
-- | - `resources`: Resources represents the minimum resources the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources
-- | - `selector`: A label query over volumes to consider for binding.
-- | - `storageClassName`: Name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1
-- | - `volumeMode`: volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec. This is an alpha feature and may change in the future.
-- | - `volumeName`: VolumeName is the binding reference to the PersistentVolume backing this claim.
newtype PersistentVolumeClaimSpec = PersistentVolumeClaimSpec
  { accessModes :: (NullOrUndefined (Array String))
  , resources :: (NullOrUndefined ResourceRequirements)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , storageClassName :: (NullOrUndefined String)
  , volumeMode :: (NullOrUndefined String)
  , volumeName :: (NullOrUndefined String) }

derive instance newtypePersistentVolumeClaimSpec :: Newtype PersistentVolumeClaimSpec _
derive instance genericPersistentVolumeClaimSpec :: Generic PersistentVolumeClaimSpec _
instance showPersistentVolumeClaimSpec :: Show PersistentVolumeClaimSpec where show a = genericShow a
instance decodePersistentVolumeClaimSpec :: Decode PersistentVolumeClaimSpec where
  decode a = do
               accessModes <- readProp "accessModes" a >>= decode
               resources <- readProp "resources" a >>= decode
               selector <- readProp "selector" a >>= decode
               storageClassName <- readProp "storageClassName" a >>= decode
               volumeMode <- readProp "volumeMode" a >>= decode
               volumeName <- readProp "volumeName" a >>= decode
               pure $ PersistentVolumeClaimSpec { accessModes, resources, selector, storageClassName, volumeMode, volumeName }
instance encodePersistentVolumeClaimSpec :: Encode PersistentVolumeClaimSpec where
  encode (PersistentVolumeClaimSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "accessModes" (encode a.accessModes)
               , Tuple "resources" (encode a.resources)
               , Tuple "selector" (encode a.selector)
               , Tuple "storageClassName" (encode a.storageClassName)
               , Tuple "volumeMode" (encode a.volumeMode)
               , Tuple "volumeName" (encode a.volumeName) ]


instance defaultPersistentVolumeClaimSpec :: Default PersistentVolumeClaimSpec where
  default = PersistentVolumeClaimSpec
    { accessModes: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , storageClassName: NullOrUndefined Nothing
    , volumeMode: NullOrUndefined Nothing
    , volumeName: NullOrUndefined Nothing }

-- | PersistentVolumeClaimStatus is the current status of a persistent volume claim.
-- |
-- | Fields:
-- | - `accessModes`: AccessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
-- | - `capacity`: Represents the actual resources of the underlying volume.
-- | - `conditions`: Current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'ResizeStarted'.
-- | - `phase`: Phase represents the current phase of PersistentVolumeClaim.
newtype PersistentVolumeClaimStatus = PersistentVolumeClaimStatus
  { accessModes :: (NullOrUndefined (Array String))
  , capacity :: (NullOrUndefined (StrMap Resource.Quantity))
  , conditions :: (NullOrUndefined (Array PersistentVolumeClaimCondition))
  , phase :: (NullOrUndefined String) }

derive instance newtypePersistentVolumeClaimStatus :: Newtype PersistentVolumeClaimStatus _
derive instance genericPersistentVolumeClaimStatus :: Generic PersistentVolumeClaimStatus _
instance showPersistentVolumeClaimStatus :: Show PersistentVolumeClaimStatus where show a = genericShow a
instance decodePersistentVolumeClaimStatus :: Decode PersistentVolumeClaimStatus where
  decode a = do
               accessModes <- readProp "accessModes" a >>= decode
               capacity <- readProp "capacity" a >>= decode
               conditions <- readProp "conditions" a >>= decode
               phase <- readProp "phase" a >>= decode
               pure $ PersistentVolumeClaimStatus { accessModes, capacity, conditions, phase }
instance encodePersistentVolumeClaimStatus :: Encode PersistentVolumeClaimStatus where
  encode (PersistentVolumeClaimStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "accessModes" (encode a.accessModes)
               , Tuple "capacity" (encode a.capacity)
               , Tuple "conditions" (encode a.conditions)
               , Tuple "phase" (encode a.phase) ]


instance defaultPersistentVolumeClaimStatus :: Default PersistentVolumeClaimStatus where
  default = PersistentVolumeClaimStatus
    { accessModes: NullOrUndefined Nothing
    , capacity: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , phase: NullOrUndefined Nothing }

-- | PersistentVolumeClaimVolumeSource references the user's PVC in the same namespace. This volume finds the bound PV and mounts that volume for the pod. A PersistentVolumeClaimVolumeSource is, essentially, a wrapper around another type of volume that is owned by someone else (the system).
-- |
-- | Fields:
-- | - `claimName`: ClaimName is the name of a PersistentVolumeClaim in the same namespace as the pod using this volume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
-- | - `readOnly`: Will force the ReadOnly setting in VolumeMounts. Default false.
newtype PersistentVolumeClaimVolumeSource = PersistentVolumeClaimVolumeSource
  { claimName :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean) }

derive instance newtypePersistentVolumeClaimVolumeSource :: Newtype PersistentVolumeClaimVolumeSource _
derive instance genericPersistentVolumeClaimVolumeSource :: Generic PersistentVolumeClaimVolumeSource _
instance showPersistentVolumeClaimVolumeSource :: Show PersistentVolumeClaimVolumeSource where show a = genericShow a
instance decodePersistentVolumeClaimVolumeSource :: Decode PersistentVolumeClaimVolumeSource where
  decode a = do
               claimName <- readProp "claimName" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               pure $ PersistentVolumeClaimVolumeSource { claimName, readOnly }
instance encodePersistentVolumeClaimVolumeSource :: Encode PersistentVolumeClaimVolumeSource where
  encode (PersistentVolumeClaimVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "claimName" (encode a.claimName)
               , Tuple "readOnly" (encode a.readOnly) ]


instance defaultPersistentVolumeClaimVolumeSource :: Default PersistentVolumeClaimVolumeSource where
  default = PersistentVolumeClaimVolumeSource
    { claimName: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing }

-- | PersistentVolumeList is a list of PersistentVolume items.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of persistent volumes. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype PersistentVolumeList = PersistentVolumeList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PersistentVolume))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePersistentVolumeList :: Newtype PersistentVolumeList _
derive instance genericPersistentVolumeList :: Generic PersistentVolumeList _
instance showPersistentVolumeList :: Show PersistentVolumeList where show a = genericShow a
instance decodePersistentVolumeList :: Decode PersistentVolumeList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ PersistentVolumeList { apiVersion, items, kind, metadata }
instance encodePersistentVolumeList :: Encode PersistentVolumeList where
  encode (PersistentVolumeList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultPersistentVolumeList :: Default PersistentVolumeList where
  default = PersistentVolumeList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PersistentVolumeSpec is the specification of a persistent volume.
-- |
-- | Fields:
-- | - `accessModes`: AccessModes contains all ways the volume can be mounted. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes
-- | - `awsElasticBlockStore`: AWSElasticBlockStore represents an AWS Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
-- | - `azureDisk`: AzureDisk represents an Azure Data Disk mount on the host and bind mount to the pod.
-- | - `azureFile`: AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
-- | - `capacity`: A description of the persistent volume's resources and capacity. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
-- | - `cephfs`: CephFS represents a Ceph FS mount on the host that shares a pod's lifetime
-- | - `cinder`: Cinder represents a cinder volume attached and mounted on kubelets host machine More info: https://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md
-- | - `claimRef`: ClaimRef is part of a bi-directional binding between PersistentVolume and PersistentVolumeClaim. Expected to be non-nil when bound. claim.VolumeName is the authoritative bind between PV and PVC. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#binding
-- | - `csi`: CSI represents storage that handled by an external CSI driver
-- | - `fc`: FC represents a Fibre Channel resource that is attached to a kubelet's host machine and then exposed to the pod.
-- | - `flexVolume`: FlexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin.
-- | - `flocker`: Flocker represents a Flocker volume attached to a kubelet's host machine and exposed to the pod for its usage. This depends on the Flocker control service being running
-- | - `gcePersistentDisk`: GCEPersistentDisk represents a GCE Disk resource that is attached to a kubelet's host machine and then exposed to the pod. Provisioned by an admin. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
-- | - `glusterfs`: Glusterfs represents a Glusterfs volume that is attached to a host and exposed to the pod. Provisioned by an admin. More info: https://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md
-- | - `hostPath`: HostPath represents a directory on the host. Provisioned by a developer or tester. This is useful for single-node development and testing only! On-host storage is not supported in any way and WILL NOT WORK in a multi-node cluster. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
-- | - `iscsi`: ISCSI represents an ISCSI Disk resource that is attached to a kubelet's host machine and then exposed to the pod. Provisioned by an admin.
-- | - `local`: Local represents directly-attached storage with node affinity
-- | - `mountOptions`: A list of mount options, e.g. ["ro", "soft"]. Not validated - mount will simply fail if one is invalid. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#mount-options
-- | - `nfs`: NFS represents an NFS mount on the host. Provisioned by an admin. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
-- | - `persistentVolumeReclaimPolicy`: What happens to a persistent volume when released from its claim. Valid options are Retain (default) and Recycle. Recycling must be supported by the volume plugin underlying this persistent volume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming
-- | - `photonPersistentDisk`: PhotonPersistentDisk represents a PhotonController persistent disk attached and mounted on kubelets host machine
-- | - `portworxVolume`: PortworxVolume represents a portworx volume attached and mounted on kubelets host machine
-- | - `quobyte`: Quobyte represents a Quobyte mount on the host that shares a pod's lifetime
-- | - `rbd`: RBD represents a Rados Block Device mount on the host that shares a pod's lifetime. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md
-- | - `scaleIO`: ScaleIO represents a ScaleIO persistent volume attached and mounted on Kubernetes nodes.
-- | - `storageClassName`: Name of StorageClass to which this persistent volume belongs. Empty value means that this volume does not belong to any StorageClass.
-- | - `storageos`: StorageOS represents a StorageOS volume that is attached to the kubelet's host machine and mounted into the pod More info: https://releases.k8s.io/HEAD/examples/volumes/storageos/README.md
-- | - `volumeMode`: volumeMode defines if a volume is intended to be used with a formatted filesystem or to remain in raw block state. Value of Filesystem is implied when not included in spec. This is an alpha feature and may change in the future.
-- | - `vsphereVolume`: VsphereVolume represents a vSphere volume attached and mounted on kubelets host machine
newtype PersistentVolumeSpec = PersistentVolumeSpec
  { accessModes :: (NullOrUndefined (Array String))
  , awsElasticBlockStore :: (NullOrUndefined AWSElasticBlockStoreVolumeSource)
  , azureDisk :: (NullOrUndefined AzureDiskVolumeSource)
  , azureFile :: (NullOrUndefined AzureFilePersistentVolumeSource)
  , capacity :: (NullOrUndefined (StrMap Resource.Quantity))
  , cephfs :: (NullOrUndefined CephFSPersistentVolumeSource)
  , cinder :: (NullOrUndefined CinderVolumeSource)
  , claimRef :: (NullOrUndefined ObjectReference)
  , csi :: (NullOrUndefined CSIPersistentVolumeSource)
  , fc :: (NullOrUndefined FCVolumeSource)
  , flexVolume :: (NullOrUndefined FlexPersistentVolumeSource)
  , flocker :: (NullOrUndefined FlockerVolumeSource)
  , gcePersistentDisk :: (NullOrUndefined GCEPersistentDiskVolumeSource)
  , glusterfs :: (NullOrUndefined GlusterfsVolumeSource)
  , hostPath :: (NullOrUndefined HostPathVolumeSource)
  , iscsi :: (NullOrUndefined ISCSIPersistentVolumeSource)
  , local :: (NullOrUndefined LocalVolumeSource)
  , mountOptions :: (NullOrUndefined (Array String))
  , nfs :: (NullOrUndefined NFSVolumeSource)
  , persistentVolumeReclaimPolicy :: (NullOrUndefined String)
  , photonPersistentDisk :: (NullOrUndefined PhotonPersistentDiskVolumeSource)
  , portworxVolume :: (NullOrUndefined PortworxVolumeSource)
  , quobyte :: (NullOrUndefined QuobyteVolumeSource)
  , rbd :: (NullOrUndefined RBDPersistentVolumeSource)
  , scaleIO :: (NullOrUndefined ScaleIOPersistentVolumeSource)
  , storageClassName :: (NullOrUndefined String)
  , storageos :: (NullOrUndefined StorageOSPersistentVolumeSource)
  , volumeMode :: (NullOrUndefined String)
  , vsphereVolume :: (NullOrUndefined VsphereVirtualDiskVolumeSource) }

derive instance newtypePersistentVolumeSpec :: Newtype PersistentVolumeSpec _
derive instance genericPersistentVolumeSpec :: Generic PersistentVolumeSpec _
instance showPersistentVolumeSpec :: Show PersistentVolumeSpec where show a = genericShow a
instance decodePersistentVolumeSpec :: Decode PersistentVolumeSpec where
  decode a = do
               accessModes <- readProp "accessModes" a >>= decode
               awsElasticBlockStore <- readProp "awsElasticBlockStore" a >>= decode
               azureDisk <- readProp "azureDisk" a >>= decode
               azureFile <- readProp "azureFile" a >>= decode
               capacity <- readProp "capacity" a >>= decode
               cephfs <- readProp "cephfs" a >>= decode
               cinder <- readProp "cinder" a >>= decode
               claimRef <- readProp "claimRef" a >>= decode
               csi <- readProp "csi" a >>= decode
               fc <- readProp "fc" a >>= decode
               flexVolume <- readProp "flexVolume" a >>= decode
               flocker <- readProp "flocker" a >>= decode
               gcePersistentDisk <- readProp "gcePersistentDisk" a >>= decode
               glusterfs <- readProp "glusterfs" a >>= decode
               hostPath <- readProp "hostPath" a >>= decode
               iscsi <- readProp "iscsi" a >>= decode
               local <- readProp "local" a >>= decode
               mountOptions <- readProp "mountOptions" a >>= decode
               nfs <- readProp "nfs" a >>= decode
               persistentVolumeReclaimPolicy <- readProp "persistentVolumeReclaimPolicy" a >>= decode
               photonPersistentDisk <- readProp "photonPersistentDisk" a >>= decode
               portworxVolume <- readProp "portworxVolume" a >>= decode
               quobyte <- readProp "quobyte" a >>= decode
               rbd <- readProp "rbd" a >>= decode
               scaleIO <- readProp "scaleIO" a >>= decode
               storageClassName <- readProp "storageClassName" a >>= decode
               storageos <- readProp "storageos" a >>= decode
               volumeMode <- readProp "volumeMode" a >>= decode
               vsphereVolume <- readProp "vsphereVolume" a >>= decode
               pure $ PersistentVolumeSpec { accessModes, awsElasticBlockStore, azureDisk, azureFile, capacity, cephfs, cinder, claimRef, csi, fc, flexVolume, flocker, gcePersistentDisk, glusterfs, hostPath, iscsi, local, mountOptions, nfs, persistentVolumeReclaimPolicy, photonPersistentDisk, portworxVolume, quobyte, rbd, scaleIO, storageClassName, storageos, volumeMode, vsphereVolume }
instance encodePersistentVolumeSpec :: Encode PersistentVolumeSpec where
  encode (PersistentVolumeSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "accessModes" (encode a.accessModes)
               , Tuple "awsElasticBlockStore" (encode a.awsElasticBlockStore)
               , Tuple "azureDisk" (encode a.azureDisk)
               , Tuple "azureFile" (encode a.azureFile)
               , Tuple "capacity" (encode a.capacity)
               , Tuple "cephfs" (encode a.cephfs)
               , Tuple "cinder" (encode a.cinder)
               , Tuple "claimRef" (encode a.claimRef)
               , Tuple "csi" (encode a.csi)
               , Tuple "fc" (encode a.fc)
               , Tuple "flexVolume" (encode a.flexVolume)
               , Tuple "flocker" (encode a.flocker)
               , Tuple "gcePersistentDisk" (encode a.gcePersistentDisk)
               , Tuple "glusterfs" (encode a.glusterfs)
               , Tuple "hostPath" (encode a.hostPath)
               , Tuple "iscsi" (encode a.iscsi)
               , Tuple "local" (encode a.local)
               , Tuple "mountOptions" (encode a.mountOptions)
               , Tuple "nfs" (encode a.nfs)
               , Tuple "persistentVolumeReclaimPolicy" (encode a.persistentVolumeReclaimPolicy)
               , Tuple "photonPersistentDisk" (encode a.photonPersistentDisk)
               , Tuple "portworxVolume" (encode a.portworxVolume)
               , Tuple "quobyte" (encode a.quobyte)
               , Tuple "rbd" (encode a.rbd)
               , Tuple "scaleIO" (encode a.scaleIO)
               , Tuple "storageClassName" (encode a.storageClassName)
               , Tuple "storageos" (encode a.storageos)
               , Tuple "volumeMode" (encode a.volumeMode)
               , Tuple "vsphereVolume" (encode a.vsphereVolume) ]


instance defaultPersistentVolumeSpec :: Default PersistentVolumeSpec where
  default = PersistentVolumeSpec
    { accessModes: NullOrUndefined Nothing
    , awsElasticBlockStore: NullOrUndefined Nothing
    , azureDisk: NullOrUndefined Nothing
    , azureFile: NullOrUndefined Nothing
    , capacity: NullOrUndefined Nothing
    , cephfs: NullOrUndefined Nothing
    , cinder: NullOrUndefined Nothing
    , claimRef: NullOrUndefined Nothing
    , csi: NullOrUndefined Nothing
    , fc: NullOrUndefined Nothing
    , flexVolume: NullOrUndefined Nothing
    , flocker: NullOrUndefined Nothing
    , gcePersistentDisk: NullOrUndefined Nothing
    , glusterfs: NullOrUndefined Nothing
    , hostPath: NullOrUndefined Nothing
    , iscsi: NullOrUndefined Nothing
    , local: NullOrUndefined Nothing
    , mountOptions: NullOrUndefined Nothing
    , nfs: NullOrUndefined Nothing
    , persistentVolumeReclaimPolicy: NullOrUndefined Nothing
    , photonPersistentDisk: NullOrUndefined Nothing
    , portworxVolume: NullOrUndefined Nothing
    , quobyte: NullOrUndefined Nothing
    , rbd: NullOrUndefined Nothing
    , scaleIO: NullOrUndefined Nothing
    , storageClassName: NullOrUndefined Nothing
    , storageos: NullOrUndefined Nothing
    , volumeMode: NullOrUndefined Nothing
    , vsphereVolume: NullOrUndefined Nothing }

-- | PersistentVolumeStatus is the current status of a persistent volume.
-- |
-- | Fields:
-- | - `message`: A human-readable message indicating details about why the volume is in this state.
-- | - `phase`: Phase indicates if a volume is available, bound to a claim, or released by a claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#phase
-- | - `reason`: Reason is a brief CamelCase string that describes any failure and is meant for machine parsing and tidy display in the CLI.
newtype PersistentVolumeStatus = PersistentVolumeStatus
  { message :: (NullOrUndefined String)
  , phase :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String) }

derive instance newtypePersistentVolumeStatus :: Newtype PersistentVolumeStatus _
derive instance genericPersistentVolumeStatus :: Generic PersistentVolumeStatus _
instance showPersistentVolumeStatus :: Show PersistentVolumeStatus where show a = genericShow a
instance decodePersistentVolumeStatus :: Decode PersistentVolumeStatus where
  decode a = do
               message <- readProp "message" a >>= decode
               phase <- readProp "phase" a >>= decode
               reason <- readProp "reason" a >>= decode
               pure $ PersistentVolumeStatus { message, phase, reason }
instance encodePersistentVolumeStatus :: Encode PersistentVolumeStatus where
  encode (PersistentVolumeStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "message" (encode a.message)
               , Tuple "phase" (encode a.phase)
               , Tuple "reason" (encode a.reason) ]


instance defaultPersistentVolumeStatus :: Default PersistentVolumeStatus where
  default = PersistentVolumeStatus
    { message: NullOrUndefined Nothing
    , phase: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing }

-- | Represents a Photon Controller persistent disk resource.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `pdID`: ID that identifies Photon Controller persistent disk
newtype PhotonPersistentDiskVolumeSource = PhotonPersistentDiskVolumeSource
  { fsType :: (NullOrUndefined String)
  , pdID :: (NullOrUndefined String) }

derive instance newtypePhotonPersistentDiskVolumeSource :: Newtype PhotonPersistentDiskVolumeSource _
derive instance genericPhotonPersistentDiskVolumeSource :: Generic PhotonPersistentDiskVolumeSource _
instance showPhotonPersistentDiskVolumeSource :: Show PhotonPersistentDiskVolumeSource where show a = genericShow a
instance decodePhotonPersistentDiskVolumeSource :: Decode PhotonPersistentDiskVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               pdID <- readProp "pdID" a >>= decode
               pure $ PhotonPersistentDiskVolumeSource { fsType, pdID }
instance encodePhotonPersistentDiskVolumeSource :: Encode PhotonPersistentDiskVolumeSource where
  encode (PhotonPersistentDiskVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "pdID" (encode a.pdID) ]


instance defaultPhotonPersistentDiskVolumeSource :: Default PhotonPersistentDiskVolumeSource where
  default = PhotonPersistentDiskVolumeSource
    { fsType: NullOrUndefined Nothing
    , pdID: NullOrUndefined Nothing }

-- | Pod is a collection of containers that can run on a host. This resource is created by clients and scheduled onto hosts.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of the pod. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Most recently observed status of the pod. This data may not be up to date. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Pod = Pod
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodSpec)
  , status :: (NullOrUndefined PodStatus) }

derive instance newtypePod :: Newtype Pod _
derive instance genericPod :: Generic Pod _
instance showPod :: Show Pod where show a = genericShow a
instance decodePod :: Decode Pod where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ Pod { apiVersion, kind, metadata, spec, status }
instance encodePod :: Encode Pod where
  encode (Pod a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultPod :: Default Pod where
  default = Pod
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | Pod affinity is a group of inter pod affinity scheduling rules.
-- |
-- | Fields:
-- | - `preferredDuringSchedulingIgnoredDuringExecution`: The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
-- | - `requiredDuringSchedulingIgnoredDuringExecution`: If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
newtype PodAffinity = PodAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array WeightedPodAffinityTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array PodAffinityTerm)) }

derive instance newtypePodAffinity :: Newtype PodAffinity _
derive instance genericPodAffinity :: Generic PodAffinity _
instance showPodAffinity :: Show PodAffinity where show a = genericShow a
instance decodePodAffinity :: Decode PodAffinity where
  decode a = do
               preferredDuringSchedulingIgnoredDuringExecution <- readProp "preferredDuringSchedulingIgnoredDuringExecution" a >>= decode
               requiredDuringSchedulingIgnoredDuringExecution <- readProp "requiredDuringSchedulingIgnoredDuringExecution" a >>= decode
               pure $ PodAffinity { preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution }
instance encodePodAffinity :: Encode PodAffinity where
  encode (PodAffinity a) = encode $ StrMap.fromFoldable $
               [ Tuple "preferredDuringSchedulingIgnoredDuringExecution" (encode a.preferredDuringSchedulingIgnoredDuringExecution)
               , Tuple "requiredDuringSchedulingIgnoredDuringExecution" (encode a.requiredDuringSchedulingIgnoredDuringExecution) ]


instance defaultPodAffinity :: Default PodAffinity where
  default = PodAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing }

-- | Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running
-- |
-- | Fields:
-- | - `labelSelector`: A label query over a set of resources, in this case pods.
-- | - `namespaces`: namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means "this pod's namespace"
-- | - `topologyKey`: This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed.
newtype PodAffinityTerm = PodAffinityTerm
  { labelSelector :: (NullOrUndefined MetaV1.LabelSelector)
  , namespaces :: (NullOrUndefined (Array String))
  , topologyKey :: (NullOrUndefined String) }

derive instance newtypePodAffinityTerm :: Newtype PodAffinityTerm _
derive instance genericPodAffinityTerm :: Generic PodAffinityTerm _
instance showPodAffinityTerm :: Show PodAffinityTerm where show a = genericShow a
instance decodePodAffinityTerm :: Decode PodAffinityTerm where
  decode a = do
               labelSelector <- readProp "labelSelector" a >>= decode
               namespaces <- readProp "namespaces" a >>= decode
               topologyKey <- readProp "topologyKey" a >>= decode
               pure $ PodAffinityTerm { labelSelector, namespaces, topologyKey }
instance encodePodAffinityTerm :: Encode PodAffinityTerm where
  encode (PodAffinityTerm a) = encode $ StrMap.fromFoldable $
               [ Tuple "labelSelector" (encode a.labelSelector)
               , Tuple "namespaces" (encode a.namespaces)
               , Tuple "topologyKey" (encode a.topologyKey) ]


instance defaultPodAffinityTerm :: Default PodAffinityTerm where
  default = PodAffinityTerm
    { labelSelector: NullOrUndefined Nothing
    , namespaces: NullOrUndefined Nothing
    , topologyKey: NullOrUndefined Nothing }

-- | Pod anti affinity is a group of inter pod anti affinity scheduling rules.
-- |
-- | Fields:
-- | - `preferredDuringSchedulingIgnoredDuringExecution`: The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
-- | - `requiredDuringSchedulingIgnoredDuringExecution`: If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
newtype PodAntiAffinity = PodAntiAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array WeightedPodAffinityTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array PodAffinityTerm)) }

derive instance newtypePodAntiAffinity :: Newtype PodAntiAffinity _
derive instance genericPodAntiAffinity :: Generic PodAntiAffinity _
instance showPodAntiAffinity :: Show PodAntiAffinity where show a = genericShow a
instance decodePodAntiAffinity :: Decode PodAntiAffinity where
  decode a = do
               preferredDuringSchedulingIgnoredDuringExecution <- readProp "preferredDuringSchedulingIgnoredDuringExecution" a >>= decode
               requiredDuringSchedulingIgnoredDuringExecution <- readProp "requiredDuringSchedulingIgnoredDuringExecution" a >>= decode
               pure $ PodAntiAffinity { preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution }
instance encodePodAntiAffinity :: Encode PodAntiAffinity where
  encode (PodAntiAffinity a) = encode $ StrMap.fromFoldable $
               [ Tuple "preferredDuringSchedulingIgnoredDuringExecution" (encode a.preferredDuringSchedulingIgnoredDuringExecution)
               , Tuple "requiredDuringSchedulingIgnoredDuringExecution" (encode a.requiredDuringSchedulingIgnoredDuringExecution) ]


instance defaultPodAntiAffinity :: Default PodAntiAffinity where
  default = PodAntiAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing }

-- | PodCondition contains details for the current condition of this pod.
-- |
-- | Fields:
-- | - `lastProbeTime`: Last time we probed the condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: Human-readable message indicating details about last transition.
-- | - `reason`: Unique, one-word, CamelCase reason for the condition's last transition.
-- | - `status`: Status is the status of the condition. Can be True, False, Unknown. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
-- | - `_type`: Type is the type of the condition. Currently only Ready. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
newtype PodCondition = PodCondition
  { _type :: (NullOrUndefined String)
  , lastProbeTime :: (NullOrUndefined MetaV1.Time)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypePodCondition :: Newtype PodCondition _
derive instance genericPodCondition :: Generic PodCondition _
instance showPodCondition :: Show PodCondition where show a = genericShow a
instance decodePodCondition :: Decode PodCondition where
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastProbeTime <- readProp "lastProbeTime" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ PodCondition { _type, lastProbeTime, lastTransitionTime, message, reason, status }
instance encodePodCondition :: Encode PodCondition where
  encode (PodCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastProbeTime" (encode a.lastProbeTime)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


instance defaultPodCondition :: Default PodCondition where
  default = PodCondition
    { _type: NullOrUndefined Nothing
    , lastProbeTime: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | PodDNSConfig defines the DNS parameters of a pod in addition to those generated from DNSPolicy.
-- |
-- | Fields:
-- | - `nameservers`: A list of DNS name server IP addresses. This will be appended to the base nameservers generated from DNSPolicy. Duplicated nameservers will be removed.
-- | - `options`: A list of DNS resolver options. This will be merged with the base options generated from DNSPolicy. Duplicated entries will be removed. Resolution options given in Options will override those that appear in the base DNSPolicy.
-- | - `searches`: A list of DNS search domains for host-name lookup. This will be appended to the base search paths generated from DNSPolicy. Duplicated search paths will be removed.
newtype PodDNSConfig = PodDNSConfig
  { nameservers :: (NullOrUndefined (Array String))
  , options :: (NullOrUndefined (Array PodDNSConfigOption))
  , searches :: (NullOrUndefined (Array String)) }

derive instance newtypePodDNSConfig :: Newtype PodDNSConfig _
derive instance genericPodDNSConfig :: Generic PodDNSConfig _
instance showPodDNSConfig :: Show PodDNSConfig where show a = genericShow a
instance decodePodDNSConfig :: Decode PodDNSConfig where
  decode a = do
               nameservers <- readProp "nameservers" a >>= decode
               options <- readProp "options" a >>= decode
               searches <- readProp "searches" a >>= decode
               pure $ PodDNSConfig { nameservers, options, searches }
instance encodePodDNSConfig :: Encode PodDNSConfig where
  encode (PodDNSConfig a) = encode $ StrMap.fromFoldable $
               [ Tuple "nameservers" (encode a.nameservers)
               , Tuple "options" (encode a.options)
               , Tuple "searches" (encode a.searches) ]


instance defaultPodDNSConfig :: Default PodDNSConfig where
  default = PodDNSConfig
    { nameservers: NullOrUndefined Nothing
    , options: NullOrUndefined Nothing
    , searches: NullOrUndefined Nothing }

-- | PodDNSConfigOption defines DNS resolver options of a pod.
-- |
-- | Fields:
-- | - `name`: Required.
-- | - `value`
newtype PodDNSConfigOption = PodDNSConfigOption
  { name :: (NullOrUndefined String)
  , value :: (NullOrUndefined String) }

derive instance newtypePodDNSConfigOption :: Newtype PodDNSConfigOption _
derive instance genericPodDNSConfigOption :: Generic PodDNSConfigOption _
instance showPodDNSConfigOption :: Show PodDNSConfigOption where show a = genericShow a
instance decodePodDNSConfigOption :: Decode PodDNSConfigOption where
  decode a = do
               name <- readProp "name" a >>= decode
               value <- readProp "value" a >>= decode
               pure $ PodDNSConfigOption { name, value }
instance encodePodDNSConfigOption :: Encode PodDNSConfigOption where
  encode (PodDNSConfigOption a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "value" (encode a.value) ]


instance defaultPodDNSConfigOption :: Default PodDNSConfigOption where
  default = PodDNSConfigOption
    { name: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | PodList is a list of Pods.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of pods. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype PodList = PodList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Pod))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodList :: Newtype PodList _
derive instance genericPodList :: Generic PodList _
instance showPodList :: Show PodList where show a = genericShow a
instance decodePodList :: Decode PodList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ PodList { apiVersion, items, kind, metadata }
instance encodePodList :: Encode PodList where
  encode (PodList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultPodList :: Default PodList where
  default = PodList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PodSecurityContext holds pod-level security attributes and common container settings. Some fields are also present in container.securityContext.  Field values of container.securityContext take precedence over field values of PodSecurityContext.
-- |
-- | Fields:
-- | - `fsGroup`: A special supplemental group that applies to all containers in a pod. Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod:
-- |    
-- |    1. The owning GID will be the FSGroup 2. The setgid bit is set (new files created in the volume will be owned by FSGroup) 3. The permission bits are OR'd with rw-rw----
-- |    
-- |    If unset, the Kubelet will not modify the ownership and permissions of any volume.
-- | - `runAsNonRoot`: Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
-- | - `runAsUser`: The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container.
-- | - `seLinuxOptions`: The SELinux context to be applied to all containers. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container.
-- | - `supplementalGroups`: A list of groups applied to the first process run in each container, in addition to the container's primary GID.  If unspecified, no groups will be added to any container.
newtype PodSecurityContext = PodSecurityContext
  { fsGroup :: (NullOrUndefined Int)
  , runAsNonRoot :: (NullOrUndefined Boolean)
  , runAsUser :: (NullOrUndefined Int)
  , seLinuxOptions :: (NullOrUndefined SELinuxOptions)
  , supplementalGroups :: (NullOrUndefined (Array Int)) }

derive instance newtypePodSecurityContext :: Newtype PodSecurityContext _
derive instance genericPodSecurityContext :: Generic PodSecurityContext _
instance showPodSecurityContext :: Show PodSecurityContext where show a = genericShow a
instance decodePodSecurityContext :: Decode PodSecurityContext where
  decode a = do
               fsGroup <- readProp "fsGroup" a >>= decode
               runAsNonRoot <- readProp "runAsNonRoot" a >>= decode
               runAsUser <- readProp "runAsUser" a >>= decode
               seLinuxOptions <- readProp "seLinuxOptions" a >>= decode
               supplementalGroups <- readProp "supplementalGroups" a >>= decode
               pure $ PodSecurityContext { fsGroup, runAsNonRoot, runAsUser, seLinuxOptions, supplementalGroups }
instance encodePodSecurityContext :: Encode PodSecurityContext where
  encode (PodSecurityContext a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsGroup" (encode a.fsGroup)
               , Tuple "runAsNonRoot" (encode a.runAsNonRoot)
               , Tuple "runAsUser" (encode a.runAsUser)
               , Tuple "seLinuxOptions" (encode a.seLinuxOptions)
               , Tuple "supplementalGroups" (encode a.supplementalGroups) ]


instance defaultPodSecurityContext :: Default PodSecurityContext where
  default = PodSecurityContext
    { fsGroup: NullOrUndefined Nothing
    , runAsNonRoot: NullOrUndefined Nothing
    , runAsUser: NullOrUndefined Nothing
    , seLinuxOptions: NullOrUndefined Nothing
    , supplementalGroups: NullOrUndefined Nothing }

-- | PodSpec is a description of a pod.
-- |
-- | Fields:
-- | - `activeDeadlineSeconds`: Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer.
-- | - `affinity`: If specified, the pod's scheduling constraints
-- | - `automountServiceAccountToken`: AutomountServiceAccountToken indicates whether a service account token should be automatically mounted.
-- | - `containers`: List of containers belonging to the pod. Containers cannot currently be added or removed. There must be at least one container in a Pod. Cannot be updated.
-- | - `dnsConfig`: Specifies the DNS parameters of a pod. Parameters specified here will be merged to the generated DNS configuration based on DNSPolicy. This is an alpha feature introduced in v1.9 and CustomPodDNS feature gate must be enabled to use it.
-- | - `dnsPolicy`: Set DNS policy for the pod. Defaults to "ClusterFirst". Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'. Note that 'None' policy is an alpha feature introduced in v1.9 and CustomPodDNS feature gate must be enabled to use it.
-- | - `hostAliases`: HostAliases is an optional list of hosts and IPs that will be injected into the pod's hosts file if specified. This is only valid for non-hostNetwork pods.
-- | - `hostIPC`: Use the host's ipc namespace. Optional: Default to false.
-- | - `hostNetwork`: Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified. Default to false.
-- | - `hostPID`: Use the host's pid namespace. Optional: Default to false.
-- | - `hostname`: Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.
-- | - `imagePullSecrets`: ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images used by this PodSpec. If specified, these secrets will be passed to individual puller implementations for them to use. For example, in the case of docker, only DockerConfig type secrets are honored. More info: https://kubernetes.io/docs/concepts/containers/images#specifying-imagepullsecrets-on-a-pod
-- | - `initContainers`: List of initialization containers belonging to the pod. Init containers are executed in order prior to containers being started. If any init container fails, the pod is considered to have failed and is handled according to its restartPolicy. The name for an init container or normal container must be unique among all containers. Init containers may not have Lifecycle actions, Readiness probes, or Liveness probes. The resourceRequirements of an init container are taken into account during scheduling by finding the highest request/limit for each resource type, and then using the max of of that value or the sum of the normal containers. Limits are applied to init containers in a similar fashion. Init containers cannot currently be added or removed. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
-- | - `nodeName`: NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.
-- | - `nodeSelector`: NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
-- | - `priority`: The priority value. Various system components use this field to find the priority of the pod. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority.
-- | - `priorityClassName`: If specified, indicates the pod's priority. "SYSTEM" is a special keyword which indicates the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default.
-- | - `restartPolicy`: Restart policy for all containers within the pod. One of Always, OnFailure, Never. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy
-- | - `schedulerName`: If specified, the pod will be dispatched by specified scheduler. If not specified, the pod will be dispatched by default scheduler.
-- | - `securityContext`: SecurityContext holds pod-level security attributes and common container settings. Optional: Defaults to empty.  See type description for default values of each field.
-- | - `serviceAccount`: DeprecatedServiceAccount is a depreciated alias for ServiceAccountName. Deprecated: Use serviceAccountName instead.
-- | - `serviceAccountName`: ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
-- | - `subdomain`: If specified, the fully qualified Pod hostname will be "<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>". If not specified, the pod will not have a domainname at all.
-- | - `terminationGracePeriodSeconds`: Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. Defaults to 30 seconds.
-- | - `tolerations`: If specified, the pod's tolerations.
-- | - `volumes`: List of volumes that can be mounted by containers belonging to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes
newtype PodSpec = PodSpec
  { activeDeadlineSeconds :: (NullOrUndefined Int)
  , affinity :: (NullOrUndefined Affinity)
  , automountServiceAccountToken :: (NullOrUndefined Boolean)
  , containers :: (NullOrUndefined (Array Container))
  , dnsConfig :: (NullOrUndefined PodDNSConfig)
  , dnsPolicy :: (NullOrUndefined String)
  , hostAliases :: (NullOrUndefined (Array HostAlias))
  , hostIPC :: (NullOrUndefined Boolean)
  , hostNetwork :: (NullOrUndefined Boolean)
  , hostPID :: (NullOrUndefined Boolean)
  , hostname :: (NullOrUndefined String)
  , imagePullSecrets :: (NullOrUndefined (Array LocalObjectReference))
  , initContainers :: (NullOrUndefined (Array Container))
  , nodeName :: (NullOrUndefined String)
  , nodeSelector :: (NullOrUndefined (StrMap String))
  , priority :: (NullOrUndefined Int)
  , priorityClassName :: (NullOrUndefined String)
  , restartPolicy :: (NullOrUndefined String)
  , schedulerName :: (NullOrUndefined String)
  , securityContext :: (NullOrUndefined PodSecurityContext)
  , serviceAccount :: (NullOrUndefined String)
  , serviceAccountName :: (NullOrUndefined String)
  , subdomain :: (NullOrUndefined String)
  , terminationGracePeriodSeconds :: (NullOrUndefined Int)
  , tolerations :: (NullOrUndefined (Array Toleration))
  , volumes :: (NullOrUndefined (Array Volume)) }

derive instance newtypePodSpec :: Newtype PodSpec _
derive instance genericPodSpec :: Generic PodSpec _
instance showPodSpec :: Show PodSpec where show a = genericShow a
instance decodePodSpec :: Decode PodSpec where
  decode a = do
               activeDeadlineSeconds <- readProp "activeDeadlineSeconds" a >>= decode
               affinity <- readProp "affinity" a >>= decode
               automountServiceAccountToken <- readProp "automountServiceAccountToken" a >>= decode
               containers <- readProp "containers" a >>= decode
               dnsConfig <- readProp "dnsConfig" a >>= decode
               dnsPolicy <- readProp "dnsPolicy" a >>= decode
               hostAliases <- readProp "hostAliases" a >>= decode
               hostIPC <- readProp "hostIPC" a >>= decode
               hostNetwork <- readProp "hostNetwork" a >>= decode
               hostPID <- readProp "hostPID" a >>= decode
               hostname <- readProp "hostname" a >>= decode
               imagePullSecrets <- readProp "imagePullSecrets" a >>= decode
               initContainers <- readProp "initContainers" a >>= decode
               nodeName <- readProp "nodeName" a >>= decode
               nodeSelector <- readProp "nodeSelector" a >>= decode
               priority <- readProp "priority" a >>= decode
               priorityClassName <- readProp "priorityClassName" a >>= decode
               restartPolicy <- readProp "restartPolicy" a >>= decode
               schedulerName <- readProp "schedulerName" a >>= decode
               securityContext <- readProp "securityContext" a >>= decode
               serviceAccount <- readProp "serviceAccount" a >>= decode
               serviceAccountName <- readProp "serviceAccountName" a >>= decode
               subdomain <- readProp "subdomain" a >>= decode
               terminationGracePeriodSeconds <- readProp "terminationGracePeriodSeconds" a >>= decode
               tolerations <- readProp "tolerations" a >>= decode
               volumes <- readProp "volumes" a >>= decode
               pure $ PodSpec { activeDeadlineSeconds, affinity, automountServiceAccountToken, containers, dnsConfig, dnsPolicy, hostAliases, hostIPC, hostNetwork, hostPID, hostname, imagePullSecrets, initContainers, nodeName, nodeSelector, priority, priorityClassName, restartPolicy, schedulerName, securityContext, serviceAccount, serviceAccountName, subdomain, terminationGracePeriodSeconds, tolerations, volumes }
instance encodePodSpec :: Encode PodSpec where
  encode (PodSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "activeDeadlineSeconds" (encode a.activeDeadlineSeconds)
               , Tuple "affinity" (encode a.affinity)
               , Tuple "automountServiceAccountToken" (encode a.automountServiceAccountToken)
               , Tuple "containers" (encode a.containers)
               , Tuple "dnsConfig" (encode a.dnsConfig)
               , Tuple "dnsPolicy" (encode a.dnsPolicy)
               , Tuple "hostAliases" (encode a.hostAliases)
               , Tuple "hostIPC" (encode a.hostIPC)
               , Tuple "hostNetwork" (encode a.hostNetwork)
               , Tuple "hostPID" (encode a.hostPID)
               , Tuple "hostname" (encode a.hostname)
               , Tuple "imagePullSecrets" (encode a.imagePullSecrets)
               , Tuple "initContainers" (encode a.initContainers)
               , Tuple "nodeName" (encode a.nodeName)
               , Tuple "nodeSelector" (encode a.nodeSelector)
               , Tuple "priority" (encode a.priority)
               , Tuple "priorityClassName" (encode a.priorityClassName)
               , Tuple "restartPolicy" (encode a.restartPolicy)
               , Tuple "schedulerName" (encode a.schedulerName)
               , Tuple "securityContext" (encode a.securityContext)
               , Tuple "serviceAccount" (encode a.serviceAccount)
               , Tuple "serviceAccountName" (encode a.serviceAccountName)
               , Tuple "subdomain" (encode a.subdomain)
               , Tuple "terminationGracePeriodSeconds" (encode a.terminationGracePeriodSeconds)
               , Tuple "tolerations" (encode a.tolerations)
               , Tuple "volumes" (encode a.volumes) ]


instance defaultPodSpec :: Default PodSpec where
  default = PodSpec
    { activeDeadlineSeconds: NullOrUndefined Nothing
    , affinity: NullOrUndefined Nothing
    , automountServiceAccountToken: NullOrUndefined Nothing
    , containers: NullOrUndefined Nothing
    , dnsConfig: NullOrUndefined Nothing
    , dnsPolicy: NullOrUndefined Nothing
    , hostAliases: NullOrUndefined Nothing
    , hostIPC: NullOrUndefined Nothing
    , hostNetwork: NullOrUndefined Nothing
    , hostPID: NullOrUndefined Nothing
    , hostname: NullOrUndefined Nothing
    , imagePullSecrets: NullOrUndefined Nothing
    , initContainers: NullOrUndefined Nothing
    , nodeName: NullOrUndefined Nothing
    , nodeSelector: NullOrUndefined Nothing
    , priority: NullOrUndefined Nothing
    , priorityClassName: NullOrUndefined Nothing
    , restartPolicy: NullOrUndefined Nothing
    , schedulerName: NullOrUndefined Nothing
    , securityContext: NullOrUndefined Nothing
    , serviceAccount: NullOrUndefined Nothing
    , serviceAccountName: NullOrUndefined Nothing
    , subdomain: NullOrUndefined Nothing
    , terminationGracePeriodSeconds: NullOrUndefined Nothing
    , tolerations: NullOrUndefined Nothing
    , volumes: NullOrUndefined Nothing }

-- | PodStatus represents information about the status of a pod. Status may trail the actual state of a system.
-- |
-- | Fields:
-- | - `conditions`: Current service state of pod. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
-- | - `containerStatuses`: The list has one entry per container in the manifest. Each entry is currently the output of `docker inspect`. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status
-- | - `hostIP`: IP address of the host to which the pod is assigned. Empty if not yet scheduled.
-- | - `initContainerStatuses`: The list has one entry per init container in the manifest. The most recent successful init container will have ready = true, the most recently started container will have startTime set. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status
-- | - `message`: A human readable message indicating details about why the pod is in this condition.
-- | - `phase`: Current condition of the pod. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-phase
-- | - `podIP`: IP address allocated to the pod. Routable at least within the cluster. Empty if not yet allocated.
-- | - `qosClass`: The Quality of Service (QOS) classification assigned to the pod based on resource requirements See PodQOSClass type for available QOS classes More info: https://github.com/kubernetes/kubernetes/blob/master/docs/design/resource-qos.md
-- | - `reason`: A brief CamelCase message indicating details about why the pod is in this state. e.g. 'Evicted'
-- | - `startTime`: RFC 3339 date and time at which the object was acknowledged by the Kubelet. This is before the Kubelet pulled the container image(s) for the pod.
newtype PodStatus = PodStatus
  { conditions :: (NullOrUndefined (Array PodCondition))
  , containerStatuses :: (NullOrUndefined (Array ContainerStatus))
  , hostIP :: (NullOrUndefined String)
  , initContainerStatuses :: (NullOrUndefined (Array ContainerStatus))
  , message :: (NullOrUndefined String)
  , phase :: (NullOrUndefined String)
  , podIP :: (NullOrUndefined String)
  , qosClass :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , startTime :: (NullOrUndefined MetaV1.Time) }

derive instance newtypePodStatus :: Newtype PodStatus _
derive instance genericPodStatus :: Generic PodStatus _
instance showPodStatus :: Show PodStatus where show a = genericShow a
instance decodePodStatus :: Decode PodStatus where
  decode a = do
               conditions <- readProp "conditions" a >>= decode
               containerStatuses <- readProp "containerStatuses" a >>= decode
               hostIP <- readProp "hostIP" a >>= decode
               initContainerStatuses <- readProp "initContainerStatuses" a >>= decode
               message <- readProp "message" a >>= decode
               phase <- readProp "phase" a >>= decode
               podIP <- readProp "podIP" a >>= decode
               qosClass <- readProp "qosClass" a >>= decode
               reason <- readProp "reason" a >>= decode
               startTime <- readProp "startTime" a >>= decode
               pure $ PodStatus { conditions, containerStatuses, hostIP, initContainerStatuses, message, phase, podIP, qosClass, reason, startTime }
instance encodePodStatus :: Encode PodStatus where
  encode (PodStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "conditions" (encode a.conditions)
               , Tuple "containerStatuses" (encode a.containerStatuses)
               , Tuple "hostIP" (encode a.hostIP)
               , Tuple "initContainerStatuses" (encode a.initContainerStatuses)
               , Tuple "message" (encode a.message)
               , Tuple "phase" (encode a.phase)
               , Tuple "podIP" (encode a.podIP)
               , Tuple "qosClass" (encode a.qosClass)
               , Tuple "reason" (encode a.reason)
               , Tuple "startTime" (encode a.startTime) ]


instance defaultPodStatus :: Default PodStatus where
  default = PodStatus
    { conditions: NullOrUndefined Nothing
    , containerStatuses: NullOrUndefined Nothing
    , hostIP: NullOrUndefined Nothing
    , initContainerStatuses: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , phase: NullOrUndefined Nothing
    , podIP: NullOrUndefined Nothing
    , qosClass: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , startTime: NullOrUndefined Nothing }

-- | PodTemplate describes a template for creating copies of a predefined pod.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `template`: Template defines the pods that will be created from this pod template. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype PodTemplate = PodTemplate
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , template :: (NullOrUndefined PodTemplateSpec) }

derive instance newtypePodTemplate :: Newtype PodTemplate _
derive instance genericPodTemplate :: Generic PodTemplate _
instance showPodTemplate :: Show PodTemplate where show a = genericShow a
instance decodePodTemplate :: Decode PodTemplate where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               template <- readProp "template" a >>= decode
               pure $ PodTemplate { apiVersion, kind, metadata, template }
instance encodePodTemplate :: Encode PodTemplate where
  encode (PodTemplate a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "template" (encode a.template) ]


instance defaultPodTemplate :: Default PodTemplate where
  default = PodTemplate
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | PodTemplateList is a list of PodTemplates.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of pod templates
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype PodTemplateList = PodTemplateList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PodTemplate))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodTemplateList :: Newtype PodTemplateList _
derive instance genericPodTemplateList :: Generic PodTemplateList _
instance showPodTemplateList :: Show PodTemplateList where show a = genericShow a
instance decodePodTemplateList :: Decode PodTemplateList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ PodTemplateList { apiVersion, items, kind, metadata }
instance encodePodTemplateList :: Encode PodTemplateList where
  encode (PodTemplateList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultPodTemplateList :: Default PodTemplateList where
  default = PodTemplateList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PodTemplateSpec describes the data a pod should have when created from a template
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of the pod. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype PodTemplateSpec = PodTemplateSpec
  { metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodSpec) }

derive instance newtypePodTemplateSpec :: Newtype PodTemplateSpec _
derive instance genericPodTemplateSpec :: Generic PodTemplateSpec _
instance showPodTemplateSpec :: Show PodTemplateSpec where show a = genericShow a
instance decodePodTemplateSpec :: Decode PodTemplateSpec where
  decode a = do
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               pure $ PodTemplateSpec { metadata, spec }
instance encodePodTemplateSpec :: Encode PodTemplateSpec where
  encode (PodTemplateSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec) ]


instance defaultPodTemplateSpec :: Default PodTemplateSpec where
  default = PodTemplateSpec
    { metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | PortworxVolumeSource represents a Portworx volume resource.
-- |
-- | Fields:
-- | - `fsType`: FSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `volumeID`: VolumeID uniquely identifies a Portworx volume
newtype PortworxVolumeSource = PortworxVolumeSource
  { fsType :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , volumeID :: (NullOrUndefined String) }

derive instance newtypePortworxVolumeSource :: Newtype PortworxVolumeSource _
derive instance genericPortworxVolumeSource :: Generic PortworxVolumeSource _
instance showPortworxVolumeSource :: Show PortworxVolumeSource where show a = genericShow a
instance decodePortworxVolumeSource :: Decode PortworxVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               volumeID <- readProp "volumeID" a >>= decode
               pure $ PortworxVolumeSource { fsType, readOnly, volumeID }
instance encodePortworxVolumeSource :: Encode PortworxVolumeSource where
  encode (PortworxVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "volumeID" (encode a.volumeID) ]


instance defaultPortworxVolumeSource :: Default PortworxVolumeSource where
  default = PortworxVolumeSource
    { fsType: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , volumeID: NullOrUndefined Nothing }

-- | An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op).
-- |
-- | Fields:
-- | - `preference`: A node selector term, associated with the corresponding weight.
-- | - `weight`: Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100.
newtype PreferredSchedulingTerm = PreferredSchedulingTerm
  { preference :: (NullOrUndefined NodeSelectorTerm)
  , weight :: (NullOrUndefined Int) }

derive instance newtypePreferredSchedulingTerm :: Newtype PreferredSchedulingTerm _
derive instance genericPreferredSchedulingTerm :: Generic PreferredSchedulingTerm _
instance showPreferredSchedulingTerm :: Show PreferredSchedulingTerm where show a = genericShow a
instance decodePreferredSchedulingTerm :: Decode PreferredSchedulingTerm where
  decode a = do
               preference <- readProp "preference" a >>= decode
               weight <- readProp "weight" a >>= decode
               pure $ PreferredSchedulingTerm { preference, weight }
instance encodePreferredSchedulingTerm :: Encode PreferredSchedulingTerm where
  encode (PreferredSchedulingTerm a) = encode $ StrMap.fromFoldable $
               [ Tuple "preference" (encode a.preference)
               , Tuple "weight" (encode a.weight) ]


instance defaultPreferredSchedulingTerm :: Default PreferredSchedulingTerm where
  default = PreferredSchedulingTerm
    { preference: NullOrUndefined Nothing
    , weight: NullOrUndefined Nothing }

-- | Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.
-- |
-- | Fields:
-- | - `exec`: One and only one of the following should be specified. Exec specifies the action to take.
-- | - `failureThreshold`: Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.
-- | - `httpGet`: HTTPGet specifies the http request to perform.
-- | - `initialDelaySeconds`: Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
-- | - `periodSeconds`: How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
-- | - `successThreshold`: Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness. Minimum value is 1.
-- | - `tcpSocket`: TCPSocket specifies an action involving a TCP port. TCP hooks not yet supported
-- | - `timeoutSeconds`: Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
newtype Probe = Probe
  { exec :: (NullOrUndefined ExecAction)
  , failureThreshold :: (NullOrUndefined Int)
  , httpGet :: (NullOrUndefined HTTPGetAction)
  , initialDelaySeconds :: (NullOrUndefined Int)
  , periodSeconds :: (NullOrUndefined Int)
  , successThreshold :: (NullOrUndefined Int)
  , tcpSocket :: (NullOrUndefined TCPSocketAction)
  , timeoutSeconds :: (NullOrUndefined Int) }

derive instance newtypeProbe :: Newtype Probe _
derive instance genericProbe :: Generic Probe _
instance showProbe :: Show Probe where show a = genericShow a
instance decodeProbe :: Decode Probe where
  decode a = do
               exec <- readProp "exec" a >>= decode
               failureThreshold <- readProp "failureThreshold" a >>= decode
               httpGet <- readProp "httpGet" a >>= decode
               initialDelaySeconds <- readProp "initialDelaySeconds" a >>= decode
               periodSeconds <- readProp "periodSeconds" a >>= decode
               successThreshold <- readProp "successThreshold" a >>= decode
               tcpSocket <- readProp "tcpSocket" a >>= decode
               timeoutSeconds <- readProp "timeoutSeconds" a >>= decode
               pure $ Probe { exec, failureThreshold, httpGet, initialDelaySeconds, periodSeconds, successThreshold, tcpSocket, timeoutSeconds }
instance encodeProbe :: Encode Probe where
  encode (Probe a) = encode $ StrMap.fromFoldable $
               [ Tuple "exec" (encode a.exec)
               , Tuple "failureThreshold" (encode a.failureThreshold)
               , Tuple "httpGet" (encode a.httpGet)
               , Tuple "initialDelaySeconds" (encode a.initialDelaySeconds)
               , Tuple "periodSeconds" (encode a.periodSeconds)
               , Tuple "successThreshold" (encode a.successThreshold)
               , Tuple "tcpSocket" (encode a.tcpSocket)
               , Tuple "timeoutSeconds" (encode a.timeoutSeconds) ]


instance defaultProbe :: Default Probe where
  default = Probe
    { exec: NullOrUndefined Nothing
    , failureThreshold: NullOrUndefined Nothing
    , httpGet: NullOrUndefined Nothing
    , initialDelaySeconds: NullOrUndefined Nothing
    , periodSeconds: NullOrUndefined Nothing
    , successThreshold: NullOrUndefined Nothing
    , tcpSocket: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing }

-- | Represents a projected volume source
-- |
-- | Fields:
-- | - `defaultMode`: Mode bits to use on created files by default. Must be a value between 0 and 0777. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `sources`: list of volume projections
newtype ProjectedVolumeSource = ProjectedVolumeSource
  { defaultMode :: (NullOrUndefined Int)
  , sources :: (NullOrUndefined (Array VolumeProjection)) }

derive instance newtypeProjectedVolumeSource :: Newtype ProjectedVolumeSource _
derive instance genericProjectedVolumeSource :: Generic ProjectedVolumeSource _
instance showProjectedVolumeSource :: Show ProjectedVolumeSource where show a = genericShow a
instance decodeProjectedVolumeSource :: Decode ProjectedVolumeSource where
  decode a = do
               defaultMode <- readProp "defaultMode" a >>= decode
               sources <- readProp "sources" a >>= decode
               pure $ ProjectedVolumeSource { defaultMode, sources }
instance encodeProjectedVolumeSource :: Encode ProjectedVolumeSource where
  encode (ProjectedVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "defaultMode" (encode a.defaultMode)
               , Tuple "sources" (encode a.sources) ]


instance defaultProjectedVolumeSource :: Default ProjectedVolumeSource where
  default = ProjectedVolumeSource
    { defaultMode: NullOrUndefined Nothing
    , sources: NullOrUndefined Nothing }

-- | Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `group`: Group to map volume access to Default is no group
-- | - `readOnly`: ReadOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false.
-- | - `registry`: Registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes
-- | - `user`: User to map volume access to Defaults to serivceaccount user
-- | - `volume`: Volume is a string that references an already created Quobyte volume by name.
newtype QuobyteVolumeSource = QuobyteVolumeSource
  { group :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , registry :: (NullOrUndefined String)
  , user :: (NullOrUndefined String)
  , volume :: (NullOrUndefined String) }

derive instance newtypeQuobyteVolumeSource :: Newtype QuobyteVolumeSource _
derive instance genericQuobyteVolumeSource :: Generic QuobyteVolumeSource _
instance showQuobyteVolumeSource :: Show QuobyteVolumeSource where show a = genericShow a
instance decodeQuobyteVolumeSource :: Decode QuobyteVolumeSource where
  decode a = do
               group <- readProp "group" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               registry <- readProp "registry" a >>= decode
               user <- readProp "user" a >>= decode
               volume <- readProp "volume" a >>= decode
               pure $ QuobyteVolumeSource { group, readOnly, registry, user, volume }
instance encodeQuobyteVolumeSource :: Encode QuobyteVolumeSource where
  encode (QuobyteVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "group" (encode a.group)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "registry" (encode a.registry)
               , Tuple "user" (encode a.user)
               , Tuple "volume" (encode a.volume) ]


instance defaultQuobyteVolumeSource :: Default QuobyteVolumeSource where
  default = QuobyteVolumeSource
    { group: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , registry: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing
    , volume: NullOrUndefined Nothing }

-- | Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#rbd
-- | - `image`: The rados image name. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `keyring`: Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `monitors`: A collection of Ceph monitors. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `pool`: The rados pool name. Default is rbd. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `readOnly`: ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `secretRef`: SecretRef is name of the authentication secret for RBDUser. If provided overrides keyring. Default is nil. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `user`: The rados user name. Default is admin. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
newtype RBDPersistentVolumeSource = RBDPersistentVolumeSource
  { fsType :: (NullOrUndefined String)
  , image :: (NullOrUndefined String)
  , keyring :: (NullOrUndefined String)
  , monitors :: (NullOrUndefined (Array String))
  , pool :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined SecretReference)
  , user :: (NullOrUndefined String) }

derive instance newtypeRBDPersistentVolumeSource :: Newtype RBDPersistentVolumeSource _
derive instance genericRBDPersistentVolumeSource :: Generic RBDPersistentVolumeSource _
instance showRBDPersistentVolumeSource :: Show RBDPersistentVolumeSource where show a = genericShow a
instance decodeRBDPersistentVolumeSource :: Decode RBDPersistentVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               image <- readProp "image" a >>= decode
               keyring <- readProp "keyring" a >>= decode
               monitors <- readProp "monitors" a >>= decode
               pool <- readProp "pool" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               user <- readProp "user" a >>= decode
               pure $ RBDPersistentVolumeSource { fsType, image, keyring, monitors, pool, readOnly, secretRef, user }
instance encodeRBDPersistentVolumeSource :: Encode RBDPersistentVolumeSource where
  encode (RBDPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "image" (encode a.image)
               , Tuple "keyring" (encode a.keyring)
               , Tuple "monitors" (encode a.monitors)
               , Tuple "pool" (encode a.pool)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "user" (encode a.user) ]


instance defaultRBDPersistentVolumeSource :: Default RBDPersistentVolumeSource where
  default = RBDPersistentVolumeSource
    { fsType: NullOrUndefined Nothing
    , image: NullOrUndefined Nothing
    , keyring: NullOrUndefined Nothing
    , monitors: NullOrUndefined Nothing
    , pool: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#rbd
-- | - `image`: The rados image name. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `keyring`: Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `monitors`: A collection of Ceph monitors. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `pool`: The rados pool name. Default is rbd. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `readOnly`: ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `secretRef`: SecretRef is name of the authentication secret for RBDUser. If provided overrides keyring. Default is nil. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
-- | - `user`: The rados user name. Default is admin. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it
newtype RBDVolumeSource = RBDVolumeSource
  { fsType :: (NullOrUndefined String)
  , image :: (NullOrUndefined String)
  , keyring :: (NullOrUndefined String)
  , monitors :: (NullOrUndefined (Array String))
  , pool :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined LocalObjectReference)
  , user :: (NullOrUndefined String) }

derive instance newtypeRBDVolumeSource :: Newtype RBDVolumeSource _
derive instance genericRBDVolumeSource :: Generic RBDVolumeSource _
instance showRBDVolumeSource :: Show RBDVolumeSource where show a = genericShow a
instance decodeRBDVolumeSource :: Decode RBDVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               image <- readProp "image" a >>= decode
               keyring <- readProp "keyring" a >>= decode
               monitors <- readProp "monitors" a >>= decode
               pool <- readProp "pool" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               user <- readProp "user" a >>= decode
               pure $ RBDVolumeSource { fsType, image, keyring, monitors, pool, readOnly, secretRef, user }
instance encodeRBDVolumeSource :: Encode RBDVolumeSource where
  encode (RBDVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "image" (encode a.image)
               , Tuple "keyring" (encode a.keyring)
               , Tuple "monitors" (encode a.monitors)
               , Tuple "pool" (encode a.pool)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "user" (encode a.user) ]


instance defaultRBDVolumeSource :: Default RBDVolumeSource where
  default = RBDVolumeSource
    { fsType: NullOrUndefined Nothing
    , image: NullOrUndefined Nothing
    , keyring: NullOrUndefined Nothing
    , monitors: NullOrUndefined Nothing
    , pool: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | ReplicationController represents the configuration of a replication controller.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: If the Labels of a ReplicationController are empty, they are defaulted to be the same as the Pod(s) that the replication controller manages. Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the specification of the desired behavior of the replication controller. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status is the most recently observed status of the replication controller. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype ReplicationController = ReplicationController
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined ReplicationControllerSpec)
  , status :: (NullOrUndefined ReplicationControllerStatus) }

derive instance newtypeReplicationController :: Newtype ReplicationController _
derive instance genericReplicationController :: Generic ReplicationController _
instance showReplicationController :: Show ReplicationController where show a = genericShow a
instance decodeReplicationController :: Decode ReplicationController where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ ReplicationController { apiVersion, kind, metadata, spec, status }
instance encodeReplicationController :: Encode ReplicationController where
  encode (ReplicationController a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultReplicationController :: Default ReplicationController where
  default = ReplicationController
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | ReplicationControllerCondition describes the state of a replication controller at a certain point.
-- |
-- | Fields:
-- | - `lastTransitionTime`: The last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
-- | - `_type`: Type of replication controller condition.
newtype ReplicationControllerCondition = ReplicationControllerCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeReplicationControllerCondition :: Newtype ReplicationControllerCondition _
derive instance genericReplicationControllerCondition :: Generic ReplicationControllerCondition _
instance showReplicationControllerCondition :: Show ReplicationControllerCondition where show a = genericShow a
instance decodeReplicationControllerCondition :: Decode ReplicationControllerCondition where
  decode a = do
               _type <- readProp "_type" a >>= decode
               lastTransitionTime <- readProp "lastTransitionTime" a >>= decode
               message <- readProp "message" a >>= decode
               reason <- readProp "reason" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ ReplicationControllerCondition { _type, lastTransitionTime, message, reason, status }
instance encodeReplicationControllerCondition :: Encode ReplicationControllerCondition where
  encode (ReplicationControllerCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "lastTransitionTime" (encode a.lastTransitionTime)
               , Tuple "message" (encode a.message)
               , Tuple "reason" (encode a.reason)
               , Tuple "status" (encode a.status) ]


instance defaultReplicationControllerCondition :: Default ReplicationControllerCondition where
  default = ReplicationControllerCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | ReplicationControllerList is a collection of replication controllers.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of replication controllers. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ReplicationControllerList = ReplicationControllerList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ReplicationController))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeReplicationControllerList :: Newtype ReplicationControllerList _
derive instance genericReplicationControllerList :: Generic ReplicationControllerList _
instance showReplicationControllerList :: Show ReplicationControllerList where show a = genericShow a
instance decodeReplicationControllerList :: Decode ReplicationControllerList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ReplicationControllerList { apiVersion, items, kind, metadata }
instance encodeReplicationControllerList :: Encode ReplicationControllerList where
  encode (ReplicationControllerList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultReplicationControllerList :: Default ReplicationControllerList where
  default = ReplicationControllerList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | ReplicationControllerSpec is the specification of a replication controller.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `replicas`: Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller
-- | - `selector`: Selector is a label query over pods that should match the Replicas count. If Selector is empty, it is defaulted to the labels present on the Pod template. Label keys and values that must match in order to be controlled by this replication controller, if empty defaulted to labels on Pod template. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: Template is the object that describes the pod that will be created if insufficient replicas are detected. This takes precedence over a TemplateRef. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
newtype ReplicationControllerSpec = ReplicationControllerSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined (StrMap String))
  , template :: (NullOrUndefined PodTemplateSpec) }

derive instance newtypeReplicationControllerSpec :: Newtype ReplicationControllerSpec _
derive instance genericReplicationControllerSpec :: Generic ReplicationControllerSpec _
instance showReplicationControllerSpec :: Show ReplicationControllerSpec where show a = genericShow a
instance decodeReplicationControllerSpec :: Decode ReplicationControllerSpec where
  decode a = do
               minReadySeconds <- readProp "minReadySeconds" a >>= decode
               replicas <- readProp "replicas" a >>= decode
               selector <- readProp "selector" a >>= decode
               template <- readProp "template" a >>= decode
               pure $ ReplicationControllerSpec { minReadySeconds, replicas, selector, template }
instance encodeReplicationControllerSpec :: Encode ReplicationControllerSpec where
  encode (ReplicationControllerSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encode a.minReadySeconds)
               , Tuple "replicas" (encode a.replicas)
               , Tuple "selector" (encode a.selector)
               , Tuple "template" (encode a.template) ]


instance defaultReplicationControllerSpec :: Default ReplicationControllerSpec where
  default = ReplicationControllerSpec
    { minReadySeconds: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | ReplicationControllerStatus represents the current status of a replication controller.
-- |
-- | Fields:
-- | - `availableReplicas`: The number of available replicas (ready for at least minReadySeconds) for this replication controller.
-- | - `conditions`: Represents the latest available observations of a replication controller's current state.
-- | - `fullyLabeledReplicas`: The number of pods that have labels matching the labels of the pod template of the replication controller.
-- | - `observedGeneration`: ObservedGeneration reflects the generation of the most recently observed replication controller.
-- | - `readyReplicas`: The number of ready replicas for this replication controller.
-- | - `replicas`: Replicas is the most recently oberved number of replicas. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller
newtype ReplicationControllerStatus = ReplicationControllerStatus
  { availableReplicas :: (NullOrUndefined Int)
  , conditions :: (NullOrUndefined (Array ReplicationControllerCondition))
  , fullyLabeledReplicas :: (NullOrUndefined Int)
  , observedGeneration :: (NullOrUndefined Int)
  , readyReplicas :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int) }

derive instance newtypeReplicationControllerStatus :: Newtype ReplicationControllerStatus _
derive instance genericReplicationControllerStatus :: Generic ReplicationControllerStatus _
instance showReplicationControllerStatus :: Show ReplicationControllerStatus where show a = genericShow a
instance decodeReplicationControllerStatus :: Decode ReplicationControllerStatus where
  decode a = do
               availableReplicas <- readProp "availableReplicas" a >>= decode
               conditions <- readProp "conditions" a >>= decode
               fullyLabeledReplicas <- readProp "fullyLabeledReplicas" a >>= decode
               observedGeneration <- readProp "observedGeneration" a >>= decode
               readyReplicas <- readProp "readyReplicas" a >>= decode
               replicas <- readProp "replicas" a >>= decode
               pure $ ReplicationControllerStatus { availableReplicas, conditions, fullyLabeledReplicas, observedGeneration, readyReplicas, replicas }
instance encodeReplicationControllerStatus :: Encode ReplicationControllerStatus where
  encode (ReplicationControllerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "availableReplicas" (encode a.availableReplicas)
               , Tuple "conditions" (encode a.conditions)
               , Tuple "fullyLabeledReplicas" (encode a.fullyLabeledReplicas)
               , Tuple "observedGeneration" (encode a.observedGeneration)
               , Tuple "readyReplicas" (encode a.readyReplicas)
               , Tuple "replicas" (encode a.replicas) ]


instance defaultReplicationControllerStatus :: Default ReplicationControllerStatus where
  default = ReplicationControllerStatus
    { availableReplicas: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , fullyLabeledReplicas: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , readyReplicas: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing }

-- | ResourceFieldSelector represents container resources (cpu, memory) and their output format
-- |
-- | Fields:
-- | - `containerName`: Container name: required for volumes, optional for env vars
-- | - `divisor`: Specifies the output format of the exposed resources, defaults to "1"
-- | - `resource`: Required: resource to select
newtype ResourceFieldSelector = ResourceFieldSelector
  { containerName :: (NullOrUndefined String)
  , divisor :: (NullOrUndefined Resource.Quantity)
  , resource :: (NullOrUndefined String) }

derive instance newtypeResourceFieldSelector :: Newtype ResourceFieldSelector _
derive instance genericResourceFieldSelector :: Generic ResourceFieldSelector _
instance showResourceFieldSelector :: Show ResourceFieldSelector where show a = genericShow a
instance decodeResourceFieldSelector :: Decode ResourceFieldSelector where
  decode a = do
               containerName <- readProp "containerName" a >>= decode
               divisor <- readProp "divisor" a >>= decode
               resource <- readProp "resource" a >>= decode
               pure $ ResourceFieldSelector { containerName, divisor, resource }
instance encodeResourceFieldSelector :: Encode ResourceFieldSelector where
  encode (ResourceFieldSelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "containerName" (encode a.containerName)
               , Tuple "divisor" (encode a.divisor)
               , Tuple "resource" (encode a.resource) ]


instance defaultResourceFieldSelector :: Default ResourceFieldSelector where
  default = ResourceFieldSelector
    { containerName: NullOrUndefined Nothing
    , divisor: NullOrUndefined Nothing
    , resource: NullOrUndefined Nothing }

-- | ResourceQuota sets aggregate quota restrictions enforced per namespace
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the desired quota. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status defines the actual enforced quota and its current usage. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype ResourceQuota = ResourceQuota
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined ResourceQuotaSpec)
  , status :: (NullOrUndefined ResourceQuotaStatus) }

derive instance newtypeResourceQuota :: Newtype ResourceQuota _
derive instance genericResourceQuota :: Generic ResourceQuota _
instance showResourceQuota :: Show ResourceQuota where show a = genericShow a
instance decodeResourceQuota :: Decode ResourceQuota where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ ResourceQuota { apiVersion, kind, metadata, spec, status }
instance encodeResourceQuota :: Encode ResourceQuota where
  encode (ResourceQuota a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultResourceQuota :: Default ResourceQuota where
  default = ResourceQuota
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | ResourceQuotaList is a list of ResourceQuota items.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of ResourceQuota objects. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ResourceQuotaList = ResourceQuotaList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ResourceQuota))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeResourceQuotaList :: Newtype ResourceQuotaList _
derive instance genericResourceQuotaList :: Generic ResourceQuotaList _
instance showResourceQuotaList :: Show ResourceQuotaList where show a = genericShow a
instance decodeResourceQuotaList :: Decode ResourceQuotaList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ResourceQuotaList { apiVersion, items, kind, metadata }
instance encodeResourceQuotaList :: Encode ResourceQuotaList where
  encode (ResourceQuotaList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultResourceQuotaList :: Default ResourceQuotaList where
  default = ResourceQuotaList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | ResourceQuotaSpec defines the desired hard limits to enforce for Quota.
-- |
-- | Fields:
-- | - `hard`: Hard is the set of desired hard limits for each named resource. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
-- | - `scopes`: A collection of filters that must match each object tracked by a quota. If not specified, the quota matches all objects.
newtype ResourceQuotaSpec = ResourceQuotaSpec
  { hard :: (NullOrUndefined (StrMap Resource.Quantity))
  , scopes :: (NullOrUndefined (Array String)) }

derive instance newtypeResourceQuotaSpec :: Newtype ResourceQuotaSpec _
derive instance genericResourceQuotaSpec :: Generic ResourceQuotaSpec _
instance showResourceQuotaSpec :: Show ResourceQuotaSpec where show a = genericShow a
instance decodeResourceQuotaSpec :: Decode ResourceQuotaSpec where
  decode a = do
               hard <- readProp "hard" a >>= decode
               scopes <- readProp "scopes" a >>= decode
               pure $ ResourceQuotaSpec { hard, scopes }
instance encodeResourceQuotaSpec :: Encode ResourceQuotaSpec where
  encode (ResourceQuotaSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "hard" (encode a.hard)
               , Tuple "scopes" (encode a.scopes) ]


instance defaultResourceQuotaSpec :: Default ResourceQuotaSpec where
  default = ResourceQuotaSpec
    { hard: NullOrUndefined Nothing
    , scopes: NullOrUndefined Nothing }

-- | ResourceQuotaStatus defines the enforced hard limits and observed use.
-- |
-- | Fields:
-- | - `hard`: Hard is the set of enforced hard limits for each named resource. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
-- | - `used`: Used is the current observed total usage of the resource in the namespace.
newtype ResourceQuotaStatus = ResourceQuotaStatus
  { hard :: (NullOrUndefined (StrMap Resource.Quantity))
  , used :: (NullOrUndefined (StrMap Resource.Quantity)) }

derive instance newtypeResourceQuotaStatus :: Newtype ResourceQuotaStatus _
derive instance genericResourceQuotaStatus :: Generic ResourceQuotaStatus _
instance showResourceQuotaStatus :: Show ResourceQuotaStatus where show a = genericShow a
instance decodeResourceQuotaStatus :: Decode ResourceQuotaStatus where
  decode a = do
               hard <- readProp "hard" a >>= decode
               used <- readProp "used" a >>= decode
               pure $ ResourceQuotaStatus { hard, used }
instance encodeResourceQuotaStatus :: Encode ResourceQuotaStatus where
  encode (ResourceQuotaStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "hard" (encode a.hard)
               , Tuple "used" (encode a.used) ]


instance defaultResourceQuotaStatus :: Default ResourceQuotaStatus where
  default = ResourceQuotaStatus
    { hard: NullOrUndefined Nothing
    , used: NullOrUndefined Nothing }

-- | ResourceRequirements describes the compute resource requirements.
-- |
-- | Fields:
-- | - `limits`: Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
-- | - `requests`: Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
newtype ResourceRequirements = ResourceRequirements
  { limits :: (NullOrUndefined (StrMap Resource.Quantity))
  , requests :: (NullOrUndefined (StrMap Resource.Quantity)) }

derive instance newtypeResourceRequirements :: Newtype ResourceRequirements _
derive instance genericResourceRequirements :: Generic ResourceRequirements _
instance showResourceRequirements :: Show ResourceRequirements where show a = genericShow a
instance decodeResourceRequirements :: Decode ResourceRequirements where
  decode a = do
               limits <- readProp "limits" a >>= decode
               requests <- readProp "requests" a >>= decode
               pure $ ResourceRequirements { limits, requests }
instance encodeResourceRequirements :: Encode ResourceRequirements where
  encode (ResourceRequirements a) = encode $ StrMap.fromFoldable $
               [ Tuple "limits" (encode a.limits)
               , Tuple "requests" (encode a.requests) ]


instance defaultResourceRequirements :: Default ResourceRequirements where
  default = ResourceRequirements
    { limits: NullOrUndefined Nothing
    , requests: NullOrUndefined Nothing }

-- | SELinuxOptions are the labels to be applied to the container
-- |
-- | Fields:
-- | - `level`: Level is SELinux level label that applies to the container.
-- | - `role`: Role is a SELinux role label that applies to the container.
-- | - `_type`: Type is a SELinux type label that applies to the container.
-- | - `user`: User is a SELinux user label that applies to the container.
newtype SELinuxOptions = SELinuxOptions
  { _type :: (NullOrUndefined String)
  , level :: (NullOrUndefined String)
  , role :: (NullOrUndefined String)
  , user :: (NullOrUndefined String) }

derive instance newtypeSELinuxOptions :: Newtype SELinuxOptions _
derive instance genericSELinuxOptions :: Generic SELinuxOptions _
instance showSELinuxOptions :: Show SELinuxOptions where show a = genericShow a
instance decodeSELinuxOptions :: Decode SELinuxOptions where
  decode a = do
               _type <- readProp "_type" a >>= decode
               level <- readProp "level" a >>= decode
               role <- readProp "role" a >>= decode
               user <- readProp "user" a >>= decode
               pure $ SELinuxOptions { _type, level, role, user }
instance encodeSELinuxOptions :: Encode SELinuxOptions where
  encode (SELinuxOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "level" (encode a.level)
               , Tuple "role" (encode a.role)
               , Tuple "user" (encode a.user) ]


instance defaultSELinuxOptions :: Default SELinuxOptions where
  default = SELinuxOptions
    { _type: NullOrUndefined Nothing
    , level: NullOrUndefined Nothing
    , role: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | ScaleIOPersistentVolumeSource represents a persistent ScaleIO volume
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `gateway`: The host address of the ScaleIO API Gateway.
-- | - `protectionDomain`: The name of the ScaleIO Protection Domain for the configured storage.
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: SecretRef references to the secret for ScaleIO user and other sensitive information. If this is not provided, Login operation will fail.
-- | - `sslEnabled`: Flag to enable/disable SSL communication with Gateway, default false
-- | - `storageMode`: Indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned.
-- | - `storagePool`: The ScaleIO Storage Pool associated with the protection domain.
-- | - `system`: The name of the storage system as configured in ScaleIO.
-- | - `volumeName`: The name of a volume already created in the ScaleIO system that is associated with this volume source.
newtype ScaleIOPersistentVolumeSource = ScaleIOPersistentVolumeSource
  { fsType :: (NullOrUndefined String)
  , gateway :: (NullOrUndefined String)
  , protectionDomain :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined SecretReference)
  , sslEnabled :: (NullOrUndefined Boolean)
  , storageMode :: (NullOrUndefined String)
  , storagePool :: (NullOrUndefined String)
  , system :: (NullOrUndefined String)
  , volumeName :: (NullOrUndefined String) }

derive instance newtypeScaleIOPersistentVolumeSource :: Newtype ScaleIOPersistentVolumeSource _
derive instance genericScaleIOPersistentVolumeSource :: Generic ScaleIOPersistentVolumeSource _
instance showScaleIOPersistentVolumeSource :: Show ScaleIOPersistentVolumeSource where show a = genericShow a
instance decodeScaleIOPersistentVolumeSource :: Decode ScaleIOPersistentVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               gateway <- readProp "gateway" a >>= decode
               protectionDomain <- readProp "protectionDomain" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               sslEnabled <- readProp "sslEnabled" a >>= decode
               storageMode <- readProp "storageMode" a >>= decode
               storagePool <- readProp "storagePool" a >>= decode
               system <- readProp "system" a >>= decode
               volumeName <- readProp "volumeName" a >>= decode
               pure $ ScaleIOPersistentVolumeSource { fsType, gateway, protectionDomain, readOnly, secretRef, sslEnabled, storageMode, storagePool, system, volumeName }
instance encodeScaleIOPersistentVolumeSource :: Encode ScaleIOPersistentVolumeSource where
  encode (ScaleIOPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "gateway" (encode a.gateway)
               , Tuple "protectionDomain" (encode a.protectionDomain)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "sslEnabled" (encode a.sslEnabled)
               , Tuple "storageMode" (encode a.storageMode)
               , Tuple "storagePool" (encode a.storagePool)
               , Tuple "system" (encode a.system)
               , Tuple "volumeName" (encode a.volumeName) ]


instance defaultScaleIOPersistentVolumeSource :: Default ScaleIOPersistentVolumeSource where
  default = ScaleIOPersistentVolumeSource
    { fsType: NullOrUndefined Nothing
    , gateway: NullOrUndefined Nothing
    , protectionDomain: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , sslEnabled: NullOrUndefined Nothing
    , storageMode: NullOrUndefined Nothing
    , storagePool: NullOrUndefined Nothing
    , system: NullOrUndefined Nothing
    , volumeName: NullOrUndefined Nothing }

-- | ScaleIOVolumeSource represents a persistent ScaleIO volume
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `gateway`: The host address of the ScaleIO API Gateway.
-- | - `protectionDomain`: The name of the ScaleIO Protection Domain for the configured storage.
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: SecretRef references to the secret for ScaleIO user and other sensitive information. If this is not provided, Login operation will fail.
-- | - `sslEnabled`: Flag to enable/disable SSL communication with Gateway, default false
-- | - `storageMode`: Indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned.
-- | - `storagePool`: The ScaleIO Storage Pool associated with the protection domain.
-- | - `system`: The name of the storage system as configured in ScaleIO.
-- | - `volumeName`: The name of a volume already created in the ScaleIO system that is associated with this volume source.
newtype ScaleIOVolumeSource = ScaleIOVolumeSource
  { fsType :: (NullOrUndefined String)
  , gateway :: (NullOrUndefined String)
  , protectionDomain :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined LocalObjectReference)
  , sslEnabled :: (NullOrUndefined Boolean)
  , storageMode :: (NullOrUndefined String)
  , storagePool :: (NullOrUndefined String)
  , system :: (NullOrUndefined String)
  , volumeName :: (NullOrUndefined String) }

derive instance newtypeScaleIOVolumeSource :: Newtype ScaleIOVolumeSource _
derive instance genericScaleIOVolumeSource :: Generic ScaleIOVolumeSource _
instance showScaleIOVolumeSource :: Show ScaleIOVolumeSource where show a = genericShow a
instance decodeScaleIOVolumeSource :: Decode ScaleIOVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               gateway <- readProp "gateway" a >>= decode
               protectionDomain <- readProp "protectionDomain" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               sslEnabled <- readProp "sslEnabled" a >>= decode
               storageMode <- readProp "storageMode" a >>= decode
               storagePool <- readProp "storagePool" a >>= decode
               system <- readProp "system" a >>= decode
               volumeName <- readProp "volumeName" a >>= decode
               pure $ ScaleIOVolumeSource { fsType, gateway, protectionDomain, readOnly, secretRef, sslEnabled, storageMode, storagePool, system, volumeName }
instance encodeScaleIOVolumeSource :: Encode ScaleIOVolumeSource where
  encode (ScaleIOVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "gateway" (encode a.gateway)
               , Tuple "protectionDomain" (encode a.protectionDomain)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "sslEnabled" (encode a.sslEnabled)
               , Tuple "storageMode" (encode a.storageMode)
               , Tuple "storagePool" (encode a.storagePool)
               , Tuple "system" (encode a.system)
               , Tuple "volumeName" (encode a.volumeName) ]


instance defaultScaleIOVolumeSource :: Default ScaleIOVolumeSource where
  default = ScaleIOVolumeSource
    { fsType: NullOrUndefined Nothing
    , gateway: NullOrUndefined Nothing
    , protectionDomain: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , sslEnabled: NullOrUndefined Nothing
    , storageMode: NullOrUndefined Nothing
    , storagePool: NullOrUndefined Nothing
    , system: NullOrUndefined Nothing
    , volumeName: NullOrUndefined Nothing }

-- | Secret holds secret data of a certain type. The total bytes of the values in the Data field must be less than MaxSecretSize bytes.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `_data`: Data contains the secret data. Each key must consist of alphanumeric characters, '-', '_' or '.'. The serialized form of the secret data is a base64 encoded string, representing the arbitrary (possibly non-string) data value here. Described in https://tools.ietf.org/html/rfc4648#section-4
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `stringData`: stringData allows specifying non-binary secret data in string form. It is provided as a write-only convenience method. All keys and values are merged into the data field on write, overwriting any existing values. It is never output when reading from the API.
-- | - `_type`: Used to facilitate programmatic handling of secret data.
newtype Secret = Secret
  { _data :: (NullOrUndefined (StrMap String))
  , _type :: (NullOrUndefined String)
  , apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , stringData :: (NullOrUndefined (StrMap String)) }

derive instance newtypeSecret :: Newtype Secret _
derive instance genericSecret :: Generic Secret _
instance showSecret :: Show Secret where show a = genericShow a
instance decodeSecret :: Decode Secret where
  decode a = do
               _data <- readProp "_data" a >>= decode
               _type <- readProp "_type" a >>= decode
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               stringData <- readProp "stringData" a >>= decode
               pure $ Secret { _data, _type, apiVersion, kind, metadata, stringData }
instance encodeSecret :: Encode Secret where
  encode (Secret a) = encode $ StrMap.fromFoldable $
               [ Tuple "_data" (encode a._data)
               , Tuple "_type" (encode a._type)
               , Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "stringData" (encode a.stringData) ]


instance defaultSecret :: Default Secret where
  default = Secret
    { _data: NullOrUndefined Nothing
    , _type: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , stringData: NullOrUndefined Nothing }

-- | SecretEnvSource selects a Secret to populate the environment variables with.
-- | 
-- | The contents of the target Secret's Data field will represent the key-value pairs as environment variables.
-- |
-- | Fields:
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the Secret must be defined
newtype SecretEnvSource = SecretEnvSource
  { name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeSecretEnvSource :: Newtype SecretEnvSource _
derive instance genericSecretEnvSource :: Generic SecretEnvSource _
instance showSecretEnvSource :: Show SecretEnvSource where show a = genericShow a
instance decodeSecretEnvSource :: Decode SecretEnvSource where
  decode a = do
               name <- readProp "name" a >>= decode
               optional <- readProp "optional" a >>= decode
               pure $ SecretEnvSource { name, optional }
instance encodeSecretEnvSource :: Encode SecretEnvSource where
  encode (SecretEnvSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "optional" (encode a.optional) ]


instance defaultSecretEnvSource :: Default SecretEnvSource where
  default = SecretEnvSource
    { name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | SecretKeySelector selects a key of a Secret.
-- |
-- | Fields:
-- | - `key`: The key of the secret to select from.  Must be a valid secret key.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the Secret or it's key must be defined
newtype SecretKeySelector = SecretKeySelector
  { key :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeSecretKeySelector :: Newtype SecretKeySelector _
derive instance genericSecretKeySelector :: Generic SecretKeySelector _
instance showSecretKeySelector :: Show SecretKeySelector where show a = genericShow a
instance decodeSecretKeySelector :: Decode SecretKeySelector where
  decode a = do
               key <- readProp "key" a >>= decode
               name <- readProp "name" a >>= decode
               optional <- readProp "optional" a >>= decode
               pure $ SecretKeySelector { key, name, optional }
instance encodeSecretKeySelector :: Encode SecretKeySelector where
  encode (SecretKeySelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "key" (encode a.key)
               , Tuple "name" (encode a.name)
               , Tuple "optional" (encode a.optional) ]


instance defaultSecretKeySelector :: Default SecretKeySelector where
  default = SecretKeySelector
    { key: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | SecretList is a list of Secret.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of secret objects. More info: https://kubernetes.io/docs/concepts/configuration/secret
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype SecretList = SecretList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Secret))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeSecretList :: Newtype SecretList _
derive instance genericSecretList :: Generic SecretList _
instance showSecretList :: Show SecretList where show a = genericShow a
instance decodeSecretList :: Decode SecretList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ SecretList { apiVersion, items, kind, metadata }
instance encodeSecretList :: Encode SecretList where
  encode (SecretList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultSecretList :: Default SecretList where
  default = SecretList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | Adapts a secret into a projected volume.
-- | 
-- | The contents of the target Secret's Data field will be presented in a projected volume as files using the keys in the Data field as the file names. Note that this is identical to a secret volume source without the default mode.
-- |
-- | Fields:
-- | - `items`: If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the Secret, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the Secret or its key must be defined
newtype SecretProjection = SecretProjection
  { items :: (NullOrUndefined (Array KeyToPath))
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeSecretProjection :: Newtype SecretProjection _
derive instance genericSecretProjection :: Generic SecretProjection _
instance showSecretProjection :: Show SecretProjection where show a = genericShow a
instance decodeSecretProjection :: Decode SecretProjection where
  decode a = do
               items <- readProp "items" a >>= decode
               name <- readProp "name" a >>= decode
               optional <- readProp "optional" a >>= decode
               pure $ SecretProjection { items, name, optional }
instance encodeSecretProjection :: Encode SecretProjection where
  encode (SecretProjection a) = encode $ StrMap.fromFoldable $
               [ Tuple "items" (encode a.items)
               , Tuple "name" (encode a.name)
               , Tuple "optional" (encode a.optional) ]


instance defaultSecretProjection :: Default SecretProjection where
  default = SecretProjection
    { items: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | SecretReference represents a Secret Reference. It has enough information to retrieve secret in any namespace
-- |
-- | Fields:
-- | - `name`: Name is unique within a namespace to reference a secret resource.
-- | - `namespace`: Namespace defines the space within which the secret name must be unique.
newtype SecretReference = SecretReference
  { name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String) }

derive instance newtypeSecretReference :: Newtype SecretReference _
derive instance genericSecretReference :: Generic SecretReference _
instance showSecretReference :: Show SecretReference where show a = genericShow a
instance decodeSecretReference :: Decode SecretReference where
  decode a = do
               name <- readProp "name" a >>= decode
               namespace <- readProp "namespace" a >>= decode
               pure $ SecretReference { name, namespace }
instance encodeSecretReference :: Encode SecretReference where
  encode (SecretReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "namespace" (encode a.namespace) ]


instance defaultSecretReference :: Default SecretReference where
  default = SecretReference
    { name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing }

-- | Adapts a Secret into a volume.
-- | 
-- | The contents of the target Secret's Data field will be presented in a volume as files using the keys in the Data field as the file names. Secret volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `defaultMode`: Optional: mode bits to use on created files by default. Must be a value between 0 and 0777. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `items`: If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the Secret, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
-- | - `optional`: Specify whether the Secret or it's keys must be defined
-- | - `secretName`: Name of the secret in the pod's namespace to use. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret
newtype SecretVolumeSource = SecretVolumeSource
  { defaultMode :: (NullOrUndefined Int)
  , items :: (NullOrUndefined (Array KeyToPath))
  , optional :: (NullOrUndefined Boolean)
  , secretName :: (NullOrUndefined String) }

derive instance newtypeSecretVolumeSource :: Newtype SecretVolumeSource _
derive instance genericSecretVolumeSource :: Generic SecretVolumeSource _
instance showSecretVolumeSource :: Show SecretVolumeSource where show a = genericShow a
instance decodeSecretVolumeSource :: Decode SecretVolumeSource where
  decode a = do
               defaultMode <- readProp "defaultMode" a >>= decode
               items <- readProp "items" a >>= decode
               optional <- readProp "optional" a >>= decode
               secretName <- readProp "secretName" a >>= decode
               pure $ SecretVolumeSource { defaultMode, items, optional, secretName }
instance encodeSecretVolumeSource :: Encode SecretVolumeSource where
  encode (SecretVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "defaultMode" (encode a.defaultMode)
               , Tuple "items" (encode a.items)
               , Tuple "optional" (encode a.optional)
               , Tuple "secretName" (encode a.secretName) ]


instance defaultSecretVolumeSource :: Default SecretVolumeSource where
  default = SecretVolumeSource
    { defaultMode: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing
    , secretName: NullOrUndefined Nothing }

-- | SecurityContext holds security configuration that will be applied to a container. Some fields are present in both SecurityContext and PodSecurityContext.  When both are set, the values in SecurityContext take precedence.
-- |
-- | Fields:
-- | - `allowPrivilegeEscalation`: AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process. AllowPrivilegeEscalation is true always when the container is: 1) run as Privileged 2) has CAP_SYS_ADMIN
-- | - `capabilities`: The capabilities to add/drop when running containers. Defaults to the default set of capabilities granted by the container runtime.
-- | - `privileged`: Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false.
-- | - `readOnlyRootFilesystem`: Whether this container has a read-only root filesystem. Default is false.
-- | - `runAsNonRoot`: Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
-- | - `runAsUser`: The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
-- | - `seLinuxOptions`: The SELinux context to be applied to the container. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
newtype SecurityContext = SecurityContext
  { allowPrivilegeEscalation :: (NullOrUndefined Boolean)
  , capabilities :: (NullOrUndefined Capabilities)
  , privileged :: (NullOrUndefined Boolean)
  , readOnlyRootFilesystem :: (NullOrUndefined Boolean)
  , runAsNonRoot :: (NullOrUndefined Boolean)
  , runAsUser :: (NullOrUndefined Int)
  , seLinuxOptions :: (NullOrUndefined SELinuxOptions) }

derive instance newtypeSecurityContext :: Newtype SecurityContext _
derive instance genericSecurityContext :: Generic SecurityContext _
instance showSecurityContext :: Show SecurityContext where show a = genericShow a
instance decodeSecurityContext :: Decode SecurityContext where
  decode a = do
               allowPrivilegeEscalation <- readProp "allowPrivilegeEscalation" a >>= decode
               capabilities <- readProp "capabilities" a >>= decode
               privileged <- readProp "privileged" a >>= decode
               readOnlyRootFilesystem <- readProp "readOnlyRootFilesystem" a >>= decode
               runAsNonRoot <- readProp "runAsNonRoot" a >>= decode
               runAsUser <- readProp "runAsUser" a >>= decode
               seLinuxOptions <- readProp "seLinuxOptions" a >>= decode
               pure $ SecurityContext { allowPrivilegeEscalation, capabilities, privileged, readOnlyRootFilesystem, runAsNonRoot, runAsUser, seLinuxOptions }
instance encodeSecurityContext :: Encode SecurityContext where
  encode (SecurityContext a) = encode $ StrMap.fromFoldable $
               [ Tuple "allowPrivilegeEscalation" (encode a.allowPrivilegeEscalation)
               , Tuple "capabilities" (encode a.capabilities)
               , Tuple "privileged" (encode a.privileged)
               , Tuple "readOnlyRootFilesystem" (encode a.readOnlyRootFilesystem)
               , Tuple "runAsNonRoot" (encode a.runAsNonRoot)
               , Tuple "runAsUser" (encode a.runAsUser)
               , Tuple "seLinuxOptions" (encode a.seLinuxOptions) ]


instance defaultSecurityContext :: Default SecurityContext where
  default = SecurityContext
    { allowPrivilegeEscalation: NullOrUndefined Nothing
    , capabilities: NullOrUndefined Nothing
    , privileged: NullOrUndefined Nothing
    , readOnlyRootFilesystem: NullOrUndefined Nothing
    , runAsNonRoot: NullOrUndefined Nothing
    , runAsUser: NullOrUndefined Nothing
    , seLinuxOptions: NullOrUndefined Nothing }

-- | Service is a named abstraction of software service (for example, mysql) consisting of local port (for example 3306) that the proxy listens on, and the selector that determines which pods will answer requests sent through the proxy.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the behavior of a service. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Most recently observed status of the service. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Service = Service
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined ServiceSpec)
  , status :: (NullOrUndefined ServiceStatus) }

derive instance newtypeService :: Newtype Service _
derive instance genericService :: Generic Service _
instance showService :: Show Service where show a = genericShow a
instance decodeService :: Decode Service where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ Service { apiVersion, kind, metadata, spec, status }
instance encodeService :: Encode Service where
  encode (Service a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultService :: Default Service where
  default = Service
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | ServiceAccount binds together: * a name, understood by users, and perhaps by peripheral systems, for an identity * a principal that can be authenticated and authorized * a set of secrets
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `automountServiceAccountToken`: AutomountServiceAccountToken indicates whether pods running as this service account should have an API token automatically mounted. Can be overridden at the pod level.
-- | - `imagePullSecrets`: ImagePullSecrets is a list of references to secrets in the same namespace to use for pulling any images in pods that reference this ServiceAccount. ImagePullSecrets are distinct from Secrets because Secrets can be mounted in the pod, but ImagePullSecrets are only accessed by the kubelet. More info: https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `secrets`: Secrets is the list of secrets allowed to be used by pods running using this ServiceAccount. More info: https://kubernetes.io/docs/concepts/configuration/secret
newtype ServiceAccount = ServiceAccount
  { apiVersion :: (NullOrUndefined String)
  , automountServiceAccountToken :: (NullOrUndefined Boolean)
  , imagePullSecrets :: (NullOrUndefined (Array LocalObjectReference))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , secrets :: (NullOrUndefined (Array ObjectReference)) }

derive instance newtypeServiceAccount :: Newtype ServiceAccount _
derive instance genericServiceAccount :: Generic ServiceAccount _
instance showServiceAccount :: Show ServiceAccount where show a = genericShow a
instance decodeServiceAccount :: Decode ServiceAccount where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               automountServiceAccountToken <- readProp "automountServiceAccountToken" a >>= decode
               imagePullSecrets <- readProp "imagePullSecrets" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               secrets <- readProp "secrets" a >>= decode
               pure $ ServiceAccount { apiVersion, automountServiceAccountToken, imagePullSecrets, kind, metadata, secrets }
instance encodeServiceAccount :: Encode ServiceAccount where
  encode (ServiceAccount a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "automountServiceAccountToken" (encode a.automountServiceAccountToken)
               , Tuple "imagePullSecrets" (encode a.imagePullSecrets)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "secrets" (encode a.secrets) ]


instance defaultServiceAccount :: Default ServiceAccount where
  default = ServiceAccount
    { apiVersion: NullOrUndefined Nothing
    , automountServiceAccountToken: NullOrUndefined Nothing
    , imagePullSecrets: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , secrets: NullOrUndefined Nothing }

-- | ServiceAccountList is a list of ServiceAccount objects
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of ServiceAccounts. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ServiceAccountList = ServiceAccountList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ServiceAccount))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeServiceAccountList :: Newtype ServiceAccountList _
derive instance genericServiceAccountList :: Generic ServiceAccountList _
instance showServiceAccountList :: Show ServiceAccountList where show a = genericShow a
instance decodeServiceAccountList :: Decode ServiceAccountList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ServiceAccountList { apiVersion, items, kind, metadata }
instance encodeServiceAccountList :: Encode ServiceAccountList where
  encode (ServiceAccountList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultServiceAccountList :: Default ServiceAccountList where
  default = ServiceAccountList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | ServiceList holds a list of services.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of services
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ServiceList = ServiceList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Service))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeServiceList :: Newtype ServiceList _
derive instance genericServiceList :: Generic ServiceList _
instance showServiceList :: Show ServiceList where show a = genericShow a
instance decodeServiceList :: Decode ServiceList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ServiceList { apiVersion, items, kind, metadata }
instance encodeServiceList :: Encode ServiceList where
  encode (ServiceList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultServiceList :: Default ServiceList where
  default = ServiceList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | ServicePort contains information on service's port.
-- |
-- | Fields:
-- | - `name`: The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. This maps to the 'Name' field in EndpointPort objects. Optional if only one ServicePort is defined on this service.
-- | - `nodePort`: The port on each node on which this service is exposed when type=NodePort or LoadBalancer. Usually assigned by the system. If specified, it will be allocated to the service if unused or else creation of the service will fail. Default is to auto-allocate a port if the ServiceType of this Service requires one. More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport
-- | - `port`: The port that will be exposed by this service.
-- | - `protocol`: The IP protocol for this port. Supports "TCP" and "UDP". Default is TCP.
-- | - `targetPort`: Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service
newtype ServicePort = ServicePort
  { name :: (NullOrUndefined String)
  , nodePort :: (NullOrUndefined Int)
  , port :: (NullOrUndefined Int)
  , protocol :: (NullOrUndefined String)
  , targetPort :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeServicePort :: Newtype ServicePort _
derive instance genericServicePort :: Generic ServicePort _
instance showServicePort :: Show ServicePort where show a = genericShow a
instance decodeServicePort :: Decode ServicePort where
  decode a = do
               name <- readProp "name" a >>= decode
               nodePort <- readProp "nodePort" a >>= decode
               port <- readProp "port" a >>= decode
               protocol <- readProp "protocol" a >>= decode
               targetPort <- readProp "targetPort" a >>= decode
               pure $ ServicePort { name, nodePort, port, protocol, targetPort }
instance encodeServicePort :: Encode ServicePort where
  encode (ServicePort a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "nodePort" (encode a.nodePort)
               , Tuple "port" (encode a.port)
               , Tuple "protocol" (encode a.protocol)
               , Tuple "targetPort" (encode a.targetPort) ]


instance defaultServicePort :: Default ServicePort where
  default = ServicePort
    { name: NullOrUndefined Nothing
    , nodePort: NullOrUndefined Nothing
    , port: NullOrUndefined Nothing
    , protocol: NullOrUndefined Nothing
    , targetPort: NullOrUndefined Nothing }

-- | ServiceSpec describes the attributes that a user creates on a service.
-- |
-- | Fields:
-- | - `clusterIP`: clusterIP is the IP address of the service and is usually assigned randomly by the master. If an address is specified manually and is not in use by others, it will be allocated to the service; otherwise, creation of the service will fail. This field can not be changed through updates. Valid values are "None", empty string (""), or a valid IP address. "None" can be specified for headless services when proxying is not required. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
-- | - `externalIPs`: externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.
-- | - `externalName`: externalName is the external reference that kubedns or equivalent will return as a CNAME record for this service. No proxying will be involved. Must be a valid RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires Type to be ExternalName.
-- | - `externalTrafficPolicy`: externalTrafficPolicy denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. "Local" preserves the client source IP and avoids a second hop for LoadBalancer and Nodeport type services, but risks potentially imbalanced traffic spreading. "Cluster" obscures the client source IP and may cause a second hop to another node, but should have good overall load-spreading.
-- | - `healthCheckNodePort`: healthCheckNodePort specifies the healthcheck nodePort for the service. If not specified, HealthCheckNodePort is created by the service api backend with the allocated nodePort. Will use user-specified nodePort value if specified by the client. Only effects when Type is set to LoadBalancer and ExternalTrafficPolicy is set to Local.
-- | - `loadBalancerIP`: Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature.
-- | - `loadBalancerSourceRanges`: If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature." More info: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/
-- | - `ports`: The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
-- | - `publishNotReadyAddresses`: publishNotReadyAddresses, when set to true, indicates that DNS implementations must publish the notReadyAddresses of subsets for the Endpoints associated with the Service. The default value is false. The primary use case for setting this field is to use a StatefulSet's Headless Service to propagate SRV records for its Pods without respect to their readiness for purpose of peer discovery. This field will replace the service.alpha.kubernetes.io/tolerate-unready-endpoints when that annotation is deprecated and all clients have been converted to use this field.
-- | - `selector`: Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/
-- | - `sessionAffinity`: Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
-- | - `sessionAffinityConfig`: sessionAffinityConfig contains the configurations of session affinity.
-- | - `_type`: type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. "ExternalName" maps to the specified externalName. "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object. If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a stable IP. "NodePort" builds on ClusterIP and allocates a port on every node which routes to the clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the clusterIP. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services---service-types
newtype ServiceSpec = ServiceSpec
  { _type :: (NullOrUndefined String)
  , clusterIP :: (NullOrUndefined String)
  , externalIPs :: (NullOrUndefined (Array String))
  , externalName :: (NullOrUndefined String)
  , externalTrafficPolicy :: (NullOrUndefined String)
  , healthCheckNodePort :: (NullOrUndefined Int)
  , loadBalancerIP :: (NullOrUndefined String)
  , loadBalancerSourceRanges :: (NullOrUndefined (Array String))
  , ports :: (NullOrUndefined (Array ServicePort))
  , publishNotReadyAddresses :: (NullOrUndefined Boolean)
  , selector :: (NullOrUndefined (StrMap String))
  , sessionAffinity :: (NullOrUndefined String)
  , sessionAffinityConfig :: (NullOrUndefined SessionAffinityConfig) }

derive instance newtypeServiceSpec :: Newtype ServiceSpec _
derive instance genericServiceSpec :: Generic ServiceSpec _
instance showServiceSpec :: Show ServiceSpec where show a = genericShow a
instance decodeServiceSpec :: Decode ServiceSpec where
  decode a = do
               _type <- readProp "_type" a >>= decode
               clusterIP <- readProp "clusterIP" a >>= decode
               externalIPs <- readProp "externalIPs" a >>= decode
               externalName <- readProp "externalName" a >>= decode
               externalTrafficPolicy <- readProp "externalTrafficPolicy" a >>= decode
               healthCheckNodePort <- readProp "healthCheckNodePort" a >>= decode
               loadBalancerIP <- readProp "loadBalancerIP" a >>= decode
               loadBalancerSourceRanges <- readProp "loadBalancerSourceRanges" a >>= decode
               ports <- readProp "ports" a >>= decode
               publishNotReadyAddresses <- readProp "publishNotReadyAddresses" a >>= decode
               selector <- readProp "selector" a >>= decode
               sessionAffinity <- readProp "sessionAffinity" a >>= decode
               sessionAffinityConfig <- readProp "sessionAffinityConfig" a >>= decode
               pure $ ServiceSpec { _type, clusterIP, externalIPs, externalName, externalTrafficPolicy, healthCheckNodePort, loadBalancerIP, loadBalancerSourceRanges, ports, publishNotReadyAddresses, selector, sessionAffinity, sessionAffinityConfig }
instance encodeServiceSpec :: Encode ServiceSpec where
  encode (ServiceSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encode a._type)
               , Tuple "clusterIP" (encode a.clusterIP)
               , Tuple "externalIPs" (encode a.externalIPs)
               , Tuple "externalName" (encode a.externalName)
               , Tuple "externalTrafficPolicy" (encode a.externalTrafficPolicy)
               , Tuple "healthCheckNodePort" (encode a.healthCheckNodePort)
               , Tuple "loadBalancerIP" (encode a.loadBalancerIP)
               , Tuple "loadBalancerSourceRanges" (encode a.loadBalancerSourceRanges)
               , Tuple "ports" (encode a.ports)
               , Tuple "publishNotReadyAddresses" (encode a.publishNotReadyAddresses)
               , Tuple "selector" (encode a.selector)
               , Tuple "sessionAffinity" (encode a.sessionAffinity)
               , Tuple "sessionAffinityConfig" (encode a.sessionAffinityConfig) ]


instance defaultServiceSpec :: Default ServiceSpec where
  default = ServiceSpec
    { _type: NullOrUndefined Nothing
    , clusterIP: NullOrUndefined Nothing
    , externalIPs: NullOrUndefined Nothing
    , externalName: NullOrUndefined Nothing
    , externalTrafficPolicy: NullOrUndefined Nothing
    , healthCheckNodePort: NullOrUndefined Nothing
    , loadBalancerIP: NullOrUndefined Nothing
    , loadBalancerSourceRanges: NullOrUndefined Nothing
    , ports: NullOrUndefined Nothing
    , publishNotReadyAddresses: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , sessionAffinity: NullOrUndefined Nothing
    , sessionAffinityConfig: NullOrUndefined Nothing }

-- | ServiceStatus represents the current status of a service.
-- |
-- | Fields:
-- | - `loadBalancer`: LoadBalancer contains the current status of the load-balancer, if one is present.
newtype ServiceStatus = ServiceStatus
  { loadBalancer :: (NullOrUndefined LoadBalancerStatus) }

derive instance newtypeServiceStatus :: Newtype ServiceStatus _
derive instance genericServiceStatus :: Generic ServiceStatus _
instance showServiceStatus :: Show ServiceStatus where show a = genericShow a
instance decodeServiceStatus :: Decode ServiceStatus where
  decode a = do
               loadBalancer <- readProp "loadBalancer" a >>= decode
               pure $ ServiceStatus { loadBalancer }
instance encodeServiceStatus :: Encode ServiceStatus where
  encode (ServiceStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "loadBalancer" (encode a.loadBalancer) ]


instance defaultServiceStatus :: Default ServiceStatus where
  default = ServiceStatus
    { loadBalancer: NullOrUndefined Nothing }

-- | SessionAffinityConfig represents the configurations of session affinity.
-- |
-- | Fields:
-- | - `clientIP`: clientIP contains the configurations of Client IP based session affinity.
newtype SessionAffinityConfig = SessionAffinityConfig
  { clientIP :: (NullOrUndefined ClientIPConfig) }

derive instance newtypeSessionAffinityConfig :: Newtype SessionAffinityConfig _
derive instance genericSessionAffinityConfig :: Generic SessionAffinityConfig _
instance showSessionAffinityConfig :: Show SessionAffinityConfig where show a = genericShow a
instance decodeSessionAffinityConfig :: Decode SessionAffinityConfig where
  decode a = do
               clientIP <- readProp "clientIP" a >>= decode
               pure $ SessionAffinityConfig { clientIP }
instance encodeSessionAffinityConfig :: Encode SessionAffinityConfig where
  encode (SessionAffinityConfig a) = encode $ StrMap.fromFoldable $
               [ Tuple "clientIP" (encode a.clientIP) ]


instance defaultSessionAffinityConfig :: Default SessionAffinityConfig where
  default = SessionAffinityConfig
    { clientIP: NullOrUndefined Nothing }

-- | Represents a StorageOS persistent volume resource.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: SecretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted.
-- | - `volumeName`: VolumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
-- | - `volumeNamespace`: VolumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
newtype StorageOSPersistentVolumeSource = StorageOSPersistentVolumeSource
  { fsType :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined ObjectReference)
  , volumeName :: (NullOrUndefined String)
  , volumeNamespace :: (NullOrUndefined String) }

derive instance newtypeStorageOSPersistentVolumeSource :: Newtype StorageOSPersistentVolumeSource _
derive instance genericStorageOSPersistentVolumeSource :: Generic StorageOSPersistentVolumeSource _
instance showStorageOSPersistentVolumeSource :: Show StorageOSPersistentVolumeSource where show a = genericShow a
instance decodeStorageOSPersistentVolumeSource :: Decode StorageOSPersistentVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               volumeName <- readProp "volumeName" a >>= decode
               volumeNamespace <- readProp "volumeNamespace" a >>= decode
               pure $ StorageOSPersistentVolumeSource { fsType, readOnly, secretRef, volumeName, volumeNamespace }
instance encodeStorageOSPersistentVolumeSource :: Encode StorageOSPersistentVolumeSource where
  encode (StorageOSPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "volumeName" (encode a.volumeName)
               , Tuple "volumeNamespace" (encode a.volumeNamespace) ]


instance defaultStorageOSPersistentVolumeSource :: Default StorageOSPersistentVolumeSource where
  default = StorageOSPersistentVolumeSource
    { fsType: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , volumeName: NullOrUndefined Nothing
    , volumeNamespace: NullOrUndefined Nothing }

-- | Represents a StorageOS persistent volume resource.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: SecretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted.
-- | - `volumeName`: VolumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
-- | - `volumeNamespace`: VolumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
newtype StorageOSVolumeSource = StorageOSVolumeSource
  { fsType :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , secretRef :: (NullOrUndefined LocalObjectReference)
  , volumeName :: (NullOrUndefined String)
  , volumeNamespace :: (NullOrUndefined String) }

derive instance newtypeStorageOSVolumeSource :: Newtype StorageOSVolumeSource _
derive instance genericStorageOSVolumeSource :: Generic StorageOSVolumeSource _
instance showStorageOSVolumeSource :: Show StorageOSVolumeSource where show a = genericShow a
instance decodeStorageOSVolumeSource :: Decode StorageOSVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               secretRef <- readProp "secretRef" a >>= decode
               volumeName <- readProp "volumeName" a >>= decode
               volumeNamespace <- readProp "volumeNamespace" a >>= decode
               pure $ StorageOSVolumeSource { fsType, readOnly, secretRef, volumeName, volumeNamespace }
instance encodeStorageOSVolumeSource :: Encode StorageOSVolumeSource where
  encode (StorageOSVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "secretRef" (encode a.secretRef)
               , Tuple "volumeName" (encode a.volumeName)
               , Tuple "volumeNamespace" (encode a.volumeNamespace) ]


instance defaultStorageOSVolumeSource :: Default StorageOSVolumeSource where
  default = StorageOSVolumeSource
    { fsType: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , volumeName: NullOrUndefined Nothing
    , volumeNamespace: NullOrUndefined Nothing }

-- | TCPSocketAction describes an action based on opening a socket
-- |
-- | Fields:
-- | - `host`: Optional: Host name to connect to, defaults to the pod IP.
-- | - `port`: Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.
newtype TCPSocketAction = TCPSocketAction
  { host :: (NullOrUndefined String)
  , port :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeTCPSocketAction :: Newtype TCPSocketAction _
derive instance genericTCPSocketAction :: Generic TCPSocketAction _
instance showTCPSocketAction :: Show TCPSocketAction where show a = genericShow a
instance decodeTCPSocketAction :: Decode TCPSocketAction where
  decode a = do
               host <- readProp "host" a >>= decode
               port <- readProp "port" a >>= decode
               pure $ TCPSocketAction { host, port }
instance encodeTCPSocketAction :: Encode TCPSocketAction where
  encode (TCPSocketAction a) = encode $ StrMap.fromFoldable $
               [ Tuple "host" (encode a.host)
               , Tuple "port" (encode a.port) ]


instance defaultTCPSocketAction :: Default TCPSocketAction where
  default = TCPSocketAction
    { host: NullOrUndefined Nothing
    , port: NullOrUndefined Nothing }

-- | The node this Taint is attached to has the "effect" on any pod that does not tolerate the Taint.
-- |
-- | Fields:
-- | - `effect`: Required. The effect of the taint on pods that do not tolerate the taint. Valid effects are NoSchedule, PreferNoSchedule and NoExecute.
-- | - `key`: Required. The taint key to be applied to a node.
-- | - `timeAdded`: TimeAdded represents the time at which the taint was added. It is only written for NoExecute taints.
-- | - `value`: Required. The taint value corresponding to the taint key.
newtype Taint = Taint
  { effect :: (NullOrUndefined String)
  , key :: (NullOrUndefined String)
  , timeAdded :: (NullOrUndefined MetaV1.Time)
  , value :: (NullOrUndefined String) }

derive instance newtypeTaint :: Newtype Taint _
derive instance genericTaint :: Generic Taint _
instance showTaint :: Show Taint where show a = genericShow a
instance decodeTaint :: Decode Taint where
  decode a = do
               effect <- readProp "effect" a >>= decode
               key <- readProp "key" a >>= decode
               timeAdded <- readProp "timeAdded" a >>= decode
               value <- readProp "value" a >>= decode
               pure $ Taint { effect, key, timeAdded, value }
instance encodeTaint :: Encode Taint where
  encode (Taint a) = encode $ StrMap.fromFoldable $
               [ Tuple "effect" (encode a.effect)
               , Tuple "key" (encode a.key)
               , Tuple "timeAdded" (encode a.timeAdded)
               , Tuple "value" (encode a.value) ]


instance defaultTaint :: Default Taint where
  default = Taint
    { effect: NullOrUndefined Nothing
    , key: NullOrUndefined Nothing
    , timeAdded: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>.
-- |
-- | Fields:
-- | - `effect`: Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.
-- | - `key`: Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys.
-- | - `operator`: Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category.
-- | - `tolerationSeconds`: TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system.
-- | - `value`: Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string.
newtype Toleration = Toleration
  { effect :: (NullOrUndefined String)
  , key :: (NullOrUndefined String)
  , operator :: (NullOrUndefined String)
  , tolerationSeconds :: (NullOrUndefined Int)
  , value :: (NullOrUndefined String) }

derive instance newtypeToleration :: Newtype Toleration _
derive instance genericToleration :: Generic Toleration _
instance showToleration :: Show Toleration where show a = genericShow a
instance decodeToleration :: Decode Toleration where
  decode a = do
               effect <- readProp "effect" a >>= decode
               key <- readProp "key" a >>= decode
               operator <- readProp "operator" a >>= decode
               tolerationSeconds <- readProp "tolerationSeconds" a >>= decode
               value <- readProp "value" a >>= decode
               pure $ Toleration { effect, key, operator, tolerationSeconds, value }
instance encodeToleration :: Encode Toleration where
  encode (Toleration a) = encode $ StrMap.fromFoldable $
               [ Tuple "effect" (encode a.effect)
               , Tuple "key" (encode a.key)
               , Tuple "operator" (encode a.operator)
               , Tuple "tolerationSeconds" (encode a.tolerationSeconds)
               , Tuple "value" (encode a.value) ]


instance defaultToleration :: Default Toleration where
  default = Toleration
    { effect: NullOrUndefined Nothing
    , key: NullOrUndefined Nothing
    , operator: NullOrUndefined Nothing
    , tolerationSeconds: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | Volume represents a named volume in a pod that may be accessed by any container in the pod.
-- |
-- | Fields:
-- | - `awsElasticBlockStore`: AWSElasticBlockStore represents an AWS Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
-- | - `azureDisk`: AzureDisk represents an Azure Data Disk mount on the host and bind mount to the pod.
-- | - `azureFile`: AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
-- | - `cephfs`: CephFS represents a Ceph FS mount on the host that shares a pod's lifetime
-- | - `cinder`: Cinder represents a cinder volume attached and mounted on kubelets host machine More info: https://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md
-- | - `configMap`: ConfigMap represents a configMap that should populate this volume
-- | - `downwardAPI`: DownwardAPI represents downward API about the pod that should populate this volume
-- | - `emptyDir`: EmptyDir represents a temporary directory that shares a pod's lifetime. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir
-- | - `fc`: FC represents a Fibre Channel resource that is attached to a kubelet's host machine and then exposed to the pod.
-- | - `flexVolume`: FlexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin.
-- | - `flocker`: Flocker represents a Flocker volume attached to a kubelet's host machine. This depends on the Flocker control service being running
-- | - `gcePersistentDisk`: GCEPersistentDisk represents a GCE Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
-- | - `gitRepo`: GitRepo represents a git repository at a particular revision.
-- | - `glusterfs`: Glusterfs represents a Glusterfs mount on the host that shares a pod's lifetime. More info: https://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md
-- | - `hostPath`: HostPath represents a pre-existing file or directory on the host machine that is directly exposed to the container. This is generally used for system agents or other privileged things that are allowed to see the host machine. Most containers will NOT need this. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
-- | - `iscsi`: ISCSI represents an ISCSI Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://releases.k8s.io/HEAD/examples/volumes/iscsi/README.md
-- | - `name`: Volume's name. Must be a DNS_LABEL and unique within the pod. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `nfs`: NFS represents an NFS mount on the host that shares a pod's lifetime More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
-- | - `persistentVolumeClaim`: PersistentVolumeClaimVolumeSource represents a reference to a PersistentVolumeClaim in the same namespace. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
-- | - `photonPersistentDisk`: PhotonPersistentDisk represents a PhotonController persistent disk attached and mounted on kubelets host machine
-- | - `portworxVolume`: PortworxVolume represents a portworx volume attached and mounted on kubelets host machine
-- | - `projected`: Items for all in one resources secrets, configmaps, and downward API
-- | - `quobyte`: Quobyte represents a Quobyte mount on the host that shares a pod's lifetime
-- | - `rbd`: RBD represents a Rados Block Device mount on the host that shares a pod's lifetime. More info: https://releases.k8s.io/HEAD/examples/volumes/rbd/README.md
-- | - `scaleIO`: ScaleIO represents a ScaleIO persistent volume attached and mounted on Kubernetes nodes.
-- | - `secret`: Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret
-- | - `storageos`: StorageOS represents a StorageOS volume attached and mounted on Kubernetes nodes.
-- | - `vsphereVolume`: VsphereVolume represents a vSphere volume attached and mounted on kubelets host machine
newtype Volume = Volume
  { awsElasticBlockStore :: (NullOrUndefined AWSElasticBlockStoreVolumeSource)
  , azureDisk :: (NullOrUndefined AzureDiskVolumeSource)
  , azureFile :: (NullOrUndefined AzureFileVolumeSource)
  , cephfs :: (NullOrUndefined CephFSVolumeSource)
  , cinder :: (NullOrUndefined CinderVolumeSource)
  , configMap :: (NullOrUndefined ConfigMapVolumeSource)
  , downwardAPI :: (NullOrUndefined DownwardAPIVolumeSource)
  , emptyDir :: (NullOrUndefined EmptyDirVolumeSource)
  , fc :: (NullOrUndefined FCVolumeSource)
  , flexVolume :: (NullOrUndefined FlexVolumeSource)
  , flocker :: (NullOrUndefined FlockerVolumeSource)
  , gcePersistentDisk :: (NullOrUndefined GCEPersistentDiskVolumeSource)
  , gitRepo :: (NullOrUndefined GitRepoVolumeSource)
  , glusterfs :: (NullOrUndefined GlusterfsVolumeSource)
  , hostPath :: (NullOrUndefined HostPathVolumeSource)
  , iscsi :: (NullOrUndefined ISCSIVolumeSource)
  , name :: (NullOrUndefined String)
  , nfs :: (NullOrUndefined NFSVolumeSource)
  , persistentVolumeClaim :: (NullOrUndefined PersistentVolumeClaimVolumeSource)
  , photonPersistentDisk :: (NullOrUndefined PhotonPersistentDiskVolumeSource)
  , portworxVolume :: (NullOrUndefined PortworxVolumeSource)
  , projected :: (NullOrUndefined ProjectedVolumeSource)
  , quobyte :: (NullOrUndefined QuobyteVolumeSource)
  , rbd :: (NullOrUndefined RBDVolumeSource)
  , scaleIO :: (NullOrUndefined ScaleIOVolumeSource)
  , secret :: (NullOrUndefined SecretVolumeSource)
  , storageos :: (NullOrUndefined StorageOSVolumeSource)
  , vsphereVolume :: (NullOrUndefined VsphereVirtualDiskVolumeSource) }

derive instance newtypeVolume :: Newtype Volume _
derive instance genericVolume :: Generic Volume _
instance showVolume :: Show Volume where show a = genericShow a
instance decodeVolume :: Decode Volume where
  decode a = do
               awsElasticBlockStore <- readProp "awsElasticBlockStore" a >>= decode
               azureDisk <- readProp "azureDisk" a >>= decode
               azureFile <- readProp "azureFile" a >>= decode
               cephfs <- readProp "cephfs" a >>= decode
               cinder <- readProp "cinder" a >>= decode
               configMap <- readProp "configMap" a >>= decode
               downwardAPI <- readProp "downwardAPI" a >>= decode
               emptyDir <- readProp "emptyDir" a >>= decode
               fc <- readProp "fc" a >>= decode
               flexVolume <- readProp "flexVolume" a >>= decode
               flocker <- readProp "flocker" a >>= decode
               gcePersistentDisk <- readProp "gcePersistentDisk" a >>= decode
               gitRepo <- readProp "gitRepo" a >>= decode
               glusterfs <- readProp "glusterfs" a >>= decode
               hostPath <- readProp "hostPath" a >>= decode
               iscsi <- readProp "iscsi" a >>= decode
               name <- readProp "name" a >>= decode
               nfs <- readProp "nfs" a >>= decode
               persistentVolumeClaim <- readProp "persistentVolumeClaim" a >>= decode
               photonPersistentDisk <- readProp "photonPersistentDisk" a >>= decode
               portworxVolume <- readProp "portworxVolume" a >>= decode
               projected <- readProp "projected" a >>= decode
               quobyte <- readProp "quobyte" a >>= decode
               rbd <- readProp "rbd" a >>= decode
               scaleIO <- readProp "scaleIO" a >>= decode
               secret <- readProp "secret" a >>= decode
               storageos <- readProp "storageos" a >>= decode
               vsphereVolume <- readProp "vsphereVolume" a >>= decode
               pure $ Volume { awsElasticBlockStore, azureDisk, azureFile, cephfs, cinder, configMap, downwardAPI, emptyDir, fc, flexVolume, flocker, gcePersistentDisk, gitRepo, glusterfs, hostPath, iscsi, name, nfs, persistentVolumeClaim, photonPersistentDisk, portworxVolume, projected, quobyte, rbd, scaleIO, secret, storageos, vsphereVolume }
instance encodeVolume :: Encode Volume where
  encode (Volume a) = encode $ StrMap.fromFoldable $
               [ Tuple "awsElasticBlockStore" (encode a.awsElasticBlockStore)
               , Tuple "azureDisk" (encode a.azureDisk)
               , Tuple "azureFile" (encode a.azureFile)
               , Tuple "cephfs" (encode a.cephfs)
               , Tuple "cinder" (encode a.cinder)
               , Tuple "configMap" (encode a.configMap)
               , Tuple "downwardAPI" (encode a.downwardAPI)
               , Tuple "emptyDir" (encode a.emptyDir)
               , Tuple "fc" (encode a.fc)
               , Tuple "flexVolume" (encode a.flexVolume)
               , Tuple "flocker" (encode a.flocker)
               , Tuple "gcePersistentDisk" (encode a.gcePersistentDisk)
               , Tuple "gitRepo" (encode a.gitRepo)
               , Tuple "glusterfs" (encode a.glusterfs)
               , Tuple "hostPath" (encode a.hostPath)
               , Tuple "iscsi" (encode a.iscsi)
               , Tuple "name" (encode a.name)
               , Tuple "nfs" (encode a.nfs)
               , Tuple "persistentVolumeClaim" (encode a.persistentVolumeClaim)
               , Tuple "photonPersistentDisk" (encode a.photonPersistentDisk)
               , Tuple "portworxVolume" (encode a.portworxVolume)
               , Tuple "projected" (encode a.projected)
               , Tuple "quobyte" (encode a.quobyte)
               , Tuple "rbd" (encode a.rbd)
               , Tuple "scaleIO" (encode a.scaleIO)
               , Tuple "secret" (encode a.secret)
               , Tuple "storageos" (encode a.storageos)
               , Tuple "vsphereVolume" (encode a.vsphereVolume) ]


instance defaultVolume :: Default Volume where
  default = Volume
    { awsElasticBlockStore: NullOrUndefined Nothing
    , azureDisk: NullOrUndefined Nothing
    , azureFile: NullOrUndefined Nothing
    , cephfs: NullOrUndefined Nothing
    , cinder: NullOrUndefined Nothing
    , configMap: NullOrUndefined Nothing
    , downwardAPI: NullOrUndefined Nothing
    , emptyDir: NullOrUndefined Nothing
    , fc: NullOrUndefined Nothing
    , flexVolume: NullOrUndefined Nothing
    , flocker: NullOrUndefined Nothing
    , gcePersistentDisk: NullOrUndefined Nothing
    , gitRepo: NullOrUndefined Nothing
    , glusterfs: NullOrUndefined Nothing
    , hostPath: NullOrUndefined Nothing
    , iscsi: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , nfs: NullOrUndefined Nothing
    , persistentVolumeClaim: NullOrUndefined Nothing
    , photonPersistentDisk: NullOrUndefined Nothing
    , portworxVolume: NullOrUndefined Nothing
    , projected: NullOrUndefined Nothing
    , quobyte: NullOrUndefined Nothing
    , rbd: NullOrUndefined Nothing
    , scaleIO: NullOrUndefined Nothing
    , secret: NullOrUndefined Nothing
    , storageos: NullOrUndefined Nothing
    , vsphereVolume: NullOrUndefined Nothing }

-- | volumeDevice describes a mapping of a raw block device within a container.
-- |
-- | Fields:
-- | - `devicePath`: devicePath is the path inside of the container that the device will be mapped to.
-- | - `name`: name must match the name of a persistentVolumeClaim in the pod
newtype VolumeDevice = VolumeDevice
  { devicePath :: (NullOrUndefined String)
  , name :: (NullOrUndefined String) }

derive instance newtypeVolumeDevice :: Newtype VolumeDevice _
derive instance genericVolumeDevice :: Generic VolumeDevice _
instance showVolumeDevice :: Show VolumeDevice where show a = genericShow a
instance decodeVolumeDevice :: Decode VolumeDevice where
  decode a = do
               devicePath <- readProp "devicePath" a >>= decode
               name <- readProp "name" a >>= decode
               pure $ VolumeDevice { devicePath, name }
instance encodeVolumeDevice :: Encode VolumeDevice where
  encode (VolumeDevice a) = encode $ StrMap.fromFoldable $
               [ Tuple "devicePath" (encode a.devicePath)
               , Tuple "name" (encode a.name) ]


instance defaultVolumeDevice :: Default VolumeDevice where
  default = VolumeDevice
    { devicePath: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | VolumeMount describes a mounting of a Volume within a container.
-- |
-- | Fields:
-- | - `mountPath`: Path within the container at which the volume should be mounted.  Must not contain ':'.
-- | - `mountPropagation`: mountPropagation determines how mounts are propagated from the host to container and the other way around. When not set, MountPropagationHostToContainer is used. This field is alpha in 1.8 and can be reworked or removed in a future release.
-- | - `name`: This must match the Name of a Volume.
-- | - `readOnly`: Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.
-- | - `subPath`: Path within the volume from which the container's volume should be mounted. Defaults to "" (volume's root).
newtype VolumeMount = VolumeMount
  { mountPath :: (NullOrUndefined String)
  , mountPropagation :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , subPath :: (NullOrUndefined String) }

derive instance newtypeVolumeMount :: Newtype VolumeMount _
derive instance genericVolumeMount :: Generic VolumeMount _
instance showVolumeMount :: Show VolumeMount where show a = genericShow a
instance decodeVolumeMount :: Decode VolumeMount where
  decode a = do
               mountPath <- readProp "mountPath" a >>= decode
               mountPropagation <- readProp "mountPropagation" a >>= decode
               name <- readProp "name" a >>= decode
               readOnly <- readProp "readOnly" a >>= decode
               subPath <- readProp "subPath" a >>= decode
               pure $ VolumeMount { mountPath, mountPropagation, name, readOnly, subPath }
instance encodeVolumeMount :: Encode VolumeMount where
  encode (VolumeMount a) = encode $ StrMap.fromFoldable $
               [ Tuple "mountPath" (encode a.mountPath)
               , Tuple "mountPropagation" (encode a.mountPropagation)
               , Tuple "name" (encode a.name)
               , Tuple "readOnly" (encode a.readOnly)
               , Tuple "subPath" (encode a.subPath) ]


instance defaultVolumeMount :: Default VolumeMount where
  default = VolumeMount
    { mountPath: NullOrUndefined Nothing
    , mountPropagation: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , subPath: NullOrUndefined Nothing }

-- | Projection that may be projected along with other supported volume types
-- |
-- | Fields:
-- | - `configMap`: information about the configMap data to project
-- | - `downwardAPI`: information about the downwardAPI data to project
-- | - `secret`: information about the secret data to project
newtype VolumeProjection = VolumeProjection
  { configMap :: (NullOrUndefined ConfigMapProjection)
  , downwardAPI :: (NullOrUndefined DownwardAPIProjection)
  , secret :: (NullOrUndefined SecretProjection) }

derive instance newtypeVolumeProjection :: Newtype VolumeProjection _
derive instance genericVolumeProjection :: Generic VolumeProjection _
instance showVolumeProjection :: Show VolumeProjection where show a = genericShow a
instance decodeVolumeProjection :: Decode VolumeProjection where
  decode a = do
               configMap <- readProp "configMap" a >>= decode
               downwardAPI <- readProp "downwardAPI" a >>= decode
               secret <- readProp "secret" a >>= decode
               pure $ VolumeProjection { configMap, downwardAPI, secret }
instance encodeVolumeProjection :: Encode VolumeProjection where
  encode (VolumeProjection a) = encode $ StrMap.fromFoldable $
               [ Tuple "configMap" (encode a.configMap)
               , Tuple "downwardAPI" (encode a.downwardAPI)
               , Tuple "secret" (encode a.secret) ]


instance defaultVolumeProjection :: Default VolumeProjection where
  default = VolumeProjection
    { configMap: NullOrUndefined Nothing
    , downwardAPI: NullOrUndefined Nothing
    , secret: NullOrUndefined Nothing }

-- | Represents a vSphere volume resource.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `storagePolicyID`: Storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName.
-- | - `storagePolicyName`: Storage Policy Based Management (SPBM) profile name.
-- | - `volumePath`: Path that identifies vSphere volume vmdk
newtype VsphereVirtualDiskVolumeSource = VsphereVirtualDiskVolumeSource
  { fsType :: (NullOrUndefined String)
  , storagePolicyID :: (NullOrUndefined String)
  , storagePolicyName :: (NullOrUndefined String)
  , volumePath :: (NullOrUndefined String) }

derive instance newtypeVsphereVirtualDiskVolumeSource :: Newtype VsphereVirtualDiskVolumeSource _
derive instance genericVsphereVirtualDiskVolumeSource :: Generic VsphereVirtualDiskVolumeSource _
instance showVsphereVirtualDiskVolumeSource :: Show VsphereVirtualDiskVolumeSource where show a = genericShow a
instance decodeVsphereVirtualDiskVolumeSource :: Decode VsphereVirtualDiskVolumeSource where
  decode a = do
               fsType <- readProp "fsType" a >>= decode
               storagePolicyID <- readProp "storagePolicyID" a >>= decode
               storagePolicyName <- readProp "storagePolicyName" a >>= decode
               volumePath <- readProp "volumePath" a >>= decode
               pure $ VsphereVirtualDiskVolumeSource { fsType, storagePolicyID, storagePolicyName, volumePath }
instance encodeVsphereVirtualDiskVolumeSource :: Encode VsphereVirtualDiskVolumeSource where
  encode (VsphereVirtualDiskVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encode a.fsType)
               , Tuple "storagePolicyID" (encode a.storagePolicyID)
               , Tuple "storagePolicyName" (encode a.storagePolicyName)
               , Tuple "volumePath" (encode a.volumePath) ]


instance defaultVsphereVirtualDiskVolumeSource :: Default VsphereVirtualDiskVolumeSource where
  default = VsphereVirtualDiskVolumeSource
    { fsType: NullOrUndefined Nothing
    , storagePolicyID: NullOrUndefined Nothing
    , storagePolicyName: NullOrUndefined Nothing
    , volumePath: NullOrUndefined Nothing }

-- | The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)
-- |
-- | Fields:
-- | - `podAffinityTerm`: Required. A pod affinity term, associated with the corresponding weight.
-- | - `weight`: weight associated with matching the corresponding podAffinityTerm, in the range 1-100.
newtype WeightedPodAffinityTerm = WeightedPodAffinityTerm
  { podAffinityTerm :: (NullOrUndefined PodAffinityTerm)
  , weight :: (NullOrUndefined Int) }

derive instance newtypeWeightedPodAffinityTerm :: Newtype WeightedPodAffinityTerm _
derive instance genericWeightedPodAffinityTerm :: Generic WeightedPodAffinityTerm _
instance showWeightedPodAffinityTerm :: Show WeightedPodAffinityTerm where show a = genericShow a
instance decodeWeightedPodAffinityTerm :: Decode WeightedPodAffinityTerm where
  decode a = do
               podAffinityTerm <- readProp "podAffinityTerm" a >>= decode
               weight <- readProp "weight" a >>= decode
               pure $ WeightedPodAffinityTerm { podAffinityTerm, weight }
instance encodeWeightedPodAffinityTerm :: Encode WeightedPodAffinityTerm where
  encode (WeightedPodAffinityTerm a) = encode $ StrMap.fromFoldable $
               [ Tuple "podAffinityTerm" (encode a.podAffinityTerm)
               , Tuple "weight" (encode a.weight) ]


instance defaultWeightedPodAffinityTerm :: Default WeightedPodAffinityTerm where
  default = WeightedPodAffinityTerm
    { podAffinityTerm: NullOrUndefined Nothing
    , weight: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/"