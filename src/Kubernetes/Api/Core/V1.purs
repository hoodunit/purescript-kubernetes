module Kubernetes.Api.Core.V1 where

import Prelude
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
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Kubernetes.Api.Meta.V1 as MetaV1
import Kubernetes.Api.Resource as Resource
import Kubernetes.Api.Util as Util

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
  { fsType :: (Maybe String)
  , partition :: (Maybe Int)
  , readOnly :: (Maybe Boolean)
  , volumeID :: (Maybe String) }

derive instance newtypeAWSElasticBlockStoreVolumeSource :: Newtype AWSElasticBlockStoreVolumeSource _
derive instance genericAWSElasticBlockStoreVolumeSource :: Generic AWSElasticBlockStoreVolumeSource _
instance showAWSElasticBlockStoreVolumeSource :: Show AWSElasticBlockStoreVolumeSource where show a = genericShow a
instance decodeAWSElasticBlockStoreVolumeSource :: Decode AWSElasticBlockStoreVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               partition <- decodeMaybe "partition" a
               readOnly <- decodeMaybe "readOnly" a
               volumeID <- decodeMaybe "volumeID" a
               pure $ AWSElasticBlockStoreVolumeSource { fsType, partition, readOnly, volumeID }
instance encodeAWSElasticBlockStoreVolumeSource :: Encode AWSElasticBlockStoreVolumeSource where
  encode (AWSElasticBlockStoreVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "partition" (encodeMaybe a.partition)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "volumeID" (encodeMaybe a.volumeID) ]


instance defaultAWSElasticBlockStoreVolumeSource :: Default AWSElasticBlockStoreVolumeSource where
  default = AWSElasticBlockStoreVolumeSource
    { fsType: Nothing
    , partition: Nothing
    , readOnly: Nothing
    , volumeID: Nothing }

-- | Affinity is a group of affinity scheduling rules.
-- |
-- | Fields:
-- | - `nodeAffinity`: Describes node affinity scheduling rules for the pod.
-- | - `podAffinity`: Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone, etc. as some other pod(s)).
-- | - `podAntiAffinity`: Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same node, zone, etc. as some other pod(s)).
newtype Affinity = Affinity
  { nodeAffinity :: (Maybe NodeAffinity)
  , podAffinity :: (Maybe PodAffinity)
  , podAntiAffinity :: (Maybe PodAntiAffinity) }

derive instance newtypeAffinity :: Newtype Affinity _
derive instance genericAffinity :: Generic Affinity _
instance showAffinity :: Show Affinity where show a = genericShow a
instance decodeAffinity :: Decode Affinity where
  decode a = do
               nodeAffinity <- decodeMaybe "nodeAffinity" a
               podAffinity <- decodeMaybe "podAffinity" a
               podAntiAffinity <- decodeMaybe "podAntiAffinity" a
               pure $ Affinity { nodeAffinity, podAffinity, podAntiAffinity }
instance encodeAffinity :: Encode Affinity where
  encode (Affinity a) = encode $ StrMap.fromFoldable $
               [ Tuple "nodeAffinity" (encodeMaybe a.nodeAffinity)
               , Tuple "podAffinity" (encodeMaybe a.podAffinity)
               , Tuple "podAntiAffinity" (encodeMaybe a.podAntiAffinity) ]


instance defaultAffinity :: Default Affinity where
  default = Affinity
    { nodeAffinity: Nothing
    , podAffinity: Nothing
    , podAntiAffinity: Nothing }

-- | AttachedVolume describes a volume attached to a node
-- |
-- | Fields:
-- | - `devicePath`: DevicePath represents the device path where the volume should be available
-- | - `name`: Name of the attached volume
newtype AttachedVolume = AttachedVolume
  { devicePath :: (Maybe String)
  , name :: (Maybe String) }

derive instance newtypeAttachedVolume :: Newtype AttachedVolume _
derive instance genericAttachedVolume :: Generic AttachedVolume _
instance showAttachedVolume :: Show AttachedVolume where show a = genericShow a
instance decodeAttachedVolume :: Decode AttachedVolume where
  decode a = do
               devicePath <- decodeMaybe "devicePath" a
               name <- decodeMaybe "name" a
               pure $ AttachedVolume { devicePath, name }
instance encodeAttachedVolume :: Encode AttachedVolume where
  encode (AttachedVolume a) = encode $ StrMap.fromFoldable $
               [ Tuple "devicePath" (encodeMaybe a.devicePath)
               , Tuple "name" (encodeMaybe a.name) ]


instance defaultAttachedVolume :: Default AttachedVolume where
  default = AttachedVolume
    { devicePath: Nothing
    , name: Nothing }

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
  { cachingMode :: (Maybe String)
  , diskName :: (Maybe String)
  , diskURI :: (Maybe String)
  , fsType :: (Maybe String)
  , kind :: (Maybe String)
  , readOnly :: (Maybe Boolean) }

derive instance newtypeAzureDiskVolumeSource :: Newtype AzureDiskVolumeSource _
derive instance genericAzureDiskVolumeSource :: Generic AzureDiskVolumeSource _
instance showAzureDiskVolumeSource :: Show AzureDiskVolumeSource where show a = genericShow a
instance decodeAzureDiskVolumeSource :: Decode AzureDiskVolumeSource where
  decode a = do
               cachingMode <- decodeMaybe "cachingMode" a
               diskName <- decodeMaybe "diskName" a
               diskURI <- decodeMaybe "diskURI" a
               fsType <- decodeMaybe "fsType" a
               kind <- decodeMaybe "kind" a
               readOnly <- decodeMaybe "readOnly" a
               pure $ AzureDiskVolumeSource { cachingMode, diskName, diskURI, fsType, kind, readOnly }
instance encodeAzureDiskVolumeSource :: Encode AzureDiskVolumeSource where
  encode (AzureDiskVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "cachingMode" (encodeMaybe a.cachingMode)
               , Tuple "diskName" (encodeMaybe a.diskName)
               , Tuple "diskURI" (encodeMaybe a.diskURI)
               , Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "readOnly" (encodeMaybe a.readOnly) ]


instance defaultAzureDiskVolumeSource :: Default AzureDiskVolumeSource where
  default = AzureDiskVolumeSource
    { cachingMode: Nothing
    , diskName: Nothing
    , diskURI: Nothing
    , fsType: Nothing
    , kind: Nothing
    , readOnly: Nothing }

-- | AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
-- |
-- | Fields:
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretName`: the name of secret that contains Azure Storage Account Name and Key
-- | - `secretNamespace`: the namespace of the secret that contains Azure Storage Account Name and Key default is the same as the Pod
-- | - `shareName`: Share Name
newtype AzureFilePersistentVolumeSource = AzureFilePersistentVolumeSource
  { readOnly :: (Maybe Boolean)
  , secretName :: (Maybe String)
  , secretNamespace :: (Maybe String)
  , shareName :: (Maybe String) }

derive instance newtypeAzureFilePersistentVolumeSource :: Newtype AzureFilePersistentVolumeSource _
derive instance genericAzureFilePersistentVolumeSource :: Generic AzureFilePersistentVolumeSource _
instance showAzureFilePersistentVolumeSource :: Show AzureFilePersistentVolumeSource where show a = genericShow a
instance decodeAzureFilePersistentVolumeSource :: Decode AzureFilePersistentVolumeSource where
  decode a = do
               readOnly <- decodeMaybe "readOnly" a
               secretName <- decodeMaybe "secretName" a
               secretNamespace <- decodeMaybe "secretNamespace" a
               shareName <- decodeMaybe "shareName" a
               pure $ AzureFilePersistentVolumeSource { readOnly, secretName, secretNamespace, shareName }
instance encodeAzureFilePersistentVolumeSource :: Encode AzureFilePersistentVolumeSource where
  encode (AzureFilePersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretName" (encodeMaybe a.secretName)
               , Tuple "secretNamespace" (encodeMaybe a.secretNamespace)
               , Tuple "shareName" (encodeMaybe a.shareName) ]


instance defaultAzureFilePersistentVolumeSource :: Default AzureFilePersistentVolumeSource where
  default = AzureFilePersistentVolumeSource
    { readOnly: Nothing
    , secretName: Nothing
    , secretNamespace: Nothing
    , shareName: Nothing }

-- | AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
-- |
-- | Fields:
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretName`: the name of secret that contains Azure Storage Account Name and Key
-- | - `shareName`: Share Name
newtype AzureFileVolumeSource = AzureFileVolumeSource
  { readOnly :: (Maybe Boolean)
  , secretName :: (Maybe String)
  , shareName :: (Maybe String) }

derive instance newtypeAzureFileVolumeSource :: Newtype AzureFileVolumeSource _
derive instance genericAzureFileVolumeSource :: Generic AzureFileVolumeSource _
instance showAzureFileVolumeSource :: Show AzureFileVolumeSource where show a = genericShow a
instance decodeAzureFileVolumeSource :: Decode AzureFileVolumeSource where
  decode a = do
               readOnly <- decodeMaybe "readOnly" a
               secretName <- decodeMaybe "secretName" a
               shareName <- decodeMaybe "shareName" a
               pure $ AzureFileVolumeSource { readOnly, secretName, shareName }
instance encodeAzureFileVolumeSource :: Encode AzureFileVolumeSource where
  encode (AzureFileVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretName" (encodeMaybe a.secretName)
               , Tuple "shareName" (encodeMaybe a.shareName) ]


instance defaultAzureFileVolumeSource :: Default AzureFileVolumeSource where
  default = AzureFileVolumeSource
    { readOnly: Nothing
    , secretName: Nothing
    , shareName: Nothing }

-- | Binding ties one object to another; for example, a pod is bound to a node by a scheduler. Deprecated in 1.7, please use the bindings subresource of pods instead.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `target`: The target object that you want to bind to the standard object.
newtype Binding = Binding
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , target :: (Maybe ObjectReference) }

derive instance newtypeBinding :: Newtype Binding _
derive instance genericBinding :: Generic Binding _
instance showBinding :: Show Binding where show a = genericShow a
instance decodeBinding :: Decode Binding where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "Binding" a
               metadata <- decodeMaybe "metadata" a
               target <- decodeMaybe "target" a
               pure $ Binding { metadata, target }
instance encodeBinding :: Encode Binding where
  encode (Binding a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "Binding")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "target" (encodeMaybe a.target) ]


instance defaultBinding :: Default Binding where
  default = Binding
    { metadata: Nothing
    , target: Nothing }

-- | Represents storage that is managed by an external CSI volume driver
-- |
-- | Fields:
-- | - `driver`: Driver is the name of the driver to use for this volume. Required.
-- | - `readOnly`: Optional: The value to pass to ControllerPublishVolumeRequest. Defaults to false (read/write).
-- | - `volumeHandle`: VolumeHandle is the unique volume name returned by the CSI volume plugin’s CreateVolume to refer to the volume on all subsequent calls. Required.
newtype CSIPersistentVolumeSource = CSIPersistentVolumeSource
  { driver :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , volumeHandle :: (Maybe String) }

derive instance newtypeCSIPersistentVolumeSource :: Newtype CSIPersistentVolumeSource _
derive instance genericCSIPersistentVolumeSource :: Generic CSIPersistentVolumeSource _
instance showCSIPersistentVolumeSource :: Show CSIPersistentVolumeSource where show a = genericShow a
instance decodeCSIPersistentVolumeSource :: Decode CSIPersistentVolumeSource where
  decode a = do
               driver <- decodeMaybe "driver" a
               readOnly <- decodeMaybe "readOnly" a
               volumeHandle <- decodeMaybe "volumeHandle" a
               pure $ CSIPersistentVolumeSource { driver, readOnly, volumeHandle }
instance encodeCSIPersistentVolumeSource :: Encode CSIPersistentVolumeSource where
  encode (CSIPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "driver" (encodeMaybe a.driver)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "volumeHandle" (encodeMaybe a.volumeHandle) ]


instance defaultCSIPersistentVolumeSource :: Default CSIPersistentVolumeSource where
  default = CSIPersistentVolumeSource
    { driver: Nothing
    , readOnly: Nothing
    , volumeHandle: Nothing }

-- | Adds and removes POSIX capabilities from running containers.
-- |
-- | Fields:
-- | - `add`: Added capabilities
-- | - `drop`: Removed capabilities
newtype Capabilities = Capabilities
  { add :: (Maybe (Array String))
  , drop :: (Maybe (Array String)) }

derive instance newtypeCapabilities :: Newtype Capabilities _
derive instance genericCapabilities :: Generic Capabilities _
instance showCapabilities :: Show Capabilities where show a = genericShow a
instance decodeCapabilities :: Decode Capabilities where
  decode a = do
               add <- decodeMaybe "add" a
               drop <- decodeMaybe "drop" a
               pure $ Capabilities { add, drop }
instance encodeCapabilities :: Encode Capabilities where
  encode (Capabilities a) = encode $ StrMap.fromFoldable $
               [ Tuple "add" (encodeMaybe a.add)
               , Tuple "drop" (encodeMaybe a.drop) ]


instance defaultCapabilities :: Default Capabilities where
  default = Capabilities
    { add: Nothing
    , drop: Nothing }

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
  { monitors :: (Maybe (Array String))
  , path :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , secretFile :: (Maybe String)
  , secretRef :: (Maybe SecretReference)
  , user :: (Maybe String) }

derive instance newtypeCephFSPersistentVolumeSource :: Newtype CephFSPersistentVolumeSource _
derive instance genericCephFSPersistentVolumeSource :: Generic CephFSPersistentVolumeSource _
instance showCephFSPersistentVolumeSource :: Show CephFSPersistentVolumeSource where show a = genericShow a
instance decodeCephFSPersistentVolumeSource :: Decode CephFSPersistentVolumeSource where
  decode a = do
               monitors <- decodeMaybe "monitors" a
               path <- decodeMaybe "path" a
               readOnly <- decodeMaybe "readOnly" a
               secretFile <- decodeMaybe "secretFile" a
               secretRef <- decodeMaybe "secretRef" a
               user <- decodeMaybe "user" a
               pure $ CephFSPersistentVolumeSource { monitors, path, readOnly, secretFile, secretRef, user }
instance encodeCephFSPersistentVolumeSource :: Encode CephFSPersistentVolumeSource where
  encode (CephFSPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "monitors" (encodeMaybe a.monitors)
               , Tuple "path" (encodeMaybe a.path)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretFile" (encodeMaybe a.secretFile)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "user" (encodeMaybe a.user) ]


instance defaultCephFSPersistentVolumeSource :: Default CephFSPersistentVolumeSource where
  default = CephFSPersistentVolumeSource
    { monitors: Nothing
    , path: Nothing
    , readOnly: Nothing
    , secretFile: Nothing
    , secretRef: Nothing
    , user: Nothing }

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
  { monitors :: (Maybe (Array String))
  , path :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , secretFile :: (Maybe String)
  , secretRef :: (Maybe LocalObjectReference)
  , user :: (Maybe String) }

derive instance newtypeCephFSVolumeSource :: Newtype CephFSVolumeSource _
derive instance genericCephFSVolumeSource :: Generic CephFSVolumeSource _
instance showCephFSVolumeSource :: Show CephFSVolumeSource where show a = genericShow a
instance decodeCephFSVolumeSource :: Decode CephFSVolumeSource where
  decode a = do
               monitors <- decodeMaybe "monitors" a
               path <- decodeMaybe "path" a
               readOnly <- decodeMaybe "readOnly" a
               secretFile <- decodeMaybe "secretFile" a
               secretRef <- decodeMaybe "secretRef" a
               user <- decodeMaybe "user" a
               pure $ CephFSVolumeSource { monitors, path, readOnly, secretFile, secretRef, user }
instance encodeCephFSVolumeSource :: Encode CephFSVolumeSource where
  encode (CephFSVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "monitors" (encodeMaybe a.monitors)
               , Tuple "path" (encodeMaybe a.path)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretFile" (encodeMaybe a.secretFile)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "user" (encodeMaybe a.user) ]


instance defaultCephFSVolumeSource :: Default CephFSVolumeSource where
  default = CephFSVolumeSource
    { monitors: Nothing
    , path: Nothing
    , readOnly: Nothing
    , secretFile: Nothing
    , secretRef: Nothing
    , user: Nothing }

-- | Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md
-- | - `volumeID`: volume id used to identify the volume in cinder More info: https://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md
newtype CinderVolumeSource = CinderVolumeSource
  { fsType :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , volumeID :: (Maybe String) }

derive instance newtypeCinderVolumeSource :: Newtype CinderVolumeSource _
derive instance genericCinderVolumeSource :: Generic CinderVolumeSource _
instance showCinderVolumeSource :: Show CinderVolumeSource where show a = genericShow a
instance decodeCinderVolumeSource :: Decode CinderVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               readOnly <- decodeMaybe "readOnly" a
               volumeID <- decodeMaybe "volumeID" a
               pure $ CinderVolumeSource { fsType, readOnly, volumeID }
instance encodeCinderVolumeSource :: Encode CinderVolumeSource where
  encode (CinderVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "volumeID" (encodeMaybe a.volumeID) ]


instance defaultCinderVolumeSource :: Default CinderVolumeSource where
  default = CinderVolumeSource
    { fsType: Nothing
    , readOnly: Nothing
    , volumeID: Nothing }

-- | ClientIPConfig represents the configurations of Client IP based session affinity.
-- |
-- | Fields:
-- | - `timeoutSeconds`: timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for 3 hours).
newtype ClientIPConfig = ClientIPConfig
  { timeoutSeconds :: (Maybe Int) }

derive instance newtypeClientIPConfig :: Newtype ClientIPConfig _
derive instance genericClientIPConfig :: Generic ClientIPConfig _
instance showClientIPConfig :: Show ClientIPConfig where show a = genericShow a
instance decodeClientIPConfig :: Decode ClientIPConfig where
  decode a = do
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               pure $ ClientIPConfig { timeoutSeconds }
instance encodeClientIPConfig :: Encode ClientIPConfig where
  encode (ClientIPConfig a) = encode $ StrMap.fromFoldable $
               [ Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds) ]


instance defaultClientIPConfig :: Default ClientIPConfig where
  default = ClientIPConfig
    { timeoutSeconds: Nothing }

