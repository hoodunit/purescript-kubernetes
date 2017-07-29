module Kubernetes.Api.SettingsV1Alpha1 where

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
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | create a PodPreset
createNamespacedPodPreset :: forall e. Config -> PodPreset -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPreset)
createNamespacedPodPreset cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets"
    encodedBody = encodeJSON body

-- | DeleteCollectionNamespacedPodPresetOptions
newtype DeleteCollectionNamespacedPodPresetOptions = DeleteCollectionNamespacedPodPresetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedPodPresetOptions :: Newtype DeleteCollectionNamespacedPodPresetOptions _
derive instance genericDeleteCollectionNamespacedPodPresetOptions :: Generic DeleteCollectionNamespacedPodPresetOptions _
instance showDeleteCollectionNamespacedPodPresetOptions :: Show DeleteCollectionNamespacedPodPresetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedPodPresetOptions :: Decode DeleteCollectionNamespacedPodPresetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedPodPresetOptions :: Encode DeleteCollectionNamespacedPodPresetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedPodPresetOptions :: Default DeleteCollectionNamespacedPodPresetOptions where
  default = DeleteCollectionNamespacedPodPresetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PodPreset
deleteCollectionNamespacedPodPreset :: forall e. Config -> DeleteCollectionNamespacedPodPresetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedPodPreset cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets" <> formatQueryString options

-- | DeleteNamespacedPodPresetOptions
newtype DeleteNamespacedPodPresetOptions = DeleteNamespacedPodPresetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedPodPresetOptions :: Newtype DeleteNamespacedPodPresetOptions _
derive instance genericDeleteNamespacedPodPresetOptions :: Generic DeleteNamespacedPodPresetOptions _
instance showDeleteNamespacedPodPresetOptions :: Show DeleteNamespacedPodPresetOptions where show a = genericShow a
instance decodeDeleteNamespacedPodPresetOptions :: Decode DeleteNamespacedPodPresetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedPodPresetOptions :: Encode DeleteNamespacedPodPresetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedPodPresetOptions :: Default DeleteNamespacedPodPresetOptions where
  default = DeleteNamespacedPodPresetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PodPreset
deleteNamespacedPodPreset :: forall e. Config -> MetaV1.DeleteOptions -> DeleteNamespacedPodPresetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedPodPreset cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/"

-- | io.k8s.api.settings.v1alpha1.PodPreset
-- | PodPreset is a policy resource that defines additional runtime requirements for a Pod.
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

-- | io.k8s.api.settings.v1alpha1.PodPresetList
-- | PodPresetList is a list of PodPreset objects.
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

-- | io.k8s.api.settings.v1alpha1.PodPresetSpec
-- | PodPresetSpec is a description of a pod preset.
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

-- | ListNamespacedPodPresetOptions
newtype ListNamespacedPodPresetOptions = ListNamespacedPodPresetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedPodPresetOptions :: Newtype ListNamespacedPodPresetOptions _
derive instance genericListNamespacedPodPresetOptions :: Generic ListNamespacedPodPresetOptions _
instance showListNamespacedPodPresetOptions :: Show ListNamespacedPodPresetOptions where show a = genericShow a
instance decodeListNamespacedPodPresetOptions :: Decode ListNamespacedPodPresetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedPodPresetOptions :: Encode ListNamespacedPodPresetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedPodPresetOptions :: Default ListNamespacedPodPresetOptions where
  default = ListNamespacedPodPresetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PodPreset
listNamespacedPodPreset :: forall e. Config -> ListNamespacedPodPresetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPresetList)
listNamespacedPodPreset cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets" <> formatQueryString options

-- | list or watch objects of kind PodPreset
listPodPresetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPresetList)
listPodPresetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/podpresets"

-- | ReadNamespacedPodPresetOptions
newtype ReadNamespacedPodPresetOptions = ReadNamespacedPodPresetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedPodPresetOptions :: Newtype ReadNamespacedPodPresetOptions _
derive instance genericReadNamespacedPodPresetOptions :: Generic ReadNamespacedPodPresetOptions _
instance showReadNamespacedPodPresetOptions :: Show ReadNamespacedPodPresetOptions where show a = genericShow a
instance decodeReadNamespacedPodPresetOptions :: Decode ReadNamespacedPodPresetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedPodPresetOptions :: Encode ReadNamespacedPodPresetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedPodPresetOptions :: Default ReadNamespacedPodPresetOptions where
  default = ReadNamespacedPodPresetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PodPreset
readNamespacedPodPreset :: forall e. Config -> ReadNamespacedPodPresetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPreset)
readNamespacedPodPreset cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets/{name}" <> formatQueryString options

-- | replace the specified PodPreset
replaceNamespacedPodPreset :: forall e. Config -> PodPreset -> Aff (http :: HTTP | e) (Either MetaV1.Status PodPreset)
replaceNamespacedPodPreset cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/settings.k8s.io/v1alpha1/namespaces/{namespace}/podpresets/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind PodPreset
watchNamespacedPodPreset :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodPreset cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/watch/namespaces/{namespace}/podpresets/{name}"

-- | watch individual changes to a list of PodPreset
watchNamespacedPodPresetList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodPresetList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/watch/namespaces/{namespace}/podpresets"

-- | watch individual changes to a list of PodPreset
watchPodPresetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodPresetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/settings.k8s.io/v1alpha1/watch/podpresets"