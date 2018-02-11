module Kubernetes.Api.Events where

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
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude
import Kubernetes.Api.Core.V1 as CoreV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | Event is a report of an event somewhere in the cluster. It generally denotes some state change in the system.
-- |
-- | Fields:
-- | - `_type`: Type of this event (Normal, Warning), new types could be added in the future.
-- | - `action`: What action was taken/failed regarding to the regarding object.
-- | - `deprecatedCount`: Deprecated field assuring backward compatibility with core.v1 Event type
-- | - `deprecatedFirstTimestamp`: Deprecated field assuring backward compatibility with core.v1 Event type
-- | - `deprecatedLastTimestamp`: Deprecated field assuring backward compatibility with core.v1 Event type
-- | - `deprecatedSource`: Deprecated field assuring backward compatibility with core.v1 Event type
-- | - `eventTime`: Required. Time when this Event was first observed.
-- | - `metadata`
-- | - `note`: Optional. A human-readable description of the status of this operation. Maximal length of the note is 1kB, but libraries should be prepared to handle values up to 64kB.
-- | - `reason`: Why the action was taken.
-- | - `regarding`: The object this Event is about. In most cases it's an Object reporting controller implements. E.g. ReplicaSetController implements ReplicaSets and this event is emitted because it acts on some changes in a ReplicaSet object.
-- | - `related`: Optional secondary object for more complex actions. E.g. when regarding object triggers a creation or deletion of related object.
-- | - `reportingController`: Name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`.
-- | - `reportingInstance`: ID of the controller instance, e.g. `kubelet-xyzf`.
-- | - `series`: Data about the Event series this event represents or nil if it's a singleton Event.
newtype Event = Event
  { _type :: (Maybe String)
  , action :: (Maybe String)
  , deprecatedCount :: (Maybe Int)
  , deprecatedFirstTimestamp :: (Maybe MetaV1.Time)
  , deprecatedLastTimestamp :: (Maybe MetaV1.Time)
  , deprecatedSource :: (Maybe CoreV1.EventSource)
  , eventTime :: (Maybe MetaV1.MicroTime)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , note :: (Maybe String)
  , reason :: (Maybe String)
  , regarding :: (Maybe CoreV1.ObjectReference)
  , related :: (Maybe CoreV1.ObjectReference)
  , reportingController :: (Maybe String)
  , reportingInstance :: (Maybe String)
  , series :: (Maybe EventSeries) }

derive instance newtypeEvent :: Newtype Event _
derive instance genericEvent :: Generic Event _
instance showEvent :: Show Event where show a = genericShow a
instance decodeEvent :: Decode Event where
  decode a = do
               _type <- decodeMaybe "_type" a
               action <- decodeMaybe "action" a
               assertPropEq "apiVersion" "events.k8s.io/v1beta1" a
               deprecatedCount <- decodeMaybe "deprecatedCount" a
               deprecatedFirstTimestamp <- decodeMaybe "deprecatedFirstTimestamp" a
               deprecatedLastTimestamp <- decodeMaybe "deprecatedLastTimestamp" a
               deprecatedSource <- decodeMaybe "deprecatedSource" a
               eventTime <- decodeMaybe "eventTime" a
               assertPropEq "kind" "Event" a
               metadata <- decodeMaybe "metadata" a
               note <- decodeMaybe "note" a
               reason <- decodeMaybe "reason" a
               regarding <- decodeMaybe "regarding" a
               related <- decodeMaybe "related" a
               reportingController <- decodeMaybe "reportingController" a
               reportingInstance <- decodeMaybe "reportingInstance" a
               series <- decodeMaybe "series" a
               pure $ Event { _type, action, deprecatedCount, deprecatedFirstTimestamp, deprecatedLastTimestamp, deprecatedSource, eventTime, metadata, note, reason, regarding, related, reportingController, reportingInstance, series }
instance encodeEvent :: Encode Event where
  encode (Event a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "action" (encodeMaybe a.action)
               , Tuple "apiVersion" (encode "events.k8s.io/v1beta1")
               , Tuple "deprecatedCount" (encodeMaybe a.deprecatedCount)
               , Tuple "deprecatedFirstTimestamp" (encodeMaybe a.deprecatedFirstTimestamp)
               , Tuple "deprecatedLastTimestamp" (encodeMaybe a.deprecatedLastTimestamp)
               , Tuple "deprecatedSource" (encodeMaybe a.deprecatedSource)
               , Tuple "eventTime" (encodeMaybe a.eventTime)
               , Tuple "kind" (encode "Event")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "note" (encodeMaybe a.note)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "regarding" (encodeMaybe a.regarding)
               , Tuple "related" (encodeMaybe a.related)
               , Tuple "reportingController" (encodeMaybe a.reportingController)
               , Tuple "reportingInstance" (encodeMaybe a.reportingInstance)
               , Tuple "series" (encodeMaybe a.series) ]


instance defaultEvent :: Default Event where
  default = Event
    { _type: Nothing
    , action: Nothing
    , deprecatedCount: Nothing
    , deprecatedFirstTimestamp: Nothing
    , deprecatedLastTimestamp: Nothing
    , deprecatedSource: Nothing
    , eventTime: Nothing
    , metadata: Nothing
    , note: Nothing
    , reason: Nothing
    , regarding: Nothing
    , related: Nothing
    , reportingController: Nothing
    , reportingInstance: Nothing
    , series: Nothing }

-- | EventList is a list of Event objects.
-- |
-- | Fields:
-- | - `items`: Items is a list of schema objects.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype EventList = EventList
  { items :: (Maybe (Array Event))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeEventList :: Newtype EventList _
derive instance genericEventList :: Generic EventList _
instance showEventList :: Show EventList where show a = genericShow a
instance decodeEventList :: Decode EventList where
  decode a = do
               assertPropEq "apiVersion" "events.k8s.io/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "EventList" a
               metadata <- decodeMaybe "metadata" a
               pure $ EventList { items, metadata }
instance encodeEventList :: Encode EventList where
  encode (EventList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "events.k8s.io/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "EventList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultEventList :: Default EventList where
  default = EventList
    { items: Nothing
    , metadata: Nothing }

-- | EventSeries contain information on series of events, i.e. thing that was/is happening continously for some time.
-- |
-- | Fields:
-- | - `count`: Number of occurrences in this series up to the last heartbeat time
-- | - `lastObservedTime`: Time when last Event from the series was seen before last heartbeat.
-- | - `state`: Information whether this series is ongoing or finished.
newtype EventSeries = EventSeries
  { count :: (Maybe Int)
  , lastObservedTime :: (Maybe MetaV1.MicroTime)
  , state :: (Maybe String) }

derive instance newtypeEventSeries :: Newtype EventSeries _
derive instance genericEventSeries :: Generic EventSeries _
instance showEventSeries :: Show EventSeries where show a = genericShow a
instance decodeEventSeries :: Decode EventSeries where
  decode a = do
               count <- decodeMaybe "count" a
               lastObservedTime <- decodeMaybe "lastObservedTime" a
               state <- decodeMaybe "state" a
               pure $ EventSeries { count, lastObservedTime, state }
instance encodeEventSeries :: Encode EventSeries where
  encode (EventSeries a) = encode $ StrMap.fromFoldable $
               [ Tuple "count" (encodeMaybe a.count)
               , Tuple "lastObservedTime" (encodeMaybe a.lastObservedTime)
               , Tuple "state" (encodeMaybe a.state) ]


instance defaultEventSeries :: Default EventSeries where
  default = EventSeries
    { count: Nothing
    , lastObservedTime: Nothing
    , state: Nothing }

-- | get information of a group
getAPIGroup :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIGroup)
getAPIGroup cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/"

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/events.k8s.io/v1beta1/"