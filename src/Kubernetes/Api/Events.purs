module Kubernetes.Api.Events where

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

-- | io.k8s.api.events.v1beta1.Event
-- | Event is a report of an event somewhere in the cluster. It generally denotes some state change in the system.
newtype Event = Event
  { _type :: (NullOrUndefined String)
  , action :: (NullOrUndefined String)
  , apiVersion :: (NullOrUndefined String)
  , deprecatedCount :: (NullOrUndefined Int)
  , deprecatedFirstTimestamp :: (NullOrUndefined MetaV1.Time)
  , deprecatedLastTimestamp :: (NullOrUndefined MetaV1.Time)
  , deprecatedSource :: (NullOrUndefined CoreV1.EventSource)
  , eventTime :: (NullOrUndefined MetaV1.MicroTime)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , note :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , regarding :: (NullOrUndefined CoreV1.ObjectReference)
  , related :: (NullOrUndefined CoreV1.ObjectReference)
  , reportingController :: (NullOrUndefined String)
  , reportingInstance :: (NullOrUndefined String)
  , series :: (NullOrUndefined EventSeries) }

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
    , deprecatedCount: NullOrUndefined Nothing
    , deprecatedFirstTimestamp: NullOrUndefined Nothing
    , deprecatedLastTimestamp: NullOrUndefined Nothing
    , deprecatedSource: NullOrUndefined Nothing
    , eventTime: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , note: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , regarding: NullOrUndefined Nothing
    , related: NullOrUndefined Nothing
    , reportingController: NullOrUndefined Nothing
    , reportingInstance: NullOrUndefined Nothing
    , series: NullOrUndefined Nothing }

-- | io.k8s.api.events.v1beta1.EventList
-- | EventList is a list of Event objects.
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

-- | io.k8s.api.events.v1beta1.EventSeries
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

-- | create an Event
createNamespacedEvent :: forall e. Config -> Event -> Aff (http :: HTTP | e) (Either MetaV1.Status Event)
createNamespacedEvent cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/events.k8s.io/v1beta1/namespaces/{namespace}/events"
    encodedBody = encodeJSON body

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
deleteCollectionNamespacedEvent :: forall e. Config -> DeleteCollectionNamespacedEventOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedEvent cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/namespaces/{namespace}/events" <> formatQueryString options

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
deleteNamespacedEvent :: forall e. Config -> MetaV1.DeleteOptions -> DeleteNamespacedEventOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedEvent cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/events.k8s.io/v1beta1/namespaces/{namespace}/events/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get information of a group
getAPIGroup :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIGroup)
getAPIGroup cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/"

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/"

-- | list or watch objects of kind Event
listEventForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status EventList)
listEventForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/events"

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
listNamespacedEvent :: forall e. Config -> ListNamespacedEventOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status EventList)
listNamespacedEvent cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/namespaces/{namespace}/events" <> formatQueryString options

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
readNamespacedEvent :: forall e. Config -> ReadNamespacedEventOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Event)
readNamespacedEvent cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/namespaces/{namespace}/events/{name}" <> formatQueryString options

-- | replace the specified Event
replaceNamespacedEvent :: forall e. Config -> Event -> Aff (http :: HTTP | e) (Either MetaV1.Status Event)
replaceNamespacedEvent cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/events.k8s.io/v1beta1/namespaces/{namespace}/events/{name}"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of Event
watchEventListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchEventListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/watch/events"

-- | watch changes to an object of kind Event
watchNamespacedEvent :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedEvent cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/watch/namespaces/{namespace}/events/{name}"

-- | watch individual changes to a list of Event
watchNamespacedEventList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedEventList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/watch/namespaces/{namespace}/events"