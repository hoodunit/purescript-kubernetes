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

-- | create an Event
createNamespacedEvent :: forall e. Config -> Event -> Aff (http :: HTTP | e) (Either MetaV1.Status Event)
createNamespacedEvent cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/events.k8s.io/v1beta1/namespaces/{namespace}/events"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
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

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
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