-- | Information about the condition of a component.
-- |
-- | Fields:
-- | - `_type`: Type of condition for a component. Valid value: "Healthy"
-- | - `error`: Condition error code for a component. For example, a health check error code.
-- | - `message`: Message about the condition for a component. For example, information about a health check.
-- | - `status`: Status of the condition for a component. Valid values for "Healthy": "True", "False", or "Unknown".
newtype ComponentCondition = ComponentCondition
  { _type :: (Maybe String)
  , error :: (Maybe String)
  , message :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeComponentCondition :: Newtype ComponentCondition _
derive instance genericComponentCondition :: Generic ComponentCondition _
instance showComponentCondition :: Show ComponentCondition where show a = genericShow a
instance decodeComponentCondition :: Decode ComponentCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               error <- decodeMaybe "error" a
               message <- decodeMaybe "message" a
               status <- decodeMaybe "status" a
               pure $ ComponentCondition { _type, error, message, status }
instance encodeComponentCondition :: Encode ComponentCondition where
  encode (ComponentCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "error" (encodeMaybe a.error)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultComponentCondition :: Default ComponentCondition where
  default = ComponentCondition
    { _type: Nothing
    , error: Nothing
    , message: Nothing
    , status: Nothing }

-- | ComponentStatus (and ComponentStatusList) holds the cluster validation info.
-- |
-- | Fields:
-- | - `conditions`: List of component conditions observed
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype ComponentStatus = ComponentStatus
  { conditions :: (Maybe (Array ComponentCondition))
  , metadata :: (Maybe MetaV1.ObjectMeta) }

derive instance newtypeComponentStatus :: Newtype ComponentStatus _
derive instance genericComponentStatus :: Generic ComponentStatus _
instance showComponentStatus :: Show ComponentStatus where show a = genericShow a
instance decodeComponentStatus :: Decode ComponentStatus where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               conditions <- decodeMaybe "conditions" a
               assertPropEq "kind" "ComponentStatus" a
               metadata <- decodeMaybe "metadata" a
               pure $ ComponentStatus { conditions, metadata }
instance encodeComponentStatus :: Encode ComponentStatus where
  encode (ComponentStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "kind" (encode "ComponentStatus")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultComponentStatus :: Default ComponentStatus where
  default = ComponentStatus
    { conditions: Nothing
    , metadata: Nothing }

-- | Status of all the conditions for the component as a list of ComponentStatus objects.
-- |
-- | Fields:
-- | - `items`: List of ComponentStatus objects.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ComponentStatusList = ComponentStatusList
  { items :: (Maybe (Array ComponentStatus))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeComponentStatusList :: Newtype ComponentStatusList _
derive instance genericComponentStatusList :: Generic ComponentStatusList _
instance showComponentStatusList :: Show ComponentStatusList where show a = genericShow a
instance decodeComponentStatusList :: Decode ComponentStatusList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ComponentStatusList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ComponentStatusList { items, metadata }
instance encodeComponentStatusList :: Encode ComponentStatusList where
  encode (ComponentStatusList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ComponentStatusList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultComponentStatusList :: Default ComponentStatusList where
  default = ComponentStatusList
    { items: Nothing
    , metadata: Nothing }

-- | ConfigMap holds configuration data for pods to consume.
-- |
-- | Fields:
-- | - `_data`: Data contains the configuration data. Each key must consist of alphanumeric characters, '-', '_' or '.'.
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype ConfigMap = ConfigMap
  { _data :: (Maybe (StrMap String))
  , metadata :: (Maybe MetaV1.ObjectMeta) }

derive instance newtypeConfigMap :: Newtype ConfigMap _
derive instance genericConfigMap :: Generic ConfigMap _
instance showConfigMap :: Show ConfigMap where show a = genericShow a
instance decodeConfigMap :: Decode ConfigMap where
  decode a = do
               _data <- decodeMaybe "_data" a
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "ConfigMap" a
               metadata <- decodeMaybe "metadata" a
               pure $ ConfigMap { _data, metadata }
instance encodeConfigMap :: Encode ConfigMap where
  encode (ConfigMap a) = encode $ StrMap.fromFoldable $
               [ Tuple "_data" (encodeMaybe a._data)
               , Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "ConfigMap")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultConfigMap :: Default ConfigMap where
  default = ConfigMap
    { _data: Nothing
    , metadata: Nothing }

-- | ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.
-- | 
-- | The contents of the target ConfigMap's Data field will represent the key-value pairs as environment variables.
-- |
-- | Fields:
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the ConfigMap must be defined
newtype ConfigMapEnvSource = ConfigMapEnvSource
  { name :: (Maybe String)
  , optional :: (Maybe Boolean) }

derive instance newtypeConfigMapEnvSource :: Newtype ConfigMapEnvSource _
derive instance genericConfigMapEnvSource :: Generic ConfigMapEnvSource _
instance showConfigMapEnvSource :: Show ConfigMapEnvSource where show a = genericShow a
instance decodeConfigMapEnvSource :: Decode ConfigMapEnvSource where
  decode a = do
               name <- decodeMaybe "name" a
               optional <- decodeMaybe "optional" a
               pure $ ConfigMapEnvSource { name, optional }
instance encodeConfigMapEnvSource :: Encode ConfigMapEnvSource where
  encode (ConfigMapEnvSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "optional" (encodeMaybe a.optional) ]


instance defaultConfigMapEnvSource :: Default ConfigMapEnvSource where
  default = ConfigMapEnvSource
    { name: Nothing
    , optional: Nothing }

-- | Selects a key from a ConfigMap.
-- |
-- | Fields:
-- | - `key`: The key to select.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the ConfigMap or it's key must be defined
newtype ConfigMapKeySelector = ConfigMapKeySelector
  { key :: (Maybe String)
  , name :: (Maybe String)
  , optional :: (Maybe Boolean) }

derive instance newtypeConfigMapKeySelector :: Newtype ConfigMapKeySelector _
derive instance genericConfigMapKeySelector :: Generic ConfigMapKeySelector _
instance showConfigMapKeySelector :: Show ConfigMapKeySelector where show a = genericShow a
instance decodeConfigMapKeySelector :: Decode ConfigMapKeySelector where
  decode a = do
               key <- decodeMaybe "key" a
               name <- decodeMaybe "name" a
               optional <- decodeMaybe "optional" a
               pure $ ConfigMapKeySelector { key, name, optional }
instance encodeConfigMapKeySelector :: Encode ConfigMapKeySelector where
  encode (ConfigMapKeySelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "key" (encodeMaybe a.key)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "optional" (encodeMaybe a.optional) ]


instance defaultConfigMapKeySelector :: Default ConfigMapKeySelector where
  default = ConfigMapKeySelector
    { key: Nothing
    , name: Nothing
    , optional: Nothing }

-- | ConfigMapList is a resource containing a list of ConfigMap objects.
-- |
-- | Fields:
-- | - `items`: Items is the list of ConfigMaps.
-- | - `metadata`: More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype ConfigMapList = ConfigMapList
  { items :: (Maybe (Array ConfigMap))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeConfigMapList :: Newtype ConfigMapList _
derive instance genericConfigMapList :: Generic ConfigMapList _
instance showConfigMapList :: Show ConfigMapList where show a = genericShow a
instance decodeConfigMapList :: Decode ConfigMapList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ConfigMapList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ConfigMapList { items, metadata }
instance encodeConfigMapList :: Encode ConfigMapList where
  encode (ConfigMapList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ConfigMapList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultConfigMapList :: Default ConfigMapList where
  default = ConfigMapList
    { items: Nothing
    , metadata: Nothing }

-- | Adapts a ConfigMap into a projected volume.
-- | 
-- | The contents of the target ConfigMap's Data field will be presented in a projected volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. Note that this is identical to a configmap volume source without the default mode.
-- |
-- | Fields:
-- | - `items`: If unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the ConfigMap, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the ConfigMap or it's keys must be defined
newtype ConfigMapProjection = ConfigMapProjection
  { items :: (Maybe (Array KeyToPath))
  , name :: (Maybe String)
  , optional :: (Maybe Boolean) }

derive instance newtypeConfigMapProjection :: Newtype ConfigMapProjection _
derive instance genericConfigMapProjection :: Generic ConfigMapProjection _
instance showConfigMapProjection :: Show ConfigMapProjection where show a = genericShow a
instance decodeConfigMapProjection :: Decode ConfigMapProjection where
  decode a = do
               items <- decodeMaybe "items" a
               name <- decodeMaybe "name" a
               optional <- decodeMaybe "optional" a
               pure $ ConfigMapProjection { items, name, optional }
instance encodeConfigMapProjection :: Encode ConfigMapProjection where
  encode (ConfigMapProjection a) = encode $ StrMap.fromFoldable $
               [ Tuple "items" (encodeMaybe a.items)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "optional" (encodeMaybe a.optional) ]


instance defaultConfigMapProjection :: Default ConfigMapProjection where
  default = ConfigMapProjection
    { items: Nothing
    , name: Nothing
    , optional: Nothing }

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
  { defaultMode :: (Maybe Int)
  , items :: (Maybe (Array KeyToPath))
  , name :: (Maybe String)
  , optional :: (Maybe Boolean) }

derive instance newtypeConfigMapVolumeSource :: Newtype ConfigMapVolumeSource _
derive instance genericConfigMapVolumeSource :: Generic ConfigMapVolumeSource _
instance showConfigMapVolumeSource :: Show ConfigMapVolumeSource where show a = genericShow a
instance decodeConfigMapVolumeSource :: Decode ConfigMapVolumeSource where
  decode a = do
               defaultMode <- decodeMaybe "defaultMode" a
               items <- decodeMaybe "items" a
               name <- decodeMaybe "name" a
               optional <- decodeMaybe "optional" a
               pure $ ConfigMapVolumeSource { defaultMode, items, name, optional }
instance encodeConfigMapVolumeSource :: Encode ConfigMapVolumeSource where
  encode (ConfigMapVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "defaultMode" (encodeMaybe a.defaultMode)
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "optional" (encodeMaybe a.optional) ]


instance defaultConfigMapVolumeSource :: Default ConfigMapVolumeSource where
  default = ConfigMapVolumeSource
    { defaultMode: Nothing
    , items: Nothing
    , name: Nothing
    , optional: Nothing }

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
  { args :: (Maybe (Array String))
  , command :: (Maybe (Array String))
  , env :: (Maybe (Array EnvVar))
  , envFrom :: (Maybe (Array EnvFromSource))
  , image :: (Maybe String)
  , imagePullPolicy :: (Maybe String)
  , lifecycle :: (Maybe Lifecycle)
  , livenessProbe :: (Maybe Probe)
  , name :: (Maybe String)
  , ports :: (Maybe (Array ContainerPort))
  , readinessProbe :: (Maybe Probe)
  , resources :: (Maybe ResourceRequirements)
  , securityContext :: (Maybe SecurityContext)
  , stdin :: (Maybe Boolean)
  , stdinOnce :: (Maybe Boolean)
  , terminationMessagePath :: (Maybe String)
  , terminationMessagePolicy :: (Maybe String)
  , tty :: (Maybe Boolean)
  , volumeDevices :: (Maybe (Array VolumeDevice))
  , volumeMounts :: (Maybe (Array VolumeMount))
  , workingDir :: (Maybe String) }

derive instance newtypeContainer :: Newtype Container _
derive instance genericContainer :: Generic Container _
instance showContainer :: Show Container where show a = genericShow a
instance decodeContainer :: Decode Container where
  decode a = do
               args <- decodeMaybe "args" a
               command <- decodeMaybe "command" a
               env <- decodeMaybe "env" a
               envFrom <- decodeMaybe "envFrom" a
               image <- decodeMaybe "image" a
               imagePullPolicy <- decodeMaybe "imagePullPolicy" a
               lifecycle <- decodeMaybe "lifecycle" a
               livenessProbe <- decodeMaybe "livenessProbe" a
               name <- decodeMaybe "name" a
               ports <- decodeMaybe "ports" a
               readinessProbe <- decodeMaybe "readinessProbe" a
               resources <- decodeMaybe "resources" a
               securityContext <- decodeMaybe "securityContext" a
               stdin <- decodeMaybe "stdin" a
               stdinOnce <- decodeMaybe "stdinOnce" a
               terminationMessagePath <- decodeMaybe "terminationMessagePath" a
               terminationMessagePolicy <- decodeMaybe "terminationMessagePolicy" a
               tty <- decodeMaybe "tty" a
               volumeDevices <- decodeMaybe "volumeDevices" a
               volumeMounts <- decodeMaybe "volumeMounts" a
               workingDir <- decodeMaybe "workingDir" a
               pure $ Container { args, command, env, envFrom, image, imagePullPolicy, lifecycle, livenessProbe, name, ports, readinessProbe, resources, securityContext, stdin, stdinOnce, terminationMessagePath, terminationMessagePolicy, tty, volumeDevices, volumeMounts, workingDir }
instance encodeContainer :: Encode Container where
  encode (Container a) = encode $ StrMap.fromFoldable $
               [ Tuple "args" (encodeMaybe a.args)
               , Tuple "command" (encodeMaybe a.command)
               , Tuple "env" (encodeMaybe a.env)
               , Tuple "envFrom" (encodeMaybe a.envFrom)
               , Tuple "image" (encodeMaybe a.image)
               , Tuple "imagePullPolicy" (encodeMaybe a.imagePullPolicy)
               , Tuple "lifecycle" (encodeMaybe a.lifecycle)
               , Tuple "livenessProbe" (encodeMaybe a.livenessProbe)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "ports" (encodeMaybe a.ports)
               , Tuple "readinessProbe" (encodeMaybe a.readinessProbe)
               , Tuple "resources" (encodeMaybe a.resources)
               , Tuple "securityContext" (encodeMaybe a.securityContext)
               , Tuple "stdin" (encodeMaybe a.stdin)
               , Tuple "stdinOnce" (encodeMaybe a.stdinOnce)
               , Tuple "terminationMessagePath" (encodeMaybe a.terminationMessagePath)
               , Tuple "terminationMessagePolicy" (encodeMaybe a.terminationMessagePolicy)
               , Tuple "tty" (encodeMaybe a.tty)
               , Tuple "volumeDevices" (encodeMaybe a.volumeDevices)
               , Tuple "volumeMounts" (encodeMaybe a.volumeMounts)
               , Tuple "workingDir" (encodeMaybe a.workingDir) ]


instance defaultContainer :: Default Container where
  default = Container
    { args: Nothing
    , command: Nothing
    , env: Nothing
    , envFrom: Nothing
    , image: Nothing
    , imagePullPolicy: Nothing
    , lifecycle: Nothing
    , livenessProbe: Nothing
    , name: Nothing
    , ports: Nothing
    , readinessProbe: Nothing
    , resources: Nothing
    , securityContext: Nothing
    , stdin: Nothing
    , stdinOnce: Nothing
    , terminationMessagePath: Nothing
    , terminationMessagePolicy: Nothing
    , tty: Nothing
    , volumeDevices: Nothing
    , volumeMounts: Nothing
    , workingDir: Nothing }

-- | Describe a container image
-- |
-- | Fields:
-- | - `names`: Names by which this image is known. e.g. ["gcr.io/google_containers/hyperkube:v1.0.7", "dockerhub.io/google_containers/hyperkube:v1.0.7"]
-- | - `sizeBytes`: The size of the image in bytes.
newtype ContainerImage = ContainerImage
  { names :: (Maybe (Array String))
  , sizeBytes :: (Maybe Int) }

derive instance newtypeContainerImage :: Newtype ContainerImage _
derive instance genericContainerImage :: Generic ContainerImage _
instance showContainerImage :: Show ContainerImage where show a = genericShow a
instance decodeContainerImage :: Decode ContainerImage where
  decode a = do
               names <- decodeMaybe "names" a
               sizeBytes <- decodeMaybe "sizeBytes" a
               pure $ ContainerImage { names, sizeBytes }
instance encodeContainerImage :: Encode ContainerImage where
  encode (ContainerImage a) = encode $ StrMap.fromFoldable $
               [ Tuple "names" (encodeMaybe a.names)
               , Tuple "sizeBytes" (encodeMaybe a.sizeBytes) ]


instance defaultContainerImage :: Default ContainerImage where
  default = ContainerImage
    { names: Nothing
    , sizeBytes: Nothing }

-- | ContainerPort represents a network port in a single container.
-- |
-- | Fields:
-- | - `containerPort`: Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x < 65536.
-- | - `hostIP`: What host IP to bind the external port to.
-- | - `hostPort`: Number of port to expose on the host. If specified, this must be a valid port number, 0 < x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do not need this.
-- | - `name`: If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in a pod must have a unique name. Name for the port that can be referred to by services.
-- | - `protocol`: Protocol for port. Must be UDP or TCP. Defaults to "TCP".
newtype ContainerPort = ContainerPort
  { containerPort :: (Maybe Int)
  , hostIP :: (Maybe String)
  , hostPort :: (Maybe Int)
  , name :: (Maybe String)
  , protocol :: (Maybe String) }

derive instance newtypeContainerPort :: Newtype ContainerPort _
derive instance genericContainerPort :: Generic ContainerPort _
instance showContainerPort :: Show ContainerPort where show a = genericShow a
instance decodeContainerPort :: Decode ContainerPort where
  decode a = do
               containerPort <- decodeMaybe "containerPort" a
               hostIP <- decodeMaybe "hostIP" a
               hostPort <- decodeMaybe "hostPort" a
               name <- decodeMaybe "name" a
               protocol <- decodeMaybe "protocol" a
               pure $ ContainerPort { containerPort, hostIP, hostPort, name, protocol }
instance encodeContainerPort :: Encode ContainerPort where
  encode (ContainerPort a) = encode $ StrMap.fromFoldable $
               [ Tuple "containerPort" (encodeMaybe a.containerPort)
               , Tuple "hostIP" (encodeMaybe a.hostIP)
               , Tuple "hostPort" (encodeMaybe a.hostPort)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "protocol" (encodeMaybe a.protocol) ]


instance defaultContainerPort :: Default ContainerPort where
  default = ContainerPort
    { containerPort: Nothing
    , hostIP: Nothing
    , hostPort: Nothing
    , name: Nothing
    , protocol: Nothing }

-- | ContainerState holds a possible state of container. Only one of its members may be specified. If none of them is specified, the default one is ContainerStateWaiting.
-- |
-- | Fields:
-- | - `running`: Details about a running container
-- | - `terminated`: Details about a terminated container
-- | - `waiting`: Details about a waiting container
newtype ContainerState = ContainerState
  { running :: (Maybe ContainerStateRunning)
  , terminated :: (Maybe ContainerStateTerminated)
  , waiting :: (Maybe ContainerStateWaiting) }

derive instance newtypeContainerState :: Newtype ContainerState _
derive instance genericContainerState :: Generic ContainerState _
instance showContainerState :: Show ContainerState where show a = genericShow a
instance decodeContainerState :: Decode ContainerState where
  decode a = do
               running <- decodeMaybe "running" a
               terminated <- decodeMaybe "terminated" a
               waiting <- decodeMaybe "waiting" a
               pure $ ContainerState { running, terminated, waiting }
instance encodeContainerState :: Encode ContainerState where
  encode (ContainerState a) = encode $ StrMap.fromFoldable $
               [ Tuple "running" (encodeMaybe a.running)
               , Tuple "terminated" (encodeMaybe a.terminated)
               , Tuple "waiting" (encodeMaybe a.waiting) ]


instance defaultContainerState :: Default ContainerState where
  default = ContainerState
    { running: Nothing
    , terminated: Nothing
    , waiting: Nothing }

-- | ContainerStateRunning is a running state of a container.
-- |
-- | Fields:
-- | - `startedAt`: Time at which the container was last (re-)started
newtype ContainerStateRunning = ContainerStateRunning
  { startedAt :: (Maybe MetaV1.Time) }

derive instance newtypeContainerStateRunning :: Newtype ContainerStateRunning _
derive instance genericContainerStateRunning :: Generic ContainerStateRunning _
instance showContainerStateRunning :: Show ContainerStateRunning where show a = genericShow a
instance decodeContainerStateRunning :: Decode ContainerStateRunning where
  decode a = do
               startedAt <- decodeMaybe "startedAt" a
               pure $ ContainerStateRunning { startedAt }
instance encodeContainerStateRunning :: Encode ContainerStateRunning where
  encode (ContainerStateRunning a) = encode $ StrMap.fromFoldable $
               [ Tuple "startedAt" (encodeMaybe a.startedAt) ]


instance defaultContainerStateRunning :: Default ContainerStateRunning where
  default = ContainerStateRunning
    { startedAt: Nothing }

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
  { containerID :: (Maybe String)
  , exitCode :: (Maybe Int)
  , finishedAt :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , signal :: (Maybe Int)
  , startedAt :: (Maybe MetaV1.Time) }

derive instance newtypeContainerStateTerminated :: Newtype ContainerStateTerminated _
derive instance genericContainerStateTerminated :: Generic ContainerStateTerminated _
instance showContainerStateTerminated :: Show ContainerStateTerminated where show a = genericShow a
instance decodeContainerStateTerminated :: Decode ContainerStateTerminated where
  decode a = do
               containerID <- decodeMaybe "containerID" a
               exitCode <- decodeMaybe "exitCode" a
               finishedAt <- decodeMaybe "finishedAt" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               signal <- decodeMaybe "signal" a
               startedAt <- decodeMaybe "startedAt" a
               pure $ ContainerStateTerminated { containerID, exitCode, finishedAt, message, reason, signal, startedAt }
instance encodeContainerStateTerminated :: Encode ContainerStateTerminated where
  encode (ContainerStateTerminated a) = encode $ StrMap.fromFoldable $
               [ Tuple "containerID" (encodeMaybe a.containerID)
               , Tuple "exitCode" (encodeMaybe a.exitCode)
               , Tuple "finishedAt" (encodeMaybe a.finishedAt)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "signal" (encodeMaybe a.signal)
               , Tuple "startedAt" (encodeMaybe a.startedAt) ]


instance defaultContainerStateTerminated :: Default ContainerStateTerminated where
  default = ContainerStateTerminated
    { containerID: Nothing
    , exitCode: Nothing
    , finishedAt: Nothing
    , message: Nothing
    , reason: Nothing
    , signal: Nothing
    , startedAt: Nothing }

-- | ContainerStateWaiting is a waiting state of a container.
-- |
-- | Fields:
-- | - `message`: Message regarding why the container is not yet running.
-- | - `reason`: (brief) reason the container is not yet running.
newtype ContainerStateWaiting = ContainerStateWaiting
  { message :: (Maybe String)
  , reason :: (Maybe String) }

derive instance newtypeContainerStateWaiting :: Newtype ContainerStateWaiting _
derive instance genericContainerStateWaiting :: Generic ContainerStateWaiting _
instance showContainerStateWaiting :: Show ContainerStateWaiting where show a = genericShow a
instance decodeContainerStateWaiting :: Decode ContainerStateWaiting where
  decode a = do
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               pure $ ContainerStateWaiting { message, reason }
instance encodeContainerStateWaiting :: Encode ContainerStateWaiting where
  encode (ContainerStateWaiting a) = encode $ StrMap.fromFoldable $
               [ Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason) ]


instance defaultContainerStateWaiting :: Default ContainerStateWaiting where
  default = ContainerStateWaiting
    { message: Nothing
    , reason: Nothing }

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
  { containerID :: (Maybe String)
  , image :: (Maybe String)
  , imageID :: (Maybe String)
  , lastState :: (Maybe ContainerState)
  , name :: (Maybe String)
  , ready :: (Maybe Boolean)
  , restartCount :: (Maybe Int)
  , state :: (Maybe ContainerState) }

derive instance newtypeContainerStatus :: Newtype ContainerStatus _
derive instance genericContainerStatus :: Generic ContainerStatus _
instance showContainerStatus :: Show ContainerStatus where show a = genericShow a
instance decodeContainerStatus :: Decode ContainerStatus where
  decode a = do
               containerID <- decodeMaybe "containerID" a
               image <- decodeMaybe "image" a
               imageID <- decodeMaybe "imageID" a
               lastState <- decodeMaybe "lastState" a
               name <- decodeMaybe "name" a
               ready <- decodeMaybe "ready" a
               restartCount <- decodeMaybe "restartCount" a
               state <- decodeMaybe "state" a
               pure $ ContainerStatus { containerID, image, imageID, lastState, name, ready, restartCount, state }
instance encodeContainerStatus :: Encode ContainerStatus where
  encode (ContainerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "containerID" (encodeMaybe a.containerID)
               , Tuple "image" (encodeMaybe a.image)
               , Tuple "imageID" (encodeMaybe a.imageID)
               , Tuple "lastState" (encodeMaybe a.lastState)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "ready" (encodeMaybe a.ready)
               , Tuple "restartCount" (encodeMaybe a.restartCount)
               , Tuple "state" (encodeMaybe a.state) ]


instance defaultContainerStatus :: Default ContainerStatus where
  default = ContainerStatus
    { containerID: Nothing
    , image: Nothing
    , imageID: Nothing
    , lastState: Nothing
    , name: Nothing
    , ready: Nothing
    , restartCount: Nothing
    , state: Nothing }

-- | DaemonEndpoint contains information about a single Daemon endpoint.
-- |
-- | Fields:
-- | - `_Port`: Port number of the given endpoint.
newtype DaemonEndpoint = DaemonEndpoint
  { _Port :: (Maybe Int) }

derive instance newtypeDaemonEndpoint :: Newtype DaemonEndpoint _
derive instance genericDaemonEndpoint :: Generic DaemonEndpoint _
instance showDaemonEndpoint :: Show DaemonEndpoint where show a = genericShow a
instance decodeDaemonEndpoint :: Decode DaemonEndpoint where
  decode a = do
               _Port <- decodeMaybe "_Port" a
               pure $ DaemonEndpoint { _Port }
instance encodeDaemonEndpoint :: Encode DaemonEndpoint where
  encode (DaemonEndpoint a) = encode $ StrMap.fromFoldable $
               [ Tuple "_Port" (encodeMaybe a._Port) ]


instance defaultDaemonEndpoint :: Default DaemonEndpoint where
  default = DaemonEndpoint
    { _Port: Nothing }

-- | Represents downward API info for projecting into a projected volume. Note that this is identical to a downwardAPI volume source without the default mode.
-- |
-- | Fields:
-- | - `items`: Items is a list of DownwardAPIVolume file
newtype DownwardAPIProjection = DownwardAPIProjection
  { items :: (Maybe (Array DownwardAPIVolumeFile)) }

derive instance newtypeDownwardAPIProjection :: Newtype DownwardAPIProjection _
derive instance genericDownwardAPIProjection :: Generic DownwardAPIProjection _
instance showDownwardAPIProjection :: Show DownwardAPIProjection where show a = genericShow a
instance decodeDownwardAPIProjection :: Decode DownwardAPIProjection where
  decode a = do
               items <- decodeMaybe "items" a
               pure $ DownwardAPIProjection { items }
instance encodeDownwardAPIProjection :: Encode DownwardAPIProjection where
  encode (DownwardAPIProjection a) = encode $ StrMap.fromFoldable $
               [ Tuple "items" (encodeMaybe a.items) ]


instance defaultDownwardAPIProjection :: Default DownwardAPIProjection where
  default = DownwardAPIProjection
    { items: Nothing }

-- | DownwardAPIVolumeFile represents information to create the file containing the pod field
-- |
-- | Fields:
-- | - `fieldRef`: Required: Selects a field of the pod: only annotations, labels, name and namespace are supported.
-- | - `mode`: Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `path`: Required: Path is  the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'
-- | - `resourceFieldRef`: Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, requests.cpu and requests.memory) are currently supported.
newtype DownwardAPIVolumeFile = DownwardAPIVolumeFile
  { fieldRef :: (Maybe ObjectFieldSelector)
  , mode :: (Maybe Int)
  , path :: (Maybe String)
  , resourceFieldRef :: (Maybe ResourceFieldSelector) }

derive instance newtypeDownwardAPIVolumeFile :: Newtype DownwardAPIVolumeFile _
derive instance genericDownwardAPIVolumeFile :: Generic DownwardAPIVolumeFile _
instance showDownwardAPIVolumeFile :: Show DownwardAPIVolumeFile where show a = genericShow a
instance decodeDownwardAPIVolumeFile :: Decode DownwardAPIVolumeFile where
  decode a = do
               fieldRef <- decodeMaybe "fieldRef" a
               mode <- decodeMaybe "mode" a
               path <- decodeMaybe "path" a
               resourceFieldRef <- decodeMaybe "resourceFieldRef" a
               pure $ DownwardAPIVolumeFile { fieldRef, mode, path, resourceFieldRef }
instance encodeDownwardAPIVolumeFile :: Encode DownwardAPIVolumeFile where
  encode (DownwardAPIVolumeFile a) = encode $ StrMap.fromFoldable $
               [ Tuple "fieldRef" (encodeMaybe a.fieldRef)
               , Tuple "mode" (encodeMaybe a.mode)
               , Tuple "path" (encodeMaybe a.path)
               , Tuple "resourceFieldRef" (encodeMaybe a.resourceFieldRef) ]


instance defaultDownwardAPIVolumeFile :: Default DownwardAPIVolumeFile where
  default = DownwardAPIVolumeFile
    { fieldRef: Nothing
    , mode: Nothing
    , path: Nothing
    , resourceFieldRef: Nothing }

-- | DownwardAPIVolumeSource represents a volume containing downward API info. Downward API volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `defaultMode`: Optional: mode bits to use on created files by default. Must be a value between 0 and 0777. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `items`: Items is a list of downward API volume file
newtype DownwardAPIVolumeSource = DownwardAPIVolumeSource
  { defaultMode :: (Maybe Int)
  , items :: (Maybe (Array DownwardAPIVolumeFile)) }

derive instance newtypeDownwardAPIVolumeSource :: Newtype DownwardAPIVolumeSource _
derive instance genericDownwardAPIVolumeSource :: Generic DownwardAPIVolumeSource _
instance showDownwardAPIVolumeSource :: Show DownwardAPIVolumeSource where show a = genericShow a
instance decodeDownwardAPIVolumeSource :: Decode DownwardAPIVolumeSource where
  decode a = do
               defaultMode <- decodeMaybe "defaultMode" a
               items <- decodeMaybe "items" a
               pure $ DownwardAPIVolumeSource { defaultMode, items }
instance encodeDownwardAPIVolumeSource :: Encode DownwardAPIVolumeSource where
  encode (DownwardAPIVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "defaultMode" (encodeMaybe a.defaultMode)
               , Tuple "items" (encodeMaybe a.items) ]


instance defaultDownwardAPIVolumeSource :: Default DownwardAPIVolumeSource where
  default = DownwardAPIVolumeSource
    { defaultMode: Nothing
    , items: Nothing }

-- | Represents an empty directory for a pod. Empty directory volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `medium`: What type of storage medium should back this directory. The default is "" which means to use the node's default medium. Must be an empty string (default) or Memory. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir
-- | - `sizeLimit`: Total amount of local storage required for this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. The default is nil which means that the limit is undefined. More info: http://kubernetes.io/docs/user-guide/volumes#emptydir
newtype EmptyDirVolumeSource = EmptyDirVolumeSource
  { medium :: (Maybe String)
  , sizeLimit :: (Maybe Resource.Quantity) }

derive instance newtypeEmptyDirVolumeSource :: Newtype EmptyDirVolumeSource _
derive instance genericEmptyDirVolumeSource :: Generic EmptyDirVolumeSource _
instance showEmptyDirVolumeSource :: Show EmptyDirVolumeSource where show a = genericShow a
instance decodeEmptyDirVolumeSource :: Decode EmptyDirVolumeSource where
  decode a = do
               medium <- decodeMaybe "medium" a
               sizeLimit <- decodeMaybe "sizeLimit" a
               pure $ EmptyDirVolumeSource { medium, sizeLimit }
instance encodeEmptyDirVolumeSource :: Encode EmptyDirVolumeSource where
  encode (EmptyDirVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "medium" (encodeMaybe a.medium)
               , Tuple "sizeLimit" (encodeMaybe a.sizeLimit) ]


instance defaultEmptyDirVolumeSource :: Default EmptyDirVolumeSource where
  default = EmptyDirVolumeSource
    { medium: Nothing
    , sizeLimit: Nothing }

-- | EndpointAddress is a tuple that describes single IP address.
-- |
-- | Fields:
-- | - `hostname`: The Hostname of this endpoint
-- | - `ip`: The IP of this endpoint. May not be loopback (127.0.0.0/8), link-local (169.254.0.0/16), or link-local multicast ((224.0.0.0/24). IPv6 is also accepted but not fully supported on all platforms. Also, certain kubernetes components, like kube-proxy, are not IPv6 ready.
-- | - `nodeName`: Optional: Node hosting this endpoint. This can be used to determine endpoints local to a node.
-- | - `targetRef`: Reference to object providing the endpoint.
newtype EndpointAddress = EndpointAddress
  { hostname :: (Maybe String)
  , ip :: (Maybe String)
  , nodeName :: (Maybe String)
  , targetRef :: (Maybe ObjectReference) }

derive instance newtypeEndpointAddress :: Newtype EndpointAddress _
derive instance genericEndpointAddress :: Generic EndpointAddress _
instance showEndpointAddress :: Show EndpointAddress where show a = genericShow a
instance decodeEndpointAddress :: Decode EndpointAddress where
  decode a = do
               hostname <- decodeMaybe "hostname" a
               ip <- decodeMaybe "ip" a
               nodeName <- decodeMaybe "nodeName" a
               targetRef <- decodeMaybe "targetRef" a
               pure $ EndpointAddress { hostname, ip, nodeName, targetRef }
instance encodeEndpointAddress :: Encode EndpointAddress where
  encode (EndpointAddress a) = encode $ StrMap.fromFoldable $
               [ Tuple "hostname" (encodeMaybe a.hostname)
               , Tuple "ip" (encodeMaybe a.ip)
               , Tuple "nodeName" (encodeMaybe a.nodeName)
               , Tuple "targetRef" (encodeMaybe a.targetRef) ]


instance defaultEndpointAddress :: Default EndpointAddress where
  default = EndpointAddress
    { hostname: Nothing
    , ip: Nothing
    , nodeName: Nothing
    , targetRef: Nothing }

-- | EndpointPort is a tuple that describes a single port.
-- |
-- | Fields:
-- | - `name`: The name of this port (corresponds to ServicePort.Name). Must be a DNS_LABEL. Optional only if one port is defined.
-- | - `port`: The port number of the endpoint.
-- | - `protocol`: The IP protocol for this port. Must be UDP or TCP. Default is TCP.
newtype EndpointPort = EndpointPort
  { name :: (Maybe String)
  , port :: (Maybe Int)
  , protocol :: (Maybe String) }

derive instance newtypeEndpointPort :: Newtype EndpointPort _
derive instance genericEndpointPort :: Generic EndpointPort _
instance showEndpointPort :: Show EndpointPort where show a = genericShow a
instance decodeEndpointPort :: Decode EndpointPort where
  decode a = do
               name <- decodeMaybe "name" a
               port <- decodeMaybe "port" a
               protocol <- decodeMaybe "protocol" a
               pure $ EndpointPort { name, port, protocol }
instance encodeEndpointPort :: Encode EndpointPort where
  encode (EndpointPort a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "port" (encodeMaybe a.port)
               , Tuple "protocol" (encodeMaybe a.protocol) ]


instance defaultEndpointPort :: Default EndpointPort where
  default = EndpointPort
    { name: Nothing
    , port: Nothing
    , protocol: Nothing }

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
  { addresses :: (Maybe (Array EndpointAddress))
  , notReadyAddresses :: (Maybe (Array EndpointAddress))
  , ports :: (Maybe (Array EndpointPort)) }

derive instance newtypeEndpointSubset :: Newtype EndpointSubset _
derive instance genericEndpointSubset :: Generic EndpointSubset _
instance showEndpointSubset :: Show EndpointSubset where show a = genericShow a
instance decodeEndpointSubset :: Decode EndpointSubset where
  decode a = do
               addresses <- decodeMaybe "addresses" a
               notReadyAddresses <- decodeMaybe "notReadyAddresses" a
               ports <- decodeMaybe "ports" a
               pure $ EndpointSubset { addresses, notReadyAddresses, ports }
instance encodeEndpointSubset :: Encode EndpointSubset where
  encode (EndpointSubset a) = encode $ StrMap.fromFoldable $
               [ Tuple "addresses" (encodeMaybe a.addresses)
               , Tuple "notReadyAddresses" (encodeMaybe a.notReadyAddresses)
               , Tuple "ports" (encodeMaybe a.ports) ]


instance defaultEndpointSubset :: Default EndpointSubset where
  default = EndpointSubset
    { addresses: Nothing
    , notReadyAddresses: Nothing
    , ports: Nothing }

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
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `subsets`: The set of all endpoints is the union of all subsets. Addresses are placed into subsets according to the IPs they share. A single address with multiple ports, some of which are ready and some of which are not (because they come from different containers) will result in the address being displayed in different subsets for the different ports. No address will appear in both Addresses and NotReadyAddresses in the same subset. Sets of addresses and ports that comprise a service.
newtype Endpoints = Endpoints
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , subsets :: (Maybe (Array EndpointSubset)) }

derive instance newtypeEndpoints :: Newtype Endpoints _
derive instance genericEndpoints :: Generic Endpoints _
instance showEndpoints :: Show Endpoints where show a = genericShow a
instance decodeEndpoints :: Decode Endpoints where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "Endpoints" a
               metadata <- decodeMaybe "metadata" a
               subsets <- decodeMaybe "subsets" a
               pure $ Endpoints { metadata, subsets }
instance encodeEndpoints :: Encode Endpoints where
  encode (Endpoints a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "Endpoints")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "subsets" (encodeMaybe a.subsets) ]


instance defaultEndpoints :: Default Endpoints where
  default = Endpoints
    { metadata: Nothing
    , subsets: Nothing }

-- | EndpointsList is a list of endpoints.
-- |
-- | Fields:
-- | - `items`: List of endpoints.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype EndpointsList = EndpointsList
  { items :: (Maybe (Array Endpoints))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeEndpointsList :: Newtype EndpointsList _
derive instance genericEndpointsList :: Generic EndpointsList _
instance showEndpointsList :: Show EndpointsList where show a = genericShow a
instance decodeEndpointsList :: Decode EndpointsList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "EndpointsList" a
               metadata <- decodeMaybe "metadata" a
               pure $ EndpointsList { items, metadata }
instance encodeEndpointsList :: Encode EndpointsList where
  encode (EndpointsList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "EndpointsList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultEndpointsList :: Default EndpointsList where
  default = EndpointsList
    { items: Nothing
    , metadata: Nothing }

-- | EnvFromSource represents the source of a set of ConfigMaps
-- |
-- | Fields:
-- | - `configMapRef`: The ConfigMap to select from
-- | - `prefix`: An optional identifer to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER.
-- | - `secretRef`: The Secret to select from
newtype EnvFromSource = EnvFromSource
  { configMapRef :: (Maybe ConfigMapEnvSource)
  , prefix :: (Maybe String)
  , secretRef :: (Maybe SecretEnvSource) }

derive instance newtypeEnvFromSource :: Newtype EnvFromSource _
derive instance genericEnvFromSource :: Generic EnvFromSource _
instance showEnvFromSource :: Show EnvFromSource where show a = genericShow a
instance decodeEnvFromSource :: Decode EnvFromSource where
  decode a = do
               configMapRef <- decodeMaybe "configMapRef" a
               prefix <- decodeMaybe "prefix" a
               secretRef <- decodeMaybe "secretRef" a
               pure $ EnvFromSource { configMapRef, prefix, secretRef }
instance encodeEnvFromSource :: Encode EnvFromSource where
  encode (EnvFromSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "configMapRef" (encodeMaybe a.configMapRef)
               , Tuple "prefix" (encodeMaybe a.prefix)
               , Tuple "secretRef" (encodeMaybe a.secretRef) ]


instance defaultEnvFromSource :: Default EnvFromSource where
  default = EnvFromSource
    { configMapRef: Nothing
    , prefix: Nothing
    , secretRef: Nothing }

-- | EnvVar represents an environment variable present in a Container.
-- |
-- | Fields:
-- | - `name`: Name of the environment variable. Must be a C_IDENTIFIER.
-- | - `value`: Variable references $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Defaults to "".
-- | - `valueFrom`: Source for the environment variable's value. Cannot be used if value is not empty.
newtype EnvVar = EnvVar
  { name :: (Maybe String)
  , value :: (Maybe String)
  , valueFrom :: (Maybe EnvVarSource) }

derive instance newtypeEnvVar :: Newtype EnvVar _
derive instance genericEnvVar :: Generic EnvVar _
instance showEnvVar :: Show EnvVar where show a = genericShow a
instance decodeEnvVar :: Decode EnvVar where
  decode a = do
               name <- decodeMaybe "name" a
               value <- decodeMaybe "value" a
               valueFrom <- decodeMaybe "valueFrom" a
               pure $ EnvVar { name, value, valueFrom }
instance encodeEnvVar :: Encode EnvVar where
  encode (EnvVar a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "value" (encodeMaybe a.value)
               , Tuple "valueFrom" (encodeMaybe a.valueFrom) ]


instance defaultEnvVar :: Default EnvVar where
  default = EnvVar
    { name: Nothing
    , value: Nothing
    , valueFrom: Nothing }

-- | EnvVarSource represents a source for the value of an EnvVar.
-- |
-- | Fields:
-- | - `configMapKeyRef`: Selects a key of a ConfigMap.
-- | - `fieldRef`: Selects a field of the pod: supports metadata.name, metadata.namespace, metadata.labels, metadata.annotations, spec.nodeName, spec.serviceAccountName, status.hostIP, status.podIP.
-- | - `resourceFieldRef`: Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests.ephemeral-storage) are currently supported.
-- | - `secretKeyRef`: Selects a key of a secret in the pod's namespace
newtype EnvVarSource = EnvVarSource
  { configMapKeyRef :: (Maybe ConfigMapKeySelector)
  , fieldRef :: (Maybe ObjectFieldSelector)
  , resourceFieldRef :: (Maybe ResourceFieldSelector)
  , secretKeyRef :: (Maybe SecretKeySelector) }

derive instance newtypeEnvVarSource :: Newtype EnvVarSource _
derive instance genericEnvVarSource :: Generic EnvVarSource _
instance showEnvVarSource :: Show EnvVarSource where show a = genericShow a
instance decodeEnvVarSource :: Decode EnvVarSource where
  decode a = do
               configMapKeyRef <- decodeMaybe "configMapKeyRef" a
               fieldRef <- decodeMaybe "fieldRef" a
               resourceFieldRef <- decodeMaybe "resourceFieldRef" a
               secretKeyRef <- decodeMaybe "secretKeyRef" a
               pure $ EnvVarSource { configMapKeyRef, fieldRef, resourceFieldRef, secretKeyRef }
instance encodeEnvVarSource :: Encode EnvVarSource where
  encode (EnvVarSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "configMapKeyRef" (encodeMaybe a.configMapKeyRef)
               , Tuple "fieldRef" (encodeMaybe a.fieldRef)
               , Tuple "resourceFieldRef" (encodeMaybe a.resourceFieldRef)
               , Tuple "secretKeyRef" (encodeMaybe a.secretKeyRef) ]


instance defaultEnvVarSource :: Default EnvVarSource where
  default = EnvVarSource
    { configMapKeyRef: Nothing
    , fieldRef: Nothing
    , resourceFieldRef: Nothing
    , secretKeyRef: Nothing }

-- | Event is a report of an event somewhere in the cluster.
-- |
-- | Fields:
-- | - `_type`: Type of this event (Normal, Warning), new types could be added in the future
-- | - `action`: What action was taken/failed regarding to the Regarding object.
-- | - `count`: The number of times this event has occurred.
-- | - `eventTime`: Time when this Event was first observed.
-- | - `firstTimestamp`: The time at which the event was first recorded. (Time of server receipt is in TypeMeta.)
-- | - `involvedObject`: The object that this event is about.
-- | - `lastTimestamp`: The time at which the most recent occurrence of this event was recorded.
-- | - `message`: A human-readable description of the status of this operation.
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `reason`: This should be a short, machine understandable string that gives the reason for the transition into the object's current status.
-- | - `related`: Optional secondary object for more complex actions.
-- | - `reportingComponent`: Name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`.
-- | - `reportingInstance`: ID of the controller instance, e.g. `kubelet-xyzf`.
-- | - `series`: Data about the Event series this event represents or nil if it's a singleton Event.
-- | - `source`: The component reporting this event. Should be a short machine understandable string.
newtype Event = Event
  { _type :: (Maybe String)
  , action :: (Maybe String)
  , count :: (Maybe Int)
  , eventTime :: (Maybe MetaV1.MicroTime)
  , firstTimestamp :: (Maybe MetaV1.Time)
  , involvedObject :: (Maybe ObjectReference)
  , lastTimestamp :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , reason :: (Maybe String)
  , related :: (Maybe ObjectReference)
  , reportingComponent :: (Maybe String)
  , reportingInstance :: (Maybe String)
  , series :: (Maybe EventSeries)
  , source :: (Maybe EventSource) }

derive instance newtypeEvent :: Newtype Event _
derive instance genericEvent :: Generic Event _
instance showEvent :: Show Event where show a = genericShow a
instance decodeEvent :: Decode Event where
  decode a = do
               _type <- decodeMaybe "_type" a
               action <- decodeMaybe "action" a
               assertPropEq "apiVersion" "v1" a
               count <- decodeMaybe "count" a
               eventTime <- decodeMaybe "eventTime" a
               firstTimestamp <- decodeMaybe "firstTimestamp" a
               involvedObject <- decodeMaybe "involvedObject" a
               assertPropEq "kind" "Event" a
               lastTimestamp <- decodeMaybe "lastTimestamp" a
               message <- decodeMaybe "message" a
               metadata <- decodeMaybe "metadata" a
               reason <- decodeMaybe "reason" a
               related <- decodeMaybe "related" a
               reportingComponent <- decodeMaybe "reportingComponent" a
               reportingInstance <- decodeMaybe "reportingInstance" a
               series <- decodeMaybe "series" a
               source <- decodeMaybe "source" a
               pure $ Event { _type, action, count, eventTime, firstTimestamp, involvedObject, lastTimestamp, message, metadata, reason, related, reportingComponent, reportingInstance, series, source }
instance encodeEvent :: Encode Event where
  encode (Event a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "action" (encodeMaybe a.action)
               , Tuple "apiVersion" (encode "v1")
               , Tuple "count" (encodeMaybe a.count)
               , Tuple "eventTime" (encodeMaybe a.eventTime)
               , Tuple "firstTimestamp" (encodeMaybe a.firstTimestamp)
               , Tuple "involvedObject" (encodeMaybe a.involvedObject)
               , Tuple "kind" (encode "Event")
               , Tuple "lastTimestamp" (encodeMaybe a.lastTimestamp)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "related" (encodeMaybe a.related)
               , Tuple "reportingComponent" (encodeMaybe a.reportingComponent)
               , Tuple "reportingInstance" (encodeMaybe a.reportingInstance)
               , Tuple "series" (encodeMaybe a.series)
               , Tuple "source" (encodeMaybe a.source) ]


instance defaultEvent :: Default Event where
  default = Event
    { _type: Nothing
    , action: Nothing
    , count: Nothing
    , eventTime: Nothing
    , firstTimestamp: Nothing
    , involvedObject: Nothing
    , lastTimestamp: Nothing
    , message: Nothing
    , metadata: Nothing
    , reason: Nothing
    , related: Nothing
    , reportingComponent: Nothing
    , reportingInstance: Nothing
    , series: Nothing
    , source: Nothing }

-- | EventList is a list of events.
-- |
-- | Fields:
-- | - `items`: List of events
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype EventList = EventList
  { items :: (Maybe (Array Event))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeEventList :: Newtype EventList _
derive instance genericEventList :: Generic EventList _
instance showEventList :: Show EventList where show a = genericShow a
instance decodeEventList :: Decode EventList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "EventList" a
               metadata <- decodeMaybe "metadata" a
               pure $ EventList { items, metadata }
instance encodeEventList :: Encode EventList where
  encode (EventList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "EventList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultEventList :: Default EventList where
  default = EventList
    { items: Nothing
    , metadata: Nothing }

-- | EventSeries contain information on series of events, i.e. thing that was/is happening continously for some time.
-- |
-- | Fields:
-- | - `count`: Number of occurrences in this series up to the last heartbeat time
-- | - `lastObservedTime`: Time of the last occurence observed
-- | - `state`: State of this Series: Ongoing or Finished
newtype EventSeries = EventSeries
  { count :: (Maybe Int)
  , lastObservedTime :: (Maybe MetaV1.MicroTime)
  , state :: (Maybe String) }

derive instance newtypeEventSeries :: Newtype EventSeries _
derive instance genericEventSeries :: Generic EventSeries _
instance showEventSeries :: Show EventSeries where show a = genericShow a
instance decodeEventSeries :: Decode EventSeries where
  decode a = do
               count <- decodeMaybe "count" a
               lastObservedTime <- decodeMaybe "lastObservedTime" a
               state <- decodeMaybe "state" a
               pure $ EventSeries { count, lastObservedTime, state }
instance encodeEventSeries :: Encode EventSeries where
  encode (EventSeries a) = encode $ StrMap.fromFoldable $
               [ Tuple "count" (encodeMaybe a.count)
               , Tuple "lastObservedTime" (encodeMaybe a.lastObservedTime)
               , Tuple "state" (encodeMaybe a.state) ]


instance defaultEventSeries :: Default EventSeries where
  default = EventSeries
    { count: Nothing
    , lastObservedTime: Nothing
    , state: Nothing }

-- | EventSource contains information for an event.
-- |
-- | Fields:
-- | - `component`: Component from which the event is generated.
-- | - `host`: Node name on which the event is generated.
newtype EventSource = EventSource
  { component :: (Maybe String)
  , host :: (Maybe String) }

derive instance newtypeEventSource :: Newtype EventSource _
derive instance genericEventSource :: Generic EventSource _
instance showEventSource :: Show EventSource where show a = genericShow a
instance decodeEventSource :: Decode EventSource where
  decode a = do
               component <- decodeMaybe "component" a
               host <- decodeMaybe "host" a
               pure $ EventSource { component, host }
instance encodeEventSource :: Encode EventSource where
  encode (EventSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "component" (encodeMaybe a.component)
               , Tuple "host" (encodeMaybe a.host) ]


instance defaultEventSource :: Default EventSource where
  default = EventSource
    { component: Nothing
    , host: Nothing }

-- | ExecAction describes a "run in container" action.
-- |
-- | Fields:
-- | - `command`: Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.
newtype ExecAction = ExecAction
  { command :: (Maybe (Array String)) }

derive instance newtypeExecAction :: Newtype ExecAction _
derive instance genericExecAction :: Generic ExecAction _
instance showExecAction :: Show ExecAction where show a = genericShow a
instance decodeExecAction :: Decode ExecAction where
  decode a = do
               command <- decodeMaybe "command" a
               pure $ ExecAction { command }
instance encodeExecAction :: Encode ExecAction where
  encode (ExecAction a) = encode $ StrMap.fromFoldable $
               [ Tuple "command" (encodeMaybe a.command) ]


instance defaultExecAction :: Default ExecAction where
  default = ExecAction
    { command: Nothing }

-- | Represents a Fibre Channel volume. Fibre Channel volumes can only be mounted as read/write once. Fibre Channel volumes support ownership management and SELinux relabeling.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `lun`: Optional: FC target lun number
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `targetWWNs`: Optional: FC target worldwide names (WWNs)
-- | - `wwids`: Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously.
newtype FCVolumeSource = FCVolumeSource
  { fsType :: (Maybe String)
  , lun :: (Maybe Int)
  , readOnly :: (Maybe Boolean)
  , targetWWNs :: (Maybe (Array String))
  , wwids :: (Maybe (Array String)) }

derive instance newtypeFCVolumeSource :: Newtype FCVolumeSource _
derive instance genericFCVolumeSource :: Generic FCVolumeSource _
instance showFCVolumeSource :: Show FCVolumeSource where show a = genericShow a
instance decodeFCVolumeSource :: Decode FCVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               lun <- decodeMaybe "lun" a
               readOnly <- decodeMaybe "readOnly" a
               targetWWNs <- decodeMaybe "targetWWNs" a
               wwids <- decodeMaybe "wwids" a
               pure $ FCVolumeSource { fsType, lun, readOnly, targetWWNs, wwids }
instance encodeFCVolumeSource :: Encode FCVolumeSource where
  encode (FCVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "lun" (encodeMaybe a.lun)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "targetWWNs" (encodeMaybe a.targetWWNs)
               , Tuple "wwids" (encodeMaybe a.wwids) ]


instance defaultFCVolumeSource :: Default FCVolumeSource where
  default = FCVolumeSource
    { fsType: Nothing
    , lun: Nothing
    , readOnly: Nothing
    , targetWWNs: Nothing
    , wwids: Nothing }

-- | FlexPersistentVolumeSource represents a generic persistent volume resource that is provisioned/attached using an exec based plugin.
-- |
-- | Fields:
-- | - `driver`: Driver is the name of the driver to use for this volume.
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
-- | - `options`: Optional: Extra command options if any.
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: Optional: SecretRef is reference to the secret object containing sensitive information to pass to the plugin scripts. This may be empty if no secret object is specified. If the secret object contains more than one secret, all secrets are passed to the plugin scripts.
newtype FlexPersistentVolumeSource = FlexPersistentVolumeSource
  { driver :: (Maybe String)
  , fsType :: (Maybe String)
  , options :: (Maybe (StrMap String))
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe SecretReference) }

derive instance newtypeFlexPersistentVolumeSource :: Newtype FlexPersistentVolumeSource _
derive instance genericFlexPersistentVolumeSource :: Generic FlexPersistentVolumeSource _
instance showFlexPersistentVolumeSource :: Show FlexPersistentVolumeSource where show a = genericShow a
instance decodeFlexPersistentVolumeSource :: Decode FlexPersistentVolumeSource where
  decode a = do
               driver <- decodeMaybe "driver" a
               fsType <- decodeMaybe "fsType" a
               options <- decodeMaybe "options" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               pure $ FlexPersistentVolumeSource { driver, fsType, options, readOnly, secretRef }
instance encodeFlexPersistentVolumeSource :: Encode FlexPersistentVolumeSource where
  encode (FlexPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "driver" (encodeMaybe a.driver)
               , Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "options" (encodeMaybe a.options)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef) ]


instance defaultFlexPersistentVolumeSource :: Default FlexPersistentVolumeSource where
  default = FlexPersistentVolumeSource
    { driver: Nothing
    , fsType: Nothing
    , options: Nothing
    , readOnly: Nothing
    , secretRef: Nothing }

-- | FlexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin.
-- |
-- | Fields:
-- | - `driver`: Driver is the name of the driver to use for this volume.
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
-- | - `options`: Optional: Extra command options if any.
-- | - `readOnly`: Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: Optional: SecretRef is reference to the secret object containing sensitive information to pass to the plugin scripts. This may be empty if no secret object is specified. If the secret object contains more than one secret, all secrets are passed to the plugin scripts.
newtype FlexVolumeSource = FlexVolumeSource
  { driver :: (Maybe String)
  , fsType :: (Maybe String)
  , options :: (Maybe (StrMap String))
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe LocalObjectReference) }

derive instance newtypeFlexVolumeSource :: Newtype FlexVolumeSource _
derive instance genericFlexVolumeSource :: Generic FlexVolumeSource _
instance showFlexVolumeSource :: Show FlexVolumeSource where show a = genericShow a
instance decodeFlexVolumeSource :: Decode FlexVolumeSource where
  decode a = do
               driver <- decodeMaybe "driver" a
               fsType <- decodeMaybe "fsType" a
               options <- decodeMaybe "options" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               pure $ FlexVolumeSource { driver, fsType, options, readOnly, secretRef }
instance encodeFlexVolumeSource :: Encode FlexVolumeSource where
  encode (FlexVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "driver" (encodeMaybe a.driver)
               , Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "options" (encodeMaybe a.options)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef) ]


instance defaultFlexVolumeSource :: Default FlexVolumeSource where
  default = FlexVolumeSource
    { driver: Nothing
    , fsType: Nothing
    , options: Nothing
    , readOnly: Nothing
    , secretRef: Nothing }

-- | Represents a Flocker volume mounted by the Flocker agent. One and only one of datasetName and datasetUUID should be set. Flocker volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `datasetName`: Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated
-- | - `datasetUUID`: UUID of the dataset. This is unique identifier of a Flocker dataset
newtype FlockerVolumeSource = FlockerVolumeSource
  { datasetName :: (Maybe String)
  , datasetUUID :: (Maybe String) }

derive instance newtypeFlockerVolumeSource :: Newtype FlockerVolumeSource _
derive instance genericFlockerVolumeSource :: Generic FlockerVolumeSource _
instance showFlockerVolumeSource :: Show FlockerVolumeSource where show a = genericShow a
instance decodeFlockerVolumeSource :: Decode FlockerVolumeSource where
  decode a = do
               datasetName <- decodeMaybe "datasetName" a
               datasetUUID <- decodeMaybe "datasetUUID" a
               pure $ FlockerVolumeSource { datasetName, datasetUUID }
instance encodeFlockerVolumeSource :: Encode FlockerVolumeSource where
  encode (FlockerVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "datasetName" (encodeMaybe a.datasetName)
               , Tuple "datasetUUID" (encodeMaybe a.datasetUUID) ]


instance defaultFlockerVolumeSource :: Default FlockerVolumeSource where
  default = FlockerVolumeSource
    { datasetName: Nothing
    , datasetUUID: Nothing }

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
  { fsType :: (Maybe String)
  , partition :: (Maybe Int)
  , pdName :: (Maybe String)
  , readOnly :: (Maybe Boolean) }

derive instance newtypeGCEPersistentDiskVolumeSource :: Newtype GCEPersistentDiskVolumeSource _
derive instance genericGCEPersistentDiskVolumeSource :: Generic GCEPersistentDiskVolumeSource _
instance showGCEPersistentDiskVolumeSource :: Show GCEPersistentDiskVolumeSource where show a = genericShow a
instance decodeGCEPersistentDiskVolumeSource :: Decode GCEPersistentDiskVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               partition <- decodeMaybe "partition" a
               pdName <- decodeMaybe "pdName" a
               readOnly <- decodeMaybe "readOnly" a
               pure $ GCEPersistentDiskVolumeSource { fsType, partition, pdName, readOnly }
instance encodeGCEPersistentDiskVolumeSource :: Encode GCEPersistentDiskVolumeSource where
  encode (GCEPersistentDiskVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "partition" (encodeMaybe a.partition)
               , Tuple "pdName" (encodeMaybe a.pdName)
               , Tuple "readOnly" (encodeMaybe a.readOnly) ]


instance defaultGCEPersistentDiskVolumeSource :: Default GCEPersistentDiskVolumeSource where
  default = GCEPersistentDiskVolumeSource
    { fsType: Nothing
    , partition: Nothing
    , pdName: Nothing
    , readOnly: Nothing }

-- | Represents a volume that is populated with the contents of a git repository. Git repo volumes do not support ownership management. Git repo volumes support SELinux relabeling.
-- |
-- | Fields:
-- | - `directory`: Target directory name. Must not contain or start with '..'.  If '.' is supplied, the volume directory will be the git repository.  Otherwise, if specified, the volume will contain the git repository in the subdirectory with the given name.
-- | - `repository`: Repository URL
-- | - `revision`: Commit hash for the specified revision.
newtype GitRepoVolumeSource = GitRepoVolumeSource
  { directory :: (Maybe String)
  , repository :: (Maybe String)
  , revision :: (Maybe String) }

derive instance newtypeGitRepoVolumeSource :: Newtype GitRepoVolumeSource _
derive instance genericGitRepoVolumeSource :: Generic GitRepoVolumeSource _
instance showGitRepoVolumeSource :: Show GitRepoVolumeSource where show a = genericShow a
instance decodeGitRepoVolumeSource :: Decode GitRepoVolumeSource where
  decode a = do
               directory <- decodeMaybe "directory" a
               repository <- decodeMaybe "repository" a
               revision <- decodeMaybe "revision" a
               pure $ GitRepoVolumeSource { directory, repository, revision }
instance encodeGitRepoVolumeSource :: Encode GitRepoVolumeSource where
  encode (GitRepoVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "directory" (encodeMaybe a.directory)
               , Tuple "repository" (encodeMaybe a.repository)
               , Tuple "revision" (encodeMaybe a.revision) ]


instance defaultGitRepoVolumeSource :: Default GitRepoVolumeSource where
  default = GitRepoVolumeSource
    { directory: Nothing
    , repository: Nothing
    , revision: Nothing }

-- | Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `endpoints`: EndpointsName is the endpoint name that details Glusterfs topology. More info: https://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod
-- | - `path`: Path is the Glusterfs volume path. More info: https://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod
-- | - `readOnly`: ReadOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod
newtype GlusterfsVolumeSource = GlusterfsVolumeSource
  { endpoints :: (Maybe String)
  , path :: (Maybe String)
  , readOnly :: (Maybe Boolean) }

derive instance newtypeGlusterfsVolumeSource :: Newtype GlusterfsVolumeSource _
derive instance genericGlusterfsVolumeSource :: Generic GlusterfsVolumeSource _
instance showGlusterfsVolumeSource :: Show GlusterfsVolumeSource where show a = genericShow a
instance decodeGlusterfsVolumeSource :: Decode GlusterfsVolumeSource where
  decode a = do
               endpoints <- decodeMaybe "endpoints" a
               path <- decodeMaybe "path" a
               readOnly <- decodeMaybe "readOnly" a
               pure $ GlusterfsVolumeSource { endpoints, path, readOnly }
instance encodeGlusterfsVolumeSource :: Encode GlusterfsVolumeSource where
  encode (GlusterfsVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "endpoints" (encodeMaybe a.endpoints)
               , Tuple "path" (encodeMaybe a.path)
               , Tuple "readOnly" (encodeMaybe a.readOnly) ]


instance defaultGlusterfsVolumeSource :: Default GlusterfsVolumeSource where
  default = GlusterfsVolumeSource
    { endpoints: Nothing
    , path: Nothing
    , readOnly: Nothing }

-- | HTTPGetAction describes an action based on HTTP Get requests.
-- |
-- | Fields:
-- | - `host`: Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.
-- | - `httpHeaders`: Custom headers to set in the request. HTTP allows repeated headers.
-- | - `path`: Path to access on the HTTP server.
-- | - `port`: Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.
-- | - `scheme`: Scheme to use for connecting to the host. Defaults to HTTP.
newtype HTTPGetAction = HTTPGetAction
  { host :: (Maybe String)
  , httpHeaders :: (Maybe (Array HTTPHeader))
  , path :: (Maybe String)
  , port :: (Maybe Util.IntOrString)
  , scheme :: (Maybe String) }

derive instance newtypeHTTPGetAction :: Newtype HTTPGetAction _
derive instance genericHTTPGetAction :: Generic HTTPGetAction _
instance showHTTPGetAction :: Show HTTPGetAction where show a = genericShow a
instance decodeHTTPGetAction :: Decode HTTPGetAction where
  decode a = do
               host <- decodeMaybe "host" a
               httpHeaders <- decodeMaybe "httpHeaders" a
               path <- decodeMaybe "path" a
               port <- decodeMaybe "port" a
               scheme <- decodeMaybe "scheme" a
               pure $ HTTPGetAction { host, httpHeaders, path, port, scheme }
instance encodeHTTPGetAction :: Encode HTTPGetAction where
  encode (HTTPGetAction a) = encode $ StrMap.fromFoldable $
               [ Tuple "host" (encodeMaybe a.host)
               , Tuple "httpHeaders" (encodeMaybe a.httpHeaders)
               , Tuple "path" (encodeMaybe a.path)
               , Tuple "port" (encodeMaybe a.port)
               , Tuple "scheme" (encodeMaybe a.scheme) ]


instance defaultHTTPGetAction :: Default HTTPGetAction where
  default = HTTPGetAction
    { host: Nothing
    , httpHeaders: Nothing
    , path: Nothing
    , port: Nothing
    , scheme: Nothing }

-- | HTTPHeader describes a custom header to be used in HTTP probes
-- |
-- | Fields:
-- | - `name`: The header field name
-- | - `value`: The header field value
newtype HTTPHeader = HTTPHeader
  { name :: (Maybe String)
  , value :: (Maybe String) }

derive instance newtypeHTTPHeader :: Newtype HTTPHeader _
derive instance genericHTTPHeader :: Generic HTTPHeader _
instance showHTTPHeader :: Show HTTPHeader where show a = genericShow a
instance decodeHTTPHeader :: Decode HTTPHeader where
  decode a = do
               name <- decodeMaybe "name" a
               value <- decodeMaybe "value" a
               pure $ HTTPHeader { name, value }
instance encodeHTTPHeader :: Encode HTTPHeader where
  encode (HTTPHeader a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "value" (encodeMaybe a.value) ]


instance defaultHTTPHeader :: Default HTTPHeader where
  default = HTTPHeader
    { name: Nothing
    , value: Nothing }

-- | Handler defines a specific action that should be taken
-- |
-- | Fields:
-- | - `exec`: One and only one of the following should be specified. Exec specifies the action to take.
-- | - `httpGet`: HTTPGet specifies the http request to perform.
-- | - `tcpSocket`: TCPSocket specifies an action involving a TCP port. TCP hooks not yet supported
newtype Handler = Handler
  { exec :: (Maybe ExecAction)
  , httpGet :: (Maybe HTTPGetAction)
  , tcpSocket :: (Maybe TCPSocketAction) }

derive instance newtypeHandler :: Newtype Handler _
derive instance genericHandler :: Generic Handler _
instance showHandler :: Show Handler where show a = genericShow a
instance decodeHandler :: Decode Handler where
  decode a = do
               exec <- decodeMaybe "exec" a
               httpGet <- decodeMaybe "httpGet" a
               tcpSocket <- decodeMaybe "tcpSocket" a
               pure $ Handler { exec, httpGet, tcpSocket }
instance encodeHandler :: Encode Handler where
  encode (Handler a) = encode $ StrMap.fromFoldable $
               [ Tuple "exec" (encodeMaybe a.exec)
               , Tuple "httpGet" (encodeMaybe a.httpGet)
               , Tuple "tcpSocket" (encodeMaybe a.tcpSocket) ]


instance defaultHandler :: Default Handler where
  default = Handler
    { exec: Nothing
    , httpGet: Nothing
    , tcpSocket: Nothing }

-- | HostAlias holds the mapping between IP and hostnames that will be injected as an entry in the pod's hosts file.
-- |
-- | Fields:
-- | - `hostnames`: Hostnames for the above IP address.
-- | - `ip`: IP address of the host file entry.
newtype HostAlias = HostAlias
  { hostnames :: (Maybe (Array String))
  , ip :: (Maybe String) }

derive instance newtypeHostAlias :: Newtype HostAlias _
derive instance genericHostAlias :: Generic HostAlias _
instance showHostAlias :: Show HostAlias where show a = genericShow a
instance decodeHostAlias :: Decode HostAlias where
  decode a = do
               hostnames <- decodeMaybe "hostnames" a
               ip <- decodeMaybe "ip" a
               pure $ HostAlias { hostnames, ip }
instance encodeHostAlias :: Encode HostAlias where
  encode (HostAlias a) = encode $ StrMap.fromFoldable $
               [ Tuple "hostnames" (encodeMaybe a.hostnames)
               , Tuple "ip" (encodeMaybe a.ip) ]


instance defaultHostAlias :: Default HostAlias where
  default = HostAlias
    { hostnames: Nothing
    , ip: Nothing }

-- | Represents a host path mapped into a pod. Host path volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `_type`: Type for HostPath Volume Defaults to "" More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
-- | - `path`: Path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
newtype HostPathVolumeSource = HostPathVolumeSource
  { _type :: (Maybe String)
  , path :: (Maybe String) }

derive instance newtypeHostPathVolumeSource :: Newtype HostPathVolumeSource _
derive instance genericHostPathVolumeSource :: Generic HostPathVolumeSource _
instance showHostPathVolumeSource :: Show HostPathVolumeSource where show a = genericShow a
instance decodeHostPathVolumeSource :: Decode HostPathVolumeSource where
  decode a = do
               _type <- decodeMaybe "_type" a
               path <- decodeMaybe "path" a
               pure $ HostPathVolumeSource { _type, path }
instance encodeHostPathVolumeSource :: Encode HostPathVolumeSource where
  encode (HostPathVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "path" (encodeMaybe a.path) ]


instance defaultHostPathVolumeSource :: Default HostPathVolumeSource where
  default = HostPathVolumeSource
    { _type: Nothing
    , path: Nothing }

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
  { chapAuthDiscovery :: (Maybe Boolean)
  , chapAuthSession :: (Maybe Boolean)
  , fsType :: (Maybe String)
  , initiatorName :: (Maybe String)
  , iqn :: (Maybe String)
  , iscsiInterface :: (Maybe String)
  , lun :: (Maybe Int)
  , portals :: (Maybe (Array String))
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe SecretReference)
  , targetPortal :: (Maybe String) }

derive instance newtypeISCSIPersistentVolumeSource :: Newtype ISCSIPersistentVolumeSource _
derive instance genericISCSIPersistentVolumeSource :: Generic ISCSIPersistentVolumeSource _
instance showISCSIPersistentVolumeSource :: Show ISCSIPersistentVolumeSource where show a = genericShow a
instance decodeISCSIPersistentVolumeSource :: Decode ISCSIPersistentVolumeSource where
  decode a = do
               chapAuthDiscovery <- decodeMaybe "chapAuthDiscovery" a
               chapAuthSession <- decodeMaybe "chapAuthSession" a
               fsType <- decodeMaybe "fsType" a
               initiatorName <- decodeMaybe "initiatorName" a
               iqn <- decodeMaybe "iqn" a
               iscsiInterface <- decodeMaybe "iscsiInterface" a
               lun <- decodeMaybe "lun" a
               portals <- decodeMaybe "portals" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               targetPortal <- decodeMaybe "targetPortal" a
               pure $ ISCSIPersistentVolumeSource { chapAuthDiscovery, chapAuthSession, fsType, initiatorName, iqn, iscsiInterface, lun, portals, readOnly, secretRef, targetPortal }
instance encodeISCSIPersistentVolumeSource :: Encode ISCSIPersistentVolumeSource where
  encode (ISCSIPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "chapAuthDiscovery" (encodeMaybe a.chapAuthDiscovery)
               , Tuple "chapAuthSession" (encodeMaybe a.chapAuthSession)
               , Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "initiatorName" (encodeMaybe a.initiatorName)
               , Tuple "iqn" (encodeMaybe a.iqn)
               , Tuple "iscsiInterface" (encodeMaybe a.iscsiInterface)
               , Tuple "lun" (encodeMaybe a.lun)
               , Tuple "portals" (encodeMaybe a.portals)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "targetPortal" (encodeMaybe a.targetPortal) ]


instance defaultISCSIPersistentVolumeSource :: Default ISCSIPersistentVolumeSource where
  default = ISCSIPersistentVolumeSource
    { chapAuthDiscovery: Nothing
    , chapAuthSession: Nothing
    , fsType: Nothing
    , initiatorName: Nothing
    , iqn: Nothing
    , iscsiInterface: Nothing
    , lun: Nothing
    , portals: Nothing
    , readOnly: Nothing
    , secretRef: Nothing
    , targetPortal: Nothing }

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
  { chapAuthDiscovery :: (Maybe Boolean)
  , chapAuthSession :: (Maybe Boolean)
  , fsType :: (Maybe String)
  , initiatorName :: (Maybe String)
  , iqn :: (Maybe String)
  , iscsiInterface :: (Maybe String)
  , lun :: (Maybe Int)
  , portals :: (Maybe (Array String))
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe LocalObjectReference)
  , targetPortal :: (Maybe String) }

derive instance newtypeISCSIVolumeSource :: Newtype ISCSIVolumeSource _
derive instance genericISCSIVolumeSource :: Generic ISCSIVolumeSource _
instance showISCSIVolumeSource :: Show ISCSIVolumeSource where show a = genericShow a
instance decodeISCSIVolumeSource :: Decode ISCSIVolumeSource where
  decode a = do
               chapAuthDiscovery <- decodeMaybe "chapAuthDiscovery" a
               chapAuthSession <- decodeMaybe "chapAuthSession" a
               fsType <- decodeMaybe "fsType" a
               initiatorName <- decodeMaybe "initiatorName" a
               iqn <- decodeMaybe "iqn" a
               iscsiInterface <- decodeMaybe "iscsiInterface" a
               lun <- decodeMaybe "lun" a
               portals <- decodeMaybe "portals" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               targetPortal <- decodeMaybe "targetPortal" a
               pure $ ISCSIVolumeSource { chapAuthDiscovery, chapAuthSession, fsType, initiatorName, iqn, iscsiInterface, lun, portals, readOnly, secretRef, targetPortal }
instance encodeISCSIVolumeSource :: Encode ISCSIVolumeSource where
  encode (ISCSIVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "chapAuthDiscovery" (encodeMaybe a.chapAuthDiscovery)
               , Tuple "chapAuthSession" (encodeMaybe a.chapAuthSession)
               , Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "initiatorName" (encodeMaybe a.initiatorName)
               , Tuple "iqn" (encodeMaybe a.iqn)
               , Tuple "iscsiInterface" (encodeMaybe a.iscsiInterface)
               , Tuple "lun" (encodeMaybe a.lun)
               , Tuple "portals" (encodeMaybe a.portals)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "targetPortal" (encodeMaybe a.targetPortal) ]


instance defaultISCSIVolumeSource :: Default ISCSIVolumeSource where
  default = ISCSIVolumeSource
    { chapAuthDiscovery: Nothing
    , chapAuthSession: Nothing
    , fsType: Nothing
    , initiatorName: Nothing
    , iqn: Nothing
    , iscsiInterface: Nothing
    , lun: Nothing
    , portals: Nothing
    , readOnly: Nothing
    , secretRef: Nothing
    , targetPortal: Nothing }

-- | Maps a string key to a path within a volume.
-- |
-- | Fields:
-- | - `key`: The key to project.
-- | - `mode`: Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `path`: The relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.
newtype KeyToPath = KeyToPath
  { key :: (Maybe String)
  , mode :: (Maybe Int)
  , path :: (Maybe String) }

derive instance newtypeKeyToPath :: Newtype KeyToPath _
derive instance genericKeyToPath :: Generic KeyToPath _
instance showKeyToPath :: Show KeyToPath where show a = genericShow a
instance decodeKeyToPath :: Decode KeyToPath where
  decode a = do
               key <- decodeMaybe "key" a
               mode <- decodeMaybe "mode" a
               path <- decodeMaybe "path" a
               pure $ KeyToPath { key, mode, path }
instance encodeKeyToPath :: Encode KeyToPath where
  encode (KeyToPath a) = encode $ StrMap.fromFoldable $
               [ Tuple "key" (encodeMaybe a.key)
               , Tuple "mode" (encodeMaybe a.mode)
               , Tuple "path" (encodeMaybe a.path) ]


instance defaultKeyToPath :: Default KeyToPath where
  default = KeyToPath
    { key: Nothing
    , mode: Nothing
    , path: Nothing }

-- | Lifecycle describes actions that the management system should take in response to container lifecycle events. For the PostStart and PreStop lifecycle handlers, management of the container blocks until the action is complete, unless the container process fails, in which case the handler is aborted.
-- |
-- | Fields:
-- | - `postStart`: PostStart is called immediately after a container is created. If the handler fails, the container is terminated and restarted according to its restart policy. Other management of the container blocks until the hook completes. More info: https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#container-hooks
-- | - `preStop`: PreStop is called immediately before a container is terminated. The container is terminated after the handler completes. The reason for termination is passed to the handler. Regardless of the outcome of the handler, the container is eventually terminated. Other management of the container blocks until the hook completes. More info: https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#container-hooks
newtype Lifecycle = Lifecycle
  { postStart :: (Maybe Handler)
  , preStop :: (Maybe Handler) }

derive instance newtypeLifecycle :: Newtype Lifecycle _
derive instance genericLifecycle :: Generic Lifecycle _
instance showLifecycle :: Show Lifecycle where show a = genericShow a
instance decodeLifecycle :: Decode Lifecycle where
  decode a = do
               postStart <- decodeMaybe "postStart" a
               preStop <- decodeMaybe "preStop" a
               pure $ Lifecycle { postStart, preStop }
instance encodeLifecycle :: Encode Lifecycle where
  encode (Lifecycle a) = encode $ StrMap.fromFoldable $
               [ Tuple "postStart" (encodeMaybe a.postStart)
               , Tuple "preStop" (encodeMaybe a.preStop) ]


instance defaultLifecycle :: Default Lifecycle where
  default = Lifecycle
    { postStart: Nothing
    , preStop: Nothing }

-- | LimitRange sets resource usage limits for each kind of resource in a Namespace.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the limits enforced. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype LimitRange = LimitRange
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe LimitRangeSpec) }

derive instance newtypeLimitRange :: Newtype LimitRange _
derive instance genericLimitRange :: Generic LimitRange _
instance showLimitRange :: Show LimitRange where show a = genericShow a
instance decodeLimitRange :: Decode LimitRange where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "LimitRange" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               pure $ LimitRange { metadata, spec }
instance encodeLimitRange :: Encode LimitRange where
  encode (LimitRange a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "LimitRange")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec) ]


instance defaultLimitRange :: Default LimitRange where
  default = LimitRange
    { metadata: Nothing
    , spec: Nothing }

-- | LimitRangeItem defines a min/max usage limit for any resource that matches on kind.
-- |
-- | Fields:
-- | - `_default`: Default resource requirement limit value by resource name if resource limit is omitted.
-- | - `_type`: Type of resource that this limit applies to.
-- | - `defaultRequest`: DefaultRequest is the default resource requirement request value by resource name if resource request is omitted.
-- | - `max`: Max usage constraints on this kind by resource name.
-- | - `maxLimitRequestRatio`: MaxLimitRequestRatio if specified, the named resource must have a request and limit that are both non-zero where limit divided by request is less than or equal to the enumerated value; this represents the max burst for the named resource.
-- | - `min`: Min usage constraints on this kind by resource name.
newtype LimitRangeItem = LimitRangeItem
  { _default :: (Maybe (StrMap Resource.Quantity))
  , _type :: (Maybe String)
  , defaultRequest :: (Maybe (StrMap Resource.Quantity))
  , max :: (Maybe (StrMap Resource.Quantity))
  , maxLimitRequestRatio :: (Maybe (StrMap Resource.Quantity))
  , min :: (Maybe (StrMap Resource.Quantity)) }

derive instance newtypeLimitRangeItem :: Newtype LimitRangeItem _
derive instance genericLimitRangeItem :: Generic LimitRangeItem _
instance showLimitRangeItem :: Show LimitRangeItem where show a = genericShow a
instance decodeLimitRangeItem :: Decode LimitRangeItem where
  decode a = do
               _default <- decodeMaybe "_default" a
               _type <- decodeMaybe "_type" a
               defaultRequest <- decodeMaybe "defaultRequest" a
               max <- decodeMaybe "max" a
               maxLimitRequestRatio <- decodeMaybe "maxLimitRequestRatio" a
               min <- decodeMaybe "min" a
               pure $ LimitRangeItem { _default, _type, defaultRequest, max, maxLimitRequestRatio, min }
instance encodeLimitRangeItem :: Encode LimitRangeItem where
  encode (LimitRangeItem a) = encode $ StrMap.fromFoldable $
               [ Tuple "_default" (encodeMaybe a._default)
               , Tuple "_type" (encodeMaybe a._type)
               , Tuple "defaultRequest" (encodeMaybe a.defaultRequest)
               , Tuple "max" (encodeMaybe a.max)
               , Tuple "maxLimitRequestRatio" (encodeMaybe a.maxLimitRequestRatio)
               , Tuple "min" (encodeMaybe a.min) ]


instance defaultLimitRangeItem :: Default LimitRangeItem where
  default = LimitRangeItem
    { _default: Nothing
    , _type: Nothing
    , defaultRequest: Nothing
    , max: Nothing
    , maxLimitRequestRatio: Nothing
    , min: Nothing }

-- | LimitRangeList is a list of LimitRange items.
-- |
-- | Fields:
-- | - `items`: Items is a list of LimitRange objects. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype LimitRangeList = LimitRangeList
  { items :: (Maybe (Array LimitRange))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeLimitRangeList :: Newtype LimitRangeList _
derive instance genericLimitRangeList :: Generic LimitRangeList _
instance showLimitRangeList :: Show LimitRangeList where show a = genericShow a
instance decodeLimitRangeList :: Decode LimitRangeList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "LimitRangeList" a
               metadata <- decodeMaybe "metadata" a
               pure $ LimitRangeList { items, metadata }
instance encodeLimitRangeList :: Encode LimitRangeList where
  encode (LimitRangeList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "LimitRangeList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultLimitRangeList :: Default LimitRangeList where
  default = LimitRangeList
    { items: Nothing
    , metadata: Nothing }

-- | LimitRangeSpec defines a min/max usage limit for resources that match on kind.
-- |
-- | Fields:
-- | - `limits`: Limits is the list of LimitRangeItem objects that are enforced.
newtype LimitRangeSpec = LimitRangeSpec
  { limits :: (Maybe (Array LimitRangeItem)) }

derive instance newtypeLimitRangeSpec :: Newtype LimitRangeSpec _
derive instance genericLimitRangeSpec :: Generic LimitRangeSpec _
instance showLimitRangeSpec :: Show LimitRangeSpec where show a = genericShow a
instance decodeLimitRangeSpec :: Decode LimitRangeSpec where
  decode a = do
               limits <- decodeMaybe "limits" a
               pure $ LimitRangeSpec { limits }
instance encodeLimitRangeSpec :: Encode LimitRangeSpec where
  encode (LimitRangeSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "limits" (encodeMaybe a.limits) ]


instance defaultLimitRangeSpec :: Default LimitRangeSpec where
  default = LimitRangeSpec
    { limits: Nothing }

-- | LoadBalancerIngress represents the status of a load-balancer ingress point: traffic intended for the service should be sent to an ingress point.
-- |
-- | Fields:
-- | - `hostname`: Hostname is set for load-balancer ingress points that are DNS based (typically AWS load-balancers)
-- | - `ip`: IP is set for load-balancer ingress points that are IP based (typically GCE or OpenStack load-balancers)
newtype LoadBalancerIngress = LoadBalancerIngress
  { hostname :: (Maybe String)
  , ip :: (Maybe String) }

derive instance newtypeLoadBalancerIngress :: Newtype LoadBalancerIngress _
derive instance genericLoadBalancerIngress :: Generic LoadBalancerIngress _
instance showLoadBalancerIngress :: Show LoadBalancerIngress where show a = genericShow a
instance decodeLoadBalancerIngress :: Decode LoadBalancerIngress where
  decode a = do
               hostname <- decodeMaybe "hostname" a
               ip <- decodeMaybe "ip" a
               pure $ LoadBalancerIngress { hostname, ip }
instance encodeLoadBalancerIngress :: Encode LoadBalancerIngress where
  encode (LoadBalancerIngress a) = encode $ StrMap.fromFoldable $
               [ Tuple "hostname" (encodeMaybe a.hostname)
               , Tuple "ip" (encodeMaybe a.ip) ]


instance defaultLoadBalancerIngress :: Default LoadBalancerIngress where
  default = LoadBalancerIngress
    { hostname: Nothing
    , ip: Nothing }

-- | LoadBalancerStatus represents the status of a load-balancer.
-- |
-- | Fields:
-- | - `ingress`: Ingress is a list containing ingress points for the load-balancer. Traffic intended for the service should be sent to these ingress points.
newtype LoadBalancerStatus = LoadBalancerStatus
  { ingress :: (Maybe (Array LoadBalancerIngress)) }

derive instance newtypeLoadBalancerStatus :: Newtype LoadBalancerStatus _
derive instance genericLoadBalancerStatus :: Generic LoadBalancerStatus _
instance showLoadBalancerStatus :: Show LoadBalancerStatus where show a = genericShow a
instance decodeLoadBalancerStatus :: Decode LoadBalancerStatus where
  decode a = do
               ingress <- decodeMaybe "ingress" a
               pure $ LoadBalancerStatus { ingress }
instance encodeLoadBalancerStatus :: Encode LoadBalancerStatus where
  encode (LoadBalancerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "ingress" (encodeMaybe a.ingress) ]


instance defaultLoadBalancerStatus :: Default LoadBalancerStatus where
  default = LoadBalancerStatus
    { ingress: Nothing }

-- | LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.
-- |
-- | Fields:
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
newtype LocalObjectReference = LocalObjectReference
  { name :: (Maybe String) }

derive instance newtypeLocalObjectReference :: Newtype LocalObjectReference _
derive instance genericLocalObjectReference :: Generic LocalObjectReference _
instance showLocalObjectReference :: Show LocalObjectReference where show a = genericShow a
instance decodeLocalObjectReference :: Decode LocalObjectReference where
  decode a = do
               name <- decodeMaybe "name" a
               pure $ LocalObjectReference { name }
instance encodeLocalObjectReference :: Encode LocalObjectReference where
  encode (LocalObjectReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name) ]


instance defaultLocalObjectReference :: Default LocalObjectReference where
  default = LocalObjectReference
    { name: Nothing }

-- | Local represents directly-attached storage with node affinity
-- |
-- | Fields:
-- | - `path`: The full path to the volume on the node For alpha, this path must be a directory Once block as a source is supported, then this path can point to a block device
newtype LocalVolumeSource = LocalVolumeSource
  { path :: (Maybe String) }

derive instance newtypeLocalVolumeSource :: Newtype LocalVolumeSource _
derive instance genericLocalVolumeSource :: Generic LocalVolumeSource _
instance showLocalVolumeSource :: Show LocalVolumeSource where show a = genericShow a
instance decodeLocalVolumeSource :: Decode LocalVolumeSource where
  decode a = do
               path <- decodeMaybe "path" a
               pure $ LocalVolumeSource { path }
instance encodeLocalVolumeSource :: Encode LocalVolumeSource where
  encode (LocalVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "path" (encodeMaybe a.path) ]


instance defaultLocalVolumeSource :: Default LocalVolumeSource where
  default = LocalVolumeSource
    { path: Nothing }

-- | Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `path`: Path that is exported by the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
-- | - `readOnly`: ReadOnly here will force the NFS export to be mounted with read-only permissions. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
-- | - `server`: Server is the hostname or IP address of the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
newtype NFSVolumeSource = NFSVolumeSource
  { path :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , server :: (Maybe String) }

derive instance newtypeNFSVolumeSource :: Newtype NFSVolumeSource _
derive instance genericNFSVolumeSource :: Generic NFSVolumeSource _
instance showNFSVolumeSource :: Show NFSVolumeSource where show a = genericShow a
instance decodeNFSVolumeSource :: Decode NFSVolumeSource where
  decode a = do
               path <- decodeMaybe "path" a
               readOnly <- decodeMaybe "readOnly" a
               server <- decodeMaybe "server" a
               pure $ NFSVolumeSource { path, readOnly, server }
instance encodeNFSVolumeSource :: Encode NFSVolumeSource where
  encode (NFSVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "path" (encodeMaybe a.path)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "server" (encodeMaybe a.server) ]


instance defaultNFSVolumeSource :: Default NFSVolumeSource where
  default = NFSVolumeSource
    { path: Nothing
    , readOnly: Nothing
    , server: Nothing }

-- | Namespace provides a scope for Names. Use of multiple namespaces is optional.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the behavior of the Namespace. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status describes the current status of a Namespace. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Namespace = Namespace
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe NamespaceSpec)
  , status :: (Maybe NamespaceStatus) }

derive instance newtypeNamespace :: Newtype Namespace _
derive instance genericNamespace :: Generic Namespace _
instance showNamespace :: Show Namespace where show a = genericShow a
instance decodeNamespace :: Decode Namespace where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "Namespace" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Namespace { metadata, spec, status }
instance encodeNamespace :: Encode Namespace where
  encode (Namespace a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "Namespace")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultNamespace :: Default Namespace where
  default = Namespace
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | NamespaceList is a list of Namespaces.
-- |
-- | Fields:
-- | - `items`: Items is the list of Namespace objects in the list. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype NamespaceList = NamespaceList
  { items :: (Maybe (Array Namespace))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeNamespaceList :: Newtype NamespaceList _
derive instance genericNamespaceList :: Generic NamespaceList _
instance showNamespaceList :: Show NamespaceList where show a = genericShow a
instance decodeNamespaceList :: Decode NamespaceList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "NamespaceList" a
               metadata <- decodeMaybe "metadata" a
               pure $ NamespaceList { items, metadata }
instance encodeNamespaceList :: Encode NamespaceList where
  encode (NamespaceList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "NamespaceList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultNamespaceList :: Default NamespaceList where
  default = NamespaceList
    { items: Nothing
    , metadata: Nothing }

-- | NamespaceSpec describes the attributes on a Namespace.
-- |
-- | Fields:
-- | - `finalizers`: Finalizers is an opaque list of values that must be empty to permanently remove object from storage. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
newtype NamespaceSpec = NamespaceSpec
  { finalizers :: (Maybe (Array String)) }

derive instance newtypeNamespaceSpec :: Newtype NamespaceSpec _
derive instance genericNamespaceSpec :: Generic NamespaceSpec _
instance showNamespaceSpec :: Show NamespaceSpec where show a = genericShow a
instance decodeNamespaceSpec :: Decode NamespaceSpec where
  decode a = do
               finalizers <- decodeMaybe "finalizers" a
               pure $ NamespaceSpec { finalizers }
instance encodeNamespaceSpec :: Encode NamespaceSpec where
  encode (NamespaceSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "finalizers" (encodeMaybe a.finalizers) ]


instance defaultNamespaceSpec :: Default NamespaceSpec where
  default = NamespaceSpec
    { finalizers: Nothing }

-- | NamespaceStatus is information about the current status of a Namespace.
-- |
-- | Fields:
-- | - `phase`: Phase is the current lifecycle phase of the namespace. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
newtype NamespaceStatus = NamespaceStatus
  { phase :: (Maybe String) }

derive instance newtypeNamespaceStatus :: Newtype NamespaceStatus _
derive instance genericNamespaceStatus :: Generic NamespaceStatus _
instance showNamespaceStatus :: Show NamespaceStatus where show a = genericShow a
instance decodeNamespaceStatus :: Decode NamespaceStatus where
  decode a = do
               phase <- decodeMaybe "phase" a
               pure $ NamespaceStatus { phase }
instance encodeNamespaceStatus :: Encode NamespaceStatus where
  encode (NamespaceStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "phase" (encodeMaybe a.phase) ]


instance defaultNamespaceStatus :: Default NamespaceStatus where
  default = NamespaceStatus
    { phase: Nothing }

-- | Node is a worker node in Kubernetes. Each node will have a unique identifier in the cache (i.e. in etcd).
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the behavior of a node. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Most recently observed status of the node. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Node = Node
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe NodeSpec)
  , status :: (Maybe NodeStatus) }

derive instance newtypeNode :: Newtype Node _
derive instance genericNode :: Generic Node _
instance showNode :: Show Node where show a = genericShow a
instance decodeNode :: Decode Node where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "Node" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Node { metadata, spec, status }
instance encodeNode :: Encode Node where
  encode (Node a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "Node")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultNode :: Default Node where
  default = Node
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | NodeAddress contains information for the node's address.
-- |
-- | Fields:
-- | - `_type`: Node address type, one of Hostname, ExternalIP or InternalIP.
-- | - `address`: The node address.
newtype NodeAddress = NodeAddress
  { _type :: (Maybe String)
  , address :: (Maybe String) }

derive instance newtypeNodeAddress :: Newtype NodeAddress _
derive instance genericNodeAddress :: Generic NodeAddress _
instance showNodeAddress :: Show NodeAddress where show a = genericShow a
instance decodeNodeAddress :: Decode NodeAddress where
  decode a = do
               _type <- decodeMaybe "_type" a
               address <- decodeMaybe "address" a
               pure $ NodeAddress { _type, address }
instance encodeNodeAddress :: Encode NodeAddress where
  encode (NodeAddress a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "address" (encodeMaybe a.address) ]


instance defaultNodeAddress :: Default NodeAddress where
  default = NodeAddress
    { _type: Nothing
    , address: Nothing }

-- | Node affinity is a group of node affinity scheduling rules.
-- |
-- | Fields:
-- | - `preferredDuringSchedulingIgnoredDuringExecution`: The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred.
-- | - `requiredDuringSchedulingIgnoredDuringExecution`: If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to an update), the system may or may not try to eventually evict the pod from its node.
newtype NodeAffinity = NodeAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (Maybe (Array PreferredSchedulingTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (Maybe NodeSelector) }

derive instance newtypeNodeAffinity :: Newtype NodeAffinity _
derive instance genericNodeAffinity :: Generic NodeAffinity _
instance showNodeAffinity :: Show NodeAffinity where show a = genericShow a
instance decodeNodeAffinity :: Decode NodeAffinity where
  decode a = do
               preferredDuringSchedulingIgnoredDuringExecution <- decodeMaybe "preferredDuringSchedulingIgnoredDuringExecution" a
               requiredDuringSchedulingIgnoredDuringExecution <- decodeMaybe "requiredDuringSchedulingIgnoredDuringExecution" a
               pure $ NodeAffinity { preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution }
instance encodeNodeAffinity :: Encode NodeAffinity where
  encode (NodeAffinity a) = encode $ StrMap.fromFoldable $
               [ Tuple "preferredDuringSchedulingIgnoredDuringExecution" (encodeMaybe a.preferredDuringSchedulingIgnoredDuringExecution)
               , Tuple "requiredDuringSchedulingIgnoredDuringExecution" (encodeMaybe a.requiredDuringSchedulingIgnoredDuringExecution) ]


instance defaultNodeAffinity :: Default NodeAffinity where
  default = NodeAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: Nothing }

-- | NodeCondition contains condition information for a node.
-- |
-- | Fields:
-- | - `_type`: Type of node condition.
-- | - `lastHeartbeatTime`: Last time we got an update on a given condition.
-- | - `lastTransitionTime`: Last time the condition transit from one status to another.
-- | - `message`: Human readable message indicating details about last transition.
-- | - `reason`: (brief) reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype NodeCondition = NodeCondition
  { _type :: (Maybe String)
  , lastHeartbeatTime :: (Maybe MetaV1.Time)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeNodeCondition :: Newtype NodeCondition _
derive instance genericNodeCondition :: Generic NodeCondition _
instance showNodeCondition :: Show NodeCondition where show a = genericShow a
instance decodeNodeCondition :: Decode NodeCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastHeartbeatTime <- decodeMaybe "lastHeartbeatTime" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ NodeCondition { _type, lastHeartbeatTime, lastTransitionTime, message, reason, status }
instance encodeNodeCondition :: Encode NodeCondition where
  encode (NodeCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastHeartbeatTime" (encodeMaybe a.lastHeartbeatTime)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultNodeCondition :: Default NodeCondition where
  default = NodeCondition
    { _type: Nothing
    , lastHeartbeatTime: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | NodeConfigSource specifies a source of node configuration. Exactly one subfield (excluding metadata) must be non-nil.
-- |
-- | Fields:
-- | - `configMapRef`
newtype NodeConfigSource = NodeConfigSource
  { configMapRef :: (Maybe ObjectReference) }

derive instance newtypeNodeConfigSource :: Newtype NodeConfigSource _
derive instance genericNodeConfigSource :: Generic NodeConfigSource _
instance showNodeConfigSource :: Show NodeConfigSource where show a = genericShow a
instance decodeNodeConfigSource :: Decode NodeConfigSource where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               configMapRef <- decodeMaybe "configMapRef" a
               assertPropEq "kind" "NodeConfigSource" a
               pure $ NodeConfigSource { configMapRef }
instance encodeNodeConfigSource :: Encode NodeConfigSource where
  encode (NodeConfigSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "configMapRef" (encodeMaybe a.configMapRef)
               , Tuple "kind" (encode "NodeConfigSource") ]


instance defaultNodeConfigSource :: Default NodeConfigSource where
  default = NodeConfigSource
    { configMapRef: Nothing }

-- | NodeDaemonEndpoints lists ports opened by daemons running on the Node.
-- |
-- | Fields:
-- | - `kubeletEndpoint`: Endpoint on which Kubelet is listening.
newtype NodeDaemonEndpoints = NodeDaemonEndpoints
  { kubeletEndpoint :: (Maybe DaemonEndpoint) }

derive instance newtypeNodeDaemonEndpoints :: Newtype NodeDaemonEndpoints _
derive instance genericNodeDaemonEndpoints :: Generic NodeDaemonEndpoints _
instance showNodeDaemonEndpoints :: Show NodeDaemonEndpoints where show a = genericShow a
instance decodeNodeDaemonEndpoints :: Decode NodeDaemonEndpoints where
  decode a = do
               kubeletEndpoint <- decodeMaybe "kubeletEndpoint" a
               pure $ NodeDaemonEndpoints { kubeletEndpoint }
instance encodeNodeDaemonEndpoints :: Encode NodeDaemonEndpoints where
  encode (NodeDaemonEndpoints a) = encode $ StrMap.fromFoldable $
               [ Tuple "kubeletEndpoint" (encodeMaybe a.kubeletEndpoint) ]


instance defaultNodeDaemonEndpoints :: Default NodeDaemonEndpoints where
  default = NodeDaemonEndpoints
    { kubeletEndpoint: Nothing }

-- | NodeList is the whole list of all Nodes which have been registered with master.
-- |
-- | Fields:
-- | - `items`: List of nodes
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype NodeList = NodeList
  { items :: (Maybe (Array Node))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeNodeList :: Newtype NodeList _
derive instance genericNodeList :: Generic NodeList _
instance showNodeList :: Show NodeList where show a = genericShow a
instance decodeNodeList :: Decode NodeList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "NodeList" a
               metadata <- decodeMaybe "metadata" a
               pure $ NodeList { items, metadata }
instance encodeNodeList :: Encode NodeList where
  encode (NodeList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "NodeList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultNodeList :: Default NodeList where
  default = NodeList
    { items: Nothing
    , metadata: Nothing }

-- | A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms.
-- |
-- | Fields:
-- | - `nodeSelectorTerms`: Required. A list of node selector terms. The terms are ORed.
newtype NodeSelector = NodeSelector
  { nodeSelectorTerms :: (Maybe (Array NodeSelectorTerm)) }

derive instance newtypeNodeSelector :: Newtype NodeSelector _
derive instance genericNodeSelector :: Generic NodeSelector _
instance showNodeSelector :: Show NodeSelector where show a = genericShow a
instance decodeNodeSelector :: Decode NodeSelector where
  decode a = do
               nodeSelectorTerms <- decodeMaybe "nodeSelectorTerms" a
               pure $ NodeSelector { nodeSelectorTerms }
instance encodeNodeSelector :: Encode NodeSelector where
  encode (NodeSelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "nodeSelectorTerms" (encodeMaybe a.nodeSelectorTerms) ]


instance defaultNodeSelector :: Default NodeSelector where
  default = NodeSelector
    { nodeSelectorTerms: Nothing }

-- | A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values.
-- |
-- | Fields:
-- | - `key`: The label key that the selector applies to.
-- | - `operator`: Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
-- | - `values`: An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch.
newtype NodeSelectorRequirement = NodeSelectorRequirement
  { key :: (Maybe String)
  , operator :: (Maybe String)
  , values :: (Maybe (Array String)) }

derive instance newtypeNodeSelectorRequirement :: Newtype NodeSelectorRequirement _
derive instance genericNodeSelectorRequirement :: Generic NodeSelectorRequirement _
instance showNodeSelectorRequirement :: Show NodeSelectorRequirement where show a = genericShow a
instance decodeNodeSelectorRequirement :: Decode NodeSelectorRequirement where
  decode a = do
               key <- decodeMaybe "key" a
               operator <- decodeMaybe "operator" a
               values <- decodeMaybe "values" a
               pure $ NodeSelectorRequirement { key, operator, values }
instance encodeNodeSelectorRequirement :: Encode NodeSelectorRequirement where
  encode (NodeSelectorRequirement a) = encode $ StrMap.fromFoldable $
               [ Tuple "key" (encodeMaybe a.key)
               , Tuple "operator" (encodeMaybe a.operator)
               , Tuple "values" (encodeMaybe a.values) ]


instance defaultNodeSelectorRequirement :: Default NodeSelectorRequirement where
  default = NodeSelectorRequirement
    { key: Nothing
    , operator: Nothing
    , values: Nothing }

-- | A null or empty node selector term matches no objects.
-- |
-- | Fields:
-- | - `matchExpressions`: Required. A list of node selector requirements. The requirements are ANDed.
newtype NodeSelectorTerm = NodeSelectorTerm
  { matchExpressions :: (Maybe (Array NodeSelectorRequirement)) }

derive instance newtypeNodeSelectorTerm :: Newtype NodeSelectorTerm _
derive instance genericNodeSelectorTerm :: Generic NodeSelectorTerm _
instance showNodeSelectorTerm :: Show NodeSelectorTerm where show a = genericShow a
instance decodeNodeSelectorTerm :: Decode NodeSelectorTerm where
  decode a = do
               matchExpressions <- decodeMaybe "matchExpressions" a
               pure $ NodeSelectorTerm { matchExpressions }
instance encodeNodeSelectorTerm :: Encode NodeSelectorTerm where
  encode (NodeSelectorTerm a) = encode $ StrMap.fromFoldable $
               [ Tuple "matchExpressions" (encodeMaybe a.matchExpressions) ]


instance defaultNodeSelectorTerm :: Default NodeSelectorTerm where
  default = NodeSelectorTerm
    { matchExpressions: Nothing }

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
  { configSource :: (Maybe NodeConfigSource)
  , externalID :: (Maybe String)
  , podCIDR :: (Maybe String)
  , providerID :: (Maybe String)
  , taints :: (Maybe (Array Taint))
  , unschedulable :: (Maybe Boolean) }

derive instance newtypeNodeSpec :: Newtype NodeSpec _
derive instance genericNodeSpec :: Generic NodeSpec _
instance showNodeSpec :: Show NodeSpec where show a = genericShow a
instance decodeNodeSpec :: Decode NodeSpec where
  decode a = do
               configSource <- decodeMaybe "configSource" a
               externalID <- decodeMaybe "externalID" a
               podCIDR <- decodeMaybe "podCIDR" a
               providerID <- decodeMaybe "providerID" a
               taints <- decodeMaybe "taints" a
               unschedulable <- decodeMaybe "unschedulable" a
               pure $ NodeSpec { configSource, externalID, podCIDR, providerID, taints, unschedulable }
instance encodeNodeSpec :: Encode NodeSpec where
  encode (NodeSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "configSource" (encodeMaybe a.configSource)
               , Tuple "externalID" (encodeMaybe a.externalID)
               , Tuple "podCIDR" (encodeMaybe a.podCIDR)
               , Tuple "providerID" (encodeMaybe a.providerID)
               , Tuple "taints" (encodeMaybe a.taints)
               , Tuple "unschedulable" (encodeMaybe a.unschedulable) ]


instance defaultNodeSpec :: Default NodeSpec where
  default = NodeSpec
    { configSource: Nothing
    , externalID: Nothing
    , podCIDR: Nothing
    , providerID: Nothing
    , taints: Nothing
    , unschedulable: Nothing }

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
  { addresses :: (Maybe (Array NodeAddress))
  , allocatable :: (Maybe (StrMap Resource.Quantity))
  , capacity :: (Maybe (StrMap Resource.Quantity))
  , conditions :: (Maybe (Array NodeCondition))
  , daemonEndpoints :: (Maybe NodeDaemonEndpoints)
  , images :: (Maybe (Array ContainerImage))
  , nodeInfo :: (Maybe NodeSystemInfo)
  , phase :: (Maybe String)
  , volumesAttached :: (Maybe (Array AttachedVolume))
  , volumesInUse :: (Maybe (Array String)) }

derive instance newtypeNodeStatus :: Newtype NodeStatus _
derive instance genericNodeStatus :: Generic NodeStatus _
instance showNodeStatus :: Show NodeStatus where show a = genericShow a
instance decodeNodeStatus :: Decode NodeStatus where
  decode a = do
               addresses <- decodeMaybe "addresses" a
               allocatable <- decodeMaybe "allocatable" a
               capacity <- decodeMaybe "capacity" a
               conditions <- decodeMaybe "conditions" a
               daemonEndpoints <- decodeMaybe "daemonEndpoints" a
               images <- decodeMaybe "images" a
               nodeInfo <- decodeMaybe "nodeInfo" a
               phase <- decodeMaybe "phase" a
               volumesAttached <- decodeMaybe "volumesAttached" a
               volumesInUse <- decodeMaybe "volumesInUse" a
               pure $ NodeStatus { addresses, allocatable, capacity, conditions, daemonEndpoints, images, nodeInfo, phase, volumesAttached, volumesInUse }
instance encodeNodeStatus :: Encode NodeStatus where
  encode (NodeStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "addresses" (encodeMaybe a.addresses)
               , Tuple "allocatable" (encodeMaybe a.allocatable)
               , Tuple "capacity" (encodeMaybe a.capacity)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "daemonEndpoints" (encodeMaybe a.daemonEndpoints)
               , Tuple "images" (encodeMaybe a.images)
               , Tuple "nodeInfo" (encodeMaybe a.nodeInfo)
               , Tuple "phase" (encodeMaybe a.phase)
               , Tuple "volumesAttached" (encodeMaybe a.volumesAttached)
               , Tuple "volumesInUse" (encodeMaybe a.volumesInUse) ]


instance defaultNodeStatus :: Default NodeStatus where
  default = NodeStatus
    { addresses: Nothing
    , allocatable: Nothing
    , capacity: Nothing
    , conditions: Nothing
    , daemonEndpoints: Nothing
    , images: Nothing
    , nodeInfo: Nothing
    , phase: Nothing
    , volumesAttached: Nothing
    , volumesInUse: Nothing }

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
  { architecture :: (Maybe String)
  , bootID :: (Maybe String)
  , containerRuntimeVersion :: (Maybe String)
  , kernelVersion :: (Maybe String)
  , kubeProxyVersion :: (Maybe String)
  , kubeletVersion :: (Maybe String)
  , machineID :: (Maybe String)
  , operatingSystem :: (Maybe String)
  , osImage :: (Maybe String)
  , systemUUID :: (Maybe String) }

derive instance newtypeNodeSystemInfo :: Newtype NodeSystemInfo _
derive instance genericNodeSystemInfo :: Generic NodeSystemInfo _
instance showNodeSystemInfo :: Show NodeSystemInfo where show a = genericShow a
instance decodeNodeSystemInfo :: Decode NodeSystemInfo where
  decode a = do
               architecture <- decodeMaybe "architecture" a
               bootID <- decodeMaybe "bootID" a
               containerRuntimeVersion <- decodeMaybe "containerRuntimeVersion" a
               kernelVersion <- decodeMaybe "kernelVersion" a
               kubeProxyVersion <- decodeMaybe "kubeProxyVersion" a
               kubeletVersion <- decodeMaybe "kubeletVersion" a
               machineID <- decodeMaybe "machineID" a
               operatingSystem <- decodeMaybe "operatingSystem" a
               osImage <- decodeMaybe "osImage" a
               systemUUID <- decodeMaybe "systemUUID" a
               pure $ NodeSystemInfo { architecture, bootID, containerRuntimeVersion, kernelVersion, kubeProxyVersion, kubeletVersion, machineID, operatingSystem, osImage, systemUUID }
instance encodeNodeSystemInfo :: Encode NodeSystemInfo where
  encode (NodeSystemInfo a) = encode $ StrMap.fromFoldable $
               [ Tuple "architecture" (encodeMaybe a.architecture)
               , Tuple "bootID" (encodeMaybe a.bootID)
               , Tuple "containerRuntimeVersion" (encodeMaybe a.containerRuntimeVersion)
               , Tuple "kernelVersion" (encodeMaybe a.kernelVersion)
               , Tuple "kubeProxyVersion" (encodeMaybe a.kubeProxyVersion)
               , Tuple "kubeletVersion" (encodeMaybe a.kubeletVersion)
               , Tuple "machineID" (encodeMaybe a.machineID)
               , Tuple "operatingSystem" (encodeMaybe a.operatingSystem)
               , Tuple "osImage" (encodeMaybe a.osImage)
               , Tuple "systemUUID" (encodeMaybe a.systemUUID) ]


instance defaultNodeSystemInfo :: Default NodeSystemInfo where
  default = NodeSystemInfo
    { architecture: Nothing
    , bootID: Nothing
    , containerRuntimeVersion: Nothing
    , kernelVersion: Nothing
    , kubeProxyVersion: Nothing
    , kubeletVersion: Nothing
    , machineID: Nothing
    , operatingSystem: Nothing
    , osImage: Nothing
    , systemUUID: Nothing }

-- | ObjectFieldSelector selects an APIVersioned field of an object.
-- |
-- | Fields:
-- | - `apiVersion`: Version of the schema the FieldPath is written in terms of, defaults to "v1".
-- | - `fieldPath`: Path of the field to select in the specified API version.
newtype ObjectFieldSelector = ObjectFieldSelector
  { apiVersion :: (Maybe String)
  , fieldPath :: (Maybe String) }

derive instance newtypeObjectFieldSelector :: Newtype ObjectFieldSelector _
derive instance genericObjectFieldSelector :: Generic ObjectFieldSelector _
instance showObjectFieldSelector :: Show ObjectFieldSelector where show a = genericShow a
instance decodeObjectFieldSelector :: Decode ObjectFieldSelector where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               fieldPath <- decodeMaybe "fieldPath" a
               pure $ ObjectFieldSelector { apiVersion, fieldPath }
instance encodeObjectFieldSelector :: Encode ObjectFieldSelector where
  encode (ObjectFieldSelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "fieldPath" (encodeMaybe a.fieldPath) ]


instance defaultObjectFieldSelector :: Default ObjectFieldSelector where
  default = ObjectFieldSelector
    { apiVersion: Nothing
    , fieldPath: Nothing }

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
  { apiVersion :: (Maybe String)
  , fieldPath :: (Maybe String)
  , kind :: (Maybe String)
  , name :: (Maybe String)
  , namespace :: (Maybe String)
  , resourceVersion :: (Maybe String)
  , uid :: (Maybe String) }

derive instance newtypeObjectReference :: Newtype ObjectReference _
derive instance genericObjectReference :: Generic ObjectReference _
instance showObjectReference :: Show ObjectReference where show a = genericShow a
instance decodeObjectReference :: Decode ObjectReference where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               fieldPath <- decodeMaybe "fieldPath" a
               kind <- decodeMaybe "kind" a
               name <- decodeMaybe "name" a
               namespace <- decodeMaybe "namespace" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               uid <- decodeMaybe "uid" a
               pure $ ObjectReference { apiVersion, fieldPath, kind, name, namespace, resourceVersion, uid }
instance encodeObjectReference :: Encode ObjectReference where
  encode (ObjectReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "fieldPath" (encodeMaybe a.fieldPath)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "namespace" (encodeMaybe a.namespace)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "uid" (encodeMaybe a.uid) ]


instance defaultObjectReference :: Default ObjectReference where
  default = ObjectReference
    { apiVersion: Nothing
    , fieldPath: Nothing
    , kind: Nothing
    , name: Nothing
    , namespace: Nothing
    , resourceVersion: Nothing
    , uid: Nothing }

-- | PersistentVolume (PV) is a storage resource provisioned by an administrator. It is analogous to a node. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines a specification of a persistent volume owned by the cluster. Provisioned by an administrator. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistent-volumes
-- | - `status`: Status represents the current information/status for the persistent volume. Populated by the system. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistent-volumes
newtype PersistentVolume = PersistentVolume
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe PersistentVolumeSpec)
  , status :: (Maybe PersistentVolumeStatus) }

derive instance newtypePersistentVolume :: Newtype PersistentVolume _
derive instance genericPersistentVolume :: Generic PersistentVolume _
instance showPersistentVolume :: Show PersistentVolume where show a = genericShow a
instance decodePersistentVolume :: Decode PersistentVolume where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "PersistentVolume" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ PersistentVolume { metadata, spec, status }
instance encodePersistentVolume :: Encode PersistentVolume where
  encode (PersistentVolume a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "PersistentVolume")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultPersistentVolume :: Default PersistentVolume where
  default = PersistentVolume
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | PersistentVolumeClaim is a user's request for and claim to a persistent volume
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the desired characteristics of a volume requested by a pod author. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
-- | - `status`: Status represents the current information/status of a persistent volume claim. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
newtype PersistentVolumeClaim = PersistentVolumeClaim
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe PersistentVolumeClaimSpec)
  , status :: (Maybe PersistentVolumeClaimStatus) }

derive instance newtypePersistentVolumeClaim :: Newtype PersistentVolumeClaim _
derive instance genericPersistentVolumeClaim :: Generic PersistentVolumeClaim _
instance showPersistentVolumeClaim :: Show PersistentVolumeClaim where show a = genericShow a
instance decodePersistentVolumeClaim :: Decode PersistentVolumeClaim where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "PersistentVolumeClaim" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ PersistentVolumeClaim { metadata, spec, status }
instance encodePersistentVolumeClaim :: Encode PersistentVolumeClaim where
  encode (PersistentVolumeClaim a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "PersistentVolumeClaim")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultPersistentVolumeClaim :: Default PersistentVolumeClaim where
  default = PersistentVolumeClaim
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | PersistentVolumeClaimCondition contails details about state of pvc
-- |
-- | Fields:
-- | - `_type`
-- | - `lastProbeTime`: Last time we probed the condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: Human-readable message indicating details about last transition.
-- | - `reason`: Unique, this should be a short, machine understandable string that gives the reason for condition's last transition. If it reports "ResizeStarted" that means the underlying persistent volume is being resized.
-- | - `status`
newtype PersistentVolumeClaimCondition = PersistentVolumeClaimCondition
  { _type :: (Maybe String)
  , lastProbeTime :: (Maybe MetaV1.Time)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypePersistentVolumeClaimCondition :: Newtype PersistentVolumeClaimCondition _
derive instance genericPersistentVolumeClaimCondition :: Generic PersistentVolumeClaimCondition _
instance showPersistentVolumeClaimCondition :: Show PersistentVolumeClaimCondition where show a = genericShow a
instance decodePersistentVolumeClaimCondition :: Decode PersistentVolumeClaimCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastProbeTime <- decodeMaybe "lastProbeTime" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ PersistentVolumeClaimCondition { _type, lastProbeTime, lastTransitionTime, message, reason, status }
instance encodePersistentVolumeClaimCondition :: Encode PersistentVolumeClaimCondition where
  encode (PersistentVolumeClaimCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastProbeTime" (encodeMaybe a.lastProbeTime)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultPersistentVolumeClaimCondition :: Default PersistentVolumeClaimCondition where
  default = PersistentVolumeClaimCondition
    { _type: Nothing
    , lastProbeTime: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | PersistentVolumeClaimList is a list of PersistentVolumeClaim items.
-- |
-- | Fields:
-- | - `items`: A list of persistent volume claims. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype PersistentVolumeClaimList = PersistentVolumeClaimList
  { items :: (Maybe (Array PersistentVolumeClaim))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePersistentVolumeClaimList :: Newtype PersistentVolumeClaimList _
derive instance genericPersistentVolumeClaimList :: Generic PersistentVolumeClaimList _
instance showPersistentVolumeClaimList :: Show PersistentVolumeClaimList where show a = genericShow a
instance decodePersistentVolumeClaimList :: Decode PersistentVolumeClaimList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "PersistentVolumeClaimList" a
               metadata <- decodeMaybe "metadata" a
               pure $ PersistentVolumeClaimList { items, metadata }
instance encodePersistentVolumeClaimList :: Encode PersistentVolumeClaimList where
  encode (PersistentVolumeClaimList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "PersistentVolumeClaimList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPersistentVolumeClaimList :: Default PersistentVolumeClaimList where
  default = PersistentVolumeClaimList
    { items: Nothing
    , metadata: Nothing }

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
  { accessModes :: (Maybe (Array String))
  , resources :: (Maybe ResourceRequirements)
  , selector :: (Maybe MetaV1.LabelSelector)
  , storageClassName :: (Maybe String)
  , volumeMode :: (Maybe String)
  , volumeName :: (Maybe String) }

derive instance newtypePersistentVolumeClaimSpec :: Newtype PersistentVolumeClaimSpec _
derive instance genericPersistentVolumeClaimSpec :: Generic PersistentVolumeClaimSpec _
instance showPersistentVolumeClaimSpec :: Show PersistentVolumeClaimSpec where show a = genericShow a
instance decodePersistentVolumeClaimSpec :: Decode PersistentVolumeClaimSpec where
  decode a = do
               accessModes <- decodeMaybe "accessModes" a
               resources <- decodeMaybe "resources" a
               selector <- decodeMaybe "selector" a
               storageClassName <- decodeMaybe "storageClassName" a
               volumeMode <- decodeMaybe "volumeMode" a
               volumeName <- decodeMaybe "volumeName" a
               pure $ PersistentVolumeClaimSpec { accessModes, resources, selector, storageClassName, volumeMode, volumeName }
instance encodePersistentVolumeClaimSpec :: Encode PersistentVolumeClaimSpec where
  encode (PersistentVolumeClaimSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "accessModes" (encodeMaybe a.accessModes)
               , Tuple "resources" (encodeMaybe a.resources)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "storageClassName" (encodeMaybe a.storageClassName)
               , Tuple "volumeMode" (encodeMaybe a.volumeMode)
               , Tuple "volumeName" (encodeMaybe a.volumeName) ]


instance defaultPersistentVolumeClaimSpec :: Default PersistentVolumeClaimSpec where
  default = PersistentVolumeClaimSpec
    { accessModes: Nothing
    , resources: Nothing
    , selector: Nothing
    , storageClassName: Nothing
    , volumeMode: Nothing
    , volumeName: Nothing }

-- | PersistentVolumeClaimStatus is the current status of a persistent volume claim.
-- |
-- | Fields:
-- | - `accessModes`: AccessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
-- | - `capacity`: Represents the actual resources of the underlying volume.
-- | - `conditions`: Current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'ResizeStarted'.
-- | - `phase`: Phase represents the current phase of PersistentVolumeClaim.
newtype PersistentVolumeClaimStatus = PersistentVolumeClaimStatus
  { accessModes :: (Maybe (Array String))
  , capacity :: (Maybe (StrMap Resource.Quantity))
  , conditions :: (Maybe (Array PersistentVolumeClaimCondition))
  , phase :: (Maybe String) }

derive instance newtypePersistentVolumeClaimStatus :: Newtype PersistentVolumeClaimStatus _
derive instance genericPersistentVolumeClaimStatus :: Generic PersistentVolumeClaimStatus _
instance showPersistentVolumeClaimStatus :: Show PersistentVolumeClaimStatus where show a = genericShow a
instance decodePersistentVolumeClaimStatus :: Decode PersistentVolumeClaimStatus where
  decode a = do
               accessModes <- decodeMaybe "accessModes" a
               capacity <- decodeMaybe "capacity" a
               conditions <- decodeMaybe "conditions" a
               phase <- decodeMaybe "phase" a
               pure $ PersistentVolumeClaimStatus { accessModes, capacity, conditions, phase }
instance encodePersistentVolumeClaimStatus :: Encode PersistentVolumeClaimStatus where
  encode (PersistentVolumeClaimStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "accessModes" (encodeMaybe a.accessModes)
               , Tuple "capacity" (encodeMaybe a.capacity)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "phase" (encodeMaybe a.phase) ]


instance defaultPersistentVolumeClaimStatus :: Default PersistentVolumeClaimStatus where
  default = PersistentVolumeClaimStatus
    { accessModes: Nothing
    , capacity: Nothing
    , conditions: Nothing
    , phase: Nothing }

-- | PersistentVolumeClaimVolumeSource references the user's PVC in the same namespace. This volume finds the bound PV and mounts that volume for the pod. A PersistentVolumeClaimVolumeSource is, essentially, a wrapper around another type of volume that is owned by someone else (the system).
-- |
-- | Fields:
-- | - `claimName`: ClaimName is the name of a PersistentVolumeClaim in the same namespace as the pod using this volume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
-- | - `readOnly`: Will force the ReadOnly setting in VolumeMounts. Default false.
newtype PersistentVolumeClaimVolumeSource = PersistentVolumeClaimVolumeSource
  { claimName :: (Maybe String)
  , readOnly :: (Maybe Boolean) }

derive instance newtypePersistentVolumeClaimVolumeSource :: Newtype PersistentVolumeClaimVolumeSource _
derive instance genericPersistentVolumeClaimVolumeSource :: Generic PersistentVolumeClaimVolumeSource _
instance showPersistentVolumeClaimVolumeSource :: Show PersistentVolumeClaimVolumeSource where show a = genericShow a
instance decodePersistentVolumeClaimVolumeSource :: Decode PersistentVolumeClaimVolumeSource where
  decode a = do
               claimName <- decodeMaybe "claimName" a
               readOnly <- decodeMaybe "readOnly" a
               pure $ PersistentVolumeClaimVolumeSource { claimName, readOnly }
instance encodePersistentVolumeClaimVolumeSource :: Encode PersistentVolumeClaimVolumeSource where
  encode (PersistentVolumeClaimVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "claimName" (encodeMaybe a.claimName)
               , Tuple "readOnly" (encodeMaybe a.readOnly) ]


instance defaultPersistentVolumeClaimVolumeSource :: Default PersistentVolumeClaimVolumeSource where
  default = PersistentVolumeClaimVolumeSource
    { claimName: Nothing
    , readOnly: Nothing }

-- | PersistentVolumeList is a list of PersistentVolume items.
-- |
-- | Fields:
-- | - `items`: List of persistent volumes. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype PersistentVolumeList = PersistentVolumeList
  { items :: (Maybe (Array PersistentVolume))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePersistentVolumeList :: Newtype PersistentVolumeList _
derive instance genericPersistentVolumeList :: Generic PersistentVolumeList _
instance showPersistentVolumeList :: Show PersistentVolumeList where show a = genericShow a
instance decodePersistentVolumeList :: Decode PersistentVolumeList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "PersistentVolumeList" a
               metadata <- decodeMaybe "metadata" a
               pure $ PersistentVolumeList { items, metadata }
instance encodePersistentVolumeList :: Encode PersistentVolumeList where
  encode (PersistentVolumeList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "PersistentVolumeList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPersistentVolumeList :: Default PersistentVolumeList where
  default = PersistentVolumeList
    { items: Nothing
    , metadata: Nothing }

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
  { accessModes :: (Maybe (Array String))
  , awsElasticBlockStore :: (Maybe AWSElasticBlockStoreVolumeSource)
  , azureDisk :: (Maybe AzureDiskVolumeSource)
  , azureFile :: (Maybe AzureFilePersistentVolumeSource)
  , capacity :: (Maybe (StrMap Resource.Quantity))
  , cephfs :: (Maybe CephFSPersistentVolumeSource)
  , cinder :: (Maybe CinderVolumeSource)
  , claimRef :: (Maybe ObjectReference)
  , csi :: (Maybe CSIPersistentVolumeSource)
  , fc :: (Maybe FCVolumeSource)
  , flexVolume :: (Maybe FlexPersistentVolumeSource)
  , flocker :: (Maybe FlockerVolumeSource)
  , gcePersistentDisk :: (Maybe GCEPersistentDiskVolumeSource)
  , glusterfs :: (Maybe GlusterfsVolumeSource)
  , hostPath :: (Maybe HostPathVolumeSource)
  , iscsi :: (Maybe ISCSIPersistentVolumeSource)
  , local :: (Maybe LocalVolumeSource)
  , mountOptions :: (Maybe (Array String))
  , nfs :: (Maybe NFSVolumeSource)
  , persistentVolumeReclaimPolicy :: (Maybe String)
  , photonPersistentDisk :: (Maybe PhotonPersistentDiskVolumeSource)
  , portworxVolume :: (Maybe PortworxVolumeSource)
  , quobyte :: (Maybe QuobyteVolumeSource)
  , rbd :: (Maybe RBDPersistentVolumeSource)
  , scaleIO :: (Maybe ScaleIOPersistentVolumeSource)
  , storageClassName :: (Maybe String)
  , storageos :: (Maybe StorageOSPersistentVolumeSource)
  , volumeMode :: (Maybe String)
  , vsphereVolume :: (Maybe VsphereVirtualDiskVolumeSource) }

derive instance newtypePersistentVolumeSpec :: Newtype PersistentVolumeSpec _
derive instance genericPersistentVolumeSpec :: Generic PersistentVolumeSpec _
instance showPersistentVolumeSpec :: Show PersistentVolumeSpec where show a = genericShow a
instance decodePersistentVolumeSpec :: Decode PersistentVolumeSpec where
  decode a = do
               accessModes <- decodeMaybe "accessModes" a
               awsElasticBlockStore <- decodeMaybe "awsElasticBlockStore" a
               azureDisk <- decodeMaybe "azureDisk" a
               azureFile <- decodeMaybe "azureFile" a
               capacity <- decodeMaybe "capacity" a
               cephfs <- decodeMaybe "cephfs" a
               cinder <- decodeMaybe "cinder" a
               claimRef <- decodeMaybe "claimRef" a
               csi <- decodeMaybe "csi" a
               fc <- decodeMaybe "fc" a
               flexVolume <- decodeMaybe "flexVolume" a
               flocker <- decodeMaybe "flocker" a
               gcePersistentDisk <- decodeMaybe "gcePersistentDisk" a
               glusterfs <- decodeMaybe "glusterfs" a
               hostPath <- decodeMaybe "hostPath" a
               iscsi <- decodeMaybe "iscsi" a
               local <- decodeMaybe "local" a
               mountOptions <- decodeMaybe "mountOptions" a
               nfs <- decodeMaybe "nfs" a
               persistentVolumeReclaimPolicy <- decodeMaybe "persistentVolumeReclaimPolicy" a
               photonPersistentDisk <- decodeMaybe "photonPersistentDisk" a
               portworxVolume <- decodeMaybe "portworxVolume" a
               quobyte <- decodeMaybe "quobyte" a
               rbd <- decodeMaybe "rbd" a
               scaleIO <- decodeMaybe "scaleIO" a
               storageClassName <- decodeMaybe "storageClassName" a
               storageos <- decodeMaybe "storageos" a
               volumeMode <- decodeMaybe "volumeMode" a
               vsphereVolume <- decodeMaybe "vsphereVolume" a
               pure $ PersistentVolumeSpec { accessModes, awsElasticBlockStore, azureDisk, azureFile, capacity, cephfs, cinder, claimRef, csi, fc, flexVolume, flocker, gcePersistentDisk, glusterfs, hostPath, iscsi, local, mountOptions, nfs, persistentVolumeReclaimPolicy, photonPersistentDisk, portworxVolume, quobyte, rbd, scaleIO, storageClassName, storageos, volumeMode, vsphereVolume }
instance encodePersistentVolumeSpec :: Encode PersistentVolumeSpec where
  encode (PersistentVolumeSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "accessModes" (encodeMaybe a.accessModes)
               , Tuple "awsElasticBlockStore" (encodeMaybe a.awsElasticBlockStore)
               , Tuple "azureDisk" (encodeMaybe a.azureDisk)
               , Tuple "azureFile" (encodeMaybe a.azureFile)
               , Tuple "capacity" (encodeMaybe a.capacity)
               , Tuple "cephfs" (encodeMaybe a.cephfs)
               , Tuple "cinder" (encodeMaybe a.cinder)
               , Tuple "claimRef" (encodeMaybe a.claimRef)
               , Tuple "csi" (encodeMaybe a.csi)
               , Tuple "fc" (encodeMaybe a.fc)
               , Tuple "flexVolume" (encodeMaybe a.flexVolume)
               , Tuple "flocker" (encodeMaybe a.flocker)
               , Tuple "gcePersistentDisk" (encodeMaybe a.gcePersistentDisk)
               , Tuple "glusterfs" (encodeMaybe a.glusterfs)
               , Tuple "hostPath" (encodeMaybe a.hostPath)
               , Tuple "iscsi" (encodeMaybe a.iscsi)
               , Tuple "local" (encodeMaybe a.local)
               , Tuple "mountOptions" (encodeMaybe a.mountOptions)
               , Tuple "nfs" (encodeMaybe a.nfs)
               , Tuple "persistentVolumeReclaimPolicy" (encodeMaybe a.persistentVolumeReclaimPolicy)
               , Tuple "photonPersistentDisk" (encodeMaybe a.photonPersistentDisk)
               , Tuple "portworxVolume" (encodeMaybe a.portworxVolume)
               , Tuple "quobyte" (encodeMaybe a.quobyte)
               , Tuple "rbd" (encodeMaybe a.rbd)
               , Tuple "scaleIO" (encodeMaybe a.scaleIO)
               , Tuple "storageClassName" (encodeMaybe a.storageClassName)
               , Tuple "storageos" (encodeMaybe a.storageos)
               , Tuple "volumeMode" (encodeMaybe a.volumeMode)
               , Tuple "vsphereVolume" (encodeMaybe a.vsphereVolume) ]


instance defaultPersistentVolumeSpec :: Default PersistentVolumeSpec where
  default = PersistentVolumeSpec
    { accessModes: Nothing
    , awsElasticBlockStore: Nothing
    , azureDisk: Nothing
    , azureFile: Nothing
    , capacity: Nothing
    , cephfs: Nothing
    , cinder: Nothing
    , claimRef: Nothing
    , csi: Nothing
    , fc: Nothing
    , flexVolume: Nothing
    , flocker: Nothing
    , gcePersistentDisk: Nothing
    , glusterfs: Nothing
    , hostPath: Nothing
    , iscsi: Nothing
    , local: Nothing
    , mountOptions: Nothing
    , nfs: Nothing
    , persistentVolumeReclaimPolicy: Nothing
    , photonPersistentDisk: Nothing
    , portworxVolume: Nothing
    , quobyte: Nothing
    , rbd: Nothing
    , scaleIO: Nothing
    , storageClassName: Nothing
    , storageos: Nothing
    , volumeMode: Nothing
    , vsphereVolume: Nothing }

-- | PersistentVolumeStatus is the current status of a persistent volume.
-- |
-- | Fields:
-- | - `message`: A human-readable message indicating details about why the volume is in this state.
-- | - `phase`: Phase indicates if a volume is available, bound to a claim, or released by a claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#phase
-- | - `reason`: Reason is a brief CamelCase string that describes any failure and is meant for machine parsing and tidy display in the CLI.
newtype PersistentVolumeStatus = PersistentVolumeStatus
  { message :: (Maybe String)
  , phase :: (Maybe String)
  , reason :: (Maybe String) }

derive instance newtypePersistentVolumeStatus :: Newtype PersistentVolumeStatus _
derive instance genericPersistentVolumeStatus :: Generic PersistentVolumeStatus _
instance showPersistentVolumeStatus :: Show PersistentVolumeStatus where show a = genericShow a
instance decodePersistentVolumeStatus :: Decode PersistentVolumeStatus where
  decode a = do
               message <- decodeMaybe "message" a
               phase <- decodeMaybe "phase" a
               reason <- decodeMaybe "reason" a
               pure $ PersistentVolumeStatus { message, phase, reason }
instance encodePersistentVolumeStatus :: Encode PersistentVolumeStatus where
  encode (PersistentVolumeStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "message" (encodeMaybe a.message)
               , Tuple "phase" (encodeMaybe a.phase)
               , Tuple "reason" (encodeMaybe a.reason) ]


instance defaultPersistentVolumeStatus :: Default PersistentVolumeStatus where
  default = PersistentVolumeStatus
    { message: Nothing
    , phase: Nothing
    , reason: Nothing }

-- | Represents a Photon Controller persistent disk resource.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `pdID`: ID that identifies Photon Controller persistent disk
newtype PhotonPersistentDiskVolumeSource = PhotonPersistentDiskVolumeSource
  { fsType :: (Maybe String)
  , pdID :: (Maybe String) }

derive instance newtypePhotonPersistentDiskVolumeSource :: Newtype PhotonPersistentDiskVolumeSource _
derive instance genericPhotonPersistentDiskVolumeSource :: Generic PhotonPersistentDiskVolumeSource _
instance showPhotonPersistentDiskVolumeSource :: Show PhotonPersistentDiskVolumeSource where show a = genericShow a
instance decodePhotonPersistentDiskVolumeSource :: Decode PhotonPersistentDiskVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               pdID <- decodeMaybe "pdID" a
               pure $ PhotonPersistentDiskVolumeSource { fsType, pdID }
instance encodePhotonPersistentDiskVolumeSource :: Encode PhotonPersistentDiskVolumeSource where
  encode (PhotonPersistentDiskVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "pdID" (encodeMaybe a.pdID) ]


instance defaultPhotonPersistentDiskVolumeSource :: Default PhotonPersistentDiskVolumeSource where
  default = PhotonPersistentDiskVolumeSource
    { fsType: Nothing
    , pdID: Nothing }

-- | Pod is a collection of containers that can run on a host. This resource is created by clients and scheduled onto hosts.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of the pod. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Most recently observed status of the pod. This data may not be up to date. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Pod = Pod
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe PodSpec)
  , status :: (Maybe PodStatus) }

derive instance newtypePod :: Newtype Pod _
derive instance genericPod :: Generic Pod _
instance showPod :: Show Pod where show a = genericShow a
instance decodePod :: Decode Pod where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "Pod" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Pod { metadata, spec, status }
instance encodePod :: Encode Pod where
  encode (Pod a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "Pod")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultPod :: Default Pod where
  default = Pod
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | Pod affinity is a group of inter pod affinity scheduling rules.
-- |
-- | Fields:
-- | - `preferredDuringSchedulingIgnoredDuringExecution`: The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
-- | - `requiredDuringSchedulingIgnoredDuringExecution`: If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
newtype PodAffinity = PodAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (Maybe (Array WeightedPodAffinityTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (Maybe (Array PodAffinityTerm)) }

derive instance newtypePodAffinity :: Newtype PodAffinity _
derive instance genericPodAffinity :: Generic PodAffinity _
instance showPodAffinity :: Show PodAffinity where show a = genericShow a
instance decodePodAffinity :: Decode PodAffinity where
  decode a = do
               preferredDuringSchedulingIgnoredDuringExecution <- decodeMaybe "preferredDuringSchedulingIgnoredDuringExecution" a
               requiredDuringSchedulingIgnoredDuringExecution <- decodeMaybe "requiredDuringSchedulingIgnoredDuringExecution" a
               pure $ PodAffinity { preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution }
instance encodePodAffinity :: Encode PodAffinity where
  encode (PodAffinity a) = encode $ StrMap.fromFoldable $
               [ Tuple "preferredDuringSchedulingIgnoredDuringExecution" (encodeMaybe a.preferredDuringSchedulingIgnoredDuringExecution)
               , Tuple "requiredDuringSchedulingIgnoredDuringExecution" (encodeMaybe a.requiredDuringSchedulingIgnoredDuringExecution) ]


instance defaultPodAffinity :: Default PodAffinity where
  default = PodAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: Nothing }

-- | Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running
-- |
-- | Fields:
-- | - `labelSelector`: A label query over a set of resources, in this case pods.
-- | - `namespaces`: namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means "this pod's namespace"
-- | - `topologyKey`: This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed.
newtype PodAffinityTerm = PodAffinityTerm
  { labelSelector :: (Maybe MetaV1.LabelSelector)
  , namespaces :: (Maybe (Array String))
  , topologyKey :: (Maybe String) }

derive instance newtypePodAffinityTerm :: Newtype PodAffinityTerm _
derive instance genericPodAffinityTerm :: Generic PodAffinityTerm _
instance showPodAffinityTerm :: Show PodAffinityTerm where show a = genericShow a
instance decodePodAffinityTerm :: Decode PodAffinityTerm where
  decode a = do
               labelSelector <- decodeMaybe "labelSelector" a
               namespaces <- decodeMaybe "namespaces" a
               topologyKey <- decodeMaybe "topologyKey" a
               pure $ PodAffinityTerm { labelSelector, namespaces, topologyKey }
instance encodePodAffinityTerm :: Encode PodAffinityTerm where
  encode (PodAffinityTerm a) = encode $ StrMap.fromFoldable $
               [ Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "namespaces" (encodeMaybe a.namespaces)
               , Tuple "topologyKey" (encodeMaybe a.topologyKey) ]


instance defaultPodAffinityTerm :: Default PodAffinityTerm where
  default = PodAffinityTerm
    { labelSelector: Nothing
    , namespaces: Nothing
    , topologyKey: Nothing }

-- | Pod anti affinity is a group of inter pod anti affinity scheduling rules.
-- |
-- | Fields:
-- | - `preferredDuringSchedulingIgnoredDuringExecution`: The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
-- | - `requiredDuringSchedulingIgnoredDuringExecution`: If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
newtype PodAntiAffinity = PodAntiAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (Maybe (Array WeightedPodAffinityTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (Maybe (Array PodAffinityTerm)) }

derive instance newtypePodAntiAffinity :: Newtype PodAntiAffinity _
derive instance genericPodAntiAffinity :: Generic PodAntiAffinity _
instance showPodAntiAffinity :: Show PodAntiAffinity where show a = genericShow a
instance decodePodAntiAffinity :: Decode PodAntiAffinity where
  decode a = do
               preferredDuringSchedulingIgnoredDuringExecution <- decodeMaybe "preferredDuringSchedulingIgnoredDuringExecution" a
               requiredDuringSchedulingIgnoredDuringExecution <- decodeMaybe "requiredDuringSchedulingIgnoredDuringExecution" a
               pure $ PodAntiAffinity { preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution }
instance encodePodAntiAffinity :: Encode PodAntiAffinity where
  encode (PodAntiAffinity a) = encode $ StrMap.fromFoldable $
               [ Tuple "preferredDuringSchedulingIgnoredDuringExecution" (encodeMaybe a.preferredDuringSchedulingIgnoredDuringExecution)
               , Tuple "requiredDuringSchedulingIgnoredDuringExecution" (encodeMaybe a.requiredDuringSchedulingIgnoredDuringExecution) ]


instance defaultPodAntiAffinity :: Default PodAntiAffinity where
  default = PodAntiAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: Nothing }

-- | PodCondition contains details for the current condition of this pod.
-- |
-- | Fields:
-- | - `_type`: Type is the type of the condition. Currently only Ready. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
-- | - `lastProbeTime`: Last time we probed the condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: Human-readable message indicating details about last transition.
-- | - `reason`: Unique, one-word, CamelCase reason for the condition's last transition.
-- | - `status`: Status is the status of the condition. Can be True, False, Unknown. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
newtype PodCondition = PodCondition
  { _type :: (Maybe String)
  , lastProbeTime :: (Maybe MetaV1.Time)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypePodCondition :: Newtype PodCondition _
derive instance genericPodCondition :: Generic PodCondition _
instance showPodCondition :: Show PodCondition where show a = genericShow a
instance decodePodCondition :: Decode PodCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastProbeTime <- decodeMaybe "lastProbeTime" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ PodCondition { _type, lastProbeTime, lastTransitionTime, message, reason, status }
instance encodePodCondition :: Encode PodCondition where
  encode (PodCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastProbeTime" (encodeMaybe a.lastProbeTime)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultPodCondition :: Default PodCondition where
  default = PodCondition
    { _type: Nothing
    , lastProbeTime: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | PodDNSConfig defines the DNS parameters of a pod in addition to those generated from DNSPolicy.
-- |
-- | Fields:
-- | - `nameservers`: A list of DNS name server IP addresses. This will be appended to the base nameservers generated from DNSPolicy. Duplicated nameservers will be removed.
-- | - `options`: A list of DNS resolver options. This will be merged with the base options generated from DNSPolicy. Duplicated entries will be removed. Resolution options given in Options will override those that appear in the base DNSPolicy.
-- | - `searches`: A list of DNS search domains for host-name lookup. This will be appended to the base search paths generated from DNSPolicy. Duplicated search paths will be removed.
newtype PodDNSConfig = PodDNSConfig
  { nameservers :: (Maybe (Array String))
  , options :: (Maybe (Array PodDNSConfigOption))
  , searches :: (Maybe (Array String)) }

derive instance newtypePodDNSConfig :: Newtype PodDNSConfig _
derive instance genericPodDNSConfig :: Generic PodDNSConfig _
instance showPodDNSConfig :: Show PodDNSConfig where show a = genericShow a
instance decodePodDNSConfig :: Decode PodDNSConfig where
  decode a = do
               nameservers <- decodeMaybe "nameservers" a
               options <- decodeMaybe "options" a
               searches <- decodeMaybe "searches" a
               pure $ PodDNSConfig { nameservers, options, searches }
instance encodePodDNSConfig :: Encode PodDNSConfig where
  encode (PodDNSConfig a) = encode $ StrMap.fromFoldable $
               [ Tuple "nameservers" (encodeMaybe a.nameservers)
               , Tuple "options" (encodeMaybe a.options)
               , Tuple "searches" (encodeMaybe a.searches) ]


instance defaultPodDNSConfig :: Default PodDNSConfig where
  default = PodDNSConfig
    { nameservers: Nothing
    , options: Nothing
    , searches: Nothing }

-- | PodDNSConfigOption defines DNS resolver options of a pod.
-- |
-- | Fields:
-- | - `name`: Required.
-- | - `value`
newtype PodDNSConfigOption = PodDNSConfigOption
  { name :: (Maybe String)
  , value :: (Maybe String) }

derive instance newtypePodDNSConfigOption :: Newtype PodDNSConfigOption _
derive instance genericPodDNSConfigOption :: Generic PodDNSConfigOption _
instance showPodDNSConfigOption :: Show PodDNSConfigOption where show a = genericShow a
instance decodePodDNSConfigOption :: Decode PodDNSConfigOption where
  decode a = do
               name <- decodeMaybe "name" a
               value <- decodeMaybe "value" a
               pure $ PodDNSConfigOption { name, value }
instance encodePodDNSConfigOption :: Encode PodDNSConfigOption where
  encode (PodDNSConfigOption a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "value" (encodeMaybe a.value) ]


instance defaultPodDNSConfigOption :: Default PodDNSConfigOption where
  default = PodDNSConfigOption
    { name: Nothing
    , value: Nothing }

-- | PodList is a list of Pods.
-- |
-- | Fields:
-- | - `items`: List of pods. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype PodList = PodList
  { items :: (Maybe (Array Pod))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePodList :: Newtype PodList _
derive instance genericPodList :: Generic PodList _
instance showPodList :: Show PodList where show a = genericShow a
instance decodePodList :: Decode PodList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "PodList" a
               metadata <- decodeMaybe "metadata" a
               pure $ PodList { items, metadata }
instance encodePodList :: Encode PodList where
  encode (PodList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "PodList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPodList :: Default PodList where
  default = PodList
    { items: Nothing
    , metadata: Nothing }

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
  { fsGroup :: (Maybe Int)
  , runAsNonRoot :: (Maybe Boolean)
  , runAsUser :: (Maybe Int)
  , seLinuxOptions :: (Maybe SELinuxOptions)
  , supplementalGroups :: (Maybe (Array Int)) }

derive instance newtypePodSecurityContext :: Newtype PodSecurityContext _
derive instance genericPodSecurityContext :: Generic PodSecurityContext _
instance showPodSecurityContext :: Show PodSecurityContext where show a = genericShow a
instance decodePodSecurityContext :: Decode PodSecurityContext where
  decode a = do
               fsGroup <- decodeMaybe "fsGroup" a
               runAsNonRoot <- decodeMaybe "runAsNonRoot" a
               runAsUser <- decodeMaybe "runAsUser" a
               seLinuxOptions <- decodeMaybe "seLinuxOptions" a
               supplementalGroups <- decodeMaybe "supplementalGroups" a
               pure $ PodSecurityContext { fsGroup, runAsNonRoot, runAsUser, seLinuxOptions, supplementalGroups }
instance encodePodSecurityContext :: Encode PodSecurityContext where
  encode (PodSecurityContext a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsGroup" (encodeMaybe a.fsGroup)
               , Tuple "runAsNonRoot" (encodeMaybe a.runAsNonRoot)
               , Tuple "runAsUser" (encodeMaybe a.runAsUser)
               , Tuple "seLinuxOptions" (encodeMaybe a.seLinuxOptions)
               , Tuple "supplementalGroups" (encodeMaybe a.supplementalGroups) ]


instance defaultPodSecurityContext :: Default PodSecurityContext where
  default = PodSecurityContext
    { fsGroup: Nothing
    , runAsNonRoot: Nothing
    , runAsUser: Nothing
    , seLinuxOptions: Nothing
    , supplementalGroups: Nothing }

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
  { activeDeadlineSeconds :: (Maybe Int)
  , affinity :: (Maybe Affinity)
  , automountServiceAccountToken :: (Maybe Boolean)
  , containers :: (Maybe (Array Container))
  , dnsConfig :: (Maybe PodDNSConfig)
  , dnsPolicy :: (Maybe String)
  , hostAliases :: (Maybe (Array HostAlias))
  , hostIPC :: (Maybe Boolean)
  , hostNetwork :: (Maybe Boolean)
  , hostPID :: (Maybe Boolean)
  , hostname :: (Maybe String)
  , imagePullSecrets :: (Maybe (Array LocalObjectReference))
  , initContainers :: (Maybe (Array Container))
  , nodeName :: (Maybe String)
  , nodeSelector :: (Maybe (StrMap String))
  , priority :: (Maybe Int)
  , priorityClassName :: (Maybe String)
  , restartPolicy :: (Maybe String)
  , schedulerName :: (Maybe String)
  , securityContext :: (Maybe PodSecurityContext)
  , serviceAccount :: (Maybe String)
  , serviceAccountName :: (Maybe String)
  , subdomain :: (Maybe String)
  , terminationGracePeriodSeconds :: (Maybe Int)
  , tolerations :: (Maybe (Array Toleration))
  , volumes :: (Maybe (Array Volume)) }

derive instance newtypePodSpec :: Newtype PodSpec _
derive instance genericPodSpec :: Generic PodSpec _
instance showPodSpec :: Show PodSpec where show a = genericShow a
instance decodePodSpec :: Decode PodSpec where
  decode a = do
               activeDeadlineSeconds <- decodeMaybe "activeDeadlineSeconds" a
               affinity <- decodeMaybe "affinity" a
               automountServiceAccountToken <- decodeMaybe "automountServiceAccountToken" a
               containers <- decodeMaybe "containers" a
               dnsConfig <- decodeMaybe "dnsConfig" a
               dnsPolicy <- decodeMaybe "dnsPolicy" a
               hostAliases <- decodeMaybe "hostAliases" a
               hostIPC <- decodeMaybe "hostIPC" a
               hostNetwork <- decodeMaybe "hostNetwork" a
               hostPID <- decodeMaybe "hostPID" a
               hostname <- decodeMaybe "hostname" a
               imagePullSecrets <- decodeMaybe "imagePullSecrets" a
               initContainers <- decodeMaybe "initContainers" a
               nodeName <- decodeMaybe "nodeName" a
               nodeSelector <- decodeMaybe "nodeSelector" a
               priority <- decodeMaybe "priority" a
               priorityClassName <- decodeMaybe "priorityClassName" a
               restartPolicy <- decodeMaybe "restartPolicy" a
               schedulerName <- decodeMaybe "schedulerName" a
               securityContext <- decodeMaybe "securityContext" a
               serviceAccount <- decodeMaybe "serviceAccount" a
               serviceAccountName <- decodeMaybe "serviceAccountName" a
               subdomain <- decodeMaybe "subdomain" a
               terminationGracePeriodSeconds <- decodeMaybe "terminationGracePeriodSeconds" a
               tolerations <- decodeMaybe "tolerations" a
               volumes <- decodeMaybe "volumes" a
               pure $ PodSpec { activeDeadlineSeconds, affinity, automountServiceAccountToken, containers, dnsConfig, dnsPolicy, hostAliases, hostIPC, hostNetwork, hostPID, hostname, imagePullSecrets, initContainers, nodeName, nodeSelector, priority, priorityClassName, restartPolicy, schedulerName, securityContext, serviceAccount, serviceAccountName, subdomain, terminationGracePeriodSeconds, tolerations, volumes }
instance encodePodSpec :: Encode PodSpec where
  encode (PodSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "activeDeadlineSeconds" (encodeMaybe a.activeDeadlineSeconds)
               , Tuple "affinity" (encodeMaybe a.affinity)
               , Tuple "automountServiceAccountToken" (encodeMaybe a.automountServiceAccountToken)
               , Tuple "containers" (encodeMaybe a.containers)
               , Tuple "dnsConfig" (encodeMaybe a.dnsConfig)
               , Tuple "dnsPolicy" (encodeMaybe a.dnsPolicy)
               , Tuple "hostAliases" (encodeMaybe a.hostAliases)
               , Tuple "hostIPC" (encodeMaybe a.hostIPC)
               , Tuple "hostNetwork" (encodeMaybe a.hostNetwork)
               , Tuple "hostPID" (encodeMaybe a.hostPID)
               , Tuple "hostname" (encodeMaybe a.hostname)
               , Tuple "imagePullSecrets" (encodeMaybe a.imagePullSecrets)
               , Tuple "initContainers" (encodeMaybe a.initContainers)
               , Tuple "nodeName" (encodeMaybe a.nodeName)
               , Tuple "nodeSelector" (encodeMaybe a.nodeSelector)
               , Tuple "priority" (encodeMaybe a.priority)
               , Tuple "priorityClassName" (encodeMaybe a.priorityClassName)
               , Tuple "restartPolicy" (encodeMaybe a.restartPolicy)
               , Tuple "schedulerName" (encodeMaybe a.schedulerName)
               , Tuple "securityContext" (encodeMaybe a.securityContext)
               , Tuple "serviceAccount" (encodeMaybe a.serviceAccount)
               , Tuple "serviceAccountName" (encodeMaybe a.serviceAccountName)
               , Tuple "subdomain" (encodeMaybe a.subdomain)
               , Tuple "terminationGracePeriodSeconds" (encodeMaybe a.terminationGracePeriodSeconds)
               , Tuple "tolerations" (encodeMaybe a.tolerations)
               , Tuple "volumes" (encodeMaybe a.volumes) ]


instance defaultPodSpec :: Default PodSpec where
  default = PodSpec
    { activeDeadlineSeconds: Nothing
    , affinity: Nothing
    , automountServiceAccountToken: Nothing
    , containers: Nothing
    , dnsConfig: Nothing
    , dnsPolicy: Nothing
    , hostAliases: Nothing
    , hostIPC: Nothing
    , hostNetwork: Nothing
    , hostPID: Nothing
    , hostname: Nothing
    , imagePullSecrets: Nothing
    , initContainers: Nothing
    , nodeName: Nothing
    , nodeSelector: Nothing
    , priority: Nothing
    , priorityClassName: Nothing
    , restartPolicy: Nothing
    , schedulerName: Nothing
    , securityContext: Nothing
    , serviceAccount: Nothing
    , serviceAccountName: Nothing
    , subdomain: Nothing
    , terminationGracePeriodSeconds: Nothing
    , tolerations: Nothing
    , volumes: Nothing }

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
  { conditions :: (Maybe (Array PodCondition))
  , containerStatuses :: (Maybe (Array ContainerStatus))
  , hostIP :: (Maybe String)
  , initContainerStatuses :: (Maybe (Array ContainerStatus))
  , message :: (Maybe String)
  , phase :: (Maybe String)
  , podIP :: (Maybe String)
  , qosClass :: (Maybe String)
  , reason :: (Maybe String)
  , startTime :: (Maybe MetaV1.Time) }

derive instance newtypePodStatus :: Newtype PodStatus _
derive instance genericPodStatus :: Generic PodStatus _
instance showPodStatus :: Show PodStatus where show a = genericShow a
instance decodePodStatus :: Decode PodStatus where
  decode a = do
               conditions <- decodeMaybe "conditions" a
               containerStatuses <- decodeMaybe "containerStatuses" a
               hostIP <- decodeMaybe "hostIP" a
               initContainerStatuses <- decodeMaybe "initContainerStatuses" a
               message <- decodeMaybe "message" a
               phase <- decodeMaybe "phase" a
               podIP <- decodeMaybe "podIP" a
               qosClass <- decodeMaybe "qosClass" a
               reason <- decodeMaybe "reason" a
               startTime <- decodeMaybe "startTime" a
               pure $ PodStatus { conditions, containerStatuses, hostIP, initContainerStatuses, message, phase, podIP, qosClass, reason, startTime }
instance encodePodStatus :: Encode PodStatus where
  encode (PodStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "containerStatuses" (encodeMaybe a.containerStatuses)
               , Tuple "hostIP" (encodeMaybe a.hostIP)
               , Tuple "initContainerStatuses" (encodeMaybe a.initContainerStatuses)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "phase" (encodeMaybe a.phase)
               , Tuple "podIP" (encodeMaybe a.podIP)
               , Tuple "qosClass" (encodeMaybe a.qosClass)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "startTime" (encodeMaybe a.startTime) ]


instance defaultPodStatus :: Default PodStatus where
  default = PodStatus
    { conditions: Nothing
    , containerStatuses: Nothing
    , hostIP: Nothing
    , initContainerStatuses: Nothing
    , message: Nothing
    , phase: Nothing
    , podIP: Nothing
    , qosClass: Nothing
    , reason: Nothing
    , startTime: Nothing }

-- | PodTemplate describes a template for creating copies of a predefined pod.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `template`: Template defines the pods that will be created from this pod template. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype PodTemplate = PodTemplate
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , template :: (Maybe PodTemplateSpec) }

derive instance newtypePodTemplate :: Newtype PodTemplate _
derive instance genericPodTemplate :: Generic PodTemplate _
instance showPodTemplate :: Show PodTemplate where show a = genericShow a
instance decodePodTemplate :: Decode PodTemplate where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "PodTemplate" a
               metadata <- decodeMaybe "metadata" a
               template <- decodeMaybe "template" a
               pure $ PodTemplate { metadata, template }
instance encodePodTemplate :: Encode PodTemplate where
  encode (PodTemplate a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "PodTemplate")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "template" (encodeMaybe a.template) ]


instance defaultPodTemplate :: Default PodTemplate where
  default = PodTemplate
    { metadata: Nothing
    , template: Nothing }

-- | PodTemplateList is a list of PodTemplates.
-- |
-- | Fields:
-- | - `items`: List of pod templates
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype PodTemplateList = PodTemplateList
  { items :: (Maybe (Array PodTemplate))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePodTemplateList :: Newtype PodTemplateList _
derive instance genericPodTemplateList :: Generic PodTemplateList _
instance showPodTemplateList :: Show PodTemplateList where show a = genericShow a
instance decodePodTemplateList :: Decode PodTemplateList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "PodTemplateList" a
               metadata <- decodeMaybe "metadata" a
               pure $ PodTemplateList { items, metadata }
instance encodePodTemplateList :: Encode PodTemplateList where
  encode (PodTemplateList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "PodTemplateList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPodTemplateList :: Default PodTemplateList where
  default = PodTemplateList
    { items: Nothing
    , metadata: Nothing }

-- | PodTemplateSpec describes the data a pod should have when created from a template
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of the pod. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype PodTemplateSpec = PodTemplateSpec
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe PodSpec) }

derive instance newtypePodTemplateSpec :: Newtype PodTemplateSpec _
derive instance genericPodTemplateSpec :: Generic PodTemplateSpec _
instance showPodTemplateSpec :: Show PodTemplateSpec where show a = genericShow a
instance decodePodTemplateSpec :: Decode PodTemplateSpec where
  decode a = do
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               pure $ PodTemplateSpec { metadata, spec }
instance encodePodTemplateSpec :: Encode PodTemplateSpec where
  encode (PodTemplateSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec) ]


instance defaultPodTemplateSpec :: Default PodTemplateSpec where
  default = PodTemplateSpec
    { metadata: Nothing
    , spec: Nothing }

-- | PortworxVolumeSource represents a Portworx volume resource.
-- |
-- | Fields:
-- | - `fsType`: FSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `volumeID`: VolumeID uniquely identifies a Portworx volume
newtype PortworxVolumeSource = PortworxVolumeSource
  { fsType :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , volumeID :: (Maybe String) }

derive instance newtypePortworxVolumeSource :: Newtype PortworxVolumeSource _
derive instance genericPortworxVolumeSource :: Generic PortworxVolumeSource _
instance showPortworxVolumeSource :: Show PortworxVolumeSource where show a = genericShow a
instance decodePortworxVolumeSource :: Decode PortworxVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               readOnly <- decodeMaybe "readOnly" a
               volumeID <- decodeMaybe "volumeID" a
               pure $ PortworxVolumeSource { fsType, readOnly, volumeID }
instance encodePortworxVolumeSource :: Encode PortworxVolumeSource where
  encode (PortworxVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "volumeID" (encodeMaybe a.volumeID) ]


instance defaultPortworxVolumeSource :: Default PortworxVolumeSource where
  default = PortworxVolumeSource
    { fsType: Nothing
    , readOnly: Nothing
    , volumeID: Nothing }

-- | An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op).
-- |
-- | Fields:
-- | - `preference`: A node selector term, associated with the corresponding weight.
-- | - `weight`: Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100.
newtype PreferredSchedulingTerm = PreferredSchedulingTerm
  { preference :: (Maybe NodeSelectorTerm)
  , weight :: (Maybe Int) }

derive instance newtypePreferredSchedulingTerm :: Newtype PreferredSchedulingTerm _
derive instance genericPreferredSchedulingTerm :: Generic PreferredSchedulingTerm _
instance showPreferredSchedulingTerm :: Show PreferredSchedulingTerm where show a = genericShow a
instance decodePreferredSchedulingTerm :: Decode PreferredSchedulingTerm where
  decode a = do
               preference <- decodeMaybe "preference" a
               weight <- decodeMaybe "weight" a
               pure $ PreferredSchedulingTerm { preference, weight }
instance encodePreferredSchedulingTerm :: Encode PreferredSchedulingTerm where
  encode (PreferredSchedulingTerm a) = encode $ StrMap.fromFoldable $
               [ Tuple "preference" (encodeMaybe a.preference)
               , Tuple "weight" (encodeMaybe a.weight) ]


instance defaultPreferredSchedulingTerm :: Default PreferredSchedulingTerm where
  default = PreferredSchedulingTerm
    { preference: Nothing
    , weight: Nothing }

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
  { exec :: (Maybe ExecAction)
  , failureThreshold :: (Maybe Int)
  , httpGet :: (Maybe HTTPGetAction)
  , initialDelaySeconds :: (Maybe Int)
  , periodSeconds :: (Maybe Int)
  , successThreshold :: (Maybe Int)
  , tcpSocket :: (Maybe TCPSocketAction)
  , timeoutSeconds :: (Maybe Int) }

derive instance newtypeProbe :: Newtype Probe _
derive instance genericProbe :: Generic Probe _
instance showProbe :: Show Probe where show a = genericShow a
instance decodeProbe :: Decode Probe where
  decode a = do
               exec <- decodeMaybe "exec" a
               failureThreshold <- decodeMaybe "failureThreshold" a
               httpGet <- decodeMaybe "httpGet" a
               initialDelaySeconds <- decodeMaybe "initialDelaySeconds" a
               periodSeconds <- decodeMaybe "periodSeconds" a
               successThreshold <- decodeMaybe "successThreshold" a
               tcpSocket <- decodeMaybe "tcpSocket" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               pure $ Probe { exec, failureThreshold, httpGet, initialDelaySeconds, periodSeconds, successThreshold, tcpSocket, timeoutSeconds }
instance encodeProbe :: Encode Probe where
  encode (Probe a) = encode $ StrMap.fromFoldable $
               [ Tuple "exec" (encodeMaybe a.exec)
               , Tuple "failureThreshold" (encodeMaybe a.failureThreshold)
               , Tuple "httpGet" (encodeMaybe a.httpGet)
               , Tuple "initialDelaySeconds" (encodeMaybe a.initialDelaySeconds)
               , Tuple "periodSeconds" (encodeMaybe a.periodSeconds)
               , Tuple "successThreshold" (encodeMaybe a.successThreshold)
               , Tuple "tcpSocket" (encodeMaybe a.tcpSocket)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds) ]


instance defaultProbe :: Default Probe where
  default = Probe
    { exec: Nothing
    , failureThreshold: Nothing
    , httpGet: Nothing
    , initialDelaySeconds: Nothing
    , periodSeconds: Nothing
    , successThreshold: Nothing
    , tcpSocket: Nothing
    , timeoutSeconds: Nothing }

-- | Represents a projected volume source
-- |
-- | Fields:
-- | - `defaultMode`: Mode bits to use on created files by default. Must be a value between 0 and 0777. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
-- | - `sources`: list of volume projections
newtype ProjectedVolumeSource = ProjectedVolumeSource
  { defaultMode :: (Maybe Int)
  , sources :: (Maybe (Array VolumeProjection)) }

derive instance newtypeProjectedVolumeSource :: Newtype ProjectedVolumeSource _
derive instance genericProjectedVolumeSource :: Generic ProjectedVolumeSource _
instance showProjectedVolumeSource :: Show ProjectedVolumeSource where show a = genericShow a
instance decodeProjectedVolumeSource :: Decode ProjectedVolumeSource where
  decode a = do
               defaultMode <- decodeMaybe "defaultMode" a
               sources <- decodeMaybe "sources" a
               pure $ ProjectedVolumeSource { defaultMode, sources }
instance encodeProjectedVolumeSource :: Encode ProjectedVolumeSource where
  encode (ProjectedVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "defaultMode" (encodeMaybe a.defaultMode)
               , Tuple "sources" (encodeMaybe a.sources) ]


instance defaultProjectedVolumeSource :: Default ProjectedVolumeSource where
  default = ProjectedVolumeSource
    { defaultMode: Nothing
    , sources: Nothing }

-- | Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte volumes do not support ownership management or SELinux relabeling.
-- |
-- | Fields:
-- | - `group`: Group to map volume access to Default is no group
-- | - `readOnly`: ReadOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false.
-- | - `registry`: Registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes
-- | - `user`: User to map volume access to Defaults to serivceaccount user
-- | - `volume`: Volume is a string that references an already created Quobyte volume by name.
newtype QuobyteVolumeSource = QuobyteVolumeSource
  { group :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , registry :: (Maybe String)
  , user :: (Maybe String)
  , volume :: (Maybe String) }

derive instance newtypeQuobyteVolumeSource :: Newtype QuobyteVolumeSource _
derive instance genericQuobyteVolumeSource :: Generic QuobyteVolumeSource _
instance showQuobyteVolumeSource :: Show QuobyteVolumeSource where show a = genericShow a
instance decodeQuobyteVolumeSource :: Decode QuobyteVolumeSource where
  decode a = do
               group <- decodeMaybe "group" a
               readOnly <- decodeMaybe "readOnly" a
               registry <- decodeMaybe "registry" a
               user <- decodeMaybe "user" a
               volume <- decodeMaybe "volume" a
               pure $ QuobyteVolumeSource { group, readOnly, registry, user, volume }
instance encodeQuobyteVolumeSource :: Encode QuobyteVolumeSource where
  encode (QuobyteVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "group" (encodeMaybe a.group)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "registry" (encodeMaybe a.registry)
               , Tuple "user" (encodeMaybe a.user)
               , Tuple "volume" (encodeMaybe a.volume) ]


instance defaultQuobyteVolumeSource :: Default QuobyteVolumeSource where
  default = QuobyteVolumeSource
    { group: Nothing
    , readOnly: Nothing
    , registry: Nothing
    , user: Nothing
    , volume: Nothing }

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
  { fsType :: (Maybe String)
  , image :: (Maybe String)
  , keyring :: (Maybe String)
  , monitors :: (Maybe (Array String))
  , pool :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe SecretReference)
  , user :: (Maybe String) }

derive instance newtypeRBDPersistentVolumeSource :: Newtype RBDPersistentVolumeSource _
derive instance genericRBDPersistentVolumeSource :: Generic RBDPersistentVolumeSource _
instance showRBDPersistentVolumeSource :: Show RBDPersistentVolumeSource where show a = genericShow a
instance decodeRBDPersistentVolumeSource :: Decode RBDPersistentVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               image <- decodeMaybe "image" a
               keyring <- decodeMaybe "keyring" a
               monitors <- decodeMaybe "monitors" a
               pool <- decodeMaybe "pool" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               user <- decodeMaybe "user" a
               pure $ RBDPersistentVolumeSource { fsType, image, keyring, monitors, pool, readOnly, secretRef, user }
instance encodeRBDPersistentVolumeSource :: Encode RBDPersistentVolumeSource where
  encode (RBDPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "image" (encodeMaybe a.image)
               , Tuple "keyring" (encodeMaybe a.keyring)
               , Tuple "monitors" (encodeMaybe a.monitors)
               , Tuple "pool" (encodeMaybe a.pool)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "user" (encodeMaybe a.user) ]


instance defaultRBDPersistentVolumeSource :: Default RBDPersistentVolumeSource where
  default = RBDPersistentVolumeSource
    { fsType: Nothing
    , image: Nothing
    , keyring: Nothing
    , monitors: Nothing
    , pool: Nothing
    , readOnly: Nothing
    , secretRef: Nothing
    , user: Nothing }

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
  { fsType :: (Maybe String)
  , image :: (Maybe String)
  , keyring :: (Maybe String)
  , monitors :: (Maybe (Array String))
  , pool :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe LocalObjectReference)
  , user :: (Maybe String) }

derive instance newtypeRBDVolumeSource :: Newtype RBDVolumeSource _
derive instance genericRBDVolumeSource :: Generic RBDVolumeSource _
instance showRBDVolumeSource :: Show RBDVolumeSource where show a = genericShow a
instance decodeRBDVolumeSource :: Decode RBDVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               image <- decodeMaybe "image" a
               keyring <- decodeMaybe "keyring" a
               monitors <- decodeMaybe "monitors" a
               pool <- decodeMaybe "pool" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               user <- decodeMaybe "user" a
               pure $ RBDVolumeSource { fsType, image, keyring, monitors, pool, readOnly, secretRef, user }
instance encodeRBDVolumeSource :: Encode RBDVolumeSource where
  encode (RBDVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "image" (encodeMaybe a.image)
               , Tuple "keyring" (encodeMaybe a.keyring)
               , Tuple "monitors" (encodeMaybe a.monitors)
               , Tuple "pool" (encodeMaybe a.pool)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "user" (encodeMaybe a.user) ]


instance defaultRBDVolumeSource :: Default RBDVolumeSource where
  default = RBDVolumeSource
    { fsType: Nothing
    , image: Nothing
    , keyring: Nothing
    , monitors: Nothing
    , pool: Nothing
    , readOnly: Nothing
    , secretRef: Nothing
    , user: Nothing }

-- | ReplicationController represents the configuration of a replication controller.
-- |
-- | Fields:
-- | - `metadata`: If the Labels of a ReplicationController are empty, they are defaulted to be the same as the Pod(s) that the replication controller manages. Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the specification of the desired behavior of the replication controller. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status is the most recently observed status of the replication controller. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype ReplicationController = ReplicationController
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe ReplicationControllerSpec)
  , status :: (Maybe ReplicationControllerStatus) }

derive instance newtypeReplicationController :: Newtype ReplicationController _
derive instance genericReplicationController :: Generic ReplicationController _
instance showReplicationController :: Show ReplicationController where show a = genericShow a
instance decodeReplicationController :: Decode ReplicationController where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "ReplicationController" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ ReplicationController { metadata, spec, status }
instance encodeReplicationController :: Encode ReplicationController where
  encode (ReplicationController a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "ReplicationController")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultReplicationController :: Default ReplicationController where
  default = ReplicationController
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | ReplicationControllerCondition describes the state of a replication controller at a certain point.
-- |
-- | Fields:
-- | - `_type`: Type of replication controller condition.
-- | - `lastTransitionTime`: The last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype ReplicationControllerCondition = ReplicationControllerCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeReplicationControllerCondition :: Newtype ReplicationControllerCondition _
derive instance genericReplicationControllerCondition :: Generic ReplicationControllerCondition _
instance showReplicationControllerCondition :: Show ReplicationControllerCondition where show a = genericShow a
instance decodeReplicationControllerCondition :: Decode ReplicationControllerCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ ReplicationControllerCondition { _type, lastTransitionTime, message, reason, status }
instance encodeReplicationControllerCondition :: Encode ReplicationControllerCondition where
  encode (ReplicationControllerCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultReplicationControllerCondition :: Default ReplicationControllerCondition where
  default = ReplicationControllerCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | ReplicationControllerList is a collection of replication controllers.
-- |
-- | Fields:
-- | - `items`: List of replication controllers. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ReplicationControllerList = ReplicationControllerList
  { items :: (Maybe (Array ReplicationController))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeReplicationControllerList :: Newtype ReplicationControllerList _
derive instance genericReplicationControllerList :: Generic ReplicationControllerList _
instance showReplicationControllerList :: Show ReplicationControllerList where show a = genericShow a
instance decodeReplicationControllerList :: Decode ReplicationControllerList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ReplicationControllerList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ReplicationControllerList { items, metadata }
instance encodeReplicationControllerList :: Encode ReplicationControllerList where
  encode (ReplicationControllerList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ReplicationControllerList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultReplicationControllerList :: Default ReplicationControllerList where
  default = ReplicationControllerList
    { items: Nothing
    , metadata: Nothing }

-- | ReplicationControllerSpec is the specification of a replication controller.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `replicas`: Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller
-- | - `selector`: Selector is a label query over pods that should match the Replicas count. If Selector is empty, it is defaulted to the labels present on the Pod template. Label keys and values that must match in order to be controlled by this replication controller, if empty defaulted to labels on Pod template. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: Template is the object that describes the pod that will be created if insufficient replicas are detected. This takes precedence over a TemplateRef. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
newtype ReplicationControllerSpec = ReplicationControllerSpec
  { minReadySeconds :: (Maybe Int)
  , replicas :: (Maybe Int)
  , selector :: (Maybe (StrMap String))
  , template :: (Maybe PodTemplateSpec) }

derive instance newtypeReplicationControllerSpec :: Newtype ReplicationControllerSpec _
derive instance genericReplicationControllerSpec :: Generic ReplicationControllerSpec _
instance showReplicationControllerSpec :: Show ReplicationControllerSpec where show a = genericShow a
instance decodeReplicationControllerSpec :: Decode ReplicationControllerSpec where
  decode a = do
               minReadySeconds <- decodeMaybe "minReadySeconds" a
               replicas <- decodeMaybe "replicas" a
               selector <- decodeMaybe "selector" a
               template <- decodeMaybe "template" a
               pure $ ReplicationControllerSpec { minReadySeconds, replicas, selector, template }
instance encodeReplicationControllerSpec :: Encode ReplicationControllerSpec where
  encode (ReplicationControllerSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encodeMaybe a.minReadySeconds)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "template" (encodeMaybe a.template) ]


instance defaultReplicationControllerSpec :: Default ReplicationControllerSpec where
  default = ReplicationControllerSpec
    { minReadySeconds: Nothing
    , replicas: Nothing
    , selector: Nothing
    , template: Nothing }

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
  { availableReplicas :: (Maybe Int)
  , conditions :: (Maybe (Array ReplicationControllerCondition))
  , fullyLabeledReplicas :: (Maybe Int)
  , observedGeneration :: (Maybe Int)
  , readyReplicas :: (Maybe Int)
  , replicas :: (Maybe Int) }

derive instance newtypeReplicationControllerStatus :: Newtype ReplicationControllerStatus _
derive instance genericReplicationControllerStatus :: Generic ReplicationControllerStatus _
instance showReplicationControllerStatus :: Show ReplicationControllerStatus where show a = genericShow a
instance decodeReplicationControllerStatus :: Decode ReplicationControllerStatus where
  decode a = do
               availableReplicas <- decodeMaybe "availableReplicas" a
               conditions <- decodeMaybe "conditions" a
               fullyLabeledReplicas <- decodeMaybe "fullyLabeledReplicas" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               readyReplicas <- decodeMaybe "readyReplicas" a
               replicas <- decodeMaybe "replicas" a
               pure $ ReplicationControllerStatus { availableReplicas, conditions, fullyLabeledReplicas, observedGeneration, readyReplicas, replicas }
instance encodeReplicationControllerStatus :: Encode ReplicationControllerStatus where
  encode (ReplicationControllerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "availableReplicas" (encodeMaybe a.availableReplicas)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "fullyLabeledReplicas" (encodeMaybe a.fullyLabeledReplicas)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration)
               , Tuple "readyReplicas" (encodeMaybe a.readyReplicas)
               , Tuple "replicas" (encodeMaybe a.replicas) ]


instance defaultReplicationControllerStatus :: Default ReplicationControllerStatus where
  default = ReplicationControllerStatus
    { availableReplicas: Nothing
    , conditions: Nothing
    , fullyLabeledReplicas: Nothing
    , observedGeneration: Nothing
    , readyReplicas: Nothing
    , replicas: Nothing }

-- | ResourceFieldSelector represents container resources (cpu, memory) and their output format
-- |
-- | Fields:
-- | - `containerName`: Container name: required for volumes, optional for env vars
-- | - `divisor`: Specifies the output format of the exposed resources, defaults to "1"
-- | - `resource`: Required: resource to select
newtype ResourceFieldSelector = ResourceFieldSelector
  { containerName :: (Maybe String)
  , divisor :: (Maybe Resource.Quantity)
  , resource :: (Maybe String) }

derive instance newtypeResourceFieldSelector :: Newtype ResourceFieldSelector _
derive instance genericResourceFieldSelector :: Generic ResourceFieldSelector _
instance showResourceFieldSelector :: Show ResourceFieldSelector where show a = genericShow a
instance decodeResourceFieldSelector :: Decode ResourceFieldSelector where
  decode a = do
               containerName <- decodeMaybe "containerName" a
               divisor <- decodeMaybe "divisor" a
               resource <- decodeMaybe "resource" a
               pure $ ResourceFieldSelector { containerName, divisor, resource }
instance encodeResourceFieldSelector :: Encode ResourceFieldSelector where
  encode (ResourceFieldSelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "containerName" (encodeMaybe a.containerName)
               , Tuple "divisor" (encodeMaybe a.divisor)
               , Tuple "resource" (encodeMaybe a.resource) ]


instance defaultResourceFieldSelector :: Default ResourceFieldSelector where
  default = ResourceFieldSelector
    { containerName: Nothing
    , divisor: Nothing
    , resource: Nothing }

-- | ResourceQuota sets aggregate quota restrictions enforced per namespace
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the desired quota. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status defines the actual enforced quota and its current usage. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype ResourceQuota = ResourceQuota
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe ResourceQuotaSpec)
  , status :: (Maybe ResourceQuotaStatus) }

derive instance newtypeResourceQuota :: Newtype ResourceQuota _
derive instance genericResourceQuota :: Generic ResourceQuota _
instance showResourceQuota :: Show ResourceQuota where show a = genericShow a
instance decodeResourceQuota :: Decode ResourceQuota where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "ResourceQuota" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ ResourceQuota { metadata, spec, status }
instance encodeResourceQuota :: Encode ResourceQuota where
  encode (ResourceQuota a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "ResourceQuota")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultResourceQuota :: Default ResourceQuota where
  default = ResourceQuota
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | ResourceQuotaList is a list of ResourceQuota items.
-- |
-- | Fields:
-- | - `items`: Items is a list of ResourceQuota objects. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ResourceQuotaList = ResourceQuotaList
  { items :: (Maybe (Array ResourceQuota))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeResourceQuotaList :: Newtype ResourceQuotaList _
derive instance genericResourceQuotaList :: Generic ResourceQuotaList _
instance showResourceQuotaList :: Show ResourceQuotaList where show a = genericShow a
instance decodeResourceQuotaList :: Decode ResourceQuotaList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ResourceQuotaList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ResourceQuotaList { items, metadata }
instance encodeResourceQuotaList :: Encode ResourceQuotaList where
  encode (ResourceQuotaList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ResourceQuotaList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultResourceQuotaList :: Default ResourceQuotaList where
  default = ResourceQuotaList
    { items: Nothing
    , metadata: Nothing }

-- | ResourceQuotaSpec defines the desired hard limits to enforce for Quota.
-- |
-- | Fields:
-- | - `hard`: Hard is the set of desired hard limits for each named resource. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
-- | - `scopes`: A collection of filters that must match each object tracked by a quota. If not specified, the quota matches all objects.
newtype ResourceQuotaSpec = ResourceQuotaSpec
  { hard :: (Maybe (StrMap Resource.Quantity))
  , scopes :: (Maybe (Array String)) }

derive instance newtypeResourceQuotaSpec :: Newtype ResourceQuotaSpec _
derive instance genericResourceQuotaSpec :: Generic ResourceQuotaSpec _
instance showResourceQuotaSpec :: Show ResourceQuotaSpec where show a = genericShow a
instance decodeResourceQuotaSpec :: Decode ResourceQuotaSpec where
  decode a = do
               hard <- decodeMaybe "hard" a
               scopes <- decodeMaybe "scopes" a
               pure $ ResourceQuotaSpec { hard, scopes }
instance encodeResourceQuotaSpec :: Encode ResourceQuotaSpec where
  encode (ResourceQuotaSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "hard" (encodeMaybe a.hard)
               , Tuple "scopes" (encodeMaybe a.scopes) ]


instance defaultResourceQuotaSpec :: Default ResourceQuotaSpec where
  default = ResourceQuotaSpec
    { hard: Nothing
    , scopes: Nothing }

-- | ResourceQuotaStatus defines the enforced hard limits and observed use.
-- |
-- | Fields:
-- | - `hard`: Hard is the set of enforced hard limits for each named resource. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
-- | - `used`: Used is the current observed total usage of the resource in the namespace.
newtype ResourceQuotaStatus = ResourceQuotaStatus
  { hard :: (Maybe (StrMap Resource.Quantity))
  , used :: (Maybe (StrMap Resource.Quantity)) }

derive instance newtypeResourceQuotaStatus :: Newtype ResourceQuotaStatus _
derive instance genericResourceQuotaStatus :: Generic ResourceQuotaStatus _
instance showResourceQuotaStatus :: Show ResourceQuotaStatus where show a = genericShow a
instance decodeResourceQuotaStatus :: Decode ResourceQuotaStatus where
  decode a = do
               hard <- decodeMaybe "hard" a
               used <- decodeMaybe "used" a
               pure $ ResourceQuotaStatus { hard, used }
instance encodeResourceQuotaStatus :: Encode ResourceQuotaStatus where
  encode (ResourceQuotaStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "hard" (encodeMaybe a.hard)
               , Tuple "used" (encodeMaybe a.used) ]


instance defaultResourceQuotaStatus :: Default ResourceQuotaStatus where
  default = ResourceQuotaStatus
    { hard: Nothing
    , used: Nothing }

-- | ResourceRequirements describes the compute resource requirements.
-- |
-- | Fields:
-- | - `limits`: Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
-- | - `requests`: Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
newtype ResourceRequirements = ResourceRequirements
  { limits :: (Maybe (StrMap Resource.Quantity))
  , requests :: (Maybe (StrMap Resource.Quantity)) }

derive instance newtypeResourceRequirements :: Newtype ResourceRequirements _
derive instance genericResourceRequirements :: Generic ResourceRequirements _
instance showResourceRequirements :: Show ResourceRequirements where show a = genericShow a
instance decodeResourceRequirements :: Decode ResourceRequirements where
  decode a = do
               limits <- decodeMaybe "limits" a
               requests <- decodeMaybe "requests" a
               pure $ ResourceRequirements { limits, requests }
instance encodeResourceRequirements :: Encode ResourceRequirements where
  encode (ResourceRequirements a) = encode $ StrMap.fromFoldable $
               [ Tuple "limits" (encodeMaybe a.limits)
               , Tuple "requests" (encodeMaybe a.requests) ]


instance defaultResourceRequirements :: Default ResourceRequirements where
  default = ResourceRequirements
    { limits: Nothing
    , requests: Nothing }

-- | SELinuxOptions are the labels to be applied to the container
-- |
-- | Fields:
-- | - `_type`: Type is a SELinux type label that applies to the container.
-- | - `level`: Level is SELinux level label that applies to the container.
-- | - `role`: Role is a SELinux role label that applies to the container.
-- | - `user`: User is a SELinux user label that applies to the container.
newtype SELinuxOptions = SELinuxOptions
  { _type :: (Maybe String)
  , level :: (Maybe String)
  , role :: (Maybe String)
  , user :: (Maybe String) }

derive instance newtypeSELinuxOptions :: Newtype SELinuxOptions _
derive instance genericSELinuxOptions :: Generic SELinuxOptions _
instance showSELinuxOptions :: Show SELinuxOptions where show a = genericShow a
instance decodeSELinuxOptions :: Decode SELinuxOptions where
  decode a = do
               _type <- decodeMaybe "_type" a
               level <- decodeMaybe "level" a
               role <- decodeMaybe "role" a
               user <- decodeMaybe "user" a
               pure $ SELinuxOptions { _type, level, role, user }
instance encodeSELinuxOptions :: Encode SELinuxOptions where
  encode (SELinuxOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "level" (encodeMaybe a.level)
               , Tuple "role" (encodeMaybe a.role)
               , Tuple "user" (encodeMaybe a.user) ]


instance defaultSELinuxOptions :: Default SELinuxOptions where
  default = SELinuxOptions
    { _type: Nothing
    , level: Nothing
    , role: Nothing
    , user: Nothing }

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
  { fsType :: (Maybe String)
  , gateway :: (Maybe String)
  , protectionDomain :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe SecretReference)
  , sslEnabled :: (Maybe Boolean)
  , storageMode :: (Maybe String)
  , storagePool :: (Maybe String)
  , system :: (Maybe String)
  , volumeName :: (Maybe String) }

derive instance newtypeScaleIOPersistentVolumeSource :: Newtype ScaleIOPersistentVolumeSource _
derive instance genericScaleIOPersistentVolumeSource :: Generic ScaleIOPersistentVolumeSource _
instance showScaleIOPersistentVolumeSource :: Show ScaleIOPersistentVolumeSource where show a = genericShow a
instance decodeScaleIOPersistentVolumeSource :: Decode ScaleIOPersistentVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               gateway <- decodeMaybe "gateway" a
               protectionDomain <- decodeMaybe "protectionDomain" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               sslEnabled <- decodeMaybe "sslEnabled" a
               storageMode <- decodeMaybe "storageMode" a
               storagePool <- decodeMaybe "storagePool" a
               system <- decodeMaybe "system" a
               volumeName <- decodeMaybe "volumeName" a
               pure $ ScaleIOPersistentVolumeSource { fsType, gateway, protectionDomain, readOnly, secretRef, sslEnabled, storageMode, storagePool, system, volumeName }
instance encodeScaleIOPersistentVolumeSource :: Encode ScaleIOPersistentVolumeSource where
  encode (ScaleIOPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "gateway" (encodeMaybe a.gateway)
               , Tuple "protectionDomain" (encodeMaybe a.protectionDomain)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "sslEnabled" (encodeMaybe a.sslEnabled)
               , Tuple "storageMode" (encodeMaybe a.storageMode)
               , Tuple "storagePool" (encodeMaybe a.storagePool)
               , Tuple "system" (encodeMaybe a.system)
               , Tuple "volumeName" (encodeMaybe a.volumeName) ]


instance defaultScaleIOPersistentVolumeSource :: Default ScaleIOPersistentVolumeSource where
  default = ScaleIOPersistentVolumeSource
    { fsType: Nothing
    , gateway: Nothing
    , protectionDomain: Nothing
    , readOnly: Nothing
    , secretRef: Nothing
    , sslEnabled: Nothing
    , storageMode: Nothing
    , storagePool: Nothing
    , system: Nothing
    , volumeName: Nothing }

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
  { fsType :: (Maybe String)
  , gateway :: (Maybe String)
  , protectionDomain :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe LocalObjectReference)
  , sslEnabled :: (Maybe Boolean)
  , storageMode :: (Maybe String)
  , storagePool :: (Maybe String)
  , system :: (Maybe String)
  , volumeName :: (Maybe String) }

derive instance newtypeScaleIOVolumeSource :: Newtype ScaleIOVolumeSource _
derive instance genericScaleIOVolumeSource :: Generic ScaleIOVolumeSource _
instance showScaleIOVolumeSource :: Show ScaleIOVolumeSource where show a = genericShow a
instance decodeScaleIOVolumeSource :: Decode ScaleIOVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               gateway <- decodeMaybe "gateway" a
               protectionDomain <- decodeMaybe "protectionDomain" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               sslEnabled <- decodeMaybe "sslEnabled" a
               storageMode <- decodeMaybe "storageMode" a
               storagePool <- decodeMaybe "storagePool" a
               system <- decodeMaybe "system" a
               volumeName <- decodeMaybe "volumeName" a
               pure $ ScaleIOVolumeSource { fsType, gateway, protectionDomain, readOnly, secretRef, sslEnabled, storageMode, storagePool, system, volumeName }
instance encodeScaleIOVolumeSource :: Encode ScaleIOVolumeSource where
  encode (ScaleIOVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "gateway" (encodeMaybe a.gateway)
               , Tuple "protectionDomain" (encodeMaybe a.protectionDomain)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "sslEnabled" (encodeMaybe a.sslEnabled)
               , Tuple "storageMode" (encodeMaybe a.storageMode)
               , Tuple "storagePool" (encodeMaybe a.storagePool)
               , Tuple "system" (encodeMaybe a.system)
               , Tuple "volumeName" (encodeMaybe a.volumeName) ]


instance defaultScaleIOVolumeSource :: Default ScaleIOVolumeSource where
  default = ScaleIOVolumeSource
    { fsType: Nothing
    , gateway: Nothing
    , protectionDomain: Nothing
    , readOnly: Nothing
    , secretRef: Nothing
    , sslEnabled: Nothing
    , storageMode: Nothing
    , storagePool: Nothing
    , system: Nothing
    , volumeName: Nothing }

-- | Secret holds secret data of a certain type. The total bytes of the values in the Data field must be less than MaxSecretSize bytes.
-- |
-- | Fields:
-- | - `_data`: Data contains the secret data. Each key must consist of alphanumeric characters, '-', '_' or '.'. The serialized form of the secret data is a base64 encoded string, representing the arbitrary (possibly non-string) data value here. Described in https://tools.ietf.org/html/rfc4648#section-4
-- | - `_type`: Used to facilitate programmatic handling of secret data.
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `stringData`: stringData allows specifying non-binary secret data in string form. It is provided as a write-only convenience method. All keys and values are merged into the data field on write, overwriting any existing values. It is never output when reading from the API.
newtype Secret = Secret
  { _data :: (Maybe (StrMap String))
  , _type :: (Maybe String)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , stringData :: (Maybe (StrMap String)) }

derive instance newtypeSecret :: Newtype Secret _
derive instance genericSecret :: Generic Secret _
instance showSecret :: Show Secret where show a = genericShow a
instance decodeSecret :: Decode Secret where
  decode a = do
               _data <- decodeMaybe "_data" a
               _type <- decodeMaybe "_type" a
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "Secret" a
               metadata <- decodeMaybe "metadata" a
               stringData <- decodeMaybe "stringData" a
               pure $ Secret { _data, _type, metadata, stringData }
instance encodeSecret :: Encode Secret where
  encode (Secret a) = encode $ StrMap.fromFoldable $
               [ Tuple "_data" (encodeMaybe a._data)
               , Tuple "_type" (encodeMaybe a._type)
               , Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "Secret")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "stringData" (encodeMaybe a.stringData) ]


instance defaultSecret :: Default Secret where
  default = Secret
    { _data: Nothing
    , _type: Nothing
    , metadata: Nothing
    , stringData: Nothing }

-- | SecretEnvSource selects a Secret to populate the environment variables with.
-- | 
-- | The contents of the target Secret's Data field will represent the key-value pairs as environment variables.
-- |
-- | Fields:
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the Secret must be defined
newtype SecretEnvSource = SecretEnvSource
  { name :: (Maybe String)
  , optional :: (Maybe Boolean) }

derive instance newtypeSecretEnvSource :: Newtype SecretEnvSource _
derive instance genericSecretEnvSource :: Generic SecretEnvSource _
instance showSecretEnvSource :: Show SecretEnvSource where show a = genericShow a
instance decodeSecretEnvSource :: Decode SecretEnvSource where
  decode a = do
               name <- decodeMaybe "name" a
               optional <- decodeMaybe "optional" a
               pure $ SecretEnvSource { name, optional }
instance encodeSecretEnvSource :: Encode SecretEnvSource where
  encode (SecretEnvSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "optional" (encodeMaybe a.optional) ]


instance defaultSecretEnvSource :: Default SecretEnvSource where
  default = SecretEnvSource
    { name: Nothing
    , optional: Nothing }

-- | SecretKeySelector selects a key of a Secret.
-- |
-- | Fields:
-- | - `key`: The key of the secret to select from.  Must be a valid secret key.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the Secret or it's key must be defined
newtype SecretKeySelector = SecretKeySelector
  { key :: (Maybe String)
  , name :: (Maybe String)
  , optional :: (Maybe Boolean) }

derive instance newtypeSecretKeySelector :: Newtype SecretKeySelector _
derive instance genericSecretKeySelector :: Generic SecretKeySelector _
instance showSecretKeySelector :: Show SecretKeySelector where show a = genericShow a
instance decodeSecretKeySelector :: Decode SecretKeySelector where
  decode a = do
               key <- decodeMaybe "key" a
               name <- decodeMaybe "name" a
               optional <- decodeMaybe "optional" a
               pure $ SecretKeySelector { key, name, optional }
instance encodeSecretKeySelector :: Encode SecretKeySelector where
  encode (SecretKeySelector a) = encode $ StrMap.fromFoldable $
               [ Tuple "key" (encodeMaybe a.key)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "optional" (encodeMaybe a.optional) ]


instance defaultSecretKeySelector :: Default SecretKeySelector where
  default = SecretKeySelector
    { key: Nothing
    , name: Nothing
    , optional: Nothing }

-- | SecretList is a list of Secret.
-- |
-- | Fields:
-- | - `items`: Items is a list of secret objects. More info: https://kubernetes.io/docs/concepts/configuration/secret
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype SecretList = SecretList
  { items :: (Maybe (Array Secret))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeSecretList :: Newtype SecretList _
derive instance genericSecretList :: Generic SecretList _
instance showSecretList :: Show SecretList where show a = genericShow a
instance decodeSecretList :: Decode SecretList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "SecretList" a
               metadata <- decodeMaybe "metadata" a
               pure $ SecretList { items, metadata }
instance encodeSecretList :: Encode SecretList where
  encode (SecretList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "SecretList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultSecretList :: Default SecretList where
  default = SecretList
    { items: Nothing
    , metadata: Nothing }

-- | Adapts a secret into a projected volume.
-- | 
-- | The contents of the target Secret's Data field will be presented in a projected volume as files using the keys in the Data field as the file names. Note that this is identical to a secret volume source without the default mode.
-- |
-- | Fields:
-- | - `items`: If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the Secret, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
-- | - `name`: Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
-- | - `optional`: Specify whether the Secret or its key must be defined
newtype SecretProjection = SecretProjection
  { items :: (Maybe (Array KeyToPath))
  , name :: (Maybe String)
  , optional :: (Maybe Boolean) }

derive instance newtypeSecretProjection :: Newtype SecretProjection _
derive instance genericSecretProjection :: Generic SecretProjection _
instance showSecretProjection :: Show SecretProjection where show a = genericShow a
instance decodeSecretProjection :: Decode SecretProjection where
  decode a = do
               items <- decodeMaybe "items" a
               name <- decodeMaybe "name" a
               optional <- decodeMaybe "optional" a
               pure $ SecretProjection { items, name, optional }
instance encodeSecretProjection :: Encode SecretProjection where
  encode (SecretProjection a) = encode $ StrMap.fromFoldable $
               [ Tuple "items" (encodeMaybe a.items)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "optional" (encodeMaybe a.optional) ]


instance defaultSecretProjection :: Default SecretProjection where
  default = SecretProjection
    { items: Nothing
    , name: Nothing
    , optional: Nothing }

-- | SecretReference represents a Secret Reference. It has enough information to retrieve secret in any namespace
-- |
-- | Fields:
-- | - `name`: Name is unique within a namespace to reference a secret resource.
-- | - `namespace`: Namespace defines the space within which the secret name must be unique.
newtype SecretReference = SecretReference
  { name :: (Maybe String)
  , namespace :: (Maybe String) }

derive instance newtypeSecretReference :: Newtype SecretReference _
derive instance genericSecretReference :: Generic SecretReference _
instance showSecretReference :: Show SecretReference where show a = genericShow a
instance decodeSecretReference :: Decode SecretReference where
  decode a = do
               name <- decodeMaybe "name" a
               namespace <- decodeMaybe "namespace" a
               pure $ SecretReference { name, namespace }
instance encodeSecretReference :: Encode SecretReference where
  encode (SecretReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "namespace" (encodeMaybe a.namespace) ]


instance defaultSecretReference :: Default SecretReference where
  default = SecretReference
    { name: Nothing
    , namespace: Nothing }

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
  { defaultMode :: (Maybe Int)
  , items :: (Maybe (Array KeyToPath))
  , optional :: (Maybe Boolean)
  , secretName :: (Maybe String) }

derive instance newtypeSecretVolumeSource :: Newtype SecretVolumeSource _
derive instance genericSecretVolumeSource :: Generic SecretVolumeSource _
instance showSecretVolumeSource :: Show SecretVolumeSource where show a = genericShow a
instance decodeSecretVolumeSource :: Decode SecretVolumeSource where
  decode a = do
               defaultMode <- decodeMaybe "defaultMode" a
               items <- decodeMaybe "items" a
               optional <- decodeMaybe "optional" a
               secretName <- decodeMaybe "secretName" a
               pure $ SecretVolumeSource { defaultMode, items, optional, secretName }
instance encodeSecretVolumeSource :: Encode SecretVolumeSource where
  encode (SecretVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "defaultMode" (encodeMaybe a.defaultMode)
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "optional" (encodeMaybe a.optional)
               , Tuple "secretName" (encodeMaybe a.secretName) ]


instance defaultSecretVolumeSource :: Default SecretVolumeSource where
  default = SecretVolumeSource
    { defaultMode: Nothing
    , items: Nothing
    , optional: Nothing
    , secretName: Nothing }

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
  { allowPrivilegeEscalation :: (Maybe Boolean)
  , capabilities :: (Maybe Capabilities)
  , privileged :: (Maybe Boolean)
  , readOnlyRootFilesystem :: (Maybe Boolean)
  , runAsNonRoot :: (Maybe Boolean)
  , runAsUser :: (Maybe Int)
  , seLinuxOptions :: (Maybe SELinuxOptions) }

derive instance newtypeSecurityContext :: Newtype SecurityContext _
derive instance genericSecurityContext :: Generic SecurityContext _
instance showSecurityContext :: Show SecurityContext where show a = genericShow a
instance decodeSecurityContext :: Decode SecurityContext where
  decode a = do
               allowPrivilegeEscalation <- decodeMaybe "allowPrivilegeEscalation" a
               capabilities <- decodeMaybe "capabilities" a
               privileged <- decodeMaybe "privileged" a
               readOnlyRootFilesystem <- decodeMaybe "readOnlyRootFilesystem" a
               runAsNonRoot <- decodeMaybe "runAsNonRoot" a
               runAsUser <- decodeMaybe "runAsUser" a
               seLinuxOptions <- decodeMaybe "seLinuxOptions" a
               pure $ SecurityContext { allowPrivilegeEscalation, capabilities, privileged, readOnlyRootFilesystem, runAsNonRoot, runAsUser, seLinuxOptions }
instance encodeSecurityContext :: Encode SecurityContext where
  encode (SecurityContext a) = encode $ StrMap.fromFoldable $
               [ Tuple "allowPrivilegeEscalation" (encodeMaybe a.allowPrivilegeEscalation)
               , Tuple "capabilities" (encodeMaybe a.capabilities)
               , Tuple "privileged" (encodeMaybe a.privileged)
               , Tuple "readOnlyRootFilesystem" (encodeMaybe a.readOnlyRootFilesystem)
               , Tuple "runAsNonRoot" (encodeMaybe a.runAsNonRoot)
               , Tuple "runAsUser" (encodeMaybe a.runAsUser)
               , Tuple "seLinuxOptions" (encodeMaybe a.seLinuxOptions) ]


instance defaultSecurityContext :: Default SecurityContext where
  default = SecurityContext
    { allowPrivilegeEscalation: Nothing
    , capabilities: Nothing
    , privileged: Nothing
    , readOnlyRootFilesystem: Nothing
    , runAsNonRoot: Nothing
    , runAsUser: Nothing
    , seLinuxOptions: Nothing }

-- | Service is a named abstraction of software service (for example, mysql) consisting of local port (for example 3306) that the proxy listens on, and the selector that determines which pods will answer requests sent through the proxy.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the behavior of a service. https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Most recently observed status of the service. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Service = Service
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe ServiceSpec)
  , status :: (Maybe ServiceStatus) }

derive instance newtypeService :: Newtype Service _
derive instance genericService :: Generic Service _
instance showService :: Show Service where show a = genericShow a
instance decodeService :: Decode Service where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               assertPropEq "kind" "Service" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Service { metadata, spec, status }
instance encodeService :: Encode Service where
  encode (Service a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "kind" (encode "Service")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultService :: Default Service where
  default = Service
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | ServiceAccount binds together: * a name, understood by users, and perhaps by peripheral systems, for an identity * a principal that can be authenticated and authorized * a set of secrets
-- |
-- | Fields:
-- | - `automountServiceAccountToken`: AutomountServiceAccountToken indicates whether pods running as this service account should have an API token automatically mounted. Can be overridden at the pod level.
-- | - `imagePullSecrets`: ImagePullSecrets is a list of references to secrets in the same namespace to use for pulling any images in pods that reference this ServiceAccount. ImagePullSecrets are distinct from Secrets because Secrets can be mounted in the pod, but ImagePullSecrets are only accessed by the kubelet. More info: https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `secrets`: Secrets is the list of secrets allowed to be used by pods running using this ServiceAccount. More info: https://kubernetes.io/docs/concepts/configuration/secret
newtype ServiceAccount = ServiceAccount
  { automountServiceAccountToken :: (Maybe Boolean)
  , imagePullSecrets :: (Maybe (Array LocalObjectReference))
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , secrets :: (Maybe (Array ObjectReference)) }

derive instance newtypeServiceAccount :: Newtype ServiceAccount _
derive instance genericServiceAccount :: Generic ServiceAccount _
instance showServiceAccount :: Show ServiceAccount where show a = genericShow a
instance decodeServiceAccount :: Decode ServiceAccount where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               automountServiceAccountToken <- decodeMaybe "automountServiceAccountToken" a
               imagePullSecrets <- decodeMaybe "imagePullSecrets" a
               assertPropEq "kind" "ServiceAccount" a
               metadata <- decodeMaybe "metadata" a
               secrets <- decodeMaybe "secrets" a
               pure $ ServiceAccount { automountServiceAccountToken, imagePullSecrets, metadata, secrets }
instance encodeServiceAccount :: Encode ServiceAccount where
  encode (ServiceAccount a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "automountServiceAccountToken" (encodeMaybe a.automountServiceAccountToken)
               , Tuple "imagePullSecrets" (encodeMaybe a.imagePullSecrets)
               , Tuple "kind" (encode "ServiceAccount")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "secrets" (encodeMaybe a.secrets) ]


instance defaultServiceAccount :: Default ServiceAccount where
  default = ServiceAccount
    { automountServiceAccountToken: Nothing
    , imagePullSecrets: Nothing
    , metadata: Nothing
    , secrets: Nothing }

-- | ServiceAccountList is a list of ServiceAccount objects
-- |
-- | Fields:
-- | - `items`: List of ServiceAccounts. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ServiceAccountList = ServiceAccountList
  { items :: (Maybe (Array ServiceAccount))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeServiceAccountList :: Newtype ServiceAccountList _
derive instance genericServiceAccountList :: Generic ServiceAccountList _
instance showServiceAccountList :: Show ServiceAccountList where show a = genericShow a
instance decodeServiceAccountList :: Decode ServiceAccountList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ServiceAccountList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ServiceAccountList { items, metadata }
instance encodeServiceAccountList :: Encode ServiceAccountList where
  encode (ServiceAccountList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ServiceAccountList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultServiceAccountList :: Default ServiceAccountList where
  default = ServiceAccountList
    { items: Nothing
    , metadata: Nothing }

-- | ServiceList holds a list of services.
-- |
-- | Fields:
-- | - `items`: List of services
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ServiceList = ServiceList
  { items :: (Maybe (Array Service))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeServiceList :: Newtype ServiceList _
derive instance genericServiceList :: Generic ServiceList _
instance showServiceList :: Show ServiceList where show a = genericShow a
instance decodeServiceList :: Decode ServiceList where
  decode a = do
               assertPropEq "apiVersion" "v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ServiceList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ServiceList { items, metadata }
instance encodeServiceList :: Encode ServiceList where
  encode (ServiceList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ServiceList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultServiceList :: Default ServiceList where
  default = ServiceList
    { items: Nothing
    , metadata: Nothing }

-- | ServicePort contains information on service's port.
-- |
-- | Fields:
-- | - `name`: The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. This maps to the 'Name' field in EndpointPort objects. Optional if only one ServicePort is defined on this service.
-- | - `nodePort`: The port on each node on which this service is exposed when type=NodePort or LoadBalancer. Usually assigned by the system. If specified, it will be allocated to the service if unused or else creation of the service will fail. Default is to auto-allocate a port if the ServiceType of this Service requires one. More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport
-- | - `port`: The port that will be exposed by this service.
-- | - `protocol`: The IP protocol for this port. Supports "TCP" and "UDP". Default is TCP.
-- | - `targetPort`: Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service
newtype ServicePort = ServicePort
  { name :: (Maybe String)
  , nodePort :: (Maybe Int)
  , port :: (Maybe Int)
  , protocol :: (Maybe String)
  , targetPort :: (Maybe Util.IntOrString) }

derive instance newtypeServicePort :: Newtype ServicePort _
derive instance genericServicePort :: Generic ServicePort _
instance showServicePort :: Show ServicePort where show a = genericShow a
instance decodeServicePort :: Decode ServicePort where
  decode a = do
               name <- decodeMaybe "name" a
               nodePort <- decodeMaybe "nodePort" a
               port <- decodeMaybe "port" a
               protocol <- decodeMaybe "protocol" a
               targetPort <- decodeMaybe "targetPort" a
               pure $ ServicePort { name, nodePort, port, protocol, targetPort }
instance encodeServicePort :: Encode ServicePort where
  encode (ServicePort a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "nodePort" (encodeMaybe a.nodePort)
               , Tuple "port" (encodeMaybe a.port)
               , Tuple "protocol" (encodeMaybe a.protocol)
               , Tuple "targetPort" (encodeMaybe a.targetPort) ]


instance defaultServicePort :: Default ServicePort where
  default = ServicePort
    { name: Nothing
    , nodePort: Nothing
    , port: Nothing
    , protocol: Nothing
    , targetPort: Nothing }

-- | ServiceSpec describes the attributes that a user creates on a service.
-- |
-- | Fields:
-- | - `_type`: type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. "ExternalName" maps to the specified externalName. "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object. If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a stable IP. "NodePort" builds on ClusterIP and allocates a port on every node which routes to the clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the clusterIP. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services---service-types
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
newtype ServiceSpec = ServiceSpec
  { _type :: (Maybe String)
  , clusterIP :: (Maybe String)
  , externalIPs :: (Maybe (Array String))
  , externalName :: (Maybe String)
  , externalTrafficPolicy :: (Maybe String)
  , healthCheckNodePort :: (Maybe Int)
  , loadBalancerIP :: (Maybe String)
  , loadBalancerSourceRanges :: (Maybe (Array String))
  , ports :: (Maybe (Array ServicePort))
  , publishNotReadyAddresses :: (Maybe Boolean)
  , selector :: (Maybe (StrMap String))
  , sessionAffinity :: (Maybe String)
  , sessionAffinityConfig :: (Maybe SessionAffinityConfig) }

derive instance newtypeServiceSpec :: Newtype ServiceSpec _
derive instance genericServiceSpec :: Generic ServiceSpec _
instance showServiceSpec :: Show ServiceSpec where show a = genericShow a
instance decodeServiceSpec :: Decode ServiceSpec where
  decode a = do
               _type <- decodeMaybe "_type" a
               clusterIP <- decodeMaybe "clusterIP" a
               externalIPs <- decodeMaybe "externalIPs" a
               externalName <- decodeMaybe "externalName" a
               externalTrafficPolicy <- decodeMaybe "externalTrafficPolicy" a
               healthCheckNodePort <- decodeMaybe "healthCheckNodePort" a
               loadBalancerIP <- decodeMaybe "loadBalancerIP" a
               loadBalancerSourceRanges <- decodeMaybe "loadBalancerSourceRanges" a
               ports <- decodeMaybe "ports" a
               publishNotReadyAddresses <- decodeMaybe "publishNotReadyAddresses" a
               selector <- decodeMaybe "selector" a
               sessionAffinity <- decodeMaybe "sessionAffinity" a
               sessionAffinityConfig <- decodeMaybe "sessionAffinityConfig" a
               pure $ ServiceSpec { _type, clusterIP, externalIPs, externalName, externalTrafficPolicy, healthCheckNodePort, loadBalancerIP, loadBalancerSourceRanges, ports, publishNotReadyAddresses, selector, sessionAffinity, sessionAffinityConfig }
instance encodeServiceSpec :: Encode ServiceSpec where
  encode (ServiceSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "clusterIP" (encodeMaybe a.clusterIP)
               , Tuple "externalIPs" (encodeMaybe a.externalIPs)
               , Tuple "externalName" (encodeMaybe a.externalName)
               , Tuple "externalTrafficPolicy" (encodeMaybe a.externalTrafficPolicy)
               , Tuple "healthCheckNodePort" (encodeMaybe a.healthCheckNodePort)
               , Tuple "loadBalancerIP" (encodeMaybe a.loadBalancerIP)
               , Tuple "loadBalancerSourceRanges" (encodeMaybe a.loadBalancerSourceRanges)
               , Tuple "ports" (encodeMaybe a.ports)
               , Tuple "publishNotReadyAddresses" (encodeMaybe a.publishNotReadyAddresses)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "sessionAffinity" (encodeMaybe a.sessionAffinity)
               , Tuple "sessionAffinityConfig" (encodeMaybe a.sessionAffinityConfig) ]


instance defaultServiceSpec :: Default ServiceSpec where
  default = ServiceSpec
    { _type: Nothing
    , clusterIP: Nothing
    , externalIPs: Nothing
    , externalName: Nothing
    , externalTrafficPolicy: Nothing
    , healthCheckNodePort: Nothing
    , loadBalancerIP: Nothing
    , loadBalancerSourceRanges: Nothing
    , ports: Nothing
    , publishNotReadyAddresses: Nothing
    , selector: Nothing
    , sessionAffinity: Nothing
    , sessionAffinityConfig: Nothing }

-- | ServiceStatus represents the current status of a service.
-- |
-- | Fields:
-- | - `loadBalancer`: LoadBalancer contains the current status of the load-balancer, if one is present.
newtype ServiceStatus = ServiceStatus
  { loadBalancer :: (Maybe LoadBalancerStatus) }

derive instance newtypeServiceStatus :: Newtype ServiceStatus _
derive instance genericServiceStatus :: Generic ServiceStatus _
instance showServiceStatus :: Show ServiceStatus where show a = genericShow a
instance decodeServiceStatus :: Decode ServiceStatus where
  decode a = do
               loadBalancer <- decodeMaybe "loadBalancer" a
               pure $ ServiceStatus { loadBalancer }
instance encodeServiceStatus :: Encode ServiceStatus where
  encode (ServiceStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "loadBalancer" (encodeMaybe a.loadBalancer) ]


instance defaultServiceStatus :: Default ServiceStatus where
  default = ServiceStatus
    { loadBalancer: Nothing }

-- | SessionAffinityConfig represents the configurations of session affinity.
-- |
-- | Fields:
-- | - `clientIP`: clientIP contains the configurations of Client IP based session affinity.
newtype SessionAffinityConfig = SessionAffinityConfig
  { clientIP :: (Maybe ClientIPConfig) }

derive instance newtypeSessionAffinityConfig :: Newtype SessionAffinityConfig _
derive instance genericSessionAffinityConfig :: Generic SessionAffinityConfig _
instance showSessionAffinityConfig :: Show SessionAffinityConfig where show a = genericShow a
instance decodeSessionAffinityConfig :: Decode SessionAffinityConfig where
  decode a = do
               clientIP <- decodeMaybe "clientIP" a
               pure $ SessionAffinityConfig { clientIP }
instance encodeSessionAffinityConfig :: Encode SessionAffinityConfig where
  encode (SessionAffinityConfig a) = encode $ StrMap.fromFoldable $
               [ Tuple "clientIP" (encodeMaybe a.clientIP) ]


instance defaultSessionAffinityConfig :: Default SessionAffinityConfig where
  default = SessionAffinityConfig
    { clientIP: Nothing }

-- | Represents a StorageOS persistent volume resource.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: SecretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted.
-- | - `volumeName`: VolumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
-- | - `volumeNamespace`: VolumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
newtype StorageOSPersistentVolumeSource = StorageOSPersistentVolumeSource
  { fsType :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe ObjectReference)
  , volumeName :: (Maybe String)
  , volumeNamespace :: (Maybe String) }

derive instance newtypeStorageOSPersistentVolumeSource :: Newtype StorageOSPersistentVolumeSource _
derive instance genericStorageOSPersistentVolumeSource :: Generic StorageOSPersistentVolumeSource _
instance showStorageOSPersistentVolumeSource :: Show StorageOSPersistentVolumeSource where show a = genericShow a
instance decodeStorageOSPersistentVolumeSource :: Decode StorageOSPersistentVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               volumeName <- decodeMaybe "volumeName" a
               volumeNamespace <- decodeMaybe "volumeNamespace" a
               pure $ StorageOSPersistentVolumeSource { fsType, readOnly, secretRef, volumeName, volumeNamespace }
instance encodeStorageOSPersistentVolumeSource :: Encode StorageOSPersistentVolumeSource where
  encode (StorageOSPersistentVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "volumeName" (encodeMaybe a.volumeName)
               , Tuple "volumeNamespace" (encodeMaybe a.volumeNamespace) ]


instance defaultStorageOSPersistentVolumeSource :: Default StorageOSPersistentVolumeSource where
  default = StorageOSPersistentVolumeSource
    { fsType: Nothing
    , readOnly: Nothing
    , secretRef: Nothing
    , volumeName: Nothing
    , volumeNamespace: Nothing }

-- | Represents a StorageOS persistent volume resource.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `readOnly`: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
-- | - `secretRef`: SecretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted.
-- | - `volumeName`: VolumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
-- | - `volumeNamespace`: VolumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
newtype StorageOSVolumeSource = StorageOSVolumeSource
  { fsType :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , secretRef :: (Maybe LocalObjectReference)
  , volumeName :: (Maybe String)
  , volumeNamespace :: (Maybe String) }

derive instance newtypeStorageOSVolumeSource :: Newtype StorageOSVolumeSource _
derive instance genericStorageOSVolumeSource :: Generic StorageOSVolumeSource _
instance showStorageOSVolumeSource :: Show StorageOSVolumeSource where show a = genericShow a
instance decodeStorageOSVolumeSource :: Decode StorageOSVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               readOnly <- decodeMaybe "readOnly" a
               secretRef <- decodeMaybe "secretRef" a
               volumeName <- decodeMaybe "volumeName" a
               volumeNamespace <- decodeMaybe "volumeNamespace" a
               pure $ StorageOSVolumeSource { fsType, readOnly, secretRef, volumeName, volumeNamespace }
instance encodeStorageOSVolumeSource :: Encode StorageOSVolumeSource where
  encode (StorageOSVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "secretRef" (encodeMaybe a.secretRef)
               , Tuple "volumeName" (encodeMaybe a.volumeName)
               , Tuple "volumeNamespace" (encodeMaybe a.volumeNamespace) ]


instance defaultStorageOSVolumeSource :: Default StorageOSVolumeSource where
  default = StorageOSVolumeSource
    { fsType: Nothing
    , readOnly: Nothing
    , secretRef: Nothing
    , volumeName: Nothing
    , volumeNamespace: Nothing }

-- | TCPSocketAction describes an action based on opening a socket
-- |
-- | Fields:
-- | - `host`: Optional: Host name to connect to, defaults to the pod IP.
-- | - `port`: Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.
newtype TCPSocketAction = TCPSocketAction
  { host :: (Maybe String)
  , port :: (Maybe Util.IntOrString) }

derive instance newtypeTCPSocketAction :: Newtype TCPSocketAction _
derive instance genericTCPSocketAction :: Generic TCPSocketAction _
instance showTCPSocketAction :: Show TCPSocketAction where show a = genericShow a
instance decodeTCPSocketAction :: Decode TCPSocketAction where
  decode a = do
               host <- decodeMaybe "host" a
               port <- decodeMaybe "port" a
               pure $ TCPSocketAction { host, port }
instance encodeTCPSocketAction :: Encode TCPSocketAction where
  encode (TCPSocketAction a) = encode $ StrMap.fromFoldable $
               [ Tuple "host" (encodeMaybe a.host)
               , Tuple "port" (encodeMaybe a.port) ]


instance defaultTCPSocketAction :: Default TCPSocketAction where
  default = TCPSocketAction
    { host: Nothing
    , port: Nothing }

-- | The node this Taint is attached to has the "effect" on any pod that does not tolerate the Taint.
-- |
-- | Fields:
-- | - `effect`: Required. The effect of the taint on pods that do not tolerate the taint. Valid effects are NoSchedule, PreferNoSchedule and NoExecute.
-- | - `key`: Required. The taint key to be applied to a node.
-- | - `timeAdded`: TimeAdded represents the time at which the taint was added. It is only written for NoExecute taints.
-- | - `value`: Required. The taint value corresponding to the taint key.
newtype Taint = Taint
  { effect :: (Maybe String)
  , key :: (Maybe String)
  , timeAdded :: (Maybe MetaV1.Time)
  , value :: (Maybe String) }

derive instance newtypeTaint :: Newtype Taint _
derive instance genericTaint :: Generic Taint _
instance showTaint :: Show Taint where show a = genericShow a
instance decodeTaint :: Decode Taint where
  decode a = do
               effect <- decodeMaybe "effect" a
               key <- decodeMaybe "key" a
               timeAdded <- decodeMaybe "timeAdded" a
               value <- decodeMaybe "value" a
               pure $ Taint { effect, key, timeAdded, value }
instance encodeTaint :: Encode Taint where
  encode (Taint a) = encode $ StrMap.fromFoldable $
               [ Tuple "effect" (encodeMaybe a.effect)
               , Tuple "key" (encodeMaybe a.key)
               , Tuple "timeAdded" (encodeMaybe a.timeAdded)
               , Tuple "value" (encodeMaybe a.value) ]


instance defaultTaint :: Default Taint where
  default = Taint
    { effect: Nothing
    , key: Nothing
    , timeAdded: Nothing
    , value: Nothing }

-- | The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>.
-- |
-- | Fields:
-- | - `effect`: Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.
-- | - `key`: Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys.
-- | - `operator`: Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category.
-- | - `tolerationSeconds`: TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system.
-- | - `value`: Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string.
newtype Toleration = Toleration
  { effect :: (Maybe String)
  , key :: (Maybe String)
  , operator :: (Maybe String)
  , tolerationSeconds :: (Maybe Int)
  , value :: (Maybe String) }

derive instance newtypeToleration :: Newtype Toleration _
derive instance genericToleration :: Generic Toleration _
instance showToleration :: Show Toleration where show a = genericShow a
instance decodeToleration :: Decode Toleration where
  decode a = do
               effect <- decodeMaybe "effect" a
               key <- decodeMaybe "key" a
               operator <- decodeMaybe "operator" a
               tolerationSeconds <- decodeMaybe "tolerationSeconds" a
               value <- decodeMaybe "value" a
               pure $ Toleration { effect, key, operator, tolerationSeconds, value }
instance encodeToleration :: Encode Toleration where
  encode (Toleration a) = encode $ StrMap.fromFoldable $
               [ Tuple "effect" (encodeMaybe a.effect)
               , Tuple "key" (encodeMaybe a.key)
               , Tuple "operator" (encodeMaybe a.operator)
               , Tuple "tolerationSeconds" (encodeMaybe a.tolerationSeconds)
               , Tuple "value" (encodeMaybe a.value) ]


instance defaultToleration :: Default Toleration where
  default = Toleration
    { effect: Nothing
    , key: Nothing
    , operator: Nothing
    , tolerationSeconds: Nothing
    , value: Nothing }

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
  { awsElasticBlockStore :: (Maybe AWSElasticBlockStoreVolumeSource)
  , azureDisk :: (Maybe AzureDiskVolumeSource)
  , azureFile :: (Maybe AzureFileVolumeSource)
  , cephfs :: (Maybe CephFSVolumeSource)
  , cinder :: (Maybe CinderVolumeSource)
  , configMap :: (Maybe ConfigMapVolumeSource)
  , downwardAPI :: (Maybe DownwardAPIVolumeSource)
  , emptyDir :: (Maybe EmptyDirVolumeSource)
  , fc :: (Maybe FCVolumeSource)
  , flexVolume :: (Maybe FlexVolumeSource)
  , flocker :: (Maybe FlockerVolumeSource)
  , gcePersistentDisk :: (Maybe GCEPersistentDiskVolumeSource)
  , gitRepo :: (Maybe GitRepoVolumeSource)
  , glusterfs :: (Maybe GlusterfsVolumeSource)
  , hostPath :: (Maybe HostPathVolumeSource)
  , iscsi :: (Maybe ISCSIVolumeSource)
  , name :: (Maybe String)
  , nfs :: (Maybe NFSVolumeSource)
  , persistentVolumeClaim :: (Maybe PersistentVolumeClaimVolumeSource)
  , photonPersistentDisk :: (Maybe PhotonPersistentDiskVolumeSource)
  , portworxVolume :: (Maybe PortworxVolumeSource)
  , projected :: (Maybe ProjectedVolumeSource)
  , quobyte :: (Maybe QuobyteVolumeSource)
  , rbd :: (Maybe RBDVolumeSource)
  , scaleIO :: (Maybe ScaleIOVolumeSource)
  , secret :: (Maybe SecretVolumeSource)
  , storageos :: (Maybe StorageOSVolumeSource)
  , vsphereVolume :: (Maybe VsphereVirtualDiskVolumeSource) }

derive instance newtypeVolume :: Newtype Volume _
derive instance genericVolume :: Generic Volume _
instance showVolume :: Show Volume where show a = genericShow a
instance decodeVolume :: Decode Volume where
  decode a = do
               awsElasticBlockStore <- decodeMaybe "awsElasticBlockStore" a
               azureDisk <- decodeMaybe "azureDisk" a
               azureFile <- decodeMaybe "azureFile" a
               cephfs <- decodeMaybe "cephfs" a
               cinder <- decodeMaybe "cinder" a
               configMap <- decodeMaybe "configMap" a
               downwardAPI <- decodeMaybe "downwardAPI" a
               emptyDir <- decodeMaybe "emptyDir" a
               fc <- decodeMaybe "fc" a
               flexVolume <- decodeMaybe "flexVolume" a
               flocker <- decodeMaybe "flocker" a
               gcePersistentDisk <- decodeMaybe "gcePersistentDisk" a
               gitRepo <- decodeMaybe "gitRepo" a
               glusterfs <- decodeMaybe "glusterfs" a
               hostPath <- decodeMaybe "hostPath" a
               iscsi <- decodeMaybe "iscsi" a
               name <- decodeMaybe "name" a
               nfs <- decodeMaybe "nfs" a
               persistentVolumeClaim <- decodeMaybe "persistentVolumeClaim" a
               photonPersistentDisk <- decodeMaybe "photonPersistentDisk" a
               portworxVolume <- decodeMaybe "portworxVolume" a
               projected <- decodeMaybe "projected" a
               quobyte <- decodeMaybe "quobyte" a
               rbd <- decodeMaybe "rbd" a
               scaleIO <- decodeMaybe "scaleIO" a
               secret <- decodeMaybe "secret" a
               storageos <- decodeMaybe "storageos" a
               vsphereVolume <- decodeMaybe "vsphereVolume" a
               pure $ Volume { awsElasticBlockStore, azureDisk, azureFile, cephfs, cinder, configMap, downwardAPI, emptyDir, fc, flexVolume, flocker, gcePersistentDisk, gitRepo, glusterfs, hostPath, iscsi, name, nfs, persistentVolumeClaim, photonPersistentDisk, portworxVolume, projected, quobyte, rbd, scaleIO, secret, storageos, vsphereVolume }
instance encodeVolume :: Encode Volume where
  encode (Volume a) = encode $ StrMap.fromFoldable $
               [ Tuple "awsElasticBlockStore" (encodeMaybe a.awsElasticBlockStore)
               , Tuple "azureDisk" (encodeMaybe a.azureDisk)
               , Tuple "azureFile" (encodeMaybe a.azureFile)
               , Tuple "cephfs" (encodeMaybe a.cephfs)
               , Tuple "cinder" (encodeMaybe a.cinder)
               , Tuple "configMap" (encodeMaybe a.configMap)
               , Tuple "downwardAPI" (encodeMaybe a.downwardAPI)
               , Tuple "emptyDir" (encodeMaybe a.emptyDir)
               , Tuple "fc" (encodeMaybe a.fc)
               , Tuple "flexVolume" (encodeMaybe a.flexVolume)
               , Tuple "flocker" (encodeMaybe a.flocker)
               , Tuple "gcePersistentDisk" (encodeMaybe a.gcePersistentDisk)
               , Tuple "gitRepo" (encodeMaybe a.gitRepo)
               , Tuple "glusterfs" (encodeMaybe a.glusterfs)
               , Tuple "hostPath" (encodeMaybe a.hostPath)
               , Tuple "iscsi" (encodeMaybe a.iscsi)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "nfs" (encodeMaybe a.nfs)
               , Tuple "persistentVolumeClaim" (encodeMaybe a.persistentVolumeClaim)
               , Tuple "photonPersistentDisk" (encodeMaybe a.photonPersistentDisk)
               , Tuple "portworxVolume" (encodeMaybe a.portworxVolume)
               , Tuple "projected" (encodeMaybe a.projected)
               , Tuple "quobyte" (encodeMaybe a.quobyte)
               , Tuple "rbd" (encodeMaybe a.rbd)
               , Tuple "scaleIO" (encodeMaybe a.scaleIO)
               , Tuple "secret" (encodeMaybe a.secret)
               , Tuple "storageos" (encodeMaybe a.storageos)
               , Tuple "vsphereVolume" (encodeMaybe a.vsphereVolume) ]


instance defaultVolume :: Default Volume where
  default = Volume
    { awsElasticBlockStore: Nothing
    , azureDisk: Nothing
    , azureFile: Nothing
    , cephfs: Nothing
    , cinder: Nothing
    , configMap: Nothing
    , downwardAPI: Nothing
    , emptyDir: Nothing
    , fc: Nothing
    , flexVolume: Nothing
    , flocker: Nothing
    , gcePersistentDisk: Nothing
    , gitRepo: Nothing
    , glusterfs: Nothing
    , hostPath: Nothing
    , iscsi: Nothing
    , name: Nothing
    , nfs: Nothing
    , persistentVolumeClaim: Nothing
    , photonPersistentDisk: Nothing
    , portworxVolume: Nothing
    , projected: Nothing
    , quobyte: Nothing
    , rbd: Nothing
    , scaleIO: Nothing
    , secret: Nothing
    , storageos: Nothing
    , vsphereVolume: Nothing }

-- | volumeDevice describes a mapping of a raw block device within a container.
-- |
-- | Fields:
-- | - `devicePath`: devicePath is the path inside of the container that the device will be mapped to.
-- | - `name`: name must match the name of a persistentVolumeClaim in the pod
newtype VolumeDevice = VolumeDevice
  { devicePath :: (Maybe String)
  , name :: (Maybe String) }

derive instance newtypeVolumeDevice :: Newtype VolumeDevice _
derive instance genericVolumeDevice :: Generic VolumeDevice _
instance showVolumeDevice :: Show VolumeDevice where show a = genericShow a
instance decodeVolumeDevice :: Decode VolumeDevice where
  decode a = do
               devicePath <- decodeMaybe "devicePath" a
               name <- decodeMaybe "name" a
               pure $ VolumeDevice { devicePath, name }
instance encodeVolumeDevice :: Encode VolumeDevice where
  encode (VolumeDevice a) = encode $ StrMap.fromFoldable $
               [ Tuple "devicePath" (encodeMaybe a.devicePath)
               , Tuple "name" (encodeMaybe a.name) ]


instance defaultVolumeDevice :: Default VolumeDevice where
  default = VolumeDevice
    { devicePath: Nothing
    , name: Nothing }

-- | VolumeMount describes a mounting of a Volume within a container.
-- |
-- | Fields:
-- | - `mountPath`: Path within the container at which the volume should be mounted.  Must not contain ':'.
-- | - `mountPropagation`: mountPropagation determines how mounts are propagated from the host to container and the other way around. When not set, MountPropagationHostToContainer is used. This field is alpha in 1.8 and can be reworked or removed in a future release.
-- | - `name`: This must match the Name of a Volume.
-- | - `readOnly`: Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.
-- | - `subPath`: Path within the volume from which the container's volume should be mounted. Defaults to "" (volume's root).
newtype VolumeMount = VolumeMount
  { mountPath :: (Maybe String)
  , mountPropagation :: (Maybe String)
  , name :: (Maybe String)
  , readOnly :: (Maybe Boolean)
  , subPath :: (Maybe String) }

derive instance newtypeVolumeMount :: Newtype VolumeMount _
derive instance genericVolumeMount :: Generic VolumeMount _
instance showVolumeMount :: Show VolumeMount where show a = genericShow a
instance decodeVolumeMount :: Decode VolumeMount where
  decode a = do
               mountPath <- decodeMaybe "mountPath" a
               mountPropagation <- decodeMaybe "mountPropagation" a
               name <- decodeMaybe "name" a
               readOnly <- decodeMaybe "readOnly" a
               subPath <- decodeMaybe "subPath" a
               pure $ VolumeMount { mountPath, mountPropagation, name, readOnly, subPath }
instance encodeVolumeMount :: Encode VolumeMount where
  encode (VolumeMount a) = encode $ StrMap.fromFoldable $
               [ Tuple "mountPath" (encodeMaybe a.mountPath)
               , Tuple "mountPropagation" (encodeMaybe a.mountPropagation)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "readOnly" (encodeMaybe a.readOnly)
               , Tuple "subPath" (encodeMaybe a.subPath) ]


instance defaultVolumeMount :: Default VolumeMount where
  default = VolumeMount
    { mountPath: Nothing
    , mountPropagation: Nothing
    , name: Nothing
    , readOnly: Nothing
    , subPath: Nothing }

-- | Projection that may be projected along with other supported volume types
-- |
-- | Fields:
-- | - `configMap`: information about the configMap data to project
-- | - `downwardAPI`: information about the downwardAPI data to project
-- | - `secret`: information about the secret data to project
newtype VolumeProjection = VolumeProjection
  { configMap :: (Maybe ConfigMapProjection)
  , downwardAPI :: (Maybe DownwardAPIProjection)
  , secret :: (Maybe SecretProjection) }

derive instance newtypeVolumeProjection :: Newtype VolumeProjection _
derive instance genericVolumeProjection :: Generic VolumeProjection _
instance showVolumeProjection :: Show VolumeProjection where show a = genericShow a
instance decodeVolumeProjection :: Decode VolumeProjection where
  decode a = do
               configMap <- decodeMaybe "configMap" a
               downwardAPI <- decodeMaybe "downwardAPI" a
               secret <- decodeMaybe "secret" a
               pure $ VolumeProjection { configMap, downwardAPI, secret }
instance encodeVolumeProjection :: Encode VolumeProjection where
  encode (VolumeProjection a) = encode $ StrMap.fromFoldable $
               [ Tuple "configMap" (encodeMaybe a.configMap)
               , Tuple "downwardAPI" (encodeMaybe a.downwardAPI)
               , Tuple "secret" (encodeMaybe a.secret) ]


instance defaultVolumeProjection :: Default VolumeProjection where
  default = VolumeProjection
    { configMap: Nothing
    , downwardAPI: Nothing
    , secret: Nothing }

-- | Represents a vSphere volume resource.
-- |
-- | Fields:
-- | - `fsType`: Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
-- | - `storagePolicyID`: Storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName.
-- | - `storagePolicyName`: Storage Policy Based Management (SPBM) profile name.
-- | - `volumePath`: Path that identifies vSphere volume vmdk
newtype VsphereVirtualDiskVolumeSource = VsphereVirtualDiskVolumeSource
  { fsType :: (Maybe String)
  , storagePolicyID :: (Maybe String)
  , storagePolicyName :: (Maybe String)
  , volumePath :: (Maybe String) }

derive instance newtypeVsphereVirtualDiskVolumeSource :: Newtype VsphereVirtualDiskVolumeSource _
derive instance genericVsphereVirtualDiskVolumeSource :: Generic VsphereVirtualDiskVolumeSource _
instance showVsphereVirtualDiskVolumeSource :: Show VsphereVirtualDiskVolumeSource where show a = genericShow a
instance decodeVsphereVirtualDiskVolumeSource :: Decode VsphereVirtualDiskVolumeSource where
  decode a = do
               fsType <- decodeMaybe "fsType" a
               storagePolicyID <- decodeMaybe "storagePolicyID" a
               storagePolicyName <- decodeMaybe "storagePolicyName" a
               volumePath <- decodeMaybe "volumePath" a
               pure $ VsphereVirtualDiskVolumeSource { fsType, storagePolicyID, storagePolicyName, volumePath }
instance encodeVsphereVirtualDiskVolumeSource :: Encode VsphereVirtualDiskVolumeSource where
  encode (VsphereVirtualDiskVolumeSource a) = encode $ StrMap.fromFoldable $
               [ Tuple "fsType" (encodeMaybe a.fsType)
               , Tuple "storagePolicyID" (encodeMaybe a.storagePolicyID)
               , Tuple "storagePolicyName" (encodeMaybe a.storagePolicyName)
               , Tuple "volumePath" (encodeMaybe a.volumePath) ]


instance defaultVsphereVirtualDiskVolumeSource :: Default VsphereVirtualDiskVolumeSource where
  default = VsphereVirtualDiskVolumeSource
    { fsType: Nothing
    , storagePolicyID: Nothing
    , storagePolicyName: Nothing
    , volumePath: Nothing }

-- | The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)
-- |
-- | Fields:
-- | - `podAffinityTerm`: Required. A pod affinity term, associated with the corresponding weight.
-- | - `weight`: weight associated with matching the corresponding podAffinityTerm, in the range 1-100.
newtype WeightedPodAffinityTerm = WeightedPodAffinityTerm
  { podAffinityTerm :: (Maybe PodAffinityTerm)
  , weight :: (Maybe Int) }

derive instance newtypeWeightedPodAffinityTerm :: Newtype WeightedPodAffinityTerm _
derive instance genericWeightedPodAffinityTerm :: Generic WeightedPodAffinityTerm _
instance showWeightedPodAffinityTerm :: Show WeightedPodAffinityTerm where show a = genericShow a
instance decodeWeightedPodAffinityTerm :: Decode WeightedPodAffinityTerm where
  decode a = do
               podAffinityTerm <- decodeMaybe "podAffinityTerm" a
               weight <- decodeMaybe "weight" a
               pure $ WeightedPodAffinityTerm { podAffinityTerm, weight }
instance encodeWeightedPodAffinityTerm :: Encode WeightedPodAffinityTerm where
  encode (WeightedPodAffinityTerm a) = encode $ StrMap.fromFoldable $
               [ Tuple "podAffinityTerm" (encodeMaybe a.podAffinityTerm)
               , Tuple "weight" (encodeMaybe a.weight) ]


instance defaultWeightedPodAffinityTerm :: Default WeightedPodAffinityTerm where
  default = WeightedPodAffinityTerm
    { podAffinityTerm: Nothing
    , weight: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/"