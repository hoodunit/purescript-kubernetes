module Kubernetes.Api.SettingsV1Alpha1 where

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
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | PodPreset is a policy resource that defines additional runtime requirements for a Pod.
-- |
-- | Fields:
-- | - `metadata`
-- | - `spec`
newtype PodPreset = PodPreset
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe PodPresetSpec) }

derive instance newtypePodPreset :: Newtype PodPreset _
derive instance genericPodPreset :: Generic PodPreset _
instance showPodPreset :: Show PodPreset where show a = genericShow a
instance decodePodPreset :: Decode PodPreset where
  decode a = do
               assertPropEq "apiVersion" "settings.k8s.io/v1alpha1" a
               assertPropEq "kind" "PodPreset" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               pure $ PodPreset { metadata, spec }
instance encodePodPreset :: Encode PodPreset where
  encode (PodPreset a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "settings.k8s.io/v1alpha1")
               , Tuple "kind" (encode "PodPreset")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec) ]


instance defaultPodPreset :: Default PodPreset where
  default = PodPreset
    { metadata: Nothing
    , spec: Nothing }

-- | PodPresetList is a list of PodPreset objects.
-- |
-- | Fields:
-- | - `items`: Items is a list of schema objects.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype PodPresetList = PodPresetList
  { items :: (Maybe (Array PodPreset))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePodPresetList :: Newtype PodPresetList _
derive instance genericPodPresetList :: Generic PodPresetList _
instance showPodPresetList :: Show PodPresetList where show a = genericShow a
instance decodePodPresetList :: Decode PodPresetList where
  decode a = do
               assertPropEq "apiVersion" "settings.k8s.io/v1alpha1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "PodPresetList" a
               metadata <- decodeMaybe "metadata" a
               pure $ PodPresetList { items, metadata }
instance encodePodPresetList :: Encode PodPresetList where
  encode (PodPresetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "settings.k8s.io/v1alpha1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "PodPresetList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPodPresetList :: Default PodPresetList where
  default = PodPresetList
    { items: Nothing
    , metadata: Nothing }

-- | PodPresetSpec is a description of a pod preset.
-- |
-- | Fields:
-- | - `env`: Env defines the collection of EnvVar to inject into containers.
-- | - `envFrom`: EnvFrom defines the collection of EnvFromSource to inject into containers.
-- | - `selector`: Selector is a label query over a set of resources, in this case pods. Required.
-- | - `volumeMounts`: VolumeMounts defines the collection of VolumeMount to inject into containers.
-- | - `volumes`: Volumes defines the collection of Volume to inject into the pod.
newtype PodPresetSpec = PodPresetSpec
  { env :: (Maybe (Array CoreV1.EnvVar))
  , envFrom :: (Maybe (Array CoreV1.EnvFromSource))
  , selector :: (Maybe MetaV1.LabelSelector)
  , volumeMounts :: (Maybe (Array CoreV1.VolumeMount))
  , volumes :: (Maybe (Array CoreV1.Volume)) }

derive instance newtypePodPresetSpec :: Newtype PodPresetSpec _
derive instance genericPodPresetSpec :: Generic PodPresetSpec _
instance showPodPresetSpec :: Show PodPresetSpec where show a = genericShow a
instance decodePodPresetSpec :: Decode PodPresetSpec where
  decode a = do
               env <- decodeMaybe "env" a
               envFrom <- decodeMaybe "envFrom" a
               selector <- decodeMaybe "selector" a
               volumeMounts <- decodeMaybe "volumeMounts" a
               volumes <- decodeMaybe "volumes" a
               pure $ PodPresetSpec { env, envFrom, selector, volumeMounts, volumes }
instance encodePodPresetSpec :: Encode PodPresetSpec where
  encode (PodPresetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "env" (encodeMaybe a.env)
               , Tuple "envFrom" (encodeMaybe a.envFrom)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "volumeMounts" (encodeMaybe a.volumeMounts)
               , Tuple "volumes" (encodeMaybe a.volumes) ]


instance defaultPodPresetSpec :: Default PodPresetSpec where
  default = PodPresetSpec
    { env: Nothing
    , envFrom: Nothing
    , selector: Nothing
    , volumeMounts: Nothing
    , volumes: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/"