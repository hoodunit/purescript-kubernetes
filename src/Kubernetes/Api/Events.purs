module Kubernetes.Api.Events where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
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

-- | Event is a report of an event somewhere in the cluster. It generally denotes some state change in the system.
-- |
-- | Fields:
-- | - `action`: What action was taken/failed regarding to the regarding object.
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `deprecatedCount`: Deprecated field assuring backward compatibility with core.v1 Event type
-- | - `deprecatedFirstTimestamp`: Deprecated field assuring backward compatibility with core.v1 Event type
-- | - `deprecatedLastTimestamp`: Deprecated field assuring backward compatibility with core.v1 Event type
-- | - `deprecatedSource`: Deprecated field assuring backward compatibility with core.v1 Event type
-- | - `eventTime`: Required. Time when this Event was first observed.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `note`: Optional. A human-readable description of the status of this operation. Maximal length of the note is 1kB, but libraries should be prepared to handle values up to 64kB.
-- | - `reason`: Why the action was taken.
-- | - `regarding`: The object this Event is about. In most cases it's an Object reporting controller implements. E.g. ReplicaSetController implements ReplicaSets and this event is emitted because it acts on some changes in a ReplicaSet object.
-- | - `related`: Optional secondary object for more complex actions. E.g. when regarding object triggers a creation or deletion of related object.
-- | - `reportingController`: Name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`.
-- | - `reportingInstance`: ID of the controller instance, e.g. `kubelet-xyzf`.
-- | - `series`: Data about the Event series this event represents or nil if it's a singleton Event.
-- | - `_type`: Type of this event (Normal, Warning), new types could be added in the future.
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

-- | EventList is a list of Event objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of schema objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
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

-- | EventSeries contain information on series of events, i.e. thing that was/is happening continously for some time.
-- |
-- | Fields:
-- | - `count`: Number of occurrences in this series up to the last heartbeat time
-- | - `lastObservedTime`: Time when last Event from the series was seen before last heartbeat.
-- | - `state`: Information whether this series is ongoing or finished.
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