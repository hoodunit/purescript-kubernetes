module Kubernetes.Api.SchedulingV1Alpha1 where

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

-- | io.k8s.api.scheduling.v1alpha1.PriorityClass
-- | PriorityClass defines mapping from a priority class name to the priority integer value. The value can be any valid integer.
newtype PriorityClass = PriorityClass
  { apiVersion :: (NullOrUndefined String)
  , description :: (NullOrUndefined String)
  , globalDefault :: (NullOrUndefined Boolean)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , value :: (NullOrUndefined Int) }

derive instance newtypePriorityClass :: Newtype PriorityClass _
derive instance genericPriorityClass :: Generic PriorityClass _
instance showPriorityClass :: Show PriorityClass where show a = genericShow a
instance decodePriorityClass :: Decode PriorityClass where
  decode a = genericDecode jsonOptions a 
instance encodePriorityClass :: Encode PriorityClass where
  encode a = genericEncode jsonOptions a

instance defaultPriorityClass :: Default PriorityClass where
  default = PriorityClass
    { apiVersion: NullOrUndefined Nothing
    , description: NullOrUndefined Nothing
    , globalDefault: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , value: NullOrUndefined Nothing }

-- | io.k8s.api.scheduling.v1alpha1.PriorityClassList
-- | PriorityClassList is a collection of priority classes.
newtype PriorityClassList = PriorityClassList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PriorityClass))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePriorityClassList :: Newtype PriorityClassList _
derive instance genericPriorityClassList :: Generic PriorityClassList _
instance showPriorityClassList :: Show PriorityClassList where show a = genericShow a
instance decodePriorityClassList :: Decode PriorityClassList where
  decode a = genericDecode jsonOptions a 
instance encodePriorityClassList :: Encode PriorityClassList where
  encode a = genericEncode jsonOptions a

instance defaultPriorityClassList :: Default PriorityClassList where
  default = PriorityClassList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | create a PriorityClass
createPriorityClass :: forall e. Config -> PriorityClass -> Aff (http :: HTTP | e) (Either MetaV1.Status PriorityClass)
createPriorityClass cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses"
    encodedBody = encodeJSON body

-- | DeleteCollectionPriorityClassOptions
newtype DeleteCollectionPriorityClassOptions = DeleteCollectionPriorityClassOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionPriorityClassOptions :: Newtype DeleteCollectionPriorityClassOptions _
derive instance genericDeleteCollectionPriorityClassOptions :: Generic DeleteCollectionPriorityClassOptions _
instance showDeleteCollectionPriorityClassOptions :: Show DeleteCollectionPriorityClassOptions where show a = genericShow a
instance decodeDeleteCollectionPriorityClassOptions :: Decode DeleteCollectionPriorityClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionPriorityClassOptions :: Encode DeleteCollectionPriorityClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionPriorityClassOptions :: Default DeleteCollectionPriorityClassOptions where
  default = DeleteCollectionPriorityClassOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PriorityClass
deleteCollectionPriorityClass :: forall e. Config -> DeleteCollectionPriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionPriorityClass cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses" <> formatQueryString options

-- | DeletePriorityClassOptions
newtype DeletePriorityClassOptions = DeletePriorityClassOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeletePriorityClassOptions :: Newtype DeletePriorityClassOptions _
derive instance genericDeletePriorityClassOptions :: Generic DeletePriorityClassOptions _
instance showDeletePriorityClassOptions :: Show DeletePriorityClassOptions where show a = genericShow a
instance decodeDeletePriorityClassOptions :: Decode DeletePriorityClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeletePriorityClassOptions :: Encode DeletePriorityClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeletePriorityClassOptions :: Default DeletePriorityClassOptions where
  default = DeletePriorityClassOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PriorityClass
deletePriorityClass :: forall e. Config -> MetaV1.DeleteOptions -> DeletePriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deletePriorityClass cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/"

-- | ListPriorityClassOptions
newtype ListPriorityClassOptions = ListPriorityClassOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListPriorityClassOptions :: Newtype ListPriorityClassOptions _
derive instance genericListPriorityClassOptions :: Generic ListPriorityClassOptions _
instance showListPriorityClassOptions :: Show ListPriorityClassOptions where show a = genericShow a
instance decodeListPriorityClassOptions :: Decode ListPriorityClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListPriorityClassOptions :: Encode ListPriorityClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultListPriorityClassOptions :: Default ListPriorityClassOptions where
  default = ListPriorityClassOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PriorityClass
listPriorityClass :: forall e. Config -> ListPriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PriorityClassList)
listPriorityClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses" <> formatQueryString options

-- | ReadPriorityClassOptions
newtype ReadPriorityClassOptions = ReadPriorityClassOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadPriorityClassOptions :: Newtype ReadPriorityClassOptions _
derive instance genericReadPriorityClassOptions :: Generic ReadPriorityClassOptions _
instance showReadPriorityClassOptions :: Show ReadPriorityClassOptions where show a = genericShow a
instance decodeReadPriorityClassOptions :: Decode ReadPriorityClassOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadPriorityClassOptions :: Encode ReadPriorityClassOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadPriorityClassOptions :: Default ReadPriorityClassOptions where
  default = ReadPriorityClassOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PriorityClass
readPriorityClass :: forall e. Config -> ReadPriorityClassOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PriorityClass)
readPriorityClass cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses/{name}" <> formatQueryString options

-- | replace the specified PriorityClass
replacePriorityClass :: forall e. Config -> PriorityClass -> Aff (http :: HTTP | e) (Either MetaV1.Status PriorityClass)
replacePriorityClass cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/priorityclasses/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind PriorityClass
watchPriorityClass :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPriorityClass cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/watch/priorityclasses/{name}"

-- | watch individual changes to a list of PriorityClass
watchPriorityClassList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPriorityClassList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/scheduling.k8s.io/v1alpha1/watch/priorityclasses"