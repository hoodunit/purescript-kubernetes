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
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
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
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Initializer describes the name and the failure policy of an initializer, and what resources it applies to.
-- |
-- | Fields:
-- | - `name`: Name is the identifier of the initializer. It will be added to the object that needs to be initialized. Name should be fully qualified, e.g., alwayspullimages.kubernetes.io, where "alwayspullimages" is the name of the webhook, and kubernetes.io is the name of the organization. Required
-- | - `rules`: Rules describes what resources/subresources the initializer cares about. The initializer cares about an operation if it matches _any_ Rule. Rule.Resources must not include subresources.
newtype Initializer = Initializer
  { name :: (NullOrUndefined String)
  , rules :: (NullOrUndefined (Array Rule)) }

derive instance newtypeInitializer :: Newtype Initializer _
derive instance genericInitializer :: Generic Initializer _
instance showInitializer :: Show Initializer where show a = genericShow a
instance decodeInitializer :: Decode Initializer where
  decode a = do
               name <- readProp "name" a >>= decode
               rules <- readProp "rules" a >>= decode
               pure $ Initializer { name, rules }
instance encodeInitializer :: Encode Initializer where
  encode (Initializer a) = encode $ StrMap.fromFoldable $
               [ Tuple "name" (encode a.name)
               , Tuple "rules" (encode a.rules) ]


instance defaultInitializer :: Default Initializer where
  default = Initializer
    { name: NullOrUndefined Nothing
    , rules: NullOrUndefined Nothing }

-- | InitializerConfiguration describes the configuration of initializers.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `initializers`: Initializers is a list of resources and their default initializers Order-sensitive. When merging multiple InitializerConfigurations, we sort the initializers from different InitializerConfigurations by the name of the InitializerConfigurations; the order of the initializers from the same InitializerConfiguration is preserved.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
newtype InitializerConfiguration = InitializerConfiguration
  { apiVersion :: (NullOrUndefined String)
  , initializers :: (NullOrUndefined (Array Initializer))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta) }

derive instance newtypeInitializerConfiguration :: Newtype InitializerConfiguration _
derive instance genericInitializerConfiguration :: Generic InitializerConfiguration _
instance showInitializerConfiguration :: Show InitializerConfiguration where show a = genericShow a
instance decodeInitializerConfiguration :: Decode InitializerConfiguration where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               initializers <- readProp "initializers" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ InitializerConfiguration { apiVersion, initializers, kind, metadata }
instance encodeInitializerConfiguration :: Encode InitializerConfiguration where
  encode (InitializerConfiguration a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "initializers" (encode a.initializers)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultInitializerConfiguration :: Default InitializerConfiguration where
  default = InitializerConfiguration
    { apiVersion: NullOrUndefined Nothing
    , initializers: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | InitializerConfigurationList is a list of InitializerConfiguration.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: List of InitializerConfiguration.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype InitializerConfigurationList = InitializerConfigurationList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array InitializerConfiguration))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeInitializerConfigurationList :: Newtype InitializerConfigurationList _
derive instance genericInitializerConfigurationList :: Generic InitializerConfigurationList _
instance showInitializerConfigurationList :: Show InitializerConfigurationList where show a = genericShow a
instance decodeInitializerConfigurationList :: Decode InitializerConfigurationList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ InitializerConfigurationList { apiVersion, items, kind, metadata }
instance encodeInitializerConfigurationList :: Encode InitializerConfigurationList where
  encode (InitializerConfigurationList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultInitializerConfigurationList :: Default InitializerConfigurationList where
  default = InitializerConfigurationList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

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
  { apiGroups :: (NullOrUndefined (Array String))
  , apiVersions :: (NullOrUndefined (Array String))
  , resources :: (NullOrUndefined (Array String)) }

derive instance newtypeRule :: Newtype Rule _
derive instance genericRule :: Generic Rule _
instance showRule :: Show Rule where show a = genericShow a
instance decodeRule :: Decode Rule where
  decode a = do
               apiGroups <- readProp "apiGroups" a >>= decode
               apiVersions <- readProp "apiVersions" a >>= decode
               resources <- readProp "resources" a >>= decode
               pure $ Rule { apiGroups, apiVersions, resources }
instance encodeRule :: Encode Rule where
  encode (Rule a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroups" (encode a.apiGroups)
               , Tuple "apiVersions" (encode a.apiVersions)
               , Tuple "resources" (encode a.resources) ]


instance defaultRule :: Default Rule where
  default = Rule
    { apiGroups: NullOrUndefined Nothing
    , apiVersions: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/admissionregistration.k8s.io/v1alpha1/"