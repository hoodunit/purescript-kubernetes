module Kubernetes.Api.AdmissionRegistrationV1Alpha1 where

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

-- | io.k8s.api.admissionregistration.v1alpha1.Initializer
-- | Initializer describes the name and the failure policy of an initializer, and what resources it applies to.
newtype Initializer = Initializer
  { name :: (NullOrUndefined String)
  , rules :: (NullOrUndefined (Array Rule)) }

derive instance newtypeInitializer :: Newtype Initializer _
derive instance genericInitializer :: Generic Initializer _
instance showInitializer :: Show Initializer where show a = genericShow a
instance decodeInitializer :: Decode Initializer where
  decode a = genericDecode jsonOptions a 
instance encodeInitializer :: Encode Initializer where
  encode a = genericEncode jsonOptions a

instance defaultInitializer :: Default Initializer where
  default = Initializer
    { name: NullOrUndefined Nothing
    , rules: NullOrUndefined Nothing }

-- | io.k8s.api.admissionregistration.v1alpha1.InitializerConfiguration
-- | InitializerConfiguration describes the configuration of initializers.
newtype InitializerConfiguration = InitializerConfiguration
  { apiVersion :: (NullOrUndefined String)
  , initializers :: (NullOrUndefined (Array Initializer))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta) }

derive instance newtypeInitializerConfiguration :: Newtype InitializerConfiguration _
derive instance genericInitializerConfiguration :: Generic InitializerConfiguration _
instance showInitializerConfiguration :: Show InitializerConfiguration where show a = genericShow a
instance decodeInitializerConfiguration :: Decode InitializerConfiguration where
  decode a = genericDecode jsonOptions a 
instance encodeInitializerConfiguration :: Encode InitializerConfiguration where
  encode a = genericEncode jsonOptions a

instance defaultInitializerConfiguration :: Default InitializerConfiguration where
  default = InitializerConfiguration
    { apiVersion: NullOrUndefined Nothing
    , initializers: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.admissionregistration.v1alpha1.InitializerConfigurationList
-- | InitializerConfigurationList is a list of InitializerConfiguration.
newtype InitializerConfigurationList = InitializerConfigurationList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array InitializerConfiguration))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeInitializerConfigurationList :: Newtype InitializerConfigurationList _
derive instance genericInitializerConfigurationList :: Generic InitializerConfigurationList _
instance showInitializerConfigurationList :: Show InitializerConfigurationList where show a = genericShow a
instance decodeInitializerConfigurationList :: Decode InitializerConfigurationList where
  decode a = genericDecode jsonOptions a 
instance encodeInitializerConfigurationList :: Encode InitializerConfigurationList where
  encode a = genericEncode jsonOptions a

instance defaultInitializerConfigurationList :: Default InitializerConfigurationList where
  default = InitializerConfigurationList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.admissionregistration.v1alpha1.Rule
-- | Rule is a tuple of APIGroups, APIVersion, and Resources.It is recommended to make sure that all the tuple expansions are valid.
newtype Rule = Rule
  { apiGroups :: (NullOrUndefined (Array String))
  , apiVersions :: (NullOrUndefined (Array String))
  , resources :: (NullOrUndefined (Array String)) }

derive instance newtypeRule :: Newtype Rule _
derive instance genericRule :: Generic Rule _
instance showRule :: Show Rule where show a = genericShow a
instance decodeRule :: Decode Rule where
  decode a = genericDecode jsonOptions a 
instance encodeRule :: Encode Rule where
  encode a = genericEncode jsonOptions a

instance defaultRule :: Default Rule where
  default = Rule
    { apiGroups: NullOrUndefined Nothing
    , apiVersions: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing }

-- | create an InitializerConfiguration
createInitializerConfiguration :: forall e. Config -> InitializerConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status InitializerConfiguration)
createInitializerConfiguration cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/initializerconfigurations"
    encodedBody = encodeJSON body

