module Kubernetes.Api.CoreV1 where

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
import Kubernetes.Api.Resource as Resource
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | io.k8s.api.core.v1.AWSElasticBlockStoreVolumeSource
-- | Represents a Persistent Disk resource in AWS.
-- | 
-- | An AWS EBS disk must exist before mounting to a container. The disk must also be in the same AWS zone as the kubelet. An AWS EBS disk can only be mounted as read/write once. AWS EBS volumes support ownership management and SELinux relabeling.
newtype AWSElasticBlockStoreVolumeSource = AWSElasticBlockStoreVolumeSource
  { fsType :: (NullOrUndefined String)
  , partition :: (NullOrUndefined Int)
  , readOnly :: (NullOrUndefined Boolean)
  , volumeID :: (NullOrUndefined String) }

derive instance newtypeAWSElasticBlockStoreVolumeSource :: Newtype AWSElasticBlockStoreVolumeSource _
derive instance genericAWSElasticBlockStoreVolumeSource :: Generic AWSElasticBlockStoreVolumeSource _
instance showAWSElasticBlockStoreVolumeSource :: Show AWSElasticBlockStoreVolumeSource where show a = genericShow a
instance decodeAWSElasticBlockStoreVolumeSource :: Decode AWSElasticBlockStoreVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeAWSElasticBlockStoreVolumeSource :: Encode AWSElasticBlockStoreVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultAWSElasticBlockStoreVolumeSource :: Default AWSElasticBlockStoreVolumeSource where
  default = AWSElasticBlockStoreVolumeSource
    { fsType: NullOrUndefined Nothing
    , partition: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , volumeID: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Affinity
-- | Affinity is a group of affinity scheduling rules.
newtype Affinity = Affinity
  { nodeAffinity :: (NullOrUndefined NodeAffinity)
  , podAffinity :: (NullOrUndefined PodAffinity)
  , podAntiAffinity :: (NullOrUndefined PodAntiAffinity) }

derive instance newtypeAffinity :: Newtype Affinity _
derive instance genericAffinity :: Generic Affinity _
instance showAffinity :: Show Affinity where show a = genericShow a
instance decodeAffinity :: Decode Affinity where
  decode a = genericDecode jsonOptions a 
instance encodeAffinity :: Encode Affinity where
  encode a = genericEncode jsonOptions a

instance defaultAffinity :: Default Affinity where
  default = Affinity
    { nodeAffinity: NullOrUndefined Nothing
    , podAffinity: NullOrUndefined Nothing
    , podAntiAffinity: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.AttachedVolume
-- | AttachedVolume describes a volume attached to a node
newtype AttachedVolume = AttachedVolume
  { devicePath :: (NullOrUndefined String)
  , name :: (NullOrUndefined String) }

derive instance newtypeAttachedVolume :: Newtype AttachedVolume _
derive instance genericAttachedVolume :: Generic AttachedVolume _
instance showAttachedVolume :: Show AttachedVolume where show a = genericShow a
instance decodeAttachedVolume :: Decode AttachedVolume where
  decode a = genericDecode jsonOptions a 
instance encodeAttachedVolume :: Encode AttachedVolume where
  encode a = genericEncode jsonOptions a

instance defaultAttachedVolume :: Default AttachedVolume where
  default = AttachedVolume
    { devicePath: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.AzureDiskVolumeSource
-- | AzureDisk represents an Azure Data Disk mount on the host and bind mount to the pod.
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
  decode a = genericDecode jsonOptions a 
instance encodeAzureDiskVolumeSource :: Encode AzureDiskVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultAzureDiskVolumeSource :: Default AzureDiskVolumeSource where
  default = AzureDiskVolumeSource
    { cachingMode: NullOrUndefined Nothing
    , diskName: NullOrUndefined Nothing
    , diskURI: NullOrUndefined Nothing
    , fsType: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.AzureFilePersistentVolumeSource
-- | AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
newtype AzureFilePersistentVolumeSource = AzureFilePersistentVolumeSource
  { readOnly :: (NullOrUndefined Boolean)
  , secretName :: (NullOrUndefined String)
  , secretNamespace :: (NullOrUndefined String)
  , shareName :: (NullOrUndefined String) }

derive instance newtypeAzureFilePersistentVolumeSource :: Newtype AzureFilePersistentVolumeSource _
derive instance genericAzureFilePersistentVolumeSource :: Generic AzureFilePersistentVolumeSource _
instance showAzureFilePersistentVolumeSource :: Show AzureFilePersistentVolumeSource where show a = genericShow a
instance decodeAzureFilePersistentVolumeSource :: Decode AzureFilePersistentVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeAzureFilePersistentVolumeSource :: Encode AzureFilePersistentVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultAzureFilePersistentVolumeSource :: Default AzureFilePersistentVolumeSource where
  default = AzureFilePersistentVolumeSource
    { readOnly: NullOrUndefined Nothing
    , secretName: NullOrUndefined Nothing
    , secretNamespace: NullOrUndefined Nothing
    , shareName: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.AzureFileVolumeSource
-- | AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
newtype AzureFileVolumeSource = AzureFileVolumeSource
  { readOnly :: (NullOrUndefined Boolean)
  , secretName :: (NullOrUndefined String)
  , shareName :: (NullOrUndefined String) }

derive instance newtypeAzureFileVolumeSource :: Newtype AzureFileVolumeSource _
derive instance genericAzureFileVolumeSource :: Generic AzureFileVolumeSource _
instance showAzureFileVolumeSource :: Show AzureFileVolumeSource where show a = genericShow a
instance decodeAzureFileVolumeSource :: Decode AzureFileVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeAzureFileVolumeSource :: Encode AzureFileVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultAzureFileVolumeSource :: Default AzureFileVolumeSource where
  default = AzureFileVolumeSource
    { readOnly: NullOrUndefined Nothing
    , secretName: NullOrUndefined Nothing
    , shareName: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Binding
-- | Binding ties one object to another; for example, a pod is bound to a node by a scheduler. Deprecated in 1.7, please use the bindings subresource of pods instead.
newtype Binding = Binding
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , target :: (NullOrUndefined ObjectReference) }

derive instance newtypeBinding :: Newtype Binding _
derive instance genericBinding :: Generic Binding _
instance showBinding :: Show Binding where show a = genericShow a
instance decodeBinding :: Decode Binding where
  decode a = genericDecode jsonOptions a 
instance encodeBinding :: Encode Binding where
  encode a = genericEncode jsonOptions a

instance defaultBinding :: Default Binding where
  default = Binding
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , target: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.CSIPersistentVolumeSource
-- | Represents storage that is managed by an external CSI volume driver
newtype CSIPersistentVolumeSource = CSIPersistentVolumeSource
  { driver :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , volumeHandle :: (NullOrUndefined String) }

derive instance newtypeCSIPersistentVolumeSource :: Newtype CSIPersistentVolumeSource _
derive instance genericCSIPersistentVolumeSource :: Generic CSIPersistentVolumeSource _
instance showCSIPersistentVolumeSource :: Show CSIPersistentVolumeSource where show a = genericShow a
instance decodeCSIPersistentVolumeSource :: Decode CSIPersistentVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeCSIPersistentVolumeSource :: Encode CSIPersistentVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultCSIPersistentVolumeSource :: Default CSIPersistentVolumeSource where
  default = CSIPersistentVolumeSource
    { driver: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , volumeHandle: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Capabilities
-- | Adds and removes POSIX capabilities from running containers.
newtype Capabilities = Capabilities
  { add :: (NullOrUndefined (Array String))
  , drop :: (NullOrUndefined (Array String)) }

derive instance newtypeCapabilities :: Newtype Capabilities _
derive instance genericCapabilities :: Generic Capabilities _
instance showCapabilities :: Show Capabilities where show a = genericShow a
instance decodeCapabilities :: Decode Capabilities where
  decode a = genericDecode jsonOptions a 
instance encodeCapabilities :: Encode Capabilities where
  encode a = genericEncode jsonOptions a

instance defaultCapabilities :: Default Capabilities where
  default = Capabilities
    { add: NullOrUndefined Nothing
    , drop: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.CephFSPersistentVolumeSource
-- | Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling.
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
  decode a = genericDecode jsonOptions a 
instance encodeCephFSPersistentVolumeSource :: Encode CephFSPersistentVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultCephFSPersistentVolumeSource :: Default CephFSPersistentVolumeSource where
  default = CephFSPersistentVolumeSource
    { monitors: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretFile: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.CephFSVolumeSource
-- | Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling.
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
  decode a = genericDecode jsonOptions a 
instance encodeCephFSVolumeSource :: Encode CephFSVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultCephFSVolumeSource :: Default CephFSVolumeSource where
  default = CephFSVolumeSource
    { monitors: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretFile: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.CinderVolumeSource
-- | Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling.
newtype CinderVolumeSource = CinderVolumeSource
  { fsType :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , volumeID :: (NullOrUndefined String) }

derive instance newtypeCinderVolumeSource :: Newtype CinderVolumeSource _
derive instance genericCinderVolumeSource :: Generic CinderVolumeSource _
instance showCinderVolumeSource :: Show CinderVolumeSource where show a = genericShow a
instance decodeCinderVolumeSource :: Decode CinderVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeCinderVolumeSource :: Encode CinderVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultCinderVolumeSource :: Default CinderVolumeSource where
  default = CinderVolumeSource
    { fsType: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , volumeID: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ClientIPConfig
-- | ClientIPConfig represents the configurations of Client IP based session affinity.
newtype ClientIPConfig = ClientIPConfig
  { timeoutSeconds :: (NullOrUndefined Int) }

derive instance newtypeClientIPConfig :: Newtype ClientIPConfig _
derive instance genericClientIPConfig :: Generic ClientIPConfig _
instance showClientIPConfig :: Show ClientIPConfig where show a = genericShow a
instance decodeClientIPConfig :: Decode ClientIPConfig where
  decode a = genericDecode jsonOptions a 
instance encodeClientIPConfig :: Encode ClientIPConfig where
  encode a = genericEncode jsonOptions a

instance defaultClientIPConfig :: Default ClientIPConfig where
  default = ClientIPConfig
    { timeoutSeconds: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ComponentCondition
-- | Information about the condition of a component.
newtype ComponentCondition = ComponentCondition
  { _type :: (NullOrUndefined String)
  , error :: (NullOrUndefined String)
  , message :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeComponentCondition :: Newtype ComponentCondition _
derive instance genericComponentCondition :: Generic ComponentCondition _
instance showComponentCondition :: Show ComponentCondition where show a = genericShow a
instance decodeComponentCondition :: Decode ComponentCondition where
  decode a = genericDecode jsonOptions a 
instance encodeComponentCondition :: Encode ComponentCondition where
  encode a = genericEncode jsonOptions a

instance defaultComponentCondition :: Default ComponentCondition where
  default = ComponentCondition
    { _type: NullOrUndefined Nothing
    , error: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ComponentStatus
-- | ComponentStatus (and ComponentStatusList) holds the cluster validation info.
newtype ComponentStatus = ComponentStatus
  { apiVersion :: (NullOrUndefined String)
  , conditions :: (NullOrUndefined (Array ComponentCondition))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta) }

derive instance newtypeComponentStatus :: Newtype ComponentStatus _
derive instance genericComponentStatus :: Generic ComponentStatus _
instance showComponentStatus :: Show ComponentStatus where show a = genericShow a
instance decodeComponentStatus :: Decode ComponentStatus where
  decode a = genericDecode jsonOptions a 
instance encodeComponentStatus :: Encode ComponentStatus where
  encode a = genericEncode jsonOptions a

instance defaultComponentStatus :: Default ComponentStatus where
  default = ComponentStatus
    { apiVersion: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ComponentStatusList
-- | Status of all the conditions for the component as a list of ComponentStatus objects.
newtype ComponentStatusList = ComponentStatusList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ComponentStatus))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeComponentStatusList :: Newtype ComponentStatusList _
derive instance genericComponentStatusList :: Generic ComponentStatusList _
instance showComponentStatusList :: Show ComponentStatusList where show a = genericShow a
instance decodeComponentStatusList :: Decode ComponentStatusList where
  decode a = genericDecode jsonOptions a 
instance encodeComponentStatusList :: Encode ComponentStatusList where
  encode a = genericEncode jsonOptions a

instance defaultComponentStatusList :: Default ComponentStatusList where
  default = ComponentStatusList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ConfigMap
-- | ConfigMap holds configuration data for pods to consume.
newtype ConfigMap = ConfigMap
  { _data :: (NullOrUndefined (StrMap String))
  , apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta) }

derive instance newtypeConfigMap :: Newtype ConfigMap _
derive instance genericConfigMap :: Generic ConfigMap _
instance showConfigMap :: Show ConfigMap where show a = genericShow a
instance decodeConfigMap :: Decode ConfigMap where
  decode a = genericDecode jsonOptions a 
instance encodeConfigMap :: Encode ConfigMap where
  encode a = genericEncode jsonOptions a

instance defaultConfigMap :: Default ConfigMap where
  default = ConfigMap
    { _data: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ConfigMapEnvSource
-- | ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.
-- | 
-- | The contents of the target ConfigMap's Data field will represent the key-value pairs as environment variables.
newtype ConfigMapEnvSource = ConfigMapEnvSource
  { name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeConfigMapEnvSource :: Newtype ConfigMapEnvSource _
derive instance genericConfigMapEnvSource :: Generic ConfigMapEnvSource _
instance showConfigMapEnvSource :: Show ConfigMapEnvSource where show a = genericShow a
instance decodeConfigMapEnvSource :: Decode ConfigMapEnvSource where
  decode a = genericDecode jsonOptions a 
instance encodeConfigMapEnvSource :: Encode ConfigMapEnvSource where
  encode a = genericEncode jsonOptions a

instance defaultConfigMapEnvSource :: Default ConfigMapEnvSource where
  default = ConfigMapEnvSource
    { name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ConfigMapKeySelector
-- | Selects a key from a ConfigMap.
newtype ConfigMapKeySelector = ConfigMapKeySelector
  { key :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeConfigMapKeySelector :: Newtype ConfigMapKeySelector _
derive instance genericConfigMapKeySelector :: Generic ConfigMapKeySelector _
instance showConfigMapKeySelector :: Show ConfigMapKeySelector where show a = genericShow a
instance decodeConfigMapKeySelector :: Decode ConfigMapKeySelector where
  decode a = genericDecode jsonOptions a 
instance encodeConfigMapKeySelector :: Encode ConfigMapKeySelector where
  encode a = genericEncode jsonOptions a

instance defaultConfigMapKeySelector :: Default ConfigMapKeySelector where
  default = ConfigMapKeySelector
    { key: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ConfigMapList
-- | ConfigMapList is a resource containing a list of ConfigMap objects.
newtype ConfigMapList = ConfigMapList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ConfigMap))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeConfigMapList :: Newtype ConfigMapList _
derive instance genericConfigMapList :: Generic ConfigMapList _
instance showConfigMapList :: Show ConfigMapList where show a = genericShow a
instance decodeConfigMapList :: Decode ConfigMapList where
  decode a = genericDecode jsonOptions a 
instance encodeConfigMapList :: Encode ConfigMapList where
  encode a = genericEncode jsonOptions a

instance defaultConfigMapList :: Default ConfigMapList where
  default = ConfigMapList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ConfigMapProjection
-- | Adapts a ConfigMap into a projected volume.
-- | 
-- | The contents of the target ConfigMap's Data field will be presented in a projected volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. Note that this is identical to a configmap volume source without the default mode.
newtype ConfigMapProjection = ConfigMapProjection
  { items :: (NullOrUndefined (Array KeyToPath))
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeConfigMapProjection :: Newtype ConfigMapProjection _
derive instance genericConfigMapProjection :: Generic ConfigMapProjection _
instance showConfigMapProjection :: Show ConfigMapProjection where show a = genericShow a
instance decodeConfigMapProjection :: Decode ConfigMapProjection where
  decode a = genericDecode jsonOptions a 
instance encodeConfigMapProjection :: Encode ConfigMapProjection where
  encode a = genericEncode jsonOptions a

instance defaultConfigMapProjection :: Default ConfigMapProjection where
  default = ConfigMapProjection
    { items: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ConfigMapVolumeSource
-- | Adapts a ConfigMap into a volume.
-- | 
-- | The contents of the target ConfigMap's Data field will be presented in a volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. ConfigMap volumes support ownership management and SELinux relabeling.
newtype ConfigMapVolumeSource = ConfigMapVolumeSource
  { defaultMode :: (NullOrUndefined Int)
  , items :: (NullOrUndefined (Array KeyToPath))
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeConfigMapVolumeSource :: Newtype ConfigMapVolumeSource _
derive instance genericConfigMapVolumeSource :: Generic ConfigMapVolumeSource _
instance showConfigMapVolumeSource :: Show ConfigMapVolumeSource where show a = genericShow a
instance decodeConfigMapVolumeSource :: Decode ConfigMapVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeConfigMapVolumeSource :: Encode ConfigMapVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultConfigMapVolumeSource :: Default ConfigMapVolumeSource where
  default = ConfigMapVolumeSource
    { defaultMode: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Container
-- | A single application container that you want to run within a pod.
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
  decode a = genericDecode jsonOptions a 
instance encodeContainer :: Encode Container where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.ContainerImage
-- | Describe a container image
newtype ContainerImage = ContainerImage
  { names :: (NullOrUndefined (Array String))
  , sizeBytes :: (NullOrUndefined Int) }

derive instance newtypeContainerImage :: Newtype ContainerImage _
derive instance genericContainerImage :: Generic ContainerImage _
instance showContainerImage :: Show ContainerImage where show a = genericShow a
instance decodeContainerImage :: Decode ContainerImage where
  decode a = genericDecode jsonOptions a 
instance encodeContainerImage :: Encode ContainerImage where
  encode a = genericEncode jsonOptions a

instance defaultContainerImage :: Default ContainerImage where
  default = ContainerImage
    { names: NullOrUndefined Nothing
    , sizeBytes: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ContainerPort
-- | ContainerPort represents a network port in a single container.
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
  decode a = genericDecode jsonOptions a 
instance encodeContainerPort :: Encode ContainerPort where
  encode a = genericEncode jsonOptions a

instance defaultContainerPort :: Default ContainerPort where
  default = ContainerPort
    { containerPort: NullOrUndefined Nothing
    , hostIP: NullOrUndefined Nothing
    , hostPort: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , protocol: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ContainerState
-- | ContainerState holds a possible state of container. Only one of its members may be specified. If none of them is specified, the default one is ContainerStateWaiting.
newtype ContainerState = ContainerState
  { running :: (NullOrUndefined ContainerStateRunning)
  , terminated :: (NullOrUndefined ContainerStateTerminated)
  , waiting :: (NullOrUndefined ContainerStateWaiting) }

derive instance newtypeContainerState :: Newtype ContainerState _
derive instance genericContainerState :: Generic ContainerState _
instance showContainerState :: Show ContainerState where show a = genericShow a
instance decodeContainerState :: Decode ContainerState where
  decode a = genericDecode jsonOptions a 
instance encodeContainerState :: Encode ContainerState where
  encode a = genericEncode jsonOptions a

instance defaultContainerState :: Default ContainerState where
  default = ContainerState
    { running: NullOrUndefined Nothing
    , terminated: NullOrUndefined Nothing
    , waiting: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ContainerStateRunning
-- | ContainerStateRunning is a running state of a container.
newtype ContainerStateRunning = ContainerStateRunning
  { startedAt :: (NullOrUndefined MetaV1.Time) }

derive instance newtypeContainerStateRunning :: Newtype ContainerStateRunning _
derive instance genericContainerStateRunning :: Generic ContainerStateRunning _
instance showContainerStateRunning :: Show ContainerStateRunning where show a = genericShow a
instance decodeContainerStateRunning :: Decode ContainerStateRunning where
  decode a = genericDecode jsonOptions a 
instance encodeContainerStateRunning :: Encode ContainerStateRunning where
  encode a = genericEncode jsonOptions a

instance defaultContainerStateRunning :: Default ContainerStateRunning where
  default = ContainerStateRunning
    { startedAt: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ContainerStateTerminated
-- | ContainerStateTerminated is a terminated state of a container.
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
  decode a = genericDecode jsonOptions a 
instance encodeContainerStateTerminated :: Encode ContainerStateTerminated where
  encode a = genericEncode jsonOptions a

instance defaultContainerStateTerminated :: Default ContainerStateTerminated where
  default = ContainerStateTerminated
    { containerID: NullOrUndefined Nothing
    , exitCode: NullOrUndefined Nothing
    , finishedAt: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , signal: NullOrUndefined Nothing
    , startedAt: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ContainerStateWaiting
-- | ContainerStateWaiting is a waiting state of a container.
newtype ContainerStateWaiting = ContainerStateWaiting
  { message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String) }

derive instance newtypeContainerStateWaiting :: Newtype ContainerStateWaiting _
derive instance genericContainerStateWaiting :: Generic ContainerStateWaiting _
instance showContainerStateWaiting :: Show ContainerStateWaiting where show a = genericShow a
instance decodeContainerStateWaiting :: Decode ContainerStateWaiting where
  decode a = genericDecode jsonOptions a 
instance encodeContainerStateWaiting :: Encode ContainerStateWaiting where
  encode a = genericEncode jsonOptions a

instance defaultContainerStateWaiting :: Default ContainerStateWaiting where
  default = ContainerStateWaiting
    { message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ContainerStatus
-- | ContainerStatus contains details for the current status of this container.
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
  decode a = genericDecode jsonOptions a 
instance encodeContainerStatus :: Encode ContainerStatus where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.DaemonEndpoint
-- | DaemonEndpoint contains information about a single Daemon endpoint.
newtype DaemonEndpoint = DaemonEndpoint
  { _Port :: (NullOrUndefined Int) }

derive instance newtypeDaemonEndpoint :: Newtype DaemonEndpoint _
derive instance genericDaemonEndpoint :: Generic DaemonEndpoint _
instance showDaemonEndpoint :: Show DaemonEndpoint where show a = genericShow a
instance decodeDaemonEndpoint :: Decode DaemonEndpoint where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonEndpoint :: Encode DaemonEndpoint where
  encode a = genericEncode jsonOptions a

instance defaultDaemonEndpoint :: Default DaemonEndpoint where
  default = DaemonEndpoint
    { _Port: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.DownwardAPIProjection
-- | Represents downward API info for projecting into a projected volume. Note that this is identical to a downwardAPI volume source without the default mode.
newtype DownwardAPIProjection = DownwardAPIProjection
  { items :: (NullOrUndefined (Array DownwardAPIVolumeFile)) }

derive instance newtypeDownwardAPIProjection :: Newtype DownwardAPIProjection _
derive instance genericDownwardAPIProjection :: Generic DownwardAPIProjection _
instance showDownwardAPIProjection :: Show DownwardAPIProjection where show a = genericShow a
instance decodeDownwardAPIProjection :: Decode DownwardAPIProjection where
  decode a = genericDecode jsonOptions a 
instance encodeDownwardAPIProjection :: Encode DownwardAPIProjection where
  encode a = genericEncode jsonOptions a

instance defaultDownwardAPIProjection :: Default DownwardAPIProjection where
  default = DownwardAPIProjection
    { items: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.DownwardAPIVolumeFile
-- | DownwardAPIVolumeFile represents information to create the file containing the pod field
newtype DownwardAPIVolumeFile = DownwardAPIVolumeFile
  { fieldRef :: (NullOrUndefined ObjectFieldSelector)
  , mode :: (NullOrUndefined Int)
  , path :: (NullOrUndefined String)
  , resourceFieldRef :: (NullOrUndefined ResourceFieldSelector) }

derive instance newtypeDownwardAPIVolumeFile :: Newtype DownwardAPIVolumeFile _
derive instance genericDownwardAPIVolumeFile :: Generic DownwardAPIVolumeFile _
instance showDownwardAPIVolumeFile :: Show DownwardAPIVolumeFile where show a = genericShow a
instance decodeDownwardAPIVolumeFile :: Decode DownwardAPIVolumeFile where
  decode a = genericDecode jsonOptions a 
instance encodeDownwardAPIVolumeFile :: Encode DownwardAPIVolumeFile where
  encode a = genericEncode jsonOptions a

instance defaultDownwardAPIVolumeFile :: Default DownwardAPIVolumeFile where
  default = DownwardAPIVolumeFile
    { fieldRef: NullOrUndefined Nothing
    , mode: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , resourceFieldRef: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.DownwardAPIVolumeSource
-- | DownwardAPIVolumeSource represents a volume containing downward API info. Downward API volumes support ownership management and SELinux relabeling.
newtype DownwardAPIVolumeSource = DownwardAPIVolumeSource
  { defaultMode :: (NullOrUndefined Int)
  , items :: (NullOrUndefined (Array DownwardAPIVolumeFile)) }

derive instance newtypeDownwardAPIVolumeSource :: Newtype DownwardAPIVolumeSource _
derive instance genericDownwardAPIVolumeSource :: Generic DownwardAPIVolumeSource _
instance showDownwardAPIVolumeSource :: Show DownwardAPIVolumeSource where show a = genericShow a
instance decodeDownwardAPIVolumeSource :: Decode DownwardAPIVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeDownwardAPIVolumeSource :: Encode DownwardAPIVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultDownwardAPIVolumeSource :: Default DownwardAPIVolumeSource where
  default = DownwardAPIVolumeSource
    { defaultMode: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EmptyDirVolumeSource
-- | Represents an empty directory for a pod. Empty directory volumes support ownership management and SELinux relabeling.
newtype EmptyDirVolumeSource = EmptyDirVolumeSource
  { medium :: (NullOrUndefined String)
  , sizeLimit :: (NullOrUndefined Resource.Quantity) }

derive instance newtypeEmptyDirVolumeSource :: Newtype EmptyDirVolumeSource _
derive instance genericEmptyDirVolumeSource :: Generic EmptyDirVolumeSource _
instance showEmptyDirVolumeSource :: Show EmptyDirVolumeSource where show a = genericShow a
instance decodeEmptyDirVolumeSource :: Decode EmptyDirVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeEmptyDirVolumeSource :: Encode EmptyDirVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultEmptyDirVolumeSource :: Default EmptyDirVolumeSource where
  default = EmptyDirVolumeSource
    { medium: NullOrUndefined Nothing
    , sizeLimit: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EndpointAddress
-- | EndpointAddress is a tuple that describes single IP address.
newtype EndpointAddress = EndpointAddress
  { hostname :: (NullOrUndefined String)
  , ip :: (NullOrUndefined String)
  , nodeName :: (NullOrUndefined String)
  , targetRef :: (NullOrUndefined ObjectReference) }

derive instance newtypeEndpointAddress :: Newtype EndpointAddress _
derive instance genericEndpointAddress :: Generic EndpointAddress _
instance showEndpointAddress :: Show EndpointAddress where show a = genericShow a
instance decodeEndpointAddress :: Decode EndpointAddress where
  decode a = genericDecode jsonOptions a 
instance encodeEndpointAddress :: Encode EndpointAddress where
  encode a = genericEncode jsonOptions a

instance defaultEndpointAddress :: Default EndpointAddress where
  default = EndpointAddress
    { hostname: NullOrUndefined Nothing
    , ip: NullOrUndefined Nothing
    , nodeName: NullOrUndefined Nothing
    , targetRef: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EndpointPort
-- | EndpointPort is a tuple that describes a single port.
newtype EndpointPort = EndpointPort
  { name :: (NullOrUndefined String)
  , port :: (NullOrUndefined Int)
  , protocol :: (NullOrUndefined String) }

derive instance newtypeEndpointPort :: Newtype EndpointPort _
derive instance genericEndpointPort :: Generic EndpointPort _
instance showEndpointPort :: Show EndpointPort where show a = genericShow a
instance decodeEndpointPort :: Decode EndpointPort where
  decode a = genericDecode jsonOptions a 
instance encodeEndpointPort :: Encode EndpointPort where
  encode a = genericEncode jsonOptions a

instance defaultEndpointPort :: Default EndpointPort where
  default = EndpointPort
    { name: NullOrUndefined Nothing
    , port: NullOrUndefined Nothing
    , protocol: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EndpointSubset
-- | EndpointSubset is a group of addresses with a common set of ports. The expanded set of endpoints is the Cartesian product of Addresses x Ports. For example, given:
-- |   {
-- |     Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
-- |     Ports:     [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
-- |   }
-- | The resulting set of endpoints can be viewed as:
-- |     a: [ 10.10.1.1:8675, 10.10.2.2:8675 ],
-- |     b: [ 10.10.1.1:309, 10.10.2.2:309 ]
newtype EndpointSubset = EndpointSubset
  { addresses :: (NullOrUndefined (Array EndpointAddress))
  , notReadyAddresses :: (NullOrUndefined (Array EndpointAddress))
  , ports :: (NullOrUndefined (Array EndpointPort)) }

derive instance newtypeEndpointSubset :: Newtype EndpointSubset _
derive instance genericEndpointSubset :: Generic EndpointSubset _
instance showEndpointSubset :: Show EndpointSubset where show a = genericShow a
instance decodeEndpointSubset :: Decode EndpointSubset where
  decode a = genericDecode jsonOptions a 
instance encodeEndpointSubset :: Encode EndpointSubset where
  encode a = genericEncode jsonOptions a

instance defaultEndpointSubset :: Default EndpointSubset where
  default = EndpointSubset
    { addresses: NullOrUndefined Nothing
    , notReadyAddresses: NullOrUndefined Nothing
    , ports: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Endpoints
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
newtype Endpoints = Endpoints
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , subsets :: (NullOrUndefined (Array EndpointSubset)) }

derive instance newtypeEndpoints :: Newtype Endpoints _
derive instance genericEndpoints :: Generic Endpoints _
instance showEndpoints :: Show Endpoints where show a = genericShow a
instance decodeEndpoints :: Decode Endpoints where
  decode a = genericDecode jsonOptions a 
instance encodeEndpoints :: Encode Endpoints where
  encode a = genericEncode jsonOptions a

instance defaultEndpoints :: Default Endpoints where
  default = Endpoints
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , subsets: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EndpointsList
-- | EndpointsList is a list of endpoints.
newtype EndpointsList = EndpointsList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Endpoints))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeEndpointsList :: Newtype EndpointsList _
derive instance genericEndpointsList :: Generic EndpointsList _
instance showEndpointsList :: Show EndpointsList where show a = genericShow a
instance decodeEndpointsList :: Decode EndpointsList where
  decode a = genericDecode jsonOptions a 
instance encodeEndpointsList :: Encode EndpointsList where
  encode a = genericEncode jsonOptions a

instance defaultEndpointsList :: Default EndpointsList where
  default = EndpointsList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EnvFromSource
-- | EnvFromSource represents the source of a set of ConfigMaps
newtype EnvFromSource = EnvFromSource
  { configMapRef :: (NullOrUndefined ConfigMapEnvSource)
  , prefix :: (NullOrUndefined String)
  , secretRef :: (NullOrUndefined SecretEnvSource) }

derive instance newtypeEnvFromSource :: Newtype EnvFromSource _
derive instance genericEnvFromSource :: Generic EnvFromSource _
instance showEnvFromSource :: Show EnvFromSource where show a = genericShow a
instance decodeEnvFromSource :: Decode EnvFromSource where
  decode a = genericDecode jsonOptions a 
instance encodeEnvFromSource :: Encode EnvFromSource where
  encode a = genericEncode jsonOptions a

instance defaultEnvFromSource :: Default EnvFromSource where
  default = EnvFromSource
    { configMapRef: NullOrUndefined Nothing
    , prefix: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EnvVar
-- | EnvVar represents an environment variable present in a Container.
newtype EnvVar = EnvVar
  { name :: (NullOrUndefined String)
  , value :: (NullOrUndefined String)
  , valueFrom :: (NullOrUndefined EnvVarSource) }

derive instance newtypeEnvVar :: Newtype EnvVar _
derive instance genericEnvVar :: Generic EnvVar _
instance showEnvVar :: Show EnvVar where show a = genericShow a
instance decodeEnvVar :: Decode EnvVar where
  decode a = genericDecode jsonOptions a 
instance encodeEnvVar :: Encode EnvVar where
  encode a = genericEncode jsonOptions a

instance defaultEnvVar :: Default EnvVar where
  default = EnvVar
    { name: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing
    , valueFrom: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EnvVarSource
-- | EnvVarSource represents a source for the value of an EnvVar.
newtype EnvVarSource = EnvVarSource
  { configMapKeyRef :: (NullOrUndefined ConfigMapKeySelector)
  , fieldRef :: (NullOrUndefined ObjectFieldSelector)
  , resourceFieldRef :: (NullOrUndefined ResourceFieldSelector)
  , secretKeyRef :: (NullOrUndefined SecretKeySelector) }

derive instance newtypeEnvVarSource :: Newtype EnvVarSource _
derive instance genericEnvVarSource :: Generic EnvVarSource _
instance showEnvVarSource :: Show EnvVarSource where show a = genericShow a
instance decodeEnvVarSource :: Decode EnvVarSource where
  decode a = genericDecode jsonOptions a 
instance encodeEnvVarSource :: Encode EnvVarSource where
  encode a = genericEncode jsonOptions a

instance defaultEnvVarSource :: Default EnvVarSource where
  default = EnvVarSource
    { configMapKeyRef: NullOrUndefined Nothing
    , fieldRef: NullOrUndefined Nothing
    , resourceFieldRef: NullOrUndefined Nothing
    , secretKeyRef: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Event
-- | Event is a report of an event somewhere in the cluster.
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
  decode a = genericDecode jsonOptions a 
instance encodeEvent :: Encode Event where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.EventList
-- | EventList is a list of events.
newtype EventList = EventList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Event))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeEventList :: Newtype EventList _
derive instance genericEventList :: Generic EventList _
instance showEventList :: Show EventList where show a = genericShow a
instance decodeEventList :: Decode EventList where
  decode a = genericDecode jsonOptions a 
instance encodeEventList :: Encode EventList where
  encode a = genericEncode jsonOptions a

instance defaultEventList :: Default EventList where
  default = EventList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EventSeries
-- | EventSeries contain information on series of events, i.e. thing that was/is happening continously for some time.
newtype EventSeries = EventSeries
  { count :: (NullOrUndefined Int)
  , lastObservedTime :: (NullOrUndefined MetaV1.MicroTime)
  , state :: (NullOrUndefined String) }

derive instance newtypeEventSeries :: Newtype EventSeries _
derive instance genericEventSeries :: Generic EventSeries _
instance showEventSeries :: Show EventSeries where show a = genericShow a
instance decodeEventSeries :: Decode EventSeries where
  decode a = genericDecode jsonOptions a 
instance encodeEventSeries :: Encode EventSeries where
  encode a = genericEncode jsonOptions a

instance defaultEventSeries :: Default EventSeries where
  default = EventSeries
    { count: NullOrUndefined Nothing
    , lastObservedTime: NullOrUndefined Nothing
    , state: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.EventSource
-- | EventSource contains information for an event.
newtype EventSource = EventSource
  { component :: (NullOrUndefined String)
  , host :: (NullOrUndefined String) }

derive instance newtypeEventSource :: Newtype EventSource _
derive instance genericEventSource :: Generic EventSource _
instance showEventSource :: Show EventSource where show a = genericShow a
instance decodeEventSource :: Decode EventSource where
  decode a = genericDecode jsonOptions a 
instance encodeEventSource :: Encode EventSource where
  encode a = genericEncode jsonOptions a

instance defaultEventSource :: Default EventSource where
  default = EventSource
    { component: NullOrUndefined Nothing
    , host: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ExecAction
-- | ExecAction describes a "run in container" action.
newtype ExecAction = ExecAction
  { command :: (NullOrUndefined (Array String)) }

derive instance newtypeExecAction :: Newtype ExecAction _
derive instance genericExecAction :: Generic ExecAction _
instance showExecAction :: Show ExecAction where show a = genericShow a
instance decodeExecAction :: Decode ExecAction where
  decode a = genericDecode jsonOptions a 
instance encodeExecAction :: Encode ExecAction where
  encode a = genericEncode jsonOptions a

instance defaultExecAction :: Default ExecAction where
  default = ExecAction
    { command: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.FCVolumeSource
-- | Represents a Fibre Channel volume. Fibre Channel volumes can only be mounted as read/write once. Fibre Channel volumes support ownership management and SELinux relabeling.
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
  decode a = genericDecode jsonOptions a 
instance encodeFCVolumeSource :: Encode FCVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultFCVolumeSource :: Default FCVolumeSource where
  default = FCVolumeSource
    { fsType: NullOrUndefined Nothing
    , lun: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , targetWWNs: NullOrUndefined Nothing
    , wwids: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.FlexPersistentVolumeSource
-- | FlexPersistentVolumeSource represents a generic persistent volume resource that is provisioned/attached using an exec based plugin.
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
  decode a = genericDecode jsonOptions a 
instance encodeFlexPersistentVolumeSource :: Encode FlexPersistentVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultFlexPersistentVolumeSource :: Default FlexPersistentVolumeSource where
  default = FlexPersistentVolumeSource
    { driver: NullOrUndefined Nothing
    , fsType: NullOrUndefined Nothing
    , options: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.FlexVolumeSource
-- | FlexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin.
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
  decode a = genericDecode jsonOptions a 
instance encodeFlexVolumeSource :: Encode FlexVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultFlexVolumeSource :: Default FlexVolumeSource where
  default = FlexVolumeSource
    { driver: NullOrUndefined Nothing
    , fsType: NullOrUndefined Nothing
    , options: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.FlockerVolumeSource
-- | Represents a Flocker volume mounted by the Flocker agent. One and only one of datasetName and datasetUUID should be set. Flocker volumes do not support ownership management or SELinux relabeling.
newtype FlockerVolumeSource = FlockerVolumeSource
  { datasetName :: (NullOrUndefined String)
  , datasetUUID :: (NullOrUndefined String) }

derive instance newtypeFlockerVolumeSource :: Newtype FlockerVolumeSource _
derive instance genericFlockerVolumeSource :: Generic FlockerVolumeSource _
instance showFlockerVolumeSource :: Show FlockerVolumeSource where show a = genericShow a
instance decodeFlockerVolumeSource :: Decode FlockerVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeFlockerVolumeSource :: Encode FlockerVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultFlockerVolumeSource :: Default FlockerVolumeSource where
  default = FlockerVolumeSource
    { datasetName: NullOrUndefined Nothing
    , datasetUUID: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.GCEPersistentDiskVolumeSource
-- | Represents a Persistent Disk resource in Google Compute Engine.
-- | 
-- | A GCE PD must exist before mounting to a container. The disk must also be in the same GCE project and zone as the kubelet. A GCE PD can only be mounted as read/write once or read-only many times. GCE PDs support ownership management and SELinux relabeling.
newtype GCEPersistentDiskVolumeSource = GCEPersistentDiskVolumeSource
  { fsType :: (NullOrUndefined String)
  , partition :: (NullOrUndefined Int)
  , pdName :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean) }

derive instance newtypeGCEPersistentDiskVolumeSource :: Newtype GCEPersistentDiskVolumeSource _
derive instance genericGCEPersistentDiskVolumeSource :: Generic GCEPersistentDiskVolumeSource _
instance showGCEPersistentDiskVolumeSource :: Show GCEPersistentDiskVolumeSource where show a = genericShow a
instance decodeGCEPersistentDiskVolumeSource :: Decode GCEPersistentDiskVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeGCEPersistentDiskVolumeSource :: Encode GCEPersistentDiskVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultGCEPersistentDiskVolumeSource :: Default GCEPersistentDiskVolumeSource where
  default = GCEPersistentDiskVolumeSource
    { fsType: NullOrUndefined Nothing
    , partition: NullOrUndefined Nothing
    , pdName: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.GitRepoVolumeSource
-- | Represents a volume that is populated with the contents of a git repository. Git repo volumes do not support ownership management. Git repo volumes support SELinux relabeling.
newtype GitRepoVolumeSource = GitRepoVolumeSource
  { directory :: (NullOrUndefined String)
  , repository :: (NullOrUndefined String)
  , revision :: (NullOrUndefined String) }

derive instance newtypeGitRepoVolumeSource :: Newtype GitRepoVolumeSource _
derive instance genericGitRepoVolumeSource :: Generic GitRepoVolumeSource _
instance showGitRepoVolumeSource :: Show GitRepoVolumeSource where show a = genericShow a
instance decodeGitRepoVolumeSource :: Decode GitRepoVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeGitRepoVolumeSource :: Encode GitRepoVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultGitRepoVolumeSource :: Default GitRepoVolumeSource where
  default = GitRepoVolumeSource
    { directory: NullOrUndefined Nothing
    , repository: NullOrUndefined Nothing
    , revision: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.GlusterfsVolumeSource
-- | Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling.
newtype GlusterfsVolumeSource = GlusterfsVolumeSource
  { endpoints :: (NullOrUndefined String)
  , path :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean) }

derive instance newtypeGlusterfsVolumeSource :: Newtype GlusterfsVolumeSource _
derive instance genericGlusterfsVolumeSource :: Generic GlusterfsVolumeSource _
instance showGlusterfsVolumeSource :: Show GlusterfsVolumeSource where show a = genericShow a
instance decodeGlusterfsVolumeSource :: Decode GlusterfsVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeGlusterfsVolumeSource :: Encode GlusterfsVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultGlusterfsVolumeSource :: Default GlusterfsVolumeSource where
  default = GlusterfsVolumeSource
    { endpoints: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.HTTPGetAction
-- | HTTPGetAction describes an action based on HTTP Get requests.
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
  decode a = genericDecode jsonOptions a 
instance encodeHTTPGetAction :: Encode HTTPGetAction where
  encode a = genericEncode jsonOptions a

instance defaultHTTPGetAction :: Default HTTPGetAction where
  default = HTTPGetAction
    { host: NullOrUndefined Nothing
    , httpHeaders: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing
    , port: NullOrUndefined Nothing
    , scheme: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.HTTPHeader
-- | HTTPHeader describes a custom header to be used in HTTP probes
newtype HTTPHeader = HTTPHeader
  { name :: (NullOrUndefined String)
  , value :: (NullOrUndefined String) }

derive instance newtypeHTTPHeader :: Newtype HTTPHeader _
derive instance genericHTTPHeader :: Generic HTTPHeader _
instance showHTTPHeader :: Show HTTPHeader where show a = genericShow a
instance decodeHTTPHeader :: Decode HTTPHeader where
  decode a = genericDecode jsonOptions a 
instance encodeHTTPHeader :: Encode HTTPHeader where
  encode a = genericEncode jsonOptions a

instance defaultHTTPHeader :: Default HTTPHeader where
  default = HTTPHeader
    { name: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Handler
-- | Handler defines a specific action that should be taken
newtype Handler = Handler
  { exec :: (NullOrUndefined ExecAction)
  , httpGet :: (NullOrUndefined HTTPGetAction)
  , tcpSocket :: (NullOrUndefined TCPSocketAction) }

derive instance newtypeHandler :: Newtype Handler _
derive instance genericHandler :: Generic Handler _
instance showHandler :: Show Handler where show a = genericShow a
instance decodeHandler :: Decode Handler where
  decode a = genericDecode jsonOptions a 
instance encodeHandler :: Encode Handler where
  encode a = genericEncode jsonOptions a

instance defaultHandler :: Default Handler where
  default = Handler
    { exec: NullOrUndefined Nothing
    , httpGet: NullOrUndefined Nothing
    , tcpSocket: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.HostAlias
-- | HostAlias holds the mapping between IP and hostnames that will be injected as an entry in the pod's hosts file.
newtype HostAlias = HostAlias
  { hostnames :: (NullOrUndefined (Array String))
  , ip :: (NullOrUndefined String) }

derive instance newtypeHostAlias :: Newtype HostAlias _
derive instance genericHostAlias :: Generic HostAlias _
instance showHostAlias :: Show HostAlias where show a = genericShow a
instance decodeHostAlias :: Decode HostAlias where
  decode a = genericDecode jsonOptions a 
instance encodeHostAlias :: Encode HostAlias where
  encode a = genericEncode jsonOptions a

instance defaultHostAlias :: Default HostAlias where
  default = HostAlias
    { hostnames: NullOrUndefined Nothing
    , ip: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.HostPathVolumeSource
-- | Represents a host path mapped into a pod. Host path volumes do not support ownership management or SELinux relabeling.
newtype HostPathVolumeSource = HostPathVolumeSource
  { _type :: (NullOrUndefined String)
  , path :: (NullOrUndefined String) }

derive instance newtypeHostPathVolumeSource :: Newtype HostPathVolumeSource _
derive instance genericHostPathVolumeSource :: Generic HostPathVolumeSource _
instance showHostPathVolumeSource :: Show HostPathVolumeSource where show a = genericShow a
instance decodeHostPathVolumeSource :: Decode HostPathVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeHostPathVolumeSource :: Encode HostPathVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultHostPathVolumeSource :: Default HostPathVolumeSource where
  default = HostPathVolumeSource
    { _type: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ISCSIPersistentVolumeSource
-- | ISCSIPersistentVolumeSource represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling.
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
  decode a = genericDecode jsonOptions a 
instance encodeISCSIPersistentVolumeSource :: Encode ISCSIPersistentVolumeSource where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.ISCSIVolumeSource
-- | Represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling.
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
  decode a = genericDecode jsonOptions a 
instance encodeISCSIVolumeSource :: Encode ISCSIVolumeSource where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.KeyToPath
-- | Maps a string key to a path within a volume.
newtype KeyToPath = KeyToPath
  { key :: (NullOrUndefined String)
  , mode :: (NullOrUndefined Int)
  , path :: (NullOrUndefined String) }

derive instance newtypeKeyToPath :: Newtype KeyToPath _
derive instance genericKeyToPath :: Generic KeyToPath _
instance showKeyToPath :: Show KeyToPath where show a = genericShow a
instance decodeKeyToPath :: Decode KeyToPath where
  decode a = genericDecode jsonOptions a 
instance encodeKeyToPath :: Encode KeyToPath where
  encode a = genericEncode jsonOptions a

instance defaultKeyToPath :: Default KeyToPath where
  default = KeyToPath
    { key: NullOrUndefined Nothing
    , mode: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Lifecycle
-- | Lifecycle describes actions that the management system should take in response to container lifecycle events. For the PostStart and PreStop lifecycle handlers, management of the container blocks until the action is complete, unless the container process fails, in which case the handler is aborted.
newtype Lifecycle = Lifecycle
  { postStart :: (NullOrUndefined Handler)
  , preStop :: (NullOrUndefined Handler) }

derive instance newtypeLifecycle :: Newtype Lifecycle _
derive instance genericLifecycle :: Generic Lifecycle _
instance showLifecycle :: Show Lifecycle where show a = genericShow a
instance decodeLifecycle :: Decode Lifecycle where
  decode a = genericDecode jsonOptions a 
instance encodeLifecycle :: Encode Lifecycle where
  encode a = genericEncode jsonOptions a

instance defaultLifecycle :: Default Lifecycle where
  default = Lifecycle
    { postStart: NullOrUndefined Nothing
    , preStop: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.LimitRange
-- | LimitRange sets resource usage limits for each kind of resource in a Namespace.
newtype LimitRange = LimitRange
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined LimitRangeSpec) }

derive instance newtypeLimitRange :: Newtype LimitRange _
derive instance genericLimitRange :: Generic LimitRange _
instance showLimitRange :: Show LimitRange where show a = genericShow a
instance decodeLimitRange :: Decode LimitRange where
  decode a = genericDecode jsonOptions a 
instance encodeLimitRange :: Encode LimitRange where
  encode a = genericEncode jsonOptions a

instance defaultLimitRange :: Default LimitRange where
  default = LimitRange
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.LimitRangeItem
-- | LimitRangeItem defines a min/max usage limit for any resource that matches on kind.
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
  decode a = genericDecode jsonOptions a 
instance encodeLimitRangeItem :: Encode LimitRangeItem where
  encode a = genericEncode jsonOptions a

instance defaultLimitRangeItem :: Default LimitRangeItem where
  default = LimitRangeItem
    { _default: NullOrUndefined Nothing
    , _type: NullOrUndefined Nothing
    , defaultRequest: NullOrUndefined Nothing
    , max: NullOrUndefined Nothing
    , maxLimitRequestRatio: NullOrUndefined Nothing
    , min: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.LimitRangeList
-- | LimitRangeList is a list of LimitRange items.
newtype LimitRangeList = LimitRangeList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array LimitRange))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeLimitRangeList :: Newtype LimitRangeList _
derive instance genericLimitRangeList :: Generic LimitRangeList _
instance showLimitRangeList :: Show LimitRangeList where show a = genericShow a
instance decodeLimitRangeList :: Decode LimitRangeList where
  decode a = genericDecode jsonOptions a 
instance encodeLimitRangeList :: Encode LimitRangeList where
  encode a = genericEncode jsonOptions a

instance defaultLimitRangeList :: Default LimitRangeList where
  default = LimitRangeList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.LimitRangeSpec
-- | LimitRangeSpec defines a min/max usage limit for resources that match on kind.
newtype LimitRangeSpec = LimitRangeSpec
  { limits :: (NullOrUndefined (Array LimitRangeItem)) }

derive instance newtypeLimitRangeSpec :: Newtype LimitRangeSpec _
derive instance genericLimitRangeSpec :: Generic LimitRangeSpec _
instance showLimitRangeSpec :: Show LimitRangeSpec where show a = genericShow a
instance decodeLimitRangeSpec :: Decode LimitRangeSpec where
  decode a = genericDecode jsonOptions a 
instance encodeLimitRangeSpec :: Encode LimitRangeSpec where
  encode a = genericEncode jsonOptions a

instance defaultLimitRangeSpec :: Default LimitRangeSpec where
  default = LimitRangeSpec
    { limits: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.LoadBalancerIngress
-- | LoadBalancerIngress represents the status of a load-balancer ingress point: traffic intended for the service should be sent to an ingress point.
newtype LoadBalancerIngress = LoadBalancerIngress
  { hostname :: (NullOrUndefined String)
  , ip :: (NullOrUndefined String) }

derive instance newtypeLoadBalancerIngress :: Newtype LoadBalancerIngress _
derive instance genericLoadBalancerIngress :: Generic LoadBalancerIngress _
instance showLoadBalancerIngress :: Show LoadBalancerIngress where show a = genericShow a
instance decodeLoadBalancerIngress :: Decode LoadBalancerIngress where
  decode a = genericDecode jsonOptions a 
instance encodeLoadBalancerIngress :: Encode LoadBalancerIngress where
  encode a = genericEncode jsonOptions a

instance defaultLoadBalancerIngress :: Default LoadBalancerIngress where
  default = LoadBalancerIngress
    { hostname: NullOrUndefined Nothing
    , ip: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.LoadBalancerStatus
-- | LoadBalancerStatus represents the status of a load-balancer.
newtype LoadBalancerStatus = LoadBalancerStatus
  { ingress :: (NullOrUndefined (Array LoadBalancerIngress)) }

derive instance newtypeLoadBalancerStatus :: Newtype LoadBalancerStatus _
derive instance genericLoadBalancerStatus :: Generic LoadBalancerStatus _
instance showLoadBalancerStatus :: Show LoadBalancerStatus where show a = genericShow a
instance decodeLoadBalancerStatus :: Decode LoadBalancerStatus where
  decode a = genericDecode jsonOptions a 
instance encodeLoadBalancerStatus :: Encode LoadBalancerStatus where
  encode a = genericEncode jsonOptions a

instance defaultLoadBalancerStatus :: Default LoadBalancerStatus where
  default = LoadBalancerStatus
    { ingress: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.LocalObjectReference
-- | LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.
newtype LocalObjectReference = LocalObjectReference
  { name :: (NullOrUndefined String) }

derive instance newtypeLocalObjectReference :: Newtype LocalObjectReference _
derive instance genericLocalObjectReference :: Generic LocalObjectReference _
instance showLocalObjectReference :: Show LocalObjectReference where show a = genericShow a
instance decodeLocalObjectReference :: Decode LocalObjectReference where
  decode a = genericDecode jsonOptions a 
instance encodeLocalObjectReference :: Encode LocalObjectReference where
  encode a = genericEncode jsonOptions a

instance defaultLocalObjectReference :: Default LocalObjectReference where
  default = LocalObjectReference
    { name: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.LocalVolumeSource
-- | Local represents directly-attached storage with node affinity
newtype LocalVolumeSource = LocalVolumeSource
  { path :: (NullOrUndefined String) }

derive instance newtypeLocalVolumeSource :: Newtype LocalVolumeSource _
derive instance genericLocalVolumeSource :: Generic LocalVolumeSource _
instance showLocalVolumeSource :: Show LocalVolumeSource where show a = genericShow a
instance decodeLocalVolumeSource :: Decode LocalVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeLocalVolumeSource :: Encode LocalVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultLocalVolumeSource :: Default LocalVolumeSource where
  default = LocalVolumeSource
    { path: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NFSVolumeSource
-- | Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do not support ownership management or SELinux relabeling.
newtype NFSVolumeSource = NFSVolumeSource
  { path :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , server :: (NullOrUndefined String) }

derive instance newtypeNFSVolumeSource :: Newtype NFSVolumeSource _
derive instance genericNFSVolumeSource :: Generic NFSVolumeSource _
instance showNFSVolumeSource :: Show NFSVolumeSource where show a = genericShow a
instance decodeNFSVolumeSource :: Decode NFSVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeNFSVolumeSource :: Encode NFSVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultNFSVolumeSource :: Default NFSVolumeSource where
  default = NFSVolumeSource
    { path: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , server: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Namespace
-- | Namespace provides a scope for Names. Use of multiple namespaces is optional.
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
  decode a = genericDecode jsonOptions a 
instance encodeNamespace :: Encode Namespace where
  encode a = genericEncode jsonOptions a

instance defaultNamespace :: Default Namespace where
  default = Namespace
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NamespaceList
-- | NamespaceList is a list of Namespaces.
newtype NamespaceList = NamespaceList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Namespace))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeNamespaceList :: Newtype NamespaceList _
derive instance genericNamespaceList :: Generic NamespaceList _
instance showNamespaceList :: Show NamespaceList where show a = genericShow a
instance decodeNamespaceList :: Decode NamespaceList where
  decode a = genericDecode jsonOptions a 
instance encodeNamespaceList :: Encode NamespaceList where
  encode a = genericEncode jsonOptions a

instance defaultNamespaceList :: Default NamespaceList where
  default = NamespaceList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NamespaceSpec
-- | NamespaceSpec describes the attributes on a Namespace.
newtype NamespaceSpec = NamespaceSpec
  { finalizers :: (NullOrUndefined (Array String)) }

derive instance newtypeNamespaceSpec :: Newtype NamespaceSpec _
derive instance genericNamespaceSpec :: Generic NamespaceSpec _
instance showNamespaceSpec :: Show NamespaceSpec where show a = genericShow a
instance decodeNamespaceSpec :: Decode NamespaceSpec where
  decode a = genericDecode jsonOptions a 
instance encodeNamespaceSpec :: Encode NamespaceSpec where
  encode a = genericEncode jsonOptions a

instance defaultNamespaceSpec :: Default NamespaceSpec where
  default = NamespaceSpec
    { finalizers: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NamespaceStatus
-- | NamespaceStatus is information about the current status of a Namespace.
newtype NamespaceStatus = NamespaceStatus
  { phase :: (NullOrUndefined String) }

derive instance newtypeNamespaceStatus :: Newtype NamespaceStatus _
derive instance genericNamespaceStatus :: Generic NamespaceStatus _
instance showNamespaceStatus :: Show NamespaceStatus where show a = genericShow a
instance decodeNamespaceStatus :: Decode NamespaceStatus where
  decode a = genericDecode jsonOptions a 
instance encodeNamespaceStatus :: Encode NamespaceStatus where
  encode a = genericEncode jsonOptions a

instance defaultNamespaceStatus :: Default NamespaceStatus where
  default = NamespaceStatus
    { phase: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Node
-- | Node is a worker node in Kubernetes. Each node will have a unique identifier in the cache (i.e. in etcd).
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
  decode a = genericDecode jsonOptions a 
instance encodeNode :: Encode Node where
  encode a = genericEncode jsonOptions a

instance defaultNode :: Default Node where
  default = Node
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeAddress
-- | NodeAddress contains information for the node's address.
newtype NodeAddress = NodeAddress
  { _type :: (NullOrUndefined String)
  , address :: (NullOrUndefined String) }

derive instance newtypeNodeAddress :: Newtype NodeAddress _
derive instance genericNodeAddress :: Generic NodeAddress _
instance showNodeAddress :: Show NodeAddress where show a = genericShow a
instance decodeNodeAddress :: Decode NodeAddress where
  decode a = genericDecode jsonOptions a 
instance encodeNodeAddress :: Encode NodeAddress where
  encode a = genericEncode jsonOptions a

instance defaultNodeAddress :: Default NodeAddress where
  default = NodeAddress
    { _type: NullOrUndefined Nothing
    , address: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeAffinity
-- | Node affinity is a group of node affinity scheduling rules.
newtype NodeAffinity = NodeAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array PreferredSchedulingTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined NodeSelector) }

derive instance newtypeNodeAffinity :: Newtype NodeAffinity _
derive instance genericNodeAffinity :: Generic NodeAffinity _
instance showNodeAffinity :: Show NodeAffinity where show a = genericShow a
instance decodeNodeAffinity :: Decode NodeAffinity where
  decode a = genericDecode jsonOptions a 
instance encodeNodeAffinity :: Encode NodeAffinity where
  encode a = genericEncode jsonOptions a

instance defaultNodeAffinity :: Default NodeAffinity where
  default = NodeAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeCondition
-- | NodeCondition contains condition information for a node.
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
  decode a = genericDecode jsonOptions a 
instance encodeNodeCondition :: Encode NodeCondition where
  encode a = genericEncode jsonOptions a

instance defaultNodeCondition :: Default NodeCondition where
  default = NodeCondition
    { _type: NullOrUndefined Nothing
    , lastHeartbeatTime: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeConfigSource
-- | NodeConfigSource specifies a source of node configuration. Exactly one subfield (excluding metadata) must be non-nil.
newtype NodeConfigSource = NodeConfigSource
  { apiVersion :: (NullOrUndefined String)
  , configMapRef :: (NullOrUndefined ObjectReference)
  , kind :: (NullOrUndefined String) }

derive instance newtypeNodeConfigSource :: Newtype NodeConfigSource _
derive instance genericNodeConfigSource :: Generic NodeConfigSource _
instance showNodeConfigSource :: Show NodeConfigSource where show a = genericShow a
instance decodeNodeConfigSource :: Decode NodeConfigSource where
  decode a = genericDecode jsonOptions a 
instance encodeNodeConfigSource :: Encode NodeConfigSource where
  encode a = genericEncode jsonOptions a

instance defaultNodeConfigSource :: Default NodeConfigSource where
  default = NodeConfigSource
    { apiVersion: NullOrUndefined Nothing
    , configMapRef: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeDaemonEndpoints
-- | NodeDaemonEndpoints lists ports opened by daemons running on the Node.
newtype NodeDaemonEndpoints = NodeDaemonEndpoints
  { kubeletEndpoint :: (NullOrUndefined DaemonEndpoint) }

derive instance newtypeNodeDaemonEndpoints :: Newtype NodeDaemonEndpoints _
derive instance genericNodeDaemonEndpoints :: Generic NodeDaemonEndpoints _
instance showNodeDaemonEndpoints :: Show NodeDaemonEndpoints where show a = genericShow a
instance decodeNodeDaemonEndpoints :: Decode NodeDaemonEndpoints where
  decode a = genericDecode jsonOptions a 
instance encodeNodeDaemonEndpoints :: Encode NodeDaemonEndpoints where
  encode a = genericEncode jsonOptions a

instance defaultNodeDaemonEndpoints :: Default NodeDaemonEndpoints where
  default = NodeDaemonEndpoints
    { kubeletEndpoint: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeList
-- | NodeList is the whole list of all Nodes which have been registered with master.
newtype NodeList = NodeList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Node))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeNodeList :: Newtype NodeList _
derive instance genericNodeList :: Generic NodeList _
instance showNodeList :: Show NodeList where show a = genericShow a
instance decodeNodeList :: Decode NodeList where
  decode a = genericDecode jsonOptions a 
instance encodeNodeList :: Encode NodeList where
  encode a = genericEncode jsonOptions a

instance defaultNodeList :: Default NodeList where
  default = NodeList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeSelector
-- | A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms.
newtype NodeSelector = NodeSelector
  { nodeSelectorTerms :: (NullOrUndefined (Array NodeSelectorTerm)) }

derive instance newtypeNodeSelector :: Newtype NodeSelector _
derive instance genericNodeSelector :: Generic NodeSelector _
instance showNodeSelector :: Show NodeSelector where show a = genericShow a
instance decodeNodeSelector :: Decode NodeSelector where
  decode a = genericDecode jsonOptions a 
instance encodeNodeSelector :: Encode NodeSelector where
  encode a = genericEncode jsonOptions a

instance defaultNodeSelector :: Default NodeSelector where
  default = NodeSelector
    { nodeSelectorTerms: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeSelectorRequirement
-- | A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values.
newtype NodeSelectorRequirement = NodeSelectorRequirement
  { key :: (NullOrUndefined String)
  , operator :: (NullOrUndefined String)
  , values :: (NullOrUndefined (Array String)) }

derive instance newtypeNodeSelectorRequirement :: Newtype NodeSelectorRequirement _
derive instance genericNodeSelectorRequirement :: Generic NodeSelectorRequirement _
instance showNodeSelectorRequirement :: Show NodeSelectorRequirement where show a = genericShow a
instance decodeNodeSelectorRequirement :: Decode NodeSelectorRequirement where
  decode a = genericDecode jsonOptions a 
instance encodeNodeSelectorRequirement :: Encode NodeSelectorRequirement where
  encode a = genericEncode jsonOptions a

instance defaultNodeSelectorRequirement :: Default NodeSelectorRequirement where
  default = NodeSelectorRequirement
    { key: NullOrUndefined Nothing
    , operator: NullOrUndefined Nothing
    , values: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeSelectorTerm
-- | A null or empty node selector term matches no objects.
newtype NodeSelectorTerm = NodeSelectorTerm
  { matchExpressions :: (NullOrUndefined (Array NodeSelectorRequirement)) }

derive instance newtypeNodeSelectorTerm :: Newtype NodeSelectorTerm _
derive instance genericNodeSelectorTerm :: Generic NodeSelectorTerm _
instance showNodeSelectorTerm :: Show NodeSelectorTerm where show a = genericShow a
instance decodeNodeSelectorTerm :: Decode NodeSelectorTerm where
  decode a = genericDecode jsonOptions a 
instance encodeNodeSelectorTerm :: Encode NodeSelectorTerm where
  encode a = genericEncode jsonOptions a

instance defaultNodeSelectorTerm :: Default NodeSelectorTerm where
  default = NodeSelectorTerm
    { matchExpressions: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeSpec
-- | NodeSpec describes the attributes that a node is created with.
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
  decode a = genericDecode jsonOptions a 
instance encodeNodeSpec :: Encode NodeSpec where
  encode a = genericEncode jsonOptions a

instance defaultNodeSpec :: Default NodeSpec where
  default = NodeSpec
    { configSource: NullOrUndefined Nothing
    , externalID: NullOrUndefined Nothing
    , podCIDR: NullOrUndefined Nothing
    , providerID: NullOrUndefined Nothing
    , taints: NullOrUndefined Nothing
    , unschedulable: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.NodeStatus
-- | NodeStatus is information about the current status of a node.
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
  decode a = genericDecode jsonOptions a 
instance encodeNodeStatus :: Encode NodeStatus where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.NodeSystemInfo
-- | NodeSystemInfo is a set of ids/uuids to uniquely identify the node.
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
  decode a = genericDecode jsonOptions a 
instance encodeNodeSystemInfo :: Encode NodeSystemInfo where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.ObjectFieldSelector
-- | ObjectFieldSelector selects an APIVersioned field of an object.
newtype ObjectFieldSelector = ObjectFieldSelector
  { apiVersion :: (NullOrUndefined String)
  , fieldPath :: (NullOrUndefined String) }

derive instance newtypeObjectFieldSelector :: Newtype ObjectFieldSelector _
derive instance genericObjectFieldSelector :: Generic ObjectFieldSelector _
instance showObjectFieldSelector :: Show ObjectFieldSelector where show a = genericShow a
instance decodeObjectFieldSelector :: Decode ObjectFieldSelector where
  decode a = genericDecode jsonOptions a 
instance encodeObjectFieldSelector :: Encode ObjectFieldSelector where
  encode a = genericEncode jsonOptions a

instance defaultObjectFieldSelector :: Default ObjectFieldSelector where
  default = ObjectFieldSelector
    { apiVersion: NullOrUndefined Nothing
    , fieldPath: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ObjectReference
-- | ObjectReference contains enough information to let you inspect or modify the referred object.
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
  decode a = genericDecode jsonOptions a 
instance encodeObjectReference :: Encode ObjectReference where
  encode a = genericEncode jsonOptions a

instance defaultObjectReference :: Default ObjectReference where
  default = ObjectReference
    { apiVersion: NullOrUndefined Nothing
    , fieldPath: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolume
-- | PersistentVolume (PV) is a storage resource provisioned by an administrator. It is analogous to a node. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes
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
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolume :: Encode PersistentVolume where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolume :: Default PersistentVolume where
  default = PersistentVolume
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolumeClaim
-- | PersistentVolumeClaim is a user's request for and claim to a persistent volume
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
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeClaim :: Encode PersistentVolumeClaim where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolumeClaim :: Default PersistentVolumeClaim where
  default = PersistentVolumeClaim
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolumeClaimCondition
-- | PersistentVolumeClaimCondition contails details about state of pvc
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
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeClaimCondition :: Encode PersistentVolumeClaimCondition where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolumeClaimCondition :: Default PersistentVolumeClaimCondition where
  default = PersistentVolumeClaimCondition
    { _type: NullOrUndefined Nothing
    , lastProbeTime: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolumeClaimList
-- | PersistentVolumeClaimList is a list of PersistentVolumeClaim items.
newtype PersistentVolumeClaimList = PersistentVolumeClaimList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PersistentVolumeClaim))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePersistentVolumeClaimList :: Newtype PersistentVolumeClaimList _
derive instance genericPersistentVolumeClaimList :: Generic PersistentVolumeClaimList _
instance showPersistentVolumeClaimList :: Show PersistentVolumeClaimList where show a = genericShow a
instance decodePersistentVolumeClaimList :: Decode PersistentVolumeClaimList where
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeClaimList :: Encode PersistentVolumeClaimList where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolumeClaimList :: Default PersistentVolumeClaimList where
  default = PersistentVolumeClaimList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolumeClaimSpec
-- | PersistentVolumeClaimSpec describes the common attributes of storage devices and allows a Source for provider-specific attributes
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
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeClaimSpec :: Encode PersistentVolumeClaimSpec where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolumeClaimSpec :: Default PersistentVolumeClaimSpec where
  default = PersistentVolumeClaimSpec
    { accessModes: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , storageClassName: NullOrUndefined Nothing
    , volumeMode: NullOrUndefined Nothing
    , volumeName: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolumeClaimStatus
-- | PersistentVolumeClaimStatus is the current status of a persistent volume claim.
newtype PersistentVolumeClaimStatus = PersistentVolumeClaimStatus
  { accessModes :: (NullOrUndefined (Array String))
  , capacity :: (NullOrUndefined (StrMap Resource.Quantity))
  , conditions :: (NullOrUndefined (Array PersistentVolumeClaimCondition))
  , phase :: (NullOrUndefined String) }

derive instance newtypePersistentVolumeClaimStatus :: Newtype PersistentVolumeClaimStatus _
derive instance genericPersistentVolumeClaimStatus :: Generic PersistentVolumeClaimStatus _
instance showPersistentVolumeClaimStatus :: Show PersistentVolumeClaimStatus where show a = genericShow a
instance decodePersistentVolumeClaimStatus :: Decode PersistentVolumeClaimStatus where
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeClaimStatus :: Encode PersistentVolumeClaimStatus where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolumeClaimStatus :: Default PersistentVolumeClaimStatus where
  default = PersistentVolumeClaimStatus
    { accessModes: NullOrUndefined Nothing
    , capacity: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , phase: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolumeClaimVolumeSource
-- | PersistentVolumeClaimVolumeSource references the user's PVC in the same namespace. This volume finds the bound PV and mounts that volume for the pod. A PersistentVolumeClaimVolumeSource is, essentially, a wrapper around another type of volume that is owned by someone else (the system).
newtype PersistentVolumeClaimVolumeSource = PersistentVolumeClaimVolumeSource
  { claimName :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean) }

derive instance newtypePersistentVolumeClaimVolumeSource :: Newtype PersistentVolumeClaimVolumeSource _
derive instance genericPersistentVolumeClaimVolumeSource :: Generic PersistentVolumeClaimVolumeSource _
instance showPersistentVolumeClaimVolumeSource :: Show PersistentVolumeClaimVolumeSource where show a = genericShow a
instance decodePersistentVolumeClaimVolumeSource :: Decode PersistentVolumeClaimVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeClaimVolumeSource :: Encode PersistentVolumeClaimVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolumeClaimVolumeSource :: Default PersistentVolumeClaimVolumeSource where
  default = PersistentVolumeClaimVolumeSource
    { claimName: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolumeList
-- | PersistentVolumeList is a list of PersistentVolume items.
newtype PersistentVolumeList = PersistentVolumeList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PersistentVolume))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePersistentVolumeList :: Newtype PersistentVolumeList _
derive instance genericPersistentVolumeList :: Generic PersistentVolumeList _
instance showPersistentVolumeList :: Show PersistentVolumeList where show a = genericShow a
instance decodePersistentVolumeList :: Decode PersistentVolumeList where
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeList :: Encode PersistentVolumeList where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolumeList :: Default PersistentVolumeList where
  default = PersistentVolumeList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PersistentVolumeSpec
-- | PersistentVolumeSpec is the specification of a persistent volume.
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
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeSpec :: Encode PersistentVolumeSpec where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.PersistentVolumeStatus
-- | PersistentVolumeStatus is the current status of a persistent volume.
newtype PersistentVolumeStatus = PersistentVolumeStatus
  { message :: (NullOrUndefined String)
  , phase :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String) }

derive instance newtypePersistentVolumeStatus :: Newtype PersistentVolumeStatus _
derive instance genericPersistentVolumeStatus :: Generic PersistentVolumeStatus _
instance showPersistentVolumeStatus :: Show PersistentVolumeStatus where show a = genericShow a
instance decodePersistentVolumeStatus :: Decode PersistentVolumeStatus where
  decode a = genericDecode jsonOptions a 
instance encodePersistentVolumeStatus :: Encode PersistentVolumeStatus where
  encode a = genericEncode jsonOptions a

instance defaultPersistentVolumeStatus :: Default PersistentVolumeStatus where
  default = PersistentVolumeStatus
    { message: NullOrUndefined Nothing
    , phase: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PhotonPersistentDiskVolumeSource
-- | Represents a Photon Controller persistent disk resource.
newtype PhotonPersistentDiskVolumeSource = PhotonPersistentDiskVolumeSource
  { fsType :: (NullOrUndefined String)
  , pdID :: (NullOrUndefined String) }

derive instance newtypePhotonPersistentDiskVolumeSource :: Newtype PhotonPersistentDiskVolumeSource _
derive instance genericPhotonPersistentDiskVolumeSource :: Generic PhotonPersistentDiskVolumeSource _
instance showPhotonPersistentDiskVolumeSource :: Show PhotonPersistentDiskVolumeSource where show a = genericShow a
instance decodePhotonPersistentDiskVolumeSource :: Decode PhotonPersistentDiskVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodePhotonPersistentDiskVolumeSource :: Encode PhotonPersistentDiskVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultPhotonPersistentDiskVolumeSource :: Default PhotonPersistentDiskVolumeSource where
  default = PhotonPersistentDiskVolumeSource
    { fsType: NullOrUndefined Nothing
    , pdID: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Pod
-- | Pod is a collection of containers that can run on a host. This resource is created by clients and scheduled onto hosts.
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
  decode a = genericDecode jsonOptions a 
instance encodePod :: Encode Pod where
  encode a = genericEncode jsonOptions a

instance defaultPod :: Default Pod where
  default = Pod
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodAffinity
-- | Pod affinity is a group of inter pod affinity scheduling rules.
newtype PodAffinity = PodAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array WeightedPodAffinityTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array PodAffinityTerm)) }

derive instance newtypePodAffinity :: Newtype PodAffinity _
derive instance genericPodAffinity :: Generic PodAffinity _
instance showPodAffinity :: Show PodAffinity where show a = genericShow a
instance decodePodAffinity :: Decode PodAffinity where
  decode a = genericDecode jsonOptions a 
instance encodePodAffinity :: Encode PodAffinity where
  encode a = genericEncode jsonOptions a

instance defaultPodAffinity :: Default PodAffinity where
  default = PodAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodAffinityTerm
-- | Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running
newtype PodAffinityTerm = PodAffinityTerm
  { labelSelector :: (NullOrUndefined MetaV1.LabelSelector)
  , namespaces :: (NullOrUndefined (Array String))
  , topologyKey :: (NullOrUndefined String) }

derive instance newtypePodAffinityTerm :: Newtype PodAffinityTerm _
derive instance genericPodAffinityTerm :: Generic PodAffinityTerm _
instance showPodAffinityTerm :: Show PodAffinityTerm where show a = genericShow a
instance decodePodAffinityTerm :: Decode PodAffinityTerm where
  decode a = genericDecode jsonOptions a 
instance encodePodAffinityTerm :: Encode PodAffinityTerm where
  encode a = genericEncode jsonOptions a

instance defaultPodAffinityTerm :: Default PodAffinityTerm where
  default = PodAffinityTerm
    { labelSelector: NullOrUndefined Nothing
    , namespaces: NullOrUndefined Nothing
    , topologyKey: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodAntiAffinity
-- | Pod anti affinity is a group of inter pod anti affinity scheduling rules.
newtype PodAntiAffinity = PodAntiAffinity
  { preferredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array WeightedPodAffinityTerm))
  , requiredDuringSchedulingIgnoredDuringExecution :: (NullOrUndefined (Array PodAffinityTerm)) }

derive instance newtypePodAntiAffinity :: Newtype PodAntiAffinity _
derive instance genericPodAntiAffinity :: Generic PodAntiAffinity _
instance showPodAntiAffinity :: Show PodAntiAffinity where show a = genericShow a
instance decodePodAntiAffinity :: Decode PodAntiAffinity where
  decode a = genericDecode jsonOptions a 
instance encodePodAntiAffinity :: Encode PodAntiAffinity where
  encode a = genericEncode jsonOptions a

instance defaultPodAntiAffinity :: Default PodAntiAffinity where
  default = PodAntiAffinity
    { preferredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing
    , requiredDuringSchedulingIgnoredDuringExecution: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodCondition
-- | PodCondition contains details for the current condition of this pod.
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
  decode a = genericDecode jsonOptions a 
instance encodePodCondition :: Encode PodCondition where
  encode a = genericEncode jsonOptions a

instance defaultPodCondition :: Default PodCondition where
  default = PodCondition
    { _type: NullOrUndefined Nothing
    , lastProbeTime: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodDNSConfig
-- | PodDNSConfig defines the DNS parameters of a pod in addition to those generated from DNSPolicy.
newtype PodDNSConfig = PodDNSConfig
  { nameservers :: (NullOrUndefined (Array String))
  , options :: (NullOrUndefined (Array PodDNSConfigOption))
  , searches :: (NullOrUndefined (Array String)) }

derive instance newtypePodDNSConfig :: Newtype PodDNSConfig _
derive instance genericPodDNSConfig :: Generic PodDNSConfig _
instance showPodDNSConfig :: Show PodDNSConfig where show a = genericShow a
instance decodePodDNSConfig :: Decode PodDNSConfig where
  decode a = genericDecode jsonOptions a 
instance encodePodDNSConfig :: Encode PodDNSConfig where
  encode a = genericEncode jsonOptions a

instance defaultPodDNSConfig :: Default PodDNSConfig where
  default = PodDNSConfig
    { nameservers: NullOrUndefined Nothing
    , options: NullOrUndefined Nothing
    , searches: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodDNSConfigOption
-- | PodDNSConfigOption defines DNS resolver options of a pod.
newtype PodDNSConfigOption = PodDNSConfigOption
  { name :: (NullOrUndefined String)
  , value :: (NullOrUndefined String) }

derive instance newtypePodDNSConfigOption :: Newtype PodDNSConfigOption _
derive instance genericPodDNSConfigOption :: Generic PodDNSConfigOption _
instance showPodDNSConfigOption :: Show PodDNSConfigOption where show a = genericShow a
instance decodePodDNSConfigOption :: Decode PodDNSConfigOption where
  decode a = genericDecode jsonOptions a 
instance encodePodDNSConfigOption :: Encode PodDNSConfigOption where
  encode a = genericEncode jsonOptions a

instance defaultPodDNSConfigOption :: Default PodDNSConfigOption where
  default = PodDNSConfigOption
    { name: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodList
-- | PodList is a list of Pods.
newtype PodList = PodList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Pod))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodList :: Newtype PodList _
derive instance genericPodList :: Generic PodList _
instance showPodList :: Show PodList where show a = genericShow a
instance decodePodList :: Decode PodList where
  decode a = genericDecode jsonOptions a 
instance encodePodList :: Encode PodList where
  encode a = genericEncode jsonOptions a

instance defaultPodList :: Default PodList where
  default = PodList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodSecurityContext
-- | PodSecurityContext holds pod-level security attributes and common container settings. Some fields are also present in container.securityContext.  Field values of container.securityContext take precedence over field values of PodSecurityContext.
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
  decode a = genericDecode jsonOptions a 
instance encodePodSecurityContext :: Encode PodSecurityContext where
  encode a = genericEncode jsonOptions a

instance defaultPodSecurityContext :: Default PodSecurityContext where
  default = PodSecurityContext
    { fsGroup: NullOrUndefined Nothing
    , runAsNonRoot: NullOrUndefined Nothing
    , runAsUser: NullOrUndefined Nothing
    , seLinuxOptions: NullOrUndefined Nothing
    , supplementalGroups: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodSpec
-- | PodSpec is a description of a pod.
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
  decode a = genericDecode jsonOptions a 
instance encodePodSpec :: Encode PodSpec where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.PodStatus
-- | PodStatus represents information about the status of a pod. Status may trail the actual state of a system.
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
  decode a = genericDecode jsonOptions a 
instance encodePodStatus :: Encode PodStatus where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.PodTemplate
-- | PodTemplate describes a template for creating copies of a predefined pod.
newtype PodTemplate = PodTemplate
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , template :: (NullOrUndefined PodTemplateSpec) }

derive instance newtypePodTemplate :: Newtype PodTemplate _
derive instance genericPodTemplate :: Generic PodTemplate _
instance showPodTemplate :: Show PodTemplate where show a = genericShow a
instance decodePodTemplate :: Decode PodTemplate where
  decode a = genericDecode jsonOptions a 
instance encodePodTemplate :: Encode PodTemplate where
  encode a = genericEncode jsonOptions a

instance defaultPodTemplate :: Default PodTemplate where
  default = PodTemplate
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodTemplateList
-- | PodTemplateList is a list of PodTemplates.
newtype PodTemplateList = PodTemplateList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PodTemplate))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodTemplateList :: Newtype PodTemplateList _
derive instance genericPodTemplateList :: Generic PodTemplateList _
instance showPodTemplateList :: Show PodTemplateList where show a = genericShow a
instance decodePodTemplateList :: Decode PodTemplateList where
  decode a = genericDecode jsonOptions a 
instance encodePodTemplateList :: Encode PodTemplateList where
  encode a = genericEncode jsonOptions a

instance defaultPodTemplateList :: Default PodTemplateList where
  default = PodTemplateList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PodTemplateSpec
-- | PodTemplateSpec describes the data a pod should have when created from a template
newtype PodTemplateSpec = PodTemplateSpec
  { metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodSpec) }

derive instance newtypePodTemplateSpec :: Newtype PodTemplateSpec _
derive instance genericPodTemplateSpec :: Generic PodTemplateSpec _
instance showPodTemplateSpec :: Show PodTemplateSpec where show a = genericShow a
instance decodePodTemplateSpec :: Decode PodTemplateSpec where
  decode a = genericDecode jsonOptions a 
instance encodePodTemplateSpec :: Encode PodTemplateSpec where
  encode a = genericEncode jsonOptions a

instance defaultPodTemplateSpec :: Default PodTemplateSpec where
  default = PodTemplateSpec
    { metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PortworxVolumeSource
-- | PortworxVolumeSource represents a Portworx volume resource.
newtype PortworxVolumeSource = PortworxVolumeSource
  { fsType :: (NullOrUndefined String)
  , readOnly :: (NullOrUndefined Boolean)
  , volumeID :: (NullOrUndefined String) }

derive instance newtypePortworxVolumeSource :: Newtype PortworxVolumeSource _
derive instance genericPortworxVolumeSource :: Generic PortworxVolumeSource _
instance showPortworxVolumeSource :: Show PortworxVolumeSource where show a = genericShow a
instance decodePortworxVolumeSource :: Decode PortworxVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodePortworxVolumeSource :: Encode PortworxVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultPortworxVolumeSource :: Default PortworxVolumeSource where
  default = PortworxVolumeSource
    { fsType: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , volumeID: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.PreferredSchedulingTerm
-- | An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op).
newtype PreferredSchedulingTerm = PreferredSchedulingTerm
  { preference :: (NullOrUndefined NodeSelectorTerm)
  , weight :: (NullOrUndefined Int) }

derive instance newtypePreferredSchedulingTerm :: Newtype PreferredSchedulingTerm _
derive instance genericPreferredSchedulingTerm :: Generic PreferredSchedulingTerm _
instance showPreferredSchedulingTerm :: Show PreferredSchedulingTerm where show a = genericShow a
instance decodePreferredSchedulingTerm :: Decode PreferredSchedulingTerm where
  decode a = genericDecode jsonOptions a 
instance encodePreferredSchedulingTerm :: Encode PreferredSchedulingTerm where
  encode a = genericEncode jsonOptions a

instance defaultPreferredSchedulingTerm :: Default PreferredSchedulingTerm where
  default = PreferredSchedulingTerm
    { preference: NullOrUndefined Nothing
    , weight: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Probe
-- | Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.
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
  decode a = genericDecode jsonOptions a 
instance encodeProbe :: Encode Probe where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.ProjectedVolumeSource
-- | Represents a projected volume source
newtype ProjectedVolumeSource = ProjectedVolumeSource
  { defaultMode :: (NullOrUndefined Int)
  , sources :: (NullOrUndefined (Array VolumeProjection)) }

derive instance newtypeProjectedVolumeSource :: Newtype ProjectedVolumeSource _
derive instance genericProjectedVolumeSource :: Generic ProjectedVolumeSource _
instance showProjectedVolumeSource :: Show ProjectedVolumeSource where show a = genericShow a
instance decodeProjectedVolumeSource :: Decode ProjectedVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeProjectedVolumeSource :: Encode ProjectedVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultProjectedVolumeSource :: Default ProjectedVolumeSource where
  default = ProjectedVolumeSource
    { defaultMode: NullOrUndefined Nothing
    , sources: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.QuobyteVolumeSource
-- | Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte volumes do not support ownership management or SELinux relabeling.
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
  decode a = genericDecode jsonOptions a 
instance encodeQuobyteVolumeSource :: Encode QuobyteVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultQuobyteVolumeSource :: Default QuobyteVolumeSource where
  default = QuobyteVolumeSource
    { group: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , registry: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing
    , volume: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.RBDPersistentVolumeSource
-- | Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling.
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
  decode a = genericDecode jsonOptions a 
instance encodeRBDPersistentVolumeSource :: Encode RBDPersistentVolumeSource where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.RBDVolumeSource
-- | Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling.
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
  decode a = genericDecode jsonOptions a 
instance encodeRBDVolumeSource :: Encode RBDVolumeSource where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.ReplicationController
-- | ReplicationController represents the configuration of a replication controller.
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
  decode a = genericDecode jsonOptions a 
instance encodeReplicationController :: Encode ReplicationController where
  encode a = genericEncode jsonOptions a

instance defaultReplicationController :: Default ReplicationController where
  default = ReplicationController
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ReplicationControllerCondition
-- | ReplicationControllerCondition describes the state of a replication controller at a certain point.
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
  decode a = genericDecode jsonOptions a 
instance encodeReplicationControllerCondition :: Encode ReplicationControllerCondition where
  encode a = genericEncode jsonOptions a

instance defaultReplicationControllerCondition :: Default ReplicationControllerCondition where
  default = ReplicationControllerCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ReplicationControllerList
-- | ReplicationControllerList is a collection of replication controllers.
newtype ReplicationControllerList = ReplicationControllerList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ReplicationController))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeReplicationControllerList :: Newtype ReplicationControllerList _
derive instance genericReplicationControllerList :: Generic ReplicationControllerList _
instance showReplicationControllerList :: Show ReplicationControllerList where show a = genericShow a
instance decodeReplicationControllerList :: Decode ReplicationControllerList where
  decode a = genericDecode jsonOptions a 
instance encodeReplicationControllerList :: Encode ReplicationControllerList where
  encode a = genericEncode jsonOptions a

instance defaultReplicationControllerList :: Default ReplicationControllerList where
  default = ReplicationControllerList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ReplicationControllerSpec
-- | ReplicationControllerSpec is the specification of a replication controller.
newtype ReplicationControllerSpec = ReplicationControllerSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined (StrMap String))
  , template :: (NullOrUndefined PodTemplateSpec) }

derive instance newtypeReplicationControllerSpec :: Newtype ReplicationControllerSpec _
derive instance genericReplicationControllerSpec :: Generic ReplicationControllerSpec _
instance showReplicationControllerSpec :: Show ReplicationControllerSpec where show a = genericShow a
instance decodeReplicationControllerSpec :: Decode ReplicationControllerSpec where
  decode a = genericDecode jsonOptions a 
instance encodeReplicationControllerSpec :: Encode ReplicationControllerSpec where
  encode a = genericEncode jsonOptions a

instance defaultReplicationControllerSpec :: Default ReplicationControllerSpec where
  default = ReplicationControllerSpec
    { minReadySeconds: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ReplicationControllerStatus
-- | ReplicationControllerStatus represents the current status of a replication controller.
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
  decode a = genericDecode jsonOptions a 
instance encodeReplicationControllerStatus :: Encode ReplicationControllerStatus where
  encode a = genericEncode jsonOptions a

instance defaultReplicationControllerStatus :: Default ReplicationControllerStatus where
  default = ReplicationControllerStatus
    { availableReplicas: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , fullyLabeledReplicas: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , readyReplicas: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ResourceFieldSelector
-- | ResourceFieldSelector represents container resources (cpu, memory) and their output format
newtype ResourceFieldSelector = ResourceFieldSelector
  { containerName :: (NullOrUndefined String)
  , divisor :: (NullOrUndefined Resource.Quantity)
  , resource :: (NullOrUndefined String) }

derive instance newtypeResourceFieldSelector :: Newtype ResourceFieldSelector _
derive instance genericResourceFieldSelector :: Generic ResourceFieldSelector _
instance showResourceFieldSelector :: Show ResourceFieldSelector where show a = genericShow a
instance decodeResourceFieldSelector :: Decode ResourceFieldSelector where
  decode a = genericDecode jsonOptions a 
instance encodeResourceFieldSelector :: Encode ResourceFieldSelector where
  encode a = genericEncode jsonOptions a

instance defaultResourceFieldSelector :: Default ResourceFieldSelector where
  default = ResourceFieldSelector
    { containerName: NullOrUndefined Nothing
    , divisor: NullOrUndefined Nothing
    , resource: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ResourceQuota
-- | ResourceQuota sets aggregate quota restrictions enforced per namespace
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
  decode a = genericDecode jsonOptions a 
instance encodeResourceQuota :: Encode ResourceQuota where
  encode a = genericEncode jsonOptions a

instance defaultResourceQuota :: Default ResourceQuota where
  default = ResourceQuota
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ResourceQuotaList
-- | ResourceQuotaList is a list of ResourceQuota items.
newtype ResourceQuotaList = ResourceQuotaList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ResourceQuota))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeResourceQuotaList :: Newtype ResourceQuotaList _
derive instance genericResourceQuotaList :: Generic ResourceQuotaList _
instance showResourceQuotaList :: Show ResourceQuotaList where show a = genericShow a
instance decodeResourceQuotaList :: Decode ResourceQuotaList where
  decode a = genericDecode jsonOptions a 
instance encodeResourceQuotaList :: Encode ResourceQuotaList where
  encode a = genericEncode jsonOptions a

instance defaultResourceQuotaList :: Default ResourceQuotaList where
  default = ResourceQuotaList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ResourceQuotaSpec
-- | ResourceQuotaSpec defines the desired hard limits to enforce for Quota.
newtype ResourceQuotaSpec = ResourceQuotaSpec
  { hard :: (NullOrUndefined (StrMap Resource.Quantity))
  , scopes :: (NullOrUndefined (Array String)) }

derive instance newtypeResourceQuotaSpec :: Newtype ResourceQuotaSpec _
derive instance genericResourceQuotaSpec :: Generic ResourceQuotaSpec _
instance showResourceQuotaSpec :: Show ResourceQuotaSpec where show a = genericShow a
instance decodeResourceQuotaSpec :: Decode ResourceQuotaSpec where
  decode a = genericDecode jsonOptions a 
instance encodeResourceQuotaSpec :: Encode ResourceQuotaSpec where
  encode a = genericEncode jsonOptions a

instance defaultResourceQuotaSpec :: Default ResourceQuotaSpec where
  default = ResourceQuotaSpec
    { hard: NullOrUndefined Nothing
    , scopes: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ResourceQuotaStatus
-- | ResourceQuotaStatus defines the enforced hard limits and observed use.
newtype ResourceQuotaStatus = ResourceQuotaStatus
  { hard :: (NullOrUndefined (StrMap Resource.Quantity))
  , used :: (NullOrUndefined (StrMap Resource.Quantity)) }

derive instance newtypeResourceQuotaStatus :: Newtype ResourceQuotaStatus _
derive instance genericResourceQuotaStatus :: Generic ResourceQuotaStatus _
instance showResourceQuotaStatus :: Show ResourceQuotaStatus where show a = genericShow a
instance decodeResourceQuotaStatus :: Decode ResourceQuotaStatus where
  decode a = genericDecode jsonOptions a 
instance encodeResourceQuotaStatus :: Encode ResourceQuotaStatus where
  encode a = genericEncode jsonOptions a

instance defaultResourceQuotaStatus :: Default ResourceQuotaStatus where
  default = ResourceQuotaStatus
    { hard: NullOrUndefined Nothing
    , used: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ResourceRequirements
-- | ResourceRequirements describes the compute resource requirements.
newtype ResourceRequirements = ResourceRequirements
  { limits :: (NullOrUndefined (StrMap Resource.Quantity))
  , requests :: (NullOrUndefined (StrMap Resource.Quantity)) }

derive instance newtypeResourceRequirements :: Newtype ResourceRequirements _
derive instance genericResourceRequirements :: Generic ResourceRequirements _
instance showResourceRequirements :: Show ResourceRequirements where show a = genericShow a
instance decodeResourceRequirements :: Decode ResourceRequirements where
  decode a = genericDecode jsonOptions a 
instance encodeResourceRequirements :: Encode ResourceRequirements where
  encode a = genericEncode jsonOptions a

instance defaultResourceRequirements :: Default ResourceRequirements where
  default = ResourceRequirements
    { limits: NullOrUndefined Nothing
    , requests: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SELinuxOptions
-- | SELinuxOptions are the labels to be applied to the container
newtype SELinuxOptions = SELinuxOptions
  { _type :: (NullOrUndefined String)
  , level :: (NullOrUndefined String)
  , role :: (NullOrUndefined String)
  , user :: (NullOrUndefined String) }

derive instance newtypeSELinuxOptions :: Newtype SELinuxOptions _
derive instance genericSELinuxOptions :: Generic SELinuxOptions _
instance showSELinuxOptions :: Show SELinuxOptions where show a = genericShow a
instance decodeSELinuxOptions :: Decode SELinuxOptions where
  decode a = genericDecode jsonOptions a 
instance encodeSELinuxOptions :: Encode SELinuxOptions where
  encode a = genericEncode jsonOptions a

instance defaultSELinuxOptions :: Default SELinuxOptions where
  default = SELinuxOptions
    { _type: NullOrUndefined Nothing
    , level: NullOrUndefined Nothing
    , role: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ScaleIOPersistentVolumeSource
-- | ScaleIOPersistentVolumeSource represents a persistent ScaleIO volume
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
  decode a = genericDecode jsonOptions a 
instance encodeScaleIOPersistentVolumeSource :: Encode ScaleIOPersistentVolumeSource where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.ScaleIOVolumeSource
-- | ScaleIOVolumeSource represents a persistent ScaleIO volume
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
  decode a = genericDecode jsonOptions a 
instance encodeScaleIOVolumeSource :: Encode ScaleIOVolumeSource where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.Secret
-- | Secret holds secret data of a certain type. The total bytes of the values in the Data field must be less than MaxSecretSize bytes.
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
  decode a = genericDecode jsonOptions a 
instance encodeSecret :: Encode Secret where
  encode a = genericEncode jsonOptions a

instance defaultSecret :: Default Secret where
  default = Secret
    { _data: NullOrUndefined Nothing
    , _type: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , stringData: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SecretEnvSource
-- | SecretEnvSource selects a Secret to populate the environment variables with.
-- | 
-- | The contents of the target Secret's Data field will represent the key-value pairs as environment variables.
newtype SecretEnvSource = SecretEnvSource
  { name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeSecretEnvSource :: Newtype SecretEnvSource _
derive instance genericSecretEnvSource :: Generic SecretEnvSource _
instance showSecretEnvSource :: Show SecretEnvSource where show a = genericShow a
instance decodeSecretEnvSource :: Decode SecretEnvSource where
  decode a = genericDecode jsonOptions a 
instance encodeSecretEnvSource :: Encode SecretEnvSource where
  encode a = genericEncode jsonOptions a

instance defaultSecretEnvSource :: Default SecretEnvSource where
  default = SecretEnvSource
    { name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SecretKeySelector
-- | SecretKeySelector selects a key of a Secret.
newtype SecretKeySelector = SecretKeySelector
  { key :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeSecretKeySelector :: Newtype SecretKeySelector _
derive instance genericSecretKeySelector :: Generic SecretKeySelector _
instance showSecretKeySelector :: Show SecretKeySelector where show a = genericShow a
instance decodeSecretKeySelector :: Decode SecretKeySelector where
  decode a = genericDecode jsonOptions a 
instance encodeSecretKeySelector :: Encode SecretKeySelector where
  encode a = genericEncode jsonOptions a

instance defaultSecretKeySelector :: Default SecretKeySelector where
  default = SecretKeySelector
    { key: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SecretList
-- | SecretList is a list of Secret.
newtype SecretList = SecretList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Secret))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeSecretList :: Newtype SecretList _
derive instance genericSecretList :: Generic SecretList _
instance showSecretList :: Show SecretList where show a = genericShow a
instance decodeSecretList :: Decode SecretList where
  decode a = genericDecode jsonOptions a 
instance encodeSecretList :: Encode SecretList where
  encode a = genericEncode jsonOptions a

instance defaultSecretList :: Default SecretList where
  default = SecretList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SecretProjection
-- | Adapts a secret into a projected volume.
-- | 
-- | The contents of the target Secret's Data field will be presented in a projected volume as files using the keys in the Data field as the file names. Note that this is identical to a secret volume source without the default mode.
newtype SecretProjection = SecretProjection
  { items :: (NullOrUndefined (Array KeyToPath))
  , name :: (NullOrUndefined String)
  , optional :: (NullOrUndefined Boolean) }

derive instance newtypeSecretProjection :: Newtype SecretProjection _
derive instance genericSecretProjection :: Generic SecretProjection _
instance showSecretProjection :: Show SecretProjection where show a = genericShow a
instance decodeSecretProjection :: Decode SecretProjection where
  decode a = genericDecode jsonOptions a 
instance encodeSecretProjection :: Encode SecretProjection where
  encode a = genericEncode jsonOptions a

instance defaultSecretProjection :: Default SecretProjection where
  default = SecretProjection
    { items: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SecretReference
-- | SecretReference represents a Secret Reference. It has enough information to retrieve secret in any namespace
newtype SecretReference = SecretReference
  { name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String) }

derive instance newtypeSecretReference :: Newtype SecretReference _
derive instance genericSecretReference :: Generic SecretReference _
instance showSecretReference :: Show SecretReference where show a = genericShow a
instance decodeSecretReference :: Decode SecretReference where
  decode a = genericDecode jsonOptions a 
instance encodeSecretReference :: Encode SecretReference where
  encode a = genericEncode jsonOptions a

instance defaultSecretReference :: Default SecretReference where
  default = SecretReference
    { name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SecretVolumeSource
-- | Adapts a Secret into a volume.
-- | 
-- | The contents of the target Secret's Data field will be presented in a volume as files using the keys in the Data field as the file names. Secret volumes support ownership management and SELinux relabeling.
newtype SecretVolumeSource = SecretVolumeSource
  { defaultMode :: (NullOrUndefined Int)
  , items :: (NullOrUndefined (Array KeyToPath))
  , optional :: (NullOrUndefined Boolean)
  , secretName :: (NullOrUndefined String) }

derive instance newtypeSecretVolumeSource :: Newtype SecretVolumeSource _
derive instance genericSecretVolumeSource :: Generic SecretVolumeSource _
instance showSecretVolumeSource :: Show SecretVolumeSource where show a = genericShow a
instance decodeSecretVolumeSource :: Decode SecretVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeSecretVolumeSource :: Encode SecretVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultSecretVolumeSource :: Default SecretVolumeSource where
  default = SecretVolumeSource
    { defaultMode: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , optional: NullOrUndefined Nothing
    , secretName: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SecurityContext
-- | SecurityContext holds security configuration that will be applied to a container. Some fields are present in both SecurityContext and PodSecurityContext.  When both are set, the values in SecurityContext take precedence.
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
  decode a = genericDecode jsonOptions a 
instance encodeSecurityContext :: Encode SecurityContext where
  encode a = genericEncode jsonOptions a

instance defaultSecurityContext :: Default SecurityContext where
  default = SecurityContext
    { allowPrivilegeEscalation: NullOrUndefined Nothing
    , capabilities: NullOrUndefined Nothing
    , privileged: NullOrUndefined Nothing
    , readOnlyRootFilesystem: NullOrUndefined Nothing
    , runAsNonRoot: NullOrUndefined Nothing
    , runAsUser: NullOrUndefined Nothing
    , seLinuxOptions: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Service
-- | Service is a named abstraction of software service (for example, mysql) consisting of local port (for example 3306) that the proxy listens on, and the selector that determines which pods will answer requests sent through the proxy.
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
  decode a = genericDecode jsonOptions a 
instance encodeService :: Encode Service where
  encode a = genericEncode jsonOptions a

instance defaultService :: Default Service where
  default = Service
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ServiceAccount
-- | ServiceAccount binds together: * a name, understood by users, and perhaps by peripheral systems, for an identity * a principal that can be authenticated and authorized * a set of secrets
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
  decode a = genericDecode jsonOptions a 
instance encodeServiceAccount :: Encode ServiceAccount where
  encode a = genericEncode jsonOptions a

instance defaultServiceAccount :: Default ServiceAccount where
  default = ServiceAccount
    { apiVersion: NullOrUndefined Nothing
    , automountServiceAccountToken: NullOrUndefined Nothing
    , imagePullSecrets: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , secrets: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ServiceAccountList
-- | ServiceAccountList is a list of ServiceAccount objects
newtype ServiceAccountList = ServiceAccountList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ServiceAccount))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeServiceAccountList :: Newtype ServiceAccountList _
derive instance genericServiceAccountList :: Generic ServiceAccountList _
instance showServiceAccountList :: Show ServiceAccountList where show a = genericShow a
instance decodeServiceAccountList :: Decode ServiceAccountList where
  decode a = genericDecode jsonOptions a 
instance encodeServiceAccountList :: Encode ServiceAccountList where
  encode a = genericEncode jsonOptions a

instance defaultServiceAccountList :: Default ServiceAccountList where
  default = ServiceAccountList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ServiceList
-- | ServiceList holds a list of services.
newtype ServiceList = ServiceList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Service))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeServiceList :: Newtype ServiceList _
derive instance genericServiceList :: Generic ServiceList _
instance showServiceList :: Show ServiceList where show a = genericShow a
instance decodeServiceList :: Decode ServiceList where
  decode a = genericDecode jsonOptions a 
instance encodeServiceList :: Encode ServiceList where
  encode a = genericEncode jsonOptions a

instance defaultServiceList :: Default ServiceList where
  default = ServiceList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ServicePort
-- | ServicePort contains information on service's port.
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
  decode a = genericDecode jsonOptions a 
instance encodeServicePort :: Encode ServicePort where
  encode a = genericEncode jsonOptions a

instance defaultServicePort :: Default ServicePort where
  default = ServicePort
    { name: NullOrUndefined Nothing
    , nodePort: NullOrUndefined Nothing
    , port: NullOrUndefined Nothing
    , protocol: NullOrUndefined Nothing
    , targetPort: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.ServiceSpec
-- | ServiceSpec describes the attributes that a user creates on a service.
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
  decode a = genericDecode jsonOptions a 
instance encodeServiceSpec :: Encode ServiceSpec where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.ServiceStatus
-- | ServiceStatus represents the current status of a service.
newtype ServiceStatus = ServiceStatus
  { loadBalancer :: (NullOrUndefined LoadBalancerStatus) }

derive instance newtypeServiceStatus :: Newtype ServiceStatus _
derive instance genericServiceStatus :: Generic ServiceStatus _
instance showServiceStatus :: Show ServiceStatus where show a = genericShow a
instance decodeServiceStatus :: Decode ServiceStatus where
  decode a = genericDecode jsonOptions a 
instance encodeServiceStatus :: Encode ServiceStatus where
  encode a = genericEncode jsonOptions a

instance defaultServiceStatus :: Default ServiceStatus where
  default = ServiceStatus
    { loadBalancer: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.SessionAffinityConfig
-- | SessionAffinityConfig represents the configurations of session affinity.
newtype SessionAffinityConfig = SessionAffinityConfig
  { clientIP :: (NullOrUndefined ClientIPConfig) }

derive instance newtypeSessionAffinityConfig :: Newtype SessionAffinityConfig _
derive instance genericSessionAffinityConfig :: Generic SessionAffinityConfig _
instance showSessionAffinityConfig :: Show SessionAffinityConfig where show a = genericShow a
instance decodeSessionAffinityConfig :: Decode SessionAffinityConfig where
  decode a = genericDecode jsonOptions a 
instance encodeSessionAffinityConfig :: Encode SessionAffinityConfig where
  encode a = genericEncode jsonOptions a

instance defaultSessionAffinityConfig :: Default SessionAffinityConfig where
  default = SessionAffinityConfig
    { clientIP: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.StorageOSPersistentVolumeSource
-- | Represents a StorageOS persistent volume resource.
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
  decode a = genericDecode jsonOptions a 
instance encodeStorageOSPersistentVolumeSource :: Encode StorageOSPersistentVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultStorageOSPersistentVolumeSource :: Default StorageOSPersistentVolumeSource where
  default = StorageOSPersistentVolumeSource
    { fsType: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , volumeName: NullOrUndefined Nothing
    , volumeNamespace: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.StorageOSVolumeSource
-- | Represents a StorageOS persistent volume resource.
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
  decode a = genericDecode jsonOptions a 
instance encodeStorageOSVolumeSource :: Encode StorageOSVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultStorageOSVolumeSource :: Default StorageOSVolumeSource where
  default = StorageOSVolumeSource
    { fsType: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , secretRef: NullOrUndefined Nothing
    , volumeName: NullOrUndefined Nothing
    , volumeNamespace: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.TCPSocketAction
-- | TCPSocketAction describes an action based on opening a socket
newtype TCPSocketAction = TCPSocketAction
  { host :: (NullOrUndefined String)
  , port :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeTCPSocketAction :: Newtype TCPSocketAction _
derive instance genericTCPSocketAction :: Generic TCPSocketAction _
instance showTCPSocketAction :: Show TCPSocketAction where show a = genericShow a
instance decodeTCPSocketAction :: Decode TCPSocketAction where
  decode a = genericDecode jsonOptions a 
instance encodeTCPSocketAction :: Encode TCPSocketAction where
  encode a = genericEncode jsonOptions a

instance defaultTCPSocketAction :: Default TCPSocketAction where
  default = TCPSocketAction
    { host: NullOrUndefined Nothing
    , port: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Taint
-- | The node this Taint is attached to has the "effect" on any pod that does not tolerate the Taint.
newtype Taint = Taint
  { effect :: (NullOrUndefined String)
  , key :: (NullOrUndefined String)
  , timeAdded :: (NullOrUndefined MetaV1.Time)
  , value :: (NullOrUndefined String) }

derive instance newtypeTaint :: Newtype Taint _
derive instance genericTaint :: Generic Taint _
instance showTaint :: Show Taint where show a = genericShow a
instance decodeTaint :: Decode Taint where
  decode a = genericDecode jsonOptions a 
instance encodeTaint :: Encode Taint where
  encode a = genericEncode jsonOptions a

instance defaultTaint :: Default Taint where
  default = Taint
    { effect: NullOrUndefined Nothing
    , key: NullOrUndefined Nothing
    , timeAdded: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Toleration
-- | The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>.
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
  decode a = genericDecode jsonOptions a 
instance encodeToleration :: Encode Toleration where
  encode a = genericEncode jsonOptions a

instance defaultToleration :: Default Toleration where
  default = Toleration
    { effect: NullOrUndefined Nothing
    , key: NullOrUndefined Nothing
    , operator: NullOrUndefined Nothing
    , tolerationSeconds: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.Volume
-- | Volume represents a named volume in a pod that may be accessed by any container in the pod.
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
  decode a = genericDecode jsonOptions a 
instance encodeVolume :: Encode Volume where
  encode a = genericEncode jsonOptions a

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

-- | io.k8s.api.core.v1.VolumeDevice
-- | volumeDevice describes a mapping of a raw block device within a container.
newtype VolumeDevice = VolumeDevice
  { devicePath :: (NullOrUndefined String)
  , name :: (NullOrUndefined String) }

derive instance newtypeVolumeDevice :: Newtype VolumeDevice _
derive instance genericVolumeDevice :: Generic VolumeDevice _
instance showVolumeDevice :: Show VolumeDevice where show a = genericShow a
instance decodeVolumeDevice :: Decode VolumeDevice where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeDevice :: Encode VolumeDevice where
  encode a = genericEncode jsonOptions a

instance defaultVolumeDevice :: Default VolumeDevice where
  default = VolumeDevice
    { devicePath: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.VolumeMount
-- | VolumeMount describes a mounting of a Volume within a container.
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
  decode a = genericDecode jsonOptions a 
instance encodeVolumeMount :: Encode VolumeMount where
  encode a = genericEncode jsonOptions a

instance defaultVolumeMount :: Default VolumeMount where
  default = VolumeMount
    { mountPath: NullOrUndefined Nothing
    , mountPropagation: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , readOnly: NullOrUndefined Nothing
    , subPath: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.VolumeProjection
-- | Projection that may be projected along with other supported volume types
newtype VolumeProjection = VolumeProjection
  { configMap :: (NullOrUndefined ConfigMapProjection)
  , downwardAPI :: (NullOrUndefined DownwardAPIProjection)
  , secret :: (NullOrUndefined SecretProjection) }

derive instance newtypeVolumeProjection :: Newtype VolumeProjection _
derive instance genericVolumeProjection :: Generic VolumeProjection _
instance showVolumeProjection :: Show VolumeProjection where show a = genericShow a
instance decodeVolumeProjection :: Decode VolumeProjection where
  decode a = genericDecode jsonOptions a 
instance encodeVolumeProjection :: Encode VolumeProjection where
  encode a = genericEncode jsonOptions a

instance defaultVolumeProjection :: Default VolumeProjection where
  default = VolumeProjection
    { configMap: NullOrUndefined Nothing
    , downwardAPI: NullOrUndefined Nothing
    , secret: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.VsphereVirtualDiskVolumeSource
-- | Represents a vSphere volume resource.
newtype VsphereVirtualDiskVolumeSource = VsphereVirtualDiskVolumeSource
  { fsType :: (NullOrUndefined String)
  , storagePolicyID :: (NullOrUndefined String)
  , storagePolicyName :: (NullOrUndefined String)
  , volumePath :: (NullOrUndefined String) }

derive instance newtypeVsphereVirtualDiskVolumeSource :: Newtype VsphereVirtualDiskVolumeSource _
derive instance genericVsphereVirtualDiskVolumeSource :: Generic VsphereVirtualDiskVolumeSource _
instance showVsphereVirtualDiskVolumeSource :: Show VsphereVirtualDiskVolumeSource where show a = genericShow a
instance decodeVsphereVirtualDiskVolumeSource :: Decode VsphereVirtualDiskVolumeSource where
  decode a = genericDecode jsonOptions a 
instance encodeVsphereVirtualDiskVolumeSource :: Encode VsphereVirtualDiskVolumeSource where
  encode a = genericEncode jsonOptions a

instance defaultVsphereVirtualDiskVolumeSource :: Default VsphereVirtualDiskVolumeSource where
  default = VsphereVirtualDiskVolumeSource
    { fsType: NullOrUndefined Nothing
    , storagePolicyID: NullOrUndefined Nothing
    , storagePolicyName: NullOrUndefined Nothing
    , volumePath: NullOrUndefined Nothing }

-- | io.k8s.api.core.v1.WeightedPodAffinityTerm
-- | The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)
newtype WeightedPodAffinityTerm = WeightedPodAffinityTerm
  { podAffinityTerm :: (NullOrUndefined PodAffinityTerm)
  , weight :: (NullOrUndefined Int) }

derive instance newtypeWeightedPodAffinityTerm :: Newtype WeightedPodAffinityTerm _
derive instance genericWeightedPodAffinityTerm :: Generic WeightedPodAffinityTerm _
instance showWeightedPodAffinityTerm :: Show WeightedPodAffinityTerm where show a = genericShow a
instance decodeWeightedPodAffinityTerm :: Decode WeightedPodAffinityTerm where
  decode a = genericDecode jsonOptions a 
instance encodeWeightedPodAffinityTerm :: Encode WeightedPodAffinityTerm where
  encode a = genericEncode jsonOptions a

instance defaultWeightedPodAffinityTerm :: Default WeightedPodAffinityTerm where
  default = WeightedPodAffinityTerm
    { podAffinityTerm: NullOrUndefined Nothing
    , weight: NullOrUndefined Nothing }

-- | connect DELETE requests to proxy of Pod
connectDeleteNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedPodProxy cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect DELETE requests to proxy of Pod
connectDeleteNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedPodProxyWithPath cfg namespace name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect DELETE requests to proxy of Service
connectDeleteNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedServiceProxy cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect DELETE requests to proxy of Service
connectDeleteNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect DELETE requests to proxy of Node
connectDeleteNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNodeProxy cfg name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect DELETE requests to proxy of Node
connectDeleteNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNodeProxyWithPath cfg name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect GET requests to attach of Pod
connectGetNamespacedPodAttach :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodAttach cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/attach"

-- | connect GET requests to exec of Pod
connectGetNamespacedPodExec :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodExec cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/exec"

-- | connect GET requests to portforward of Pod
connectGetNamespacedPodPortforward :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodPortforward cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/portforward"

-- | connect GET requests to proxy of Pod
connectGetNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodProxy cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect GET requests to proxy of Pod
connectGetNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodProxyWithPath cfg namespace name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect GET requests to proxy of Service
connectGetNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedServiceProxy cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect GET requests to proxy of Service
connectGetNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect GET requests to proxy of Node
connectGetNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNodeProxy cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect GET requests to proxy of Node
connectGetNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNodeProxyWithPath cfg name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect HEAD requests to proxy of Pod
connectHeadNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedPodProxy cfg namespace name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect HEAD requests to proxy of Pod
connectHeadNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedPodProxyWithPath cfg namespace name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect HEAD requests to proxy of Service
connectHeadNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedServiceProxy cfg namespace name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect HEAD requests to proxy of Service
connectHeadNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect HEAD requests to proxy of Node
connectHeadNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNodeProxy cfg name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect HEAD requests to proxy of Node
connectHeadNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNodeProxyWithPath cfg name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect OPTIONS requests to proxy of Pod
connectOptionsNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedPodProxy cfg namespace name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect OPTIONS requests to proxy of Pod
connectOptionsNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedPodProxyWithPath cfg namespace name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect OPTIONS requests to proxy of Service
connectOptionsNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedServiceProxy cfg namespace name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect OPTIONS requests to proxy of Service
connectOptionsNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect OPTIONS requests to proxy of Node
connectOptionsNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNodeProxy cfg name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect OPTIONS requests to proxy of Node
connectOptionsNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNodeProxyWithPath cfg name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect POST requests to attach of Pod
connectPostNamespacedPodAttach :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodAttach cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/attach"

-- | connect POST requests to exec of Pod
connectPostNamespacedPodExec :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodExec cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/exec"

-- | connect POST requests to portforward of Pod
connectPostNamespacedPodPortforward :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodPortforward cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/portforward"

-- | connect POST requests to proxy of Pod
connectPostNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodProxy cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect POST requests to proxy of Pod
connectPostNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodProxyWithPath cfg namespace name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect POST requests to proxy of Service
connectPostNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedServiceProxy cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect POST requests to proxy of Service
connectPostNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect POST requests to proxy of Node
connectPostNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNodeProxy cfg name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect POST requests to proxy of Node
connectPostNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNodeProxyWithPath cfg name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect PUT requests to proxy of Pod
connectPutNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedPodProxy cfg namespace name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect PUT requests to proxy of Pod
connectPutNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedPodProxyWithPath cfg namespace name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect PUT requests to proxy of Service
connectPutNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedServiceProxy cfg namespace name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect PUT requests to proxy of Service
connectPutNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect PUT requests to proxy of Node
connectPutNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNodeProxy cfg name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect PUT requests to proxy of Node
connectPutNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNodeProxyWithPath cfg name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | create a Namespace
createNamespace :: forall e. Config -> Namespace -> Aff (http :: HTTP | e) (Either MetaV1.Status Namespace)
createNamespace cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces"
    encodedBody = encodeJSON body

-- | create a Binding
createNamespacedBinding :: forall e. Config -> String -> Binding -> Aff (http :: HTTP | e) (Either MetaV1.Status Binding)
createNamespacedBinding cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/bindings"
    encodedBody = encodeJSON body

-- | create a ConfigMap
createNamespacedConfigMap :: forall e. Config -> String -> ConfigMap -> Aff (http :: HTTP | e) (Either MetaV1.Status ConfigMap)
createNamespacedConfigMap cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/configmaps"
    encodedBody = encodeJSON body

-- | create Endpoints
createNamespacedEndpoints :: forall e. Config -> String -> Endpoints -> Aff (http :: HTTP | e) (Either MetaV1.Status Endpoints)
createNamespacedEndpoints cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/endpoints"
    encodedBody = encodeJSON body

-- | create an Event
createNamespacedEvent :: forall e. Config -> String -> Event -> Aff (http :: HTTP | e) (Either MetaV1.Status Event)
createNamespacedEvent cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/events"
    encodedBody = encodeJSON body

-- | create a LimitRange
createNamespacedLimitRange :: forall e. Config -> String -> LimitRange -> Aff (http :: HTTP | e) (Either MetaV1.Status LimitRange)
createNamespacedLimitRange cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/limitranges"
    encodedBody = encodeJSON body

-- | create a PersistentVolumeClaim
createNamespacedPersistentVolumeClaim :: forall e. Config -> String -> PersistentVolumeClaim -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolumeClaim)
createNamespacedPersistentVolumeClaim cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/persistentvolumeclaims"
    encodedBody = encodeJSON body

-- | create a Pod
createNamespacedPod :: forall e. Config -> String -> Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status Pod)
createNamespacedPod cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods"
    encodedBody = encodeJSON body

-- | create binding of a Pod
createNamespacedPodBinding :: forall e. Config -> String -> String -> Binding -> Aff (http :: HTTP | e) (Either MetaV1.Status Binding)
createNamespacedPodBinding cfg namespace name body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/binding"
    encodedBody = encodeJSON body

-- | create a PodTemplate
createNamespacedPodTemplate :: forall e. Config -> String -> PodTemplate -> Aff (http :: HTTP | e) (Either MetaV1.Status PodTemplate)
createNamespacedPodTemplate cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/podtemplates"
    encodedBody = encodeJSON body

-- | create a ReplicationController
createNamespacedReplicationController :: forall e. Config -> String -> ReplicationController -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicationController)
createNamespacedReplicationController cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers"
    encodedBody = encodeJSON body

-- | create a ResourceQuota
createNamespacedResourceQuota :: forall e. Config -> String -> ResourceQuota -> Aff (http :: HTTP | e) (Either MetaV1.Status ResourceQuota)
createNamespacedResourceQuota cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/resourcequotas"
    encodedBody = encodeJSON body

-- | create a Secret
createNamespacedSecret :: forall e. Config -> String -> Secret -> Aff (http :: HTTP | e) (Either MetaV1.Status Secret)
createNamespacedSecret cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/secrets"
    encodedBody = encodeJSON body

-- | create a Service
createNamespacedService :: forall e. Config -> String -> Service -> Aff (http :: HTTP | e) (Either MetaV1.Status Service)
createNamespacedService cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services"
    encodedBody = encodeJSON body

-- | create a ServiceAccount
createNamespacedServiceAccount :: forall e. Config -> String -> ServiceAccount -> Aff (http :: HTTP | e) (Either MetaV1.Status ServiceAccount)
createNamespacedServiceAccount cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/serviceaccounts"
    encodedBody = encodeJSON body

-- | create a Node
createNode :: forall e. Config -> Node -> Aff (http :: HTTP | e) (Either MetaV1.Status Node)
createNode cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/nodes"
    encodedBody = encodeJSON body

-- | create a PersistentVolume
createPersistentVolume :: forall e. Config -> PersistentVolume -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolume)
createPersistentVolume cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/persistentvolumes"
    encodedBody = encodeJSON body

-- | DeleteCollectionNamespacedConfigMapOptions
newtype DeleteCollectionNamespacedConfigMapOptions = DeleteCollectionNamespacedConfigMapOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedConfigMapOptions :: Newtype DeleteCollectionNamespacedConfigMapOptions _
derive instance genericDeleteCollectionNamespacedConfigMapOptions :: Generic DeleteCollectionNamespacedConfigMapOptions _
instance showDeleteCollectionNamespacedConfigMapOptions :: Show DeleteCollectionNamespacedConfigMapOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedConfigMapOptions :: Decode DeleteCollectionNamespacedConfigMapOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedConfigMapOptions :: Encode DeleteCollectionNamespacedConfigMapOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedConfigMapOptions :: Default DeleteCollectionNamespacedConfigMapOptions where
  default = DeleteCollectionNamespacedConfigMapOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ConfigMap
deleteCollectionNamespacedConfigMap :: forall e. Config -> String -> DeleteCollectionNamespacedConfigMapOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedConfigMap cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/configmaps" <> formatQueryString options

-- | DeleteCollectionNamespacedEndpointsOptions
newtype DeleteCollectionNamespacedEndpointsOptions = DeleteCollectionNamespacedEndpointsOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedEndpointsOptions :: Newtype DeleteCollectionNamespacedEndpointsOptions _
derive instance genericDeleteCollectionNamespacedEndpointsOptions :: Generic DeleteCollectionNamespacedEndpointsOptions _
instance showDeleteCollectionNamespacedEndpointsOptions :: Show DeleteCollectionNamespacedEndpointsOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedEndpointsOptions :: Decode DeleteCollectionNamespacedEndpointsOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedEndpointsOptions :: Encode DeleteCollectionNamespacedEndpointsOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedEndpointsOptions :: Default DeleteCollectionNamespacedEndpointsOptions where
  default = DeleteCollectionNamespacedEndpointsOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Endpoints
deleteCollectionNamespacedEndpoints :: forall e. Config -> String -> DeleteCollectionNamespacedEndpointsOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedEndpoints cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/endpoints" <> formatQueryString options

-- | DeleteCollectionNamespacedEventOptions
newtype DeleteCollectionNamespacedEventOptions = DeleteCollectionNamespacedEventOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedEventOptions :: Newtype DeleteCollectionNamespacedEventOptions _
derive instance genericDeleteCollectionNamespacedEventOptions :: Generic DeleteCollectionNamespacedEventOptions _
instance showDeleteCollectionNamespacedEventOptions :: Show DeleteCollectionNamespacedEventOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedEventOptions :: Decode DeleteCollectionNamespacedEventOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedEventOptions :: Encode DeleteCollectionNamespacedEventOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedEventOptions :: Default DeleteCollectionNamespacedEventOptions where
  default = DeleteCollectionNamespacedEventOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Event
deleteCollectionNamespacedEvent :: forall e. Config -> String -> DeleteCollectionNamespacedEventOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedEvent cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/events" <> formatQueryString options

-- | DeleteCollectionNamespacedLimitRangeOptions
newtype DeleteCollectionNamespacedLimitRangeOptions = DeleteCollectionNamespacedLimitRangeOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedLimitRangeOptions :: Newtype DeleteCollectionNamespacedLimitRangeOptions _
derive instance genericDeleteCollectionNamespacedLimitRangeOptions :: Generic DeleteCollectionNamespacedLimitRangeOptions _
instance showDeleteCollectionNamespacedLimitRangeOptions :: Show DeleteCollectionNamespacedLimitRangeOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedLimitRangeOptions :: Decode DeleteCollectionNamespacedLimitRangeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedLimitRangeOptions :: Encode DeleteCollectionNamespacedLimitRangeOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedLimitRangeOptions :: Default DeleteCollectionNamespacedLimitRangeOptions where
  default = DeleteCollectionNamespacedLimitRangeOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of LimitRange
deleteCollectionNamespacedLimitRange :: forall e. Config -> String -> DeleteCollectionNamespacedLimitRangeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedLimitRange cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/limitranges" <> formatQueryString options

-- | DeleteCollectionNamespacedPersistentVolumeClaimOptions
newtype DeleteCollectionNamespacedPersistentVolumeClaimOptions = DeleteCollectionNamespacedPersistentVolumeClaimOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedPersistentVolumeClaimOptions :: Newtype DeleteCollectionNamespacedPersistentVolumeClaimOptions _
derive instance genericDeleteCollectionNamespacedPersistentVolumeClaimOptions :: Generic DeleteCollectionNamespacedPersistentVolumeClaimOptions _
instance showDeleteCollectionNamespacedPersistentVolumeClaimOptions :: Show DeleteCollectionNamespacedPersistentVolumeClaimOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedPersistentVolumeClaimOptions :: Decode DeleteCollectionNamespacedPersistentVolumeClaimOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedPersistentVolumeClaimOptions :: Encode DeleteCollectionNamespacedPersistentVolumeClaimOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedPersistentVolumeClaimOptions :: Default DeleteCollectionNamespacedPersistentVolumeClaimOptions where
  default = DeleteCollectionNamespacedPersistentVolumeClaimOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PersistentVolumeClaim
deleteCollectionNamespacedPersistentVolumeClaim :: forall e. Config -> String -> DeleteCollectionNamespacedPersistentVolumeClaimOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedPersistentVolumeClaim cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/persistentvolumeclaims" <> formatQueryString options

-- | DeleteCollectionNamespacedPodOptions
newtype DeleteCollectionNamespacedPodOptions = DeleteCollectionNamespacedPodOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedPodOptions :: Newtype DeleteCollectionNamespacedPodOptions _
derive instance genericDeleteCollectionNamespacedPodOptions :: Generic DeleteCollectionNamespacedPodOptions _
instance showDeleteCollectionNamespacedPodOptions :: Show DeleteCollectionNamespacedPodOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedPodOptions :: Decode DeleteCollectionNamespacedPodOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedPodOptions :: Encode DeleteCollectionNamespacedPodOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedPodOptions :: Default DeleteCollectionNamespacedPodOptions where
  default = DeleteCollectionNamespacedPodOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Pod
deleteCollectionNamespacedPod :: forall e. Config -> String -> DeleteCollectionNamespacedPodOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedPod cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods" <> formatQueryString options

-- | DeleteCollectionNamespacedPodTemplateOptions
newtype DeleteCollectionNamespacedPodTemplateOptions = DeleteCollectionNamespacedPodTemplateOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedPodTemplateOptions :: Newtype DeleteCollectionNamespacedPodTemplateOptions _
derive instance genericDeleteCollectionNamespacedPodTemplateOptions :: Generic DeleteCollectionNamespacedPodTemplateOptions _
instance showDeleteCollectionNamespacedPodTemplateOptions :: Show DeleteCollectionNamespacedPodTemplateOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedPodTemplateOptions :: Decode DeleteCollectionNamespacedPodTemplateOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedPodTemplateOptions :: Encode DeleteCollectionNamespacedPodTemplateOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedPodTemplateOptions :: Default DeleteCollectionNamespacedPodTemplateOptions where
  default = DeleteCollectionNamespacedPodTemplateOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PodTemplate
deleteCollectionNamespacedPodTemplate :: forall e. Config -> String -> DeleteCollectionNamespacedPodTemplateOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedPodTemplate cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/podtemplates" <> formatQueryString options

-- | DeleteCollectionNamespacedReplicationControllerOptions
newtype DeleteCollectionNamespacedReplicationControllerOptions = DeleteCollectionNamespacedReplicationControllerOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedReplicationControllerOptions :: Newtype DeleteCollectionNamespacedReplicationControllerOptions _
derive instance genericDeleteCollectionNamespacedReplicationControllerOptions :: Generic DeleteCollectionNamespacedReplicationControllerOptions _
instance showDeleteCollectionNamespacedReplicationControllerOptions :: Show DeleteCollectionNamespacedReplicationControllerOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedReplicationControllerOptions :: Decode DeleteCollectionNamespacedReplicationControllerOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedReplicationControllerOptions :: Encode DeleteCollectionNamespacedReplicationControllerOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedReplicationControllerOptions :: Default DeleteCollectionNamespacedReplicationControllerOptions where
  default = DeleteCollectionNamespacedReplicationControllerOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ReplicationController
deleteCollectionNamespacedReplicationController :: forall e. Config -> String -> DeleteCollectionNamespacedReplicationControllerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedReplicationController cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers" <> formatQueryString options

-- | DeleteCollectionNamespacedResourceQuotaOptions
newtype DeleteCollectionNamespacedResourceQuotaOptions = DeleteCollectionNamespacedResourceQuotaOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedResourceQuotaOptions :: Newtype DeleteCollectionNamespacedResourceQuotaOptions _
derive instance genericDeleteCollectionNamespacedResourceQuotaOptions :: Generic DeleteCollectionNamespacedResourceQuotaOptions _
instance showDeleteCollectionNamespacedResourceQuotaOptions :: Show DeleteCollectionNamespacedResourceQuotaOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedResourceQuotaOptions :: Decode DeleteCollectionNamespacedResourceQuotaOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedResourceQuotaOptions :: Encode DeleteCollectionNamespacedResourceQuotaOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedResourceQuotaOptions :: Default DeleteCollectionNamespacedResourceQuotaOptions where
  default = DeleteCollectionNamespacedResourceQuotaOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ResourceQuota
deleteCollectionNamespacedResourceQuota :: forall e. Config -> String -> DeleteCollectionNamespacedResourceQuotaOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedResourceQuota cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/resourcequotas" <> formatQueryString options

-- | DeleteCollectionNamespacedSecretOptions
newtype DeleteCollectionNamespacedSecretOptions = DeleteCollectionNamespacedSecretOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedSecretOptions :: Newtype DeleteCollectionNamespacedSecretOptions _
derive instance genericDeleteCollectionNamespacedSecretOptions :: Generic DeleteCollectionNamespacedSecretOptions _
instance showDeleteCollectionNamespacedSecretOptions :: Show DeleteCollectionNamespacedSecretOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedSecretOptions :: Decode DeleteCollectionNamespacedSecretOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedSecretOptions :: Encode DeleteCollectionNamespacedSecretOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedSecretOptions :: Default DeleteCollectionNamespacedSecretOptions where
  default = DeleteCollectionNamespacedSecretOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Secret
deleteCollectionNamespacedSecret :: forall e. Config -> String -> DeleteCollectionNamespacedSecretOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedSecret cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/secrets" <> formatQueryString options

-- | DeleteCollectionNamespacedServiceAccountOptions
newtype DeleteCollectionNamespacedServiceAccountOptions = DeleteCollectionNamespacedServiceAccountOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedServiceAccountOptions :: Newtype DeleteCollectionNamespacedServiceAccountOptions _
derive instance genericDeleteCollectionNamespacedServiceAccountOptions :: Generic DeleteCollectionNamespacedServiceAccountOptions _
instance showDeleteCollectionNamespacedServiceAccountOptions :: Show DeleteCollectionNamespacedServiceAccountOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedServiceAccountOptions :: Decode DeleteCollectionNamespacedServiceAccountOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedServiceAccountOptions :: Encode DeleteCollectionNamespacedServiceAccountOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedServiceAccountOptions :: Default DeleteCollectionNamespacedServiceAccountOptions where
  default = DeleteCollectionNamespacedServiceAccountOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ServiceAccount
deleteCollectionNamespacedServiceAccount :: forall e. Config -> String -> DeleteCollectionNamespacedServiceAccountOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedServiceAccount cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/serviceaccounts" <> formatQueryString options

-- | DeleteCollectionNodeOptions
newtype DeleteCollectionNodeOptions = DeleteCollectionNodeOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNodeOptions :: Newtype DeleteCollectionNodeOptions _
derive instance genericDeleteCollectionNodeOptions :: Generic DeleteCollectionNodeOptions _
instance showDeleteCollectionNodeOptions :: Show DeleteCollectionNodeOptions where show a = genericShow a
instance decodeDeleteCollectionNodeOptions :: Decode DeleteCollectionNodeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNodeOptions :: Encode DeleteCollectionNodeOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNodeOptions :: Default DeleteCollectionNodeOptions where
  default = DeleteCollectionNodeOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Node
deleteCollectionNode :: forall e. Config -> DeleteCollectionNodeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNode cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/nodes" <> formatQueryString options

-- | DeleteCollectionPersistentVolumeOptions
newtype DeleteCollectionPersistentVolumeOptions = DeleteCollectionPersistentVolumeOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionPersistentVolumeOptions :: Newtype DeleteCollectionPersistentVolumeOptions _
derive instance genericDeleteCollectionPersistentVolumeOptions :: Generic DeleteCollectionPersistentVolumeOptions _
instance showDeleteCollectionPersistentVolumeOptions :: Show DeleteCollectionPersistentVolumeOptions where show a = genericShow a
instance decodeDeleteCollectionPersistentVolumeOptions :: Decode DeleteCollectionPersistentVolumeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionPersistentVolumeOptions :: Encode DeleteCollectionPersistentVolumeOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionPersistentVolumeOptions :: Default DeleteCollectionPersistentVolumeOptions where
  default = DeleteCollectionPersistentVolumeOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PersistentVolume
deleteCollectionPersistentVolume :: forall e. Config -> DeleteCollectionPersistentVolumeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionPersistentVolume cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/persistentvolumes" <> formatQueryString options

-- | DeleteNamespaceOptions
newtype DeleteNamespaceOptions = DeleteNamespaceOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespaceOptions :: Newtype DeleteNamespaceOptions _
derive instance genericDeleteNamespaceOptions :: Generic DeleteNamespaceOptions _
instance showDeleteNamespaceOptions :: Show DeleteNamespaceOptions where show a = genericShow a
instance decodeDeleteNamespaceOptions :: Decode DeleteNamespaceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespaceOptions :: Encode DeleteNamespaceOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespaceOptions :: Default DeleteNamespaceOptions where
  default = DeleteNamespaceOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a Namespace
deleteNamespace :: forall e. Config -> String -> MetaV1.DeleteOptions -> DeleteNamespaceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Namespace)
deleteNamespace cfg name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedConfigMapOptions
newtype DeleteNamespacedConfigMapOptions = DeleteNamespacedConfigMapOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedConfigMapOptions :: Newtype DeleteNamespacedConfigMapOptions _
derive instance genericDeleteNamespacedConfigMapOptions :: Generic DeleteNamespacedConfigMapOptions _
instance showDeleteNamespacedConfigMapOptions :: Show DeleteNamespacedConfigMapOptions where show a = genericShow a
instance decodeDeleteNamespacedConfigMapOptions :: Decode DeleteNamespacedConfigMapOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedConfigMapOptions :: Encode DeleteNamespacedConfigMapOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedConfigMapOptions :: Default DeleteNamespacedConfigMapOptions where
  default = DeleteNamespacedConfigMapOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ConfigMap
deleteNamespacedConfigMap :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedConfigMapOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedConfigMap cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/configmaps/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedEndpointsOptions
newtype DeleteNamespacedEndpointsOptions = DeleteNamespacedEndpointsOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedEndpointsOptions :: Newtype DeleteNamespacedEndpointsOptions _
derive instance genericDeleteNamespacedEndpointsOptions :: Generic DeleteNamespacedEndpointsOptions _
instance showDeleteNamespacedEndpointsOptions :: Show DeleteNamespacedEndpointsOptions where show a = genericShow a
instance decodeDeleteNamespacedEndpointsOptions :: Decode DeleteNamespacedEndpointsOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedEndpointsOptions :: Encode DeleteNamespacedEndpointsOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedEndpointsOptions :: Default DeleteNamespacedEndpointsOptions where
  default = DeleteNamespacedEndpointsOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete Endpoints
deleteNamespacedEndpoints :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedEndpointsOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedEndpoints cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/endpoints/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedEventOptions
newtype DeleteNamespacedEventOptions = DeleteNamespacedEventOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedEventOptions :: Newtype DeleteNamespacedEventOptions _
derive instance genericDeleteNamespacedEventOptions :: Generic DeleteNamespacedEventOptions _
instance showDeleteNamespacedEventOptions :: Show DeleteNamespacedEventOptions where show a = genericShow a
instance decodeDeleteNamespacedEventOptions :: Decode DeleteNamespacedEventOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedEventOptions :: Encode DeleteNamespacedEventOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedEventOptions :: Default DeleteNamespacedEventOptions where
  default = DeleteNamespacedEventOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete an Event
deleteNamespacedEvent :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedEventOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedEvent cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/events/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedLimitRangeOptions
newtype DeleteNamespacedLimitRangeOptions = DeleteNamespacedLimitRangeOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedLimitRangeOptions :: Newtype DeleteNamespacedLimitRangeOptions _
derive instance genericDeleteNamespacedLimitRangeOptions :: Generic DeleteNamespacedLimitRangeOptions _
instance showDeleteNamespacedLimitRangeOptions :: Show DeleteNamespacedLimitRangeOptions where show a = genericShow a
instance decodeDeleteNamespacedLimitRangeOptions :: Decode DeleteNamespacedLimitRangeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedLimitRangeOptions :: Encode DeleteNamespacedLimitRangeOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedLimitRangeOptions :: Default DeleteNamespacedLimitRangeOptions where
  default = DeleteNamespacedLimitRangeOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a LimitRange
deleteNamespacedLimitRange :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedLimitRangeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedLimitRange cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/limitranges/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedPersistentVolumeClaimOptions
newtype DeleteNamespacedPersistentVolumeClaimOptions = DeleteNamespacedPersistentVolumeClaimOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedPersistentVolumeClaimOptions :: Newtype DeleteNamespacedPersistentVolumeClaimOptions _
derive instance genericDeleteNamespacedPersistentVolumeClaimOptions :: Generic DeleteNamespacedPersistentVolumeClaimOptions _
instance showDeleteNamespacedPersistentVolumeClaimOptions :: Show DeleteNamespacedPersistentVolumeClaimOptions where show a = genericShow a
instance decodeDeleteNamespacedPersistentVolumeClaimOptions :: Decode DeleteNamespacedPersistentVolumeClaimOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedPersistentVolumeClaimOptions :: Encode DeleteNamespacedPersistentVolumeClaimOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedPersistentVolumeClaimOptions :: Default DeleteNamespacedPersistentVolumeClaimOptions where
  default = DeleteNamespacedPersistentVolumeClaimOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PersistentVolumeClaim
deleteNamespacedPersistentVolumeClaim :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedPersistentVolumeClaimOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedPersistentVolumeClaim cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/persistentvolumeclaims/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedPodOptions
newtype DeleteNamespacedPodOptions = DeleteNamespacedPodOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedPodOptions :: Newtype DeleteNamespacedPodOptions _
derive instance genericDeleteNamespacedPodOptions :: Generic DeleteNamespacedPodOptions _
instance showDeleteNamespacedPodOptions :: Show DeleteNamespacedPodOptions where show a = genericShow a
instance decodeDeleteNamespacedPodOptions :: Decode DeleteNamespacedPodOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedPodOptions :: Encode DeleteNamespacedPodOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedPodOptions :: Default DeleteNamespacedPodOptions where
  default = DeleteNamespacedPodOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a Pod
deleteNamespacedPod :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedPodOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedPod cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedPodTemplateOptions
newtype DeleteNamespacedPodTemplateOptions = DeleteNamespacedPodTemplateOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedPodTemplateOptions :: Newtype DeleteNamespacedPodTemplateOptions _
derive instance genericDeleteNamespacedPodTemplateOptions :: Generic DeleteNamespacedPodTemplateOptions _
instance showDeleteNamespacedPodTemplateOptions :: Show DeleteNamespacedPodTemplateOptions where show a = genericShow a
instance decodeDeleteNamespacedPodTemplateOptions :: Decode DeleteNamespacedPodTemplateOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedPodTemplateOptions :: Encode DeleteNamespacedPodTemplateOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedPodTemplateOptions :: Default DeleteNamespacedPodTemplateOptions where
  default = DeleteNamespacedPodTemplateOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PodTemplate
deleteNamespacedPodTemplate :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedPodTemplateOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedPodTemplate cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/podtemplates/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedReplicationControllerOptions
newtype DeleteNamespacedReplicationControllerOptions = DeleteNamespacedReplicationControllerOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedReplicationControllerOptions :: Newtype DeleteNamespacedReplicationControllerOptions _
derive instance genericDeleteNamespacedReplicationControllerOptions :: Generic DeleteNamespacedReplicationControllerOptions _
instance showDeleteNamespacedReplicationControllerOptions :: Show DeleteNamespacedReplicationControllerOptions where show a = genericShow a
instance decodeDeleteNamespacedReplicationControllerOptions :: Decode DeleteNamespacedReplicationControllerOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedReplicationControllerOptions :: Encode DeleteNamespacedReplicationControllerOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedReplicationControllerOptions :: Default DeleteNamespacedReplicationControllerOptions where
  default = DeleteNamespacedReplicationControllerOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ReplicationController
deleteNamespacedReplicationController :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedReplicationControllerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedReplicationController cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedResourceQuotaOptions
newtype DeleteNamespacedResourceQuotaOptions = DeleteNamespacedResourceQuotaOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedResourceQuotaOptions :: Newtype DeleteNamespacedResourceQuotaOptions _
derive instance genericDeleteNamespacedResourceQuotaOptions :: Generic DeleteNamespacedResourceQuotaOptions _
instance showDeleteNamespacedResourceQuotaOptions :: Show DeleteNamespacedResourceQuotaOptions where show a = genericShow a
instance decodeDeleteNamespacedResourceQuotaOptions :: Decode DeleteNamespacedResourceQuotaOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedResourceQuotaOptions :: Encode DeleteNamespacedResourceQuotaOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedResourceQuotaOptions :: Default DeleteNamespacedResourceQuotaOptions where
  default = DeleteNamespacedResourceQuotaOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ResourceQuota
deleteNamespacedResourceQuota :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedResourceQuotaOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedResourceQuota cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/resourcequotas/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedSecretOptions
newtype DeleteNamespacedSecretOptions = DeleteNamespacedSecretOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedSecretOptions :: Newtype DeleteNamespacedSecretOptions _
derive instance genericDeleteNamespacedSecretOptions :: Generic DeleteNamespacedSecretOptions _
instance showDeleteNamespacedSecretOptions :: Show DeleteNamespacedSecretOptions where show a = genericShow a
instance decodeDeleteNamespacedSecretOptions :: Decode DeleteNamespacedSecretOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedSecretOptions :: Encode DeleteNamespacedSecretOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedSecretOptions :: Default DeleteNamespacedSecretOptions where
  default = DeleteNamespacedSecretOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a Secret
deleteNamespacedSecret :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedSecretOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedSecret cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/secrets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | delete a Service
deleteNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedService cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | DeleteNamespacedServiceAccountOptions
newtype DeleteNamespacedServiceAccountOptions = DeleteNamespacedServiceAccountOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedServiceAccountOptions :: Newtype DeleteNamespacedServiceAccountOptions _
derive instance genericDeleteNamespacedServiceAccountOptions :: Generic DeleteNamespacedServiceAccountOptions _
instance showDeleteNamespacedServiceAccountOptions :: Show DeleteNamespacedServiceAccountOptions where show a = genericShow a
instance decodeDeleteNamespacedServiceAccountOptions :: Decode DeleteNamespacedServiceAccountOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedServiceAccountOptions :: Encode DeleteNamespacedServiceAccountOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedServiceAccountOptions :: Default DeleteNamespacedServiceAccountOptions where
  default = DeleteNamespacedServiceAccountOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ServiceAccount
deleteNamespacedServiceAccount :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedServiceAccountOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedServiceAccount cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/serviceaccounts/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNodeOptions
newtype DeleteNodeOptions = DeleteNodeOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNodeOptions :: Newtype DeleteNodeOptions _
derive instance genericDeleteNodeOptions :: Generic DeleteNodeOptions _
instance showDeleteNodeOptions :: Show DeleteNodeOptions where show a = genericShow a
instance decodeDeleteNodeOptions :: Decode DeleteNodeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNodeOptions :: Encode DeleteNodeOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNodeOptions :: Default DeleteNodeOptions where
  default = DeleteNodeOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a Node
deleteNode :: forall e. Config -> String -> MetaV1.DeleteOptions -> DeleteNodeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNode cfg name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/nodes/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeletePersistentVolumeOptions
newtype DeletePersistentVolumeOptions = DeletePersistentVolumeOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeletePersistentVolumeOptions :: Newtype DeletePersistentVolumeOptions _
derive instance genericDeletePersistentVolumeOptions :: Generic DeletePersistentVolumeOptions _
instance showDeletePersistentVolumeOptions :: Show DeletePersistentVolumeOptions where show a = genericShow a
instance decodeDeletePersistentVolumeOptions :: Decode DeletePersistentVolumeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeletePersistentVolumeOptions :: Encode DeletePersistentVolumeOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeletePersistentVolumeOptions :: Default DeletePersistentVolumeOptions where
  default = DeletePersistentVolumeOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PersistentVolume
deletePersistentVolume :: forall e. Config -> String -> MetaV1.DeleteOptions -> DeletePersistentVolumeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deletePersistentVolume cfg name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/persistentvolumes/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/"

-- | list objects of kind ComponentStatus
listComponentStatus :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ComponentStatusList)
listComponentStatus cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/componentstatuses"

-- | list or watch objects of kind ConfigMap
listConfigMapForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ConfigMapList)
listConfigMapForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/configmaps"

-- | list or watch objects of kind Endpoints
listEndpointsForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status EndpointsList)
listEndpointsForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/endpoints"

-- | list or watch objects of kind Event
listEventForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status EventList)
listEventForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/events"

-- | list or watch objects of kind LimitRange
listLimitRangeForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status LimitRangeList)
listLimitRangeForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/limitranges"

-- | ListNamespaceOptions
newtype ListNamespaceOptions = ListNamespaceOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespaceOptions :: Newtype ListNamespaceOptions _
derive instance genericListNamespaceOptions :: Generic ListNamespaceOptions _
instance showListNamespaceOptions :: Show ListNamespaceOptions where show a = genericShow a
instance decodeListNamespaceOptions :: Decode ListNamespaceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespaceOptions :: Encode ListNamespaceOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespaceOptions :: Default ListNamespaceOptions where
  default = ListNamespaceOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Namespace
listNamespace :: forall e. Config -> ListNamespaceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status NamespaceList)
listNamespace cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces" <> formatQueryString options

-- | ListNamespacedConfigMapOptions
newtype ListNamespacedConfigMapOptions = ListNamespacedConfigMapOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedConfigMapOptions :: Newtype ListNamespacedConfigMapOptions _
derive instance genericListNamespacedConfigMapOptions :: Generic ListNamespacedConfigMapOptions _
instance showListNamespacedConfigMapOptions :: Show ListNamespacedConfigMapOptions where show a = genericShow a
instance decodeListNamespacedConfigMapOptions :: Decode ListNamespacedConfigMapOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedConfigMapOptions :: Encode ListNamespacedConfigMapOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedConfigMapOptions :: Default ListNamespacedConfigMapOptions where
  default = ListNamespacedConfigMapOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ConfigMap
listNamespacedConfigMap :: forall e. Config -> String -> ListNamespacedConfigMapOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ConfigMapList)
listNamespacedConfigMap cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/configmaps" <> formatQueryString options

-- | ListNamespacedEndpointsOptions
newtype ListNamespacedEndpointsOptions = ListNamespacedEndpointsOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedEndpointsOptions :: Newtype ListNamespacedEndpointsOptions _
derive instance genericListNamespacedEndpointsOptions :: Generic ListNamespacedEndpointsOptions _
instance showListNamespacedEndpointsOptions :: Show ListNamespacedEndpointsOptions where show a = genericShow a
instance decodeListNamespacedEndpointsOptions :: Decode ListNamespacedEndpointsOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedEndpointsOptions :: Encode ListNamespacedEndpointsOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedEndpointsOptions :: Default ListNamespacedEndpointsOptions where
  default = ListNamespacedEndpointsOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Endpoints
listNamespacedEndpoints :: forall e. Config -> String -> ListNamespacedEndpointsOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status EndpointsList)
listNamespacedEndpoints cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/endpoints" <> formatQueryString options

-- | ListNamespacedEventOptions
newtype ListNamespacedEventOptions = ListNamespacedEventOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedEventOptions :: Newtype ListNamespacedEventOptions _
derive instance genericListNamespacedEventOptions :: Generic ListNamespacedEventOptions _
instance showListNamespacedEventOptions :: Show ListNamespacedEventOptions where show a = genericShow a
instance decodeListNamespacedEventOptions :: Decode ListNamespacedEventOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedEventOptions :: Encode ListNamespacedEventOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedEventOptions :: Default ListNamespacedEventOptions where
  default = ListNamespacedEventOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Event
listNamespacedEvent :: forall e. Config -> String -> ListNamespacedEventOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status EventList)
listNamespacedEvent cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/events" <> formatQueryString options

-- | ListNamespacedLimitRangeOptions
newtype ListNamespacedLimitRangeOptions = ListNamespacedLimitRangeOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedLimitRangeOptions :: Newtype ListNamespacedLimitRangeOptions _
derive instance genericListNamespacedLimitRangeOptions :: Generic ListNamespacedLimitRangeOptions _
instance showListNamespacedLimitRangeOptions :: Show ListNamespacedLimitRangeOptions where show a = genericShow a
instance decodeListNamespacedLimitRangeOptions :: Decode ListNamespacedLimitRangeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedLimitRangeOptions :: Encode ListNamespacedLimitRangeOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedLimitRangeOptions :: Default ListNamespacedLimitRangeOptions where
  default = ListNamespacedLimitRangeOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind LimitRange
listNamespacedLimitRange :: forall e. Config -> String -> ListNamespacedLimitRangeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status LimitRangeList)
listNamespacedLimitRange cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/limitranges" <> formatQueryString options

-- | ListNamespacedPersistentVolumeClaimOptions
newtype ListNamespacedPersistentVolumeClaimOptions = ListNamespacedPersistentVolumeClaimOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedPersistentVolumeClaimOptions :: Newtype ListNamespacedPersistentVolumeClaimOptions _
derive instance genericListNamespacedPersistentVolumeClaimOptions :: Generic ListNamespacedPersistentVolumeClaimOptions _
instance showListNamespacedPersistentVolumeClaimOptions :: Show ListNamespacedPersistentVolumeClaimOptions where show a = genericShow a
instance decodeListNamespacedPersistentVolumeClaimOptions :: Decode ListNamespacedPersistentVolumeClaimOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedPersistentVolumeClaimOptions :: Encode ListNamespacedPersistentVolumeClaimOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedPersistentVolumeClaimOptions :: Default ListNamespacedPersistentVolumeClaimOptions where
  default = ListNamespacedPersistentVolumeClaimOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PersistentVolumeClaim
listNamespacedPersistentVolumeClaim :: forall e. Config -> String -> ListNamespacedPersistentVolumeClaimOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolumeClaimList)
listNamespacedPersistentVolumeClaim cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/persistentvolumeclaims" <> formatQueryString options

-- | ListNamespacedPodOptions
newtype ListNamespacedPodOptions = ListNamespacedPodOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedPodOptions :: Newtype ListNamespacedPodOptions _
derive instance genericListNamespacedPodOptions :: Generic ListNamespacedPodOptions _
instance showListNamespacedPodOptions :: Show ListNamespacedPodOptions where show a = genericShow a
instance decodeListNamespacedPodOptions :: Decode ListNamespacedPodOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedPodOptions :: Encode ListNamespacedPodOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedPodOptions :: Default ListNamespacedPodOptions where
  default = ListNamespacedPodOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Pod
listNamespacedPod :: forall e. Config -> String -> ListNamespacedPodOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodList)
listNamespacedPod cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods" <> formatQueryString options

-- | ListNamespacedPodTemplateOptions
newtype ListNamespacedPodTemplateOptions = ListNamespacedPodTemplateOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedPodTemplateOptions :: Newtype ListNamespacedPodTemplateOptions _
derive instance genericListNamespacedPodTemplateOptions :: Generic ListNamespacedPodTemplateOptions _
instance showListNamespacedPodTemplateOptions :: Show ListNamespacedPodTemplateOptions where show a = genericShow a
instance decodeListNamespacedPodTemplateOptions :: Decode ListNamespacedPodTemplateOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedPodTemplateOptions :: Encode ListNamespacedPodTemplateOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedPodTemplateOptions :: Default ListNamespacedPodTemplateOptions where
  default = ListNamespacedPodTemplateOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PodTemplate
listNamespacedPodTemplate :: forall e. Config -> String -> ListNamespacedPodTemplateOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodTemplateList)
listNamespacedPodTemplate cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/podtemplates" <> formatQueryString options

-- | ListNamespacedReplicationControllerOptions
newtype ListNamespacedReplicationControllerOptions = ListNamespacedReplicationControllerOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedReplicationControllerOptions :: Newtype ListNamespacedReplicationControllerOptions _
derive instance genericListNamespacedReplicationControllerOptions :: Generic ListNamespacedReplicationControllerOptions _
instance showListNamespacedReplicationControllerOptions :: Show ListNamespacedReplicationControllerOptions where show a = genericShow a
instance decodeListNamespacedReplicationControllerOptions :: Decode ListNamespacedReplicationControllerOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedReplicationControllerOptions :: Encode ListNamespacedReplicationControllerOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedReplicationControllerOptions :: Default ListNamespacedReplicationControllerOptions where
  default = ListNamespacedReplicationControllerOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ReplicationController
listNamespacedReplicationController :: forall e. Config -> String -> ListNamespacedReplicationControllerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicationControllerList)
listNamespacedReplicationController cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers" <> formatQueryString options

-- | ListNamespacedResourceQuotaOptions
newtype ListNamespacedResourceQuotaOptions = ListNamespacedResourceQuotaOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedResourceQuotaOptions :: Newtype ListNamespacedResourceQuotaOptions _
derive instance genericListNamespacedResourceQuotaOptions :: Generic ListNamespacedResourceQuotaOptions _
instance showListNamespacedResourceQuotaOptions :: Show ListNamespacedResourceQuotaOptions where show a = genericShow a
instance decodeListNamespacedResourceQuotaOptions :: Decode ListNamespacedResourceQuotaOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedResourceQuotaOptions :: Encode ListNamespacedResourceQuotaOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedResourceQuotaOptions :: Default ListNamespacedResourceQuotaOptions where
  default = ListNamespacedResourceQuotaOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ResourceQuota
listNamespacedResourceQuota :: forall e. Config -> String -> ListNamespacedResourceQuotaOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ResourceQuotaList)
listNamespacedResourceQuota cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/resourcequotas" <> formatQueryString options

-- | ListNamespacedSecretOptions
newtype ListNamespacedSecretOptions = ListNamespacedSecretOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedSecretOptions :: Newtype ListNamespacedSecretOptions _
derive instance genericListNamespacedSecretOptions :: Generic ListNamespacedSecretOptions _
instance showListNamespacedSecretOptions :: Show ListNamespacedSecretOptions where show a = genericShow a
instance decodeListNamespacedSecretOptions :: Decode ListNamespacedSecretOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedSecretOptions :: Encode ListNamespacedSecretOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedSecretOptions :: Default ListNamespacedSecretOptions where
  default = ListNamespacedSecretOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Secret
listNamespacedSecret :: forall e. Config -> String -> ListNamespacedSecretOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status SecretList)
listNamespacedSecret cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/secrets" <> formatQueryString options

-- | ListNamespacedServiceOptions
newtype ListNamespacedServiceOptions = ListNamespacedServiceOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedServiceOptions :: Newtype ListNamespacedServiceOptions _
derive instance genericListNamespacedServiceOptions :: Generic ListNamespacedServiceOptions _
instance showListNamespacedServiceOptions :: Show ListNamespacedServiceOptions where show a = genericShow a
instance decodeListNamespacedServiceOptions :: Decode ListNamespacedServiceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedServiceOptions :: Encode ListNamespacedServiceOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedServiceOptions :: Default ListNamespacedServiceOptions where
  default = ListNamespacedServiceOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Service
listNamespacedService :: forall e. Config -> String -> ListNamespacedServiceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ServiceList)
listNamespacedService cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services" <> formatQueryString options

-- | ListNamespacedServiceAccountOptions
newtype ListNamespacedServiceAccountOptions = ListNamespacedServiceAccountOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedServiceAccountOptions :: Newtype ListNamespacedServiceAccountOptions _
derive instance genericListNamespacedServiceAccountOptions :: Generic ListNamespacedServiceAccountOptions _
instance showListNamespacedServiceAccountOptions :: Show ListNamespacedServiceAccountOptions where show a = genericShow a
instance decodeListNamespacedServiceAccountOptions :: Decode ListNamespacedServiceAccountOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedServiceAccountOptions :: Encode ListNamespacedServiceAccountOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedServiceAccountOptions :: Default ListNamespacedServiceAccountOptions where
  default = ListNamespacedServiceAccountOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ServiceAccount
listNamespacedServiceAccount :: forall e. Config -> String -> ListNamespacedServiceAccountOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ServiceAccountList)
listNamespacedServiceAccount cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/serviceaccounts" <> formatQueryString options

-- | ListNodeOptions
newtype ListNodeOptions = ListNodeOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNodeOptions :: Newtype ListNodeOptions _
derive instance genericListNodeOptions :: Generic ListNodeOptions _
instance showListNodeOptions :: Show ListNodeOptions where show a = genericShow a
instance decodeListNodeOptions :: Decode ListNodeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNodeOptions :: Encode ListNodeOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNodeOptions :: Default ListNodeOptions where
  default = ListNodeOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Node
listNode :: forall e. Config -> ListNodeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status NodeList)
listNode cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes" <> formatQueryString options

-- | ListPersistentVolumeOptions
newtype ListPersistentVolumeOptions = ListPersistentVolumeOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListPersistentVolumeOptions :: Newtype ListPersistentVolumeOptions _
derive instance genericListPersistentVolumeOptions :: Generic ListPersistentVolumeOptions _
instance showListPersistentVolumeOptions :: Show ListPersistentVolumeOptions where show a = genericShow a
instance decodeListPersistentVolumeOptions :: Decode ListPersistentVolumeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListPersistentVolumeOptions :: Encode ListPersistentVolumeOptions where
  encode a = genericEncode jsonOptions a

instance defaultListPersistentVolumeOptions :: Default ListPersistentVolumeOptions where
  default = ListPersistentVolumeOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PersistentVolume
listPersistentVolume :: forall e. Config -> ListPersistentVolumeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolumeList)
listPersistentVolume cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/persistentvolumes" <> formatQueryString options

-- | list or watch objects of kind PersistentVolumeClaim
listPersistentVolumeClaimForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolumeClaimList)
listPersistentVolumeClaimForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/persistentvolumeclaims"

-- | list or watch objects of kind Pod
listPodForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status PodList)
listPodForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/pods"

-- | list or watch objects of kind PodTemplate
listPodTemplateForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status PodTemplateList)
listPodTemplateForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/podtemplates"

-- | list or watch objects of kind ReplicationController
listReplicationControllerForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicationControllerList)
listReplicationControllerForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/replicationcontrollers"

-- | list or watch objects of kind ResourceQuota
listResourceQuotaForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ResourceQuotaList)
listResourceQuotaForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/resourcequotas"

-- | list or watch objects of kind Secret
listSecretForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status SecretList)
listSecretForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/secrets"

-- | list or watch objects of kind ServiceAccount
listServiceAccountForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ServiceAccountList)
listServiceAccountForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/serviceaccounts"

-- | list or watch objects of kind Service
listServiceForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ServiceList)
listServiceForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/services"

-- | proxy DELETE requests to Pod
proxyDELETENamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedPod cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy DELETE requests to Pod
proxyDELETENamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedPodWithPath cfg namespace name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy DELETE requests to Service
proxyDELETENamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedService cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy DELETE requests to Service
proxyDELETENamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedServiceWithPath cfg namespace name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy DELETE requests to Node
proxyDELETENode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENode cfg name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy DELETE requests to Node
proxyDELETENodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENodeWithPath cfg name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy GET requests to Pod
proxyGETNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedPod cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy GET requests to Pod
proxyGETNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedPodWithPath cfg namespace name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy GET requests to Service
proxyGETNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedService cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy GET requests to Service
proxyGETNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedServiceWithPath cfg namespace name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy GET requests to Node
proxyGETNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNode cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy GET requests to Node
proxyGETNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNodeWithPath cfg name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy HEAD requests to Pod
proxyHEADNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedPod cfg namespace name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy HEAD requests to Pod
proxyHEADNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedPodWithPath cfg namespace name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy HEAD requests to Service
proxyHEADNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedService cfg namespace name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy HEAD requests to Service
proxyHEADNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedServiceWithPath cfg namespace name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy HEAD requests to Node
proxyHEADNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNode cfg name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy HEAD requests to Node
proxyHEADNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNodeWithPath cfg name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy OPTIONS requests to Pod
proxyOPTIONSNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedPod cfg namespace name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy OPTIONS requests to Pod
proxyOPTIONSNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedPodWithPath cfg namespace name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy OPTIONS requests to Service
proxyOPTIONSNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedService cfg namespace name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy OPTIONS requests to Service
proxyOPTIONSNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedServiceWithPath cfg namespace name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy OPTIONS requests to Node
proxyOPTIONSNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNode cfg name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy OPTIONS requests to Node
proxyOPTIONSNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNodeWithPath cfg name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy POST requests to Pod
proxyPOSTNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedPod cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy POST requests to Pod
proxyPOSTNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedPodWithPath cfg namespace name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy POST requests to Service
proxyPOSTNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedService cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy POST requests to Service
proxyPOSTNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedServiceWithPath cfg namespace name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy POST requests to Node
proxyPOSTNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNode cfg name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy POST requests to Node
proxyPOSTNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNodeWithPath cfg name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy PUT requests to Pod
proxyPUTNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedPod cfg namespace name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy PUT requests to Pod
proxyPUTNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedPodWithPath cfg namespace name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy PUT requests to Service
proxyPUTNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedService cfg namespace name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy PUT requests to Service
proxyPUTNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedServiceWithPath cfg namespace name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy PUT requests to Node
proxyPUTNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNode cfg name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy PUT requests to Node
proxyPUTNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNodeWithPath cfg name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | read the specified ComponentStatus
readComponentStatus :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status ComponentStatus)
readComponentStatus cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/componentstatuses/" <> name <> ""

-- | ReadNamespaceOptions
newtype ReadNamespaceOptions = ReadNamespaceOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespaceOptions :: Newtype ReadNamespaceOptions _
derive instance genericReadNamespaceOptions :: Generic ReadNamespaceOptions _
instance showReadNamespaceOptions :: Show ReadNamespaceOptions where show a = genericShow a
instance decodeReadNamespaceOptions :: Decode ReadNamespaceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespaceOptions :: Encode ReadNamespaceOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespaceOptions :: Default ReadNamespaceOptions where
  default = ReadNamespaceOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Namespace
readNamespace :: forall e. Config -> String -> ReadNamespaceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Namespace)
readNamespace cfg name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> name <> "" <> formatQueryString options

-- | read status of the specified Namespace
readNamespaceStatus :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Namespace)
readNamespaceStatus cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> name <> "/status"

-- | ReadNamespacedConfigMapOptions
newtype ReadNamespacedConfigMapOptions = ReadNamespacedConfigMapOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedConfigMapOptions :: Newtype ReadNamespacedConfigMapOptions _
derive instance genericReadNamespacedConfigMapOptions :: Generic ReadNamespacedConfigMapOptions _
instance showReadNamespacedConfigMapOptions :: Show ReadNamespacedConfigMapOptions where show a = genericShow a
instance decodeReadNamespacedConfigMapOptions :: Decode ReadNamespacedConfigMapOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedConfigMapOptions :: Encode ReadNamespacedConfigMapOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedConfigMapOptions :: Default ReadNamespacedConfigMapOptions where
  default = ReadNamespacedConfigMapOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ConfigMap
readNamespacedConfigMap :: forall e. Config -> String -> String -> ReadNamespacedConfigMapOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ConfigMap)
readNamespacedConfigMap cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/configmaps/" <> name <> "" <> formatQueryString options

-- | ReadNamespacedEndpointsOptions
newtype ReadNamespacedEndpointsOptions = ReadNamespacedEndpointsOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedEndpointsOptions :: Newtype ReadNamespacedEndpointsOptions _
derive instance genericReadNamespacedEndpointsOptions :: Generic ReadNamespacedEndpointsOptions _
instance showReadNamespacedEndpointsOptions :: Show ReadNamespacedEndpointsOptions where show a = genericShow a
instance decodeReadNamespacedEndpointsOptions :: Decode ReadNamespacedEndpointsOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedEndpointsOptions :: Encode ReadNamespacedEndpointsOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedEndpointsOptions :: Default ReadNamespacedEndpointsOptions where
  default = ReadNamespacedEndpointsOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Endpoints
readNamespacedEndpoints :: forall e. Config -> String -> String -> ReadNamespacedEndpointsOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Endpoints)
readNamespacedEndpoints cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/endpoints/" <> name <> "" <> formatQueryString options

-- | ReadNamespacedEventOptions
newtype ReadNamespacedEventOptions = ReadNamespacedEventOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedEventOptions :: Newtype ReadNamespacedEventOptions _
derive instance genericReadNamespacedEventOptions :: Generic ReadNamespacedEventOptions _
instance showReadNamespacedEventOptions :: Show ReadNamespacedEventOptions where show a = genericShow a
instance decodeReadNamespacedEventOptions :: Decode ReadNamespacedEventOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedEventOptions :: Encode ReadNamespacedEventOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedEventOptions :: Default ReadNamespacedEventOptions where
  default = ReadNamespacedEventOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Event
readNamespacedEvent :: forall e. Config -> String -> String -> ReadNamespacedEventOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Event)
readNamespacedEvent cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/events/" <> name <> "" <> formatQueryString options

-- | ReadNamespacedLimitRangeOptions
newtype ReadNamespacedLimitRangeOptions = ReadNamespacedLimitRangeOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedLimitRangeOptions :: Newtype ReadNamespacedLimitRangeOptions _
derive instance genericReadNamespacedLimitRangeOptions :: Generic ReadNamespacedLimitRangeOptions _
instance showReadNamespacedLimitRangeOptions :: Show ReadNamespacedLimitRangeOptions where show a = genericShow a
instance decodeReadNamespacedLimitRangeOptions :: Decode ReadNamespacedLimitRangeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedLimitRangeOptions :: Encode ReadNamespacedLimitRangeOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedLimitRangeOptions :: Default ReadNamespacedLimitRangeOptions where
  default = ReadNamespacedLimitRangeOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified LimitRange
readNamespacedLimitRange :: forall e. Config -> String -> String -> ReadNamespacedLimitRangeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status LimitRange)
readNamespacedLimitRange cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/limitranges/" <> name <> "" <> formatQueryString options

-- | ReadNamespacedPersistentVolumeClaimOptions
newtype ReadNamespacedPersistentVolumeClaimOptions = ReadNamespacedPersistentVolumeClaimOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedPersistentVolumeClaimOptions :: Newtype ReadNamespacedPersistentVolumeClaimOptions _
derive instance genericReadNamespacedPersistentVolumeClaimOptions :: Generic ReadNamespacedPersistentVolumeClaimOptions _
instance showReadNamespacedPersistentVolumeClaimOptions :: Show ReadNamespacedPersistentVolumeClaimOptions where show a = genericShow a
instance decodeReadNamespacedPersistentVolumeClaimOptions :: Decode ReadNamespacedPersistentVolumeClaimOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedPersistentVolumeClaimOptions :: Encode ReadNamespacedPersistentVolumeClaimOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedPersistentVolumeClaimOptions :: Default ReadNamespacedPersistentVolumeClaimOptions where
  default = ReadNamespacedPersistentVolumeClaimOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PersistentVolumeClaim
readNamespacedPersistentVolumeClaim :: forall e. Config -> String -> String -> ReadNamespacedPersistentVolumeClaimOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolumeClaim)
readNamespacedPersistentVolumeClaim cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/persistentvolumeclaims/" <> name <> "" <> formatQueryString options

-- | read status of the specified PersistentVolumeClaim
readNamespacedPersistentVolumeClaimStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolumeClaim)
readNamespacedPersistentVolumeClaimStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/persistentvolumeclaims/" <> name <> "/status"

-- | ReadNamespacedPodOptions
newtype ReadNamespacedPodOptions = ReadNamespacedPodOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedPodOptions :: Newtype ReadNamespacedPodOptions _
derive instance genericReadNamespacedPodOptions :: Generic ReadNamespacedPodOptions _
instance showReadNamespacedPodOptions :: Show ReadNamespacedPodOptions where show a = genericShow a
instance decodeReadNamespacedPodOptions :: Decode ReadNamespacedPodOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedPodOptions :: Encode ReadNamespacedPodOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedPodOptions :: Default ReadNamespacedPodOptions where
  default = ReadNamespacedPodOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Pod
readNamespacedPod :: forall e. Config -> String -> String -> ReadNamespacedPodOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Pod)
readNamespacedPod cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "" <> formatQueryString options

-- | read log of the specified Pod
readNamespacedPodLog :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
readNamespacedPodLog cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/log"

-- | read status of the specified Pod
readNamespacedPodStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Pod)
readNamespacedPodStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/status"

-- | ReadNamespacedPodTemplateOptions
newtype ReadNamespacedPodTemplateOptions = ReadNamespacedPodTemplateOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedPodTemplateOptions :: Newtype ReadNamespacedPodTemplateOptions _
derive instance genericReadNamespacedPodTemplateOptions :: Generic ReadNamespacedPodTemplateOptions _
instance showReadNamespacedPodTemplateOptions :: Show ReadNamespacedPodTemplateOptions where show a = genericShow a
instance decodeReadNamespacedPodTemplateOptions :: Decode ReadNamespacedPodTemplateOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedPodTemplateOptions :: Encode ReadNamespacedPodTemplateOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedPodTemplateOptions :: Default ReadNamespacedPodTemplateOptions where
  default = ReadNamespacedPodTemplateOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PodTemplate
readNamespacedPodTemplate :: forall e. Config -> String -> String -> ReadNamespacedPodTemplateOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodTemplate)
readNamespacedPodTemplate cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/podtemplates/" <> name <> "" <> formatQueryString options

-- | ReadNamespacedReplicationControllerOptions
newtype ReadNamespacedReplicationControllerOptions = ReadNamespacedReplicationControllerOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedReplicationControllerOptions :: Newtype ReadNamespacedReplicationControllerOptions _
derive instance genericReadNamespacedReplicationControllerOptions :: Generic ReadNamespacedReplicationControllerOptions _
instance showReadNamespacedReplicationControllerOptions :: Show ReadNamespacedReplicationControllerOptions where show a = genericShow a
instance decodeReadNamespacedReplicationControllerOptions :: Decode ReadNamespacedReplicationControllerOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedReplicationControllerOptions :: Encode ReadNamespacedReplicationControllerOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedReplicationControllerOptions :: Default ReadNamespacedReplicationControllerOptions where
  default = ReadNamespacedReplicationControllerOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ReplicationController
readNamespacedReplicationController :: forall e. Config -> String -> String -> ReadNamespacedReplicationControllerOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicationController)
readNamespacedReplicationController cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "" <> formatQueryString options

-- | read status of the specified ReplicationController
readNamespacedReplicationControllerStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicationController)
readNamespacedReplicationControllerStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/status"

-- | ReadNamespacedResourceQuotaOptions
newtype ReadNamespacedResourceQuotaOptions = ReadNamespacedResourceQuotaOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedResourceQuotaOptions :: Newtype ReadNamespacedResourceQuotaOptions _
derive instance genericReadNamespacedResourceQuotaOptions :: Generic ReadNamespacedResourceQuotaOptions _
instance showReadNamespacedResourceQuotaOptions :: Show ReadNamespacedResourceQuotaOptions where show a = genericShow a
instance decodeReadNamespacedResourceQuotaOptions :: Decode ReadNamespacedResourceQuotaOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedResourceQuotaOptions :: Encode ReadNamespacedResourceQuotaOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedResourceQuotaOptions :: Default ReadNamespacedResourceQuotaOptions where
  default = ReadNamespacedResourceQuotaOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ResourceQuota
readNamespacedResourceQuota :: forall e. Config -> String -> String -> ReadNamespacedResourceQuotaOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ResourceQuota)
readNamespacedResourceQuota cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/resourcequotas/" <> name <> "" <> formatQueryString options

-- | read status of the specified ResourceQuota
readNamespacedResourceQuotaStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status ResourceQuota)
readNamespacedResourceQuotaStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/resourcequotas/" <> name <> "/status"

-- | ReadNamespacedSecretOptions
newtype ReadNamespacedSecretOptions = ReadNamespacedSecretOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedSecretOptions :: Newtype ReadNamespacedSecretOptions _
derive instance genericReadNamespacedSecretOptions :: Generic ReadNamespacedSecretOptions _
instance showReadNamespacedSecretOptions :: Show ReadNamespacedSecretOptions where show a = genericShow a
instance decodeReadNamespacedSecretOptions :: Decode ReadNamespacedSecretOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedSecretOptions :: Encode ReadNamespacedSecretOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedSecretOptions :: Default ReadNamespacedSecretOptions where
  default = ReadNamespacedSecretOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Secret
readNamespacedSecret :: forall e. Config -> String -> String -> ReadNamespacedSecretOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Secret)
readNamespacedSecret cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/secrets/" <> name <> "" <> formatQueryString options

-- | ReadNamespacedServiceOptions
newtype ReadNamespacedServiceOptions = ReadNamespacedServiceOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedServiceOptions :: Newtype ReadNamespacedServiceOptions _
derive instance genericReadNamespacedServiceOptions :: Generic ReadNamespacedServiceOptions _
instance showReadNamespacedServiceOptions :: Show ReadNamespacedServiceOptions where show a = genericShow a
instance decodeReadNamespacedServiceOptions :: Decode ReadNamespacedServiceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedServiceOptions :: Encode ReadNamespacedServiceOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedServiceOptions :: Default ReadNamespacedServiceOptions where
  default = ReadNamespacedServiceOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Service
readNamespacedService :: forall e. Config -> String -> String -> ReadNamespacedServiceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Service)
readNamespacedService cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "" <> formatQueryString options

-- | ReadNamespacedServiceAccountOptions
newtype ReadNamespacedServiceAccountOptions = ReadNamespacedServiceAccountOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedServiceAccountOptions :: Newtype ReadNamespacedServiceAccountOptions _
derive instance genericReadNamespacedServiceAccountOptions :: Generic ReadNamespacedServiceAccountOptions _
instance showReadNamespacedServiceAccountOptions :: Show ReadNamespacedServiceAccountOptions where show a = genericShow a
instance decodeReadNamespacedServiceAccountOptions :: Decode ReadNamespacedServiceAccountOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedServiceAccountOptions :: Encode ReadNamespacedServiceAccountOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedServiceAccountOptions :: Default ReadNamespacedServiceAccountOptions where
  default = ReadNamespacedServiceAccountOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified ServiceAccount
readNamespacedServiceAccount :: forall e. Config -> String -> String -> ReadNamespacedServiceAccountOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ServiceAccount)
readNamespacedServiceAccount cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/serviceaccounts/" <> name <> "" <> formatQueryString options

-- | read status of the specified Service
readNamespacedServiceStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Service)
readNamespacedServiceStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/status"

-- | ReadNodeOptions
newtype ReadNodeOptions = ReadNodeOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNodeOptions :: Newtype ReadNodeOptions _
derive instance genericReadNodeOptions :: Generic ReadNodeOptions _
instance showReadNodeOptions :: Show ReadNodeOptions where show a = genericShow a
instance decodeReadNodeOptions :: Decode ReadNodeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNodeOptions :: Encode ReadNodeOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNodeOptions :: Default ReadNodeOptions where
  default = ReadNodeOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Node
readNode :: forall e. Config -> String -> ReadNodeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Node)
readNode cfg name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "" <> formatQueryString options

-- | read status of the specified Node
readNodeStatus :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Node)
readNodeStatus cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/status"

-- | ReadPersistentVolumeOptions
newtype ReadPersistentVolumeOptions = ReadPersistentVolumeOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadPersistentVolumeOptions :: Newtype ReadPersistentVolumeOptions _
derive instance genericReadPersistentVolumeOptions :: Generic ReadPersistentVolumeOptions _
instance showReadPersistentVolumeOptions :: Show ReadPersistentVolumeOptions where show a = genericShow a
instance decodeReadPersistentVolumeOptions :: Decode ReadPersistentVolumeOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadPersistentVolumeOptions :: Encode ReadPersistentVolumeOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadPersistentVolumeOptions :: Default ReadPersistentVolumeOptions where
  default = ReadPersistentVolumeOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PersistentVolume
readPersistentVolume :: forall e. Config -> String -> ReadPersistentVolumeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolume)
readPersistentVolume cfg name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/persistentvolumes/" <> name <> "" <> formatQueryString options

-- | read status of the specified PersistentVolume
readPersistentVolumeStatus :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolume)
readPersistentVolumeStatus cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/persistentvolumes/" <> name <> "/status"

-- | replace the specified Namespace
replaceNamespace :: forall e. Config -> String -> Namespace -> Aff (http :: HTTP | e) (Either MetaV1.Status Namespace)
replaceNamespace cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace finalize of the specified Namespace
replaceNamespaceFinalize :: forall e. Config -> String -> Namespace -> Aff (http :: HTTP | e) (Either MetaV1.Status Namespace)
replaceNamespaceFinalize cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> name <> "/finalize"
    encodedBody = encodeJSON body

-- | replace status of the specified Namespace
replaceNamespaceStatus :: forall e. Config -> String -> Namespace -> Aff (http :: HTTP | e) (Either MetaV1.Status Namespace)
replaceNamespaceStatus cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified ConfigMap
replaceNamespacedConfigMap :: forall e. Config -> String -> String -> ConfigMap -> Aff (http :: HTTP | e) (Either MetaV1.Status ConfigMap)
replaceNamespacedConfigMap cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/configmaps/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified Endpoints
replaceNamespacedEndpoints :: forall e. Config -> String -> String -> Endpoints -> Aff (http :: HTTP | e) (Either MetaV1.Status Endpoints)
replaceNamespacedEndpoints cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/endpoints/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified Event
replaceNamespacedEvent :: forall e. Config -> String -> String -> Event -> Aff (http :: HTTP | e) (Either MetaV1.Status Event)
replaceNamespacedEvent cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/events/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified LimitRange
replaceNamespacedLimitRange :: forall e. Config -> String -> String -> LimitRange -> Aff (http :: HTTP | e) (Either MetaV1.Status LimitRange)
replaceNamespacedLimitRange cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/limitranges/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified PersistentVolumeClaim
replaceNamespacedPersistentVolumeClaim :: forall e. Config -> String -> String -> PersistentVolumeClaim -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolumeClaim)
replaceNamespacedPersistentVolumeClaim cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/persistentvolumeclaims/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified PersistentVolumeClaim
replaceNamespacedPersistentVolumeClaimStatus :: forall e. Config -> String -> String -> PersistentVolumeClaim -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolumeClaim)
replaceNamespacedPersistentVolumeClaimStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/persistentvolumeclaims/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified Pod
replaceNamespacedPod :: forall e. Config -> String -> String -> Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status Pod)
replaceNamespacedPod cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Pod
replaceNamespacedPodStatus :: forall e. Config -> String -> String -> Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status Pod)
replaceNamespacedPodStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified PodTemplate
replaceNamespacedPodTemplate :: forall e. Config -> String -> String -> PodTemplate -> Aff (http :: HTTP | e) (Either MetaV1.Status PodTemplate)
replaceNamespacedPodTemplate cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/podtemplates/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified ReplicationController
replaceNamespacedReplicationController :: forall e. Config -> String -> String -> ReplicationController -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicationController)
replaceNamespacedReplicationController cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified ReplicationController
replaceNamespacedReplicationControllerStatus :: forall e. Config -> String -> String -> ReplicationController -> Aff (http :: HTTP | e) (Either MetaV1.Status ReplicationController)
replaceNamespacedReplicationControllerStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified ResourceQuota
replaceNamespacedResourceQuota :: forall e. Config -> String -> String -> ResourceQuota -> Aff (http :: HTTP | e) (Either MetaV1.Status ResourceQuota)
replaceNamespacedResourceQuota cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/resourcequotas/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified ResourceQuota
replaceNamespacedResourceQuotaStatus :: forall e. Config -> String -> String -> ResourceQuota -> Aff (http :: HTTP | e) (Either MetaV1.Status ResourceQuota)
replaceNamespacedResourceQuotaStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/resourcequotas/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified Secret
replaceNamespacedSecret :: forall e. Config -> String -> String -> Secret -> Aff (http :: HTTP | e) (Either MetaV1.Status Secret)
replaceNamespacedSecret cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/secrets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified Service
replaceNamespacedService :: forall e. Config -> String -> String -> Service -> Aff (http :: HTTP | e) (Either MetaV1.Status Service)
replaceNamespacedService cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace the specified ServiceAccount
replaceNamespacedServiceAccount :: forall e. Config -> String -> String -> ServiceAccount -> Aff (http :: HTTP | e) (Either MetaV1.Status ServiceAccount)
replaceNamespacedServiceAccount cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/serviceaccounts/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Service
replaceNamespacedServiceStatus :: forall e. Config -> String -> String -> Service -> Aff (http :: HTTP | e) (Either MetaV1.Status Service)
replaceNamespacedServiceStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified Node
replaceNode :: forall e. Config -> String -> Node -> Aff (http :: HTTP | e) (Either MetaV1.Status Node)
replaceNode cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/nodes/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Node
replaceNodeStatus :: forall e. Config -> String -> Node -> Aff (http :: HTTP | e) (Either MetaV1.Status Node)
replaceNodeStatus cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/nodes/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | replace the specified PersistentVolume
replacePersistentVolume :: forall e. Config -> String -> PersistentVolume -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolume)
replacePersistentVolume cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/persistentvolumes/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified PersistentVolume
replacePersistentVolumeStatus :: forall e. Config -> String -> PersistentVolume -> Aff (http :: HTTP | e) (Either MetaV1.Status PersistentVolume)
replacePersistentVolumeStatus cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/persistentvolumes/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of ConfigMap
watchConfigMapListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchConfigMapListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/configmaps"

-- | watch individual changes to a list of Endpoints
watchEndpointsListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchEndpointsListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/endpoints"

-- | watch individual changes to a list of Event
watchEventListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchEventListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/events"

-- | watch individual changes to a list of LimitRange
watchLimitRangeListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchLimitRangeListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/limitranges"

-- | watch changes to an object of kind Namespace
watchNamespace :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespace cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> name <> ""

-- | watch individual changes to a list of Namespace
watchNamespaceList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespaceList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces"

-- | watch changes to an object of kind ConfigMap
watchNamespacedConfigMap :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedConfigMap cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/configmaps/" <> name <> ""

-- | watch individual changes to a list of ConfigMap
watchNamespacedConfigMapList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedConfigMapList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/configmaps"

-- | watch changes to an object of kind Endpoints
watchNamespacedEndpoints :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedEndpoints cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/endpoints/" <> name <> ""

-- | watch individual changes to a list of Endpoints
watchNamespacedEndpointsList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedEndpointsList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/endpoints"

-- | watch changes to an object of kind Event
watchNamespacedEvent :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedEvent cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/events/" <> name <> ""

-- | watch individual changes to a list of Event
watchNamespacedEventList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedEventList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/events"

-- | watch changes to an object of kind LimitRange
watchNamespacedLimitRange :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedLimitRange cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/limitranges/" <> name <> ""

-- | watch individual changes to a list of LimitRange
watchNamespacedLimitRangeList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedLimitRangeList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/limitranges"

-- | watch changes to an object of kind PersistentVolumeClaim
watchNamespacedPersistentVolumeClaim :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPersistentVolumeClaim cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/persistentvolumeclaims/" <> name <> ""

-- | watch individual changes to a list of PersistentVolumeClaim
watchNamespacedPersistentVolumeClaimList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPersistentVolumeClaimList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/persistentvolumeclaims"

-- | watch changes to an object of kind Pod
watchNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPod cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | watch individual changes to a list of Pod
watchNamespacedPodList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/pods"

-- | watch changes to an object of kind PodTemplate
watchNamespacedPodTemplate :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodTemplate cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/podtemplates/" <> name <> ""

-- | watch individual changes to a list of PodTemplate
watchNamespacedPodTemplateList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodTemplateList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/podtemplates"

-- | watch changes to an object of kind ReplicationController
watchNamespacedReplicationController :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedReplicationController cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/replicationcontrollers/" <> name <> ""

-- | watch individual changes to a list of ReplicationController
watchNamespacedReplicationControllerList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedReplicationControllerList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/replicationcontrollers"

-- | watch changes to an object of kind ResourceQuota
watchNamespacedResourceQuota :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedResourceQuota cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/resourcequotas/" <> name <> ""

-- | watch individual changes to a list of ResourceQuota
watchNamespacedResourceQuotaList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedResourceQuotaList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/resourcequotas"

-- | watch changes to an object of kind Secret
watchNamespacedSecret :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedSecret cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/secrets/" <> name <> ""

-- | watch individual changes to a list of Secret
watchNamespacedSecretList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedSecretList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/secrets"

-- | watch changes to an object of kind Service
watchNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedService cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | watch changes to an object of kind ServiceAccount
watchNamespacedServiceAccount :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedServiceAccount cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/serviceaccounts/" <> name <> ""

-- | watch individual changes to a list of ServiceAccount
watchNamespacedServiceAccountList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedServiceAccountList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/serviceaccounts"

-- | watch individual changes to a list of Service
watchNamespacedServiceList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedServiceList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/services"

-- | watch changes to an object of kind Node
watchNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNode cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/nodes/" <> name <> ""

-- | watch individual changes to a list of Node
watchNodeList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNodeList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/nodes"

-- | watch changes to an object of kind PersistentVolume
watchPersistentVolume :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPersistentVolume cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/persistentvolumes/" <> name <> ""

-- | watch individual changes to a list of PersistentVolumeClaim
watchPersistentVolumeClaimListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPersistentVolumeClaimListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/persistentvolumeclaims"

-- | watch individual changes to a list of PersistentVolume
watchPersistentVolumeList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPersistentVolumeList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/persistentvolumes"

-- | watch individual changes to a list of Pod
watchPodListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/pods"

-- | watch individual changes to a list of PodTemplate
watchPodTemplateListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodTemplateListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/podtemplates"

-- | watch individual changes to a list of ReplicationController
watchReplicationControllerListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchReplicationControllerListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/replicationcontrollers"

-- | watch individual changes to a list of ResourceQuota
watchResourceQuotaListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchResourceQuotaListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/resourcequotas"

-- | watch individual changes to a list of Secret
watchSecretListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchSecretListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/secrets"

-- | watch individual changes to a list of ServiceAccount
watchServiceAccountListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchServiceAccountListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/serviceaccounts"

-- | watch individual changes to a list of Service
watchServiceListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchServiceListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/services"