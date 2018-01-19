module Kubernetes.Api.AdmissionRegistrationV1Alpha1 where

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
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Initializer describes the name and the failure policy of an initializer, and what resources it applies to.
-- |
-- | Fields:
-- | - `name`: Name is the identifier of the initializer. It will be added to the object that needs to be initialized. Name should be fully qualified, e.g., alwayspullimages.kubernetes.io, where "alwayspullimages" is the name of the webhook, and kubernetes.io is the name of the organization. Required
-- | - `rules`: Rules describes what resources/subresources the initializer cares about. The initializer cares about an operation if it matches _any_ Rule. Rule.Resources must not include subresources.
newtype Initializer = Initializer
  { name :: (Maybe String)
  , rules :: (Maybe (Array Rule)) }

derive instance newtypeInitializer :: Newtype Initializer _
derive instance genericInitializer :: Generic Initializer _
instance showInitializer :: Show Initializer where show a = genericShow a
instance decodeInitializer :: Decode Initializer where
  decode a = do
               name <- decodeMaybe "name" a
               rules <- decodeMaybe "rules" a
               pure $ Initializer { name, rules }
instance encodeInitializer :: Encode Initializer where
  encode (Initializer a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encodeMaybe a.name)
               , Tuple "rules" (encodeMaybe a.rules) ]


instance defaultInitializer :: Default Initializer where
  default = Initializer
    { name: Nothing
    , rules: Nothing }

-- | InitializerConfiguration describes the configuration of initializers.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `initializers`: Initializers is a list of resources and their default initializers Order-sensitive. When merging multiple InitializerConfigurations, we sort the initializers from different InitializerConfigurations by the name of the InitializerConfigurations; the order of the initializers from the same InitializerConfiguration is preserved.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
newtype InitializerConfiguration = InitializerConfiguration
  { apiVersion :: (Maybe String)
  , initializers :: (Maybe (Array Initializer))
  , kind :: (Maybe String)
  , metadata :: (Maybe MetaV1.ObjectMeta) }

derive instance newtypeInitializerConfiguration :: Newtype InitializerConfiguration _
derive instance genericInitializerConfiguration :: Generic InitializerConfiguration _
instance showInitializerConfiguration :: Show InitializerConfiguration where show a = genericShow a
instance decodeInitializerConfiguration :: Decode InitializerConfiguration where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               initializers <- decodeMaybe "initializers" a
               kind <- decodeMaybe "kind" a
               metadata <- decodeMaybe "metadata" a
               pure $ InitializerConfiguration { apiVersion, initializers, kind, metadata }
instance encodeInitializerConfiguration :: Encode InitializerConfiguration where
  encode (InitializerConfiguration a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "initializers" (encodeMaybe a.initializers)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultInitializerConfiguration :: Default InitializerConfiguration where
  default = InitializerConfiguration
    { apiVersion: Nothing
    , initializers: Nothing
    , kind: Nothing
    , metadata: Nothing }

-- | InitializerConfigurationList is a list of InitializerConfiguration.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of InitializerConfiguration.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype InitializerConfigurationList = InitializerConfigurationList
  { apiVersion :: (Maybe String)
  , items :: (Maybe (Array InitializerConfiguration))
  , kind :: (Maybe String)
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeInitializerConfigurationList :: Newtype InitializerConfigurationList _
derive instance genericInitializerConfigurationList :: Generic InitializerConfigurationList _
instance showInitializerConfigurationList :: Show InitializerConfigurationList where show a = genericShow a
instance decodeInitializerConfigurationList :: Decode InitializerConfigurationList where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               items <- decodeMaybe "items" a
               kind <- decodeMaybe "kind" a
               metadata <- decodeMaybe "metadata" a
               pure $ InitializerConfigurationList { apiVersion, items, kind, metadata }
instance encodeInitializerConfigurationList :: Encode InitializerConfigurationList where
  encode (InitializerConfigurationList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultInitializerConfigurationList :: Default InitializerConfigurationList where
  default = InitializerConfigurationList
    { apiVersion: Nothing
    , items: Nothing
    , kind: Nothing
    , metadata: Nothing }

-- | Rule is a tuple of APIGroups, APIVersion, and Resources.It is recommended to make sure that all the tuple expansions are valid.
-- |
-- | Fields:
-- | - `apiGroups`: APIGroups is the API groups the resources belong to. '*' is all groups. If '*' is present, the length of the slice must be one. Required.
-- | - `apiVersions`: APIVersions is the API versions the resources belong to. '*' is all versions. If '*' is present, the length of the slice must be one. Required.
-- | - `resources`: Resources is a list of resources this rule applies to.
-- |    
-- |    For example: 'pods' means pods. 'pods/log' means the log subresource of pods. '*' means all resources, but not subresources. 'pods/*' means all subresources of pods. '*/scale' means all scale subresources. '*/*' means all resources and their subresources.
-- |    
-- |    If wildcard is present, the validation rule will ensure resources do not overlap with each other.
-- |    
-- |    Depending on the enclosing object, subresources might not be allowed. Required.
newtype Rule = Rule
  { apiGroups :: (Maybe (Array String))
  , apiVersions :: (Maybe (Array String))
  , resources :: (Maybe (Array String)) }

derive instance newtypeRule :: Newtype Rule _
derive instance genericRule :: Generic Rule _
instance showRule :: Show Rule where show a = genericShow a
instance decodeRule :: Decode Rule where
  decode a = do
               apiGroups <- decodeMaybe "apiGroups" a
               apiVersions <- decodeMaybe "apiVersions" a
               resources <- decodeMaybe "resources" a
               pure $ Rule { apiGroups, apiVersions, resources }
instance encodeRule :: Encode Rule where
  encode (Rule a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroups" (encodeMaybe a.apiGroups)
               , Tuple "apiVersions" (encodeMaybe a.apiVersions)
               , Tuple "resources" (encodeMaybe a.resources) ]


instance defaultRule :: Default Rule where
  default = Rule
    { apiGroups: Nothing
    , apiVersions: Nothing
    , resources: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/"