-- | DeleteCollectionInitializerConfigurationOptions
newtype DeleteCollectionInitializerConfigurationOptions = DeleteCollectionInitializerConfigurationOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionInitializerConfigurationOptions :: Newtype DeleteCollectionInitializerConfigurationOptions _
derive instance genericDeleteCollectionInitializerConfigurationOptions :: Generic DeleteCollectionInitializerConfigurationOptions _
instance showDeleteCollectionInitializerConfigurationOptions :: Show DeleteCollectionInitializerConfigurationOptions where show a = genericShow a
instance decodeDeleteCollectionInitializerConfigurationOptions :: Decode DeleteCollectionInitializerConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionInitializerConfigurationOptions :: Encode DeleteCollectionInitializerConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionInitializerConfigurationOptions :: Default DeleteCollectionInitializerConfigurationOptions where
  default = DeleteCollectionInitializerConfigurationOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of InitializerConfiguration
deleteCollectionInitializerConfiguration :: forall e. Config -> DeleteCollectionInitializerConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionInitializerConfiguration cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/initializerconfigurations" <> formatQueryString options

-- | DeleteInitializerConfigurationOptions
newtype DeleteInitializerConfigurationOptions = DeleteInitializerConfigurationOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteInitializerConfigurationOptions :: Newtype DeleteInitializerConfigurationOptions _
derive instance genericDeleteInitializerConfigurationOptions :: Generic DeleteInitializerConfigurationOptions _
instance showDeleteInitializerConfigurationOptions :: Show DeleteInitializerConfigurationOptions where show a = genericShow a
instance decodeDeleteInitializerConfigurationOptions :: Decode DeleteInitializerConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteInitializerConfigurationOptions :: Encode DeleteInitializerConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteInitializerConfigurationOptions :: Default DeleteInitializerConfigurationOptions where
  default = DeleteInitializerConfigurationOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete an InitializerConfiguration
deleteInitializerConfiguration :: forall e. Config -> MetaV1.DeleteOptions -> DeleteInitializerConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteInitializerConfiguration cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/initializerconfigurations/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/"

-- | ListInitializerConfigurationOptions
newtype ListInitializerConfigurationOptions = ListInitializerConfigurationOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListInitializerConfigurationOptions :: Newtype ListInitializerConfigurationOptions _
derive instance genericListInitializerConfigurationOptions :: Generic ListInitializerConfigurationOptions _
instance showListInitializerConfigurationOptions :: Show ListInitializerConfigurationOptions where show a = genericShow a
instance decodeListInitializerConfigurationOptions :: Decode ListInitializerConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListInitializerConfigurationOptions :: Encode ListInitializerConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultListInitializerConfigurationOptions :: Default ListInitializerConfigurationOptions where
  default = ListInitializerConfigurationOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind InitializerConfiguration
listInitializerConfiguration :: forall e. Config -> ListInitializerConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status InitializerConfigurationList)
listInitializerConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/initializerconfigurations" <> formatQueryString options

-- | ReadInitializerConfigurationOptions
newtype ReadInitializerConfigurationOptions = ReadInitializerConfigurationOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadInitializerConfigurationOptions :: Newtype ReadInitializerConfigurationOptions _
derive instance genericReadInitializerConfigurationOptions :: Generic ReadInitializerConfigurationOptions _
instance showReadInitializerConfigurationOptions :: Show ReadInitializerConfigurationOptions where show a = genericShow a
instance decodeReadInitializerConfigurationOptions :: Decode ReadInitializerConfigurationOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadInitializerConfigurationOptions :: Encode ReadInitializerConfigurationOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadInitializerConfigurationOptions :: Default ReadInitializerConfigurationOptions where
  default = ReadInitializerConfigurationOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified InitializerConfiguration
readInitializerConfiguration :: forall e. Config -> ReadInitializerConfigurationOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status InitializerConfiguration)
readInitializerConfiguration cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/initializerconfigurations/{name}" <> formatQueryString options

-- | replace the specified InitializerConfiguration
replaceInitializerConfiguration :: forall e. Config -> InitializerConfiguration -> Aff (http :: HTTP | e) (Either MetaV1.Status InitializerConfiguration)
replaceInitializerConfiguration cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/initializerconfigurations/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind InitializerConfiguration
watchInitializerConfiguration :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchInitializerConfiguration cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/watch/initializerconfigurations/{name}"

-- | watch individual changes to a list of InitializerConfiguration
watchInitializerConfigurationList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchInitializerConfigurationList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/watch/initializerconfigurations"