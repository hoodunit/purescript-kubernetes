module Kubernetes.Api.SchedulingV1Alpha1 where

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

-- | PriorityClass defines mapping from a priority class name to the priority integer value. The value can be any valid integer.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `description`: description is an arbitrary string that usually provides guidelines on when this priority class should be used.
-- | - `globalDefault`: globalDefault specifies whether this PriorityClass should be considered as the default priority for pods that do not have any priority class.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#metadata
-- | - `value`: The value of this priority class. This is the actual priority that pods receive when they have the name of this class in their pod spec.
newtype PriorityClass = PriorityClass
  { apiVersion :: (Maybe String)
  , description :: (Maybe String)
  , globalDefault :: (Maybe Boolean)
  , kind :: (Maybe String)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , value :: (Maybe Int) }

derive instance newtypePriorityClass :: Newtype PriorityClass _
derive instance genericPriorityClass :: Generic PriorityClass _
instance showPriorityClass :: Show PriorityClass where show a = genericShow a
instance decodePriorityClass :: Decode PriorityClass where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               description <- decodeMaybe "description" a
               globalDefault <- decodeMaybe "globalDefault" a
               kind <- decodeMaybe "kind" a
               metadata <- decodeMaybe "metadata" a
               value <- decodeMaybe "value" a
               pure $ PriorityClass { apiVersion, description, globalDefault, kind, metadata, value }
instance encodePriorityClass :: Encode PriorityClass where
  encode (PriorityClass a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "description" (encodeMaybe a.description)
               , Tuple "globalDefault" (encodeMaybe a.globalDefault)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "value" (encodeMaybe a.value) ]


instance defaultPriorityClass :: Default PriorityClass where
  default = PriorityClass
    { apiVersion: Nothing
    , description: Nothing
    , globalDefault: Nothing
    , kind: Nothing
    , metadata: Nothing
    , value: Nothing }

-- | PriorityClassList is a collection of priority classes.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: items is the list of PriorityClasses
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#metadata
newtype PriorityClassList = PriorityClassList
  { apiVersion :: (Maybe String)
  , items :: (Maybe (Array PriorityClass))
  , kind :: (Maybe String)
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePriorityClassList :: Newtype PriorityClassList _
derive instance genericPriorityClassList :: Generic PriorityClassList _
instance showPriorityClassList :: Show PriorityClassList where show a = genericShow a
instance decodePriorityClassList :: Decode PriorityClassList where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               items <- decodeMaybe "items" a
               kind <- decodeMaybe "kind" a
               metadata <- decodeMaybe "metadata" a
               pure $ PriorityClassList { apiVersion, items, kind, metadata }
instance encodePriorityClassList :: Encode PriorityClassList where
  encode (PriorityClassList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPriorityClassList :: Default PriorityClassList where
  default = PriorityClassList
    { apiVersion: Nothing
    , items: Nothing
    , kind: Nothing
    , metadata: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/"