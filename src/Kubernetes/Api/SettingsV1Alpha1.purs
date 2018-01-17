module Kubernetes.Api.SettingsV1Alpha1 where

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
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | PodPreset is a policy resource that defines additional runtime requirements for a Pod.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`
newtype PodPreset = PodPreset
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodPresetSpec) }

derive instance newtypePodPreset :: Newtype PodPreset _
derive instance genericPodPreset :: Generic PodPreset _
instance showPodPreset :: Show PodPreset where show a = genericShow a
instance decodePodPreset :: Decode PodPreset where
  decode a = genericDecode jsonOptions a 
instance encodePodPreset :: Encode PodPreset where
  encode a = genericEncode jsonOptions a

instance defaultPodPreset :: Default PodPreset where
  default = PodPreset
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | PodPresetList is a list of PodPreset objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of schema objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype PodPresetList = PodPresetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PodPreset))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodPresetList :: Newtype PodPresetList _
derive instance genericPodPresetList :: Generic PodPresetList _
instance showPodPresetList :: Show PodPresetList where show a = genericShow a
instance decodePodPresetList :: Decode PodPresetList where
  decode a = genericDecode jsonOptions a 
instance encodePodPresetList :: Encode PodPresetList where
  encode a = genericEncode jsonOptions a

instance defaultPodPresetList :: Default PodPresetList where
  default = PodPresetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PodPresetSpec is a description of a pod preset.
-- |
-- | Fields:
-- | - `env`: Env defines the collection of EnvVar to inject into containers.
-- | - `envFrom`: EnvFrom defines the collection of EnvFromSource to inject into containers.
-- | - `selector`: Selector is a label query over a set of resources, in this case pods. Required.
-- | - `volumeMounts`: VolumeMounts defines the collection of VolumeMount to inject into containers.
-- | - `volumes`: Volumes defines the collection of Volume to inject into the pod.
newtype PodPresetSpec = PodPresetSpec
  { env :: (NullOrUndefined (Array CoreV1.EnvVar))
  , envFrom :: (NullOrUndefined (Array CoreV1.EnvFromSource))
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , volumeMounts :: (NullOrUndefined (Array CoreV1.VolumeMount))
  , volumes :: (NullOrUndefined (Array CoreV1.Volume)) }

derive instance newtypePodPresetSpec :: Newtype PodPresetSpec _
derive instance genericPodPresetSpec :: Generic PodPresetSpec _
instance showPodPresetSpec :: Show PodPresetSpec where show a = genericShow a
instance decodePodPresetSpec :: Decode PodPresetSpec where
  decode a = genericDecode jsonOptions a 
instance encodePodPresetSpec :: Encode PodPresetSpec where
  encode a = genericEncode jsonOptions a

instance defaultPodPresetSpec :: Default PodPresetSpec where
  default = PodPresetSpec
    { env: NullOrUndefined Nothing
    , envFrom: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , volumeMounts: NullOrUndefined Nothing
    , volumes: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/"