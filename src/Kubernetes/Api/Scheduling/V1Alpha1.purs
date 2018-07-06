module Kubernetes.Api.Scheduling.V1Alpha1 where

import Prelude
import Prelude
import Prelude
import Control.Alt ((<|>))
import Data.Either (Either(Left,Right))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(Tuple))
import Effect.Aff (Aff)
import Foreign.Class (class Decode, class Encode, decode, encode)
import Prelude
import Data.Maybe (Maybe(Just,Nothing))
import Foreign.Class (class Decode, class Encode, encode, decode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Foreign.Generic.Types (Options)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Meta.V1 as MetaV1

-- | PriorityClass defines mapping from a priority class name to the priority integer value. The value can be any valid integer.
-- |
-- | Fields:
-- | - `description`: description is an arbitrary string that usually provides guidelines on when this priority class should be used.
-- | - `globalDefault`: globalDefault specifies whether this PriorityClass should be considered as the default priority for pods that do not have any priority class.
-- | - `metadata`: Standard object's metadata. More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#metadata
-- | - `value`: The value of this priority class. This is the actual priority that pods receive when they have the name of this class in their pod spec.
newtype PriorityClass = PriorityClass
  { description :: (Maybe String)
  , globalDefault :: (Maybe Boolean)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , value :: (Maybe Int) }

derive instance newtypePriorityClass :: Newtype PriorityClass _
derive instance genericPriorityClass :: Generic PriorityClass _
instance showPriorityClass :: Show PriorityClass where show a = genericShow a
instance decodePriorityClass :: Decode PriorityClass where
  decode a = do
               assertPropEq "apiVersion" "scheduling.k8s.io/v1alpha1" a
               description <- decodeMaybe "description" a
               globalDefault <- decodeMaybe "globalDefault" a
               assertPropEq "kind" "PriorityClass" a
               metadata <- decodeMaybe "metadata" a
               value <- decodeMaybe "value" a
               pure $ PriorityClass { description, globalDefault, metadata, value }
instance encodePriorityClass :: Encode PriorityClass where
  encode (PriorityClass a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "scheduling.k8s.io/v1alpha1")
               , Tuple "description" (encodeMaybe a.description)
               , Tuple "globalDefault" (encodeMaybe a.globalDefault)
               , Tuple "kind" (encode "PriorityClass")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "value" (encodeMaybe a.value) ]


instance defaultPriorityClass :: Default PriorityClass where
  default = PriorityClass
    { description: Nothing
    , globalDefault: Nothing
    , metadata: Nothing
    , value: Nothing }

-- | PriorityClassList is a collection of priority classes.
-- |
-- | Fields:
-- | - `items`: items is the list of PriorityClasses
-- | - `metadata`: Standard list metadata More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#metadata
newtype PriorityClassList = PriorityClassList
  { items :: (Maybe (Array PriorityClass))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePriorityClassList :: Newtype PriorityClassList _
derive instance genericPriorityClassList :: Generic PriorityClassList _
instance showPriorityClassList :: Show PriorityClassList where show a = genericShow a
instance decodePriorityClassList :: Decode PriorityClassList where
  decode a = do
               assertPropEq "apiVersion" "scheduling.k8s.io/v1alpha1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "PriorityClassList" a
               metadata <- decodeMaybe "metadata" a
               pure $ PriorityClassList { items, metadata }
instance encodePriorityClassList :: Encode PriorityClassList where
  encode (PriorityClassList a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "scheduling.k8s.io/v1alpha1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "PriorityClassList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPriorityClassList :: Default PriorityClassList where
  default = PriorityClassList
    { items: Nothing
    , metadata: Nothing }

-- | get available resources
getAPIResources :: Config -> Aff (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/"