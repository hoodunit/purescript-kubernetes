module Kubernetes.Api.MetaV1 where

import Prelude
import Control.Alt ((<|>))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Kubernetes.Api.Runtime as Runtime

-- | APIGroup contains the name, the supported versions, and the preferred version of a group.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `name`: name is the name of the group.
-- | - `preferredVersion`: preferredVersion is the version preferred by the API server, which probably is the storage version.
-- | - `serverAddressByClientCIDRs`: a map of client CIDR to server address that is serving this group. This is to help clients reach servers in the most network-efficient way possible. Clients can use the appropriate server address as per the CIDR that they match. In case of multiple matches, clients should use the longest matching CIDR. The server returns only those CIDRs that it thinks that the client can match. For example: the master will return an internal IP CIDR only, if the client reaches the server using an internal IP. Server looks at X-Forwarded-For header or X-Real-Ip header or request.RemoteAddr (in that order) to get the client IP.
-- | - `versions`: versions are the versions supported in this group.
newtype APIGroup = APIGroup
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , preferredVersion :: (NullOrUndefined GroupVersionForDiscovery)
  , serverAddressByClientCIDRs :: (NullOrUndefined (Array ServerAddressByClientCIDR))
  , versions :: (NullOrUndefined (Array GroupVersionForDiscovery)) }

derive instance newtypeAPIGroup :: Newtype APIGroup _
derive instance genericAPIGroup :: Generic APIGroup _
instance showAPIGroup :: Show APIGroup where show a = genericShow a
instance decodeAPIGroup :: Decode APIGroup where
  decode a = genericDecode jsonOptions a 
instance encodeAPIGroup :: Encode APIGroup where
  encode a = genericEncode jsonOptions a

instance defaultAPIGroup :: Default APIGroup where
  default = APIGroup
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , preferredVersion: NullOrUndefined Nothing
    , serverAddressByClientCIDRs: NullOrUndefined Nothing
    , versions: NullOrUndefined Nothing }

-- | APIGroupList is a list of APIGroup, to allow clients to discover the API at /apis.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `groups`: groups is a list of APIGroup.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype APIGroupList = APIGroupList
  { apiVersion :: (NullOrUndefined String)
  , groups :: (NullOrUndefined (Array APIGroup))
  , kind :: (NullOrUndefined String) }

derive instance newtypeAPIGroupList :: Newtype APIGroupList _
derive instance genericAPIGroupList :: Generic APIGroupList _
instance showAPIGroupList :: Show APIGroupList where show a = genericShow a
instance decodeAPIGroupList :: Decode APIGroupList where
  decode a = genericDecode jsonOptions a 
instance encodeAPIGroupList :: Encode APIGroupList where
  encode a = genericEncode jsonOptions a

instance defaultAPIGroupList :: Default APIGroupList where
  default = APIGroupList
    { apiVersion: NullOrUndefined Nothing
    , groups: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing }

-- | APIResource specifies the name of a resource and whether it is namespaced.
-- |
-- | Fields:
-- | - `categories`: categories is a list of the grouped resources this resource belongs to (e.g. 'all')
-- | - `group`: group is the preferred group of the resource.  Empty implies the group of the containing resource list. For subresources, this may have a different value, for example: Scale".
-- | - `kind`: kind is the kind for the resource (e.g. 'Foo' is the kind for a resource 'foo')
-- | - `name`: name is the plural name of the resource.
-- | - `namespaced`: namespaced indicates if a resource is namespaced or not.
-- | - `shortNames`: shortNames is a list of suggested short names of the resource.
-- | - `singularName`: singularName is the singular name of the resource.  This allows clients to handle plural and singular opaquely. The singularName is more correct for reporting status on a single item and both singular and plural are allowed from the kubectl CLI interface.
-- | - `verbs`: verbs is a list of supported kube verbs (this includes get, list, watch, create, update, patch, delete, deletecollection, and proxy)
-- | - `version`: version is the preferred version of the resource.  Empty implies the version of the containing resource list For subresources, this may have a different value, for example: v1 (while inside a v1beta1 version of the core resource's group)".
newtype APIResource = APIResource
  { categories :: (NullOrUndefined (Array String))
  , group :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , namespaced :: (NullOrUndefined Boolean)
  , shortNames :: (NullOrUndefined (Array String))
  , singularName :: (NullOrUndefined String)
  , verbs :: (NullOrUndefined (Array String))
  , version :: (NullOrUndefined String) }

derive instance newtypeAPIResource :: Newtype APIResource _
derive instance genericAPIResource :: Generic APIResource _
instance showAPIResource :: Show APIResource where show a = genericShow a
instance decodeAPIResource :: Decode APIResource where
  decode a = genericDecode jsonOptions a 
instance encodeAPIResource :: Encode APIResource where
  encode a = genericEncode jsonOptions a

instance defaultAPIResource :: Default APIResource where
  default = APIResource
    { categories: NullOrUndefined Nothing
    , group: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespaced: NullOrUndefined Nothing
    , shortNames: NullOrUndefined Nothing
    , singularName: NullOrUndefined Nothing
    , verbs: NullOrUndefined Nothing
    , version: NullOrUndefined Nothing }

-- | APIResourceList is a list of APIResource, it is used to expose the name of the resources supported in a specific group and version, and if the resource is namespaced.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `groupVersion`: groupVersion is the group and version this APIResourceList is for.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `resources`: resources contains the name of the resources and if they are namespaced.
newtype APIResourceList = APIResourceList
  { apiVersion :: (NullOrUndefined String)
  , groupVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , resources :: (NullOrUndefined (Array APIResource)) }

derive instance newtypeAPIResourceList :: Newtype APIResourceList _
derive instance genericAPIResourceList :: Generic APIResourceList _
instance showAPIResourceList :: Show APIResourceList where show a = genericShow a
instance decodeAPIResourceList :: Decode APIResourceList where
  decode a = genericDecode jsonOptions a 
instance encodeAPIResourceList :: Encode APIResourceList where
  encode a = genericEncode jsonOptions a

instance defaultAPIResourceList :: Default APIResourceList where
  default = APIResourceList
    { apiVersion: NullOrUndefined Nothing
    , groupVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing }

-- | APIVersions lists the versions that are available, to allow clients to discover the API at /api, which is the root path of the legacy v1 API.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `serverAddressByClientCIDRs`: a map of client CIDR to server address that is serving this group. This is to help clients reach servers in the most network-efficient way possible. Clients can use the appropriate server address as per the CIDR that they match. In case of multiple matches, clients should use the longest matching CIDR. The server returns only those CIDRs that it thinks that the client can match. For example: the master will return an internal IP CIDR only, if the client reaches the server using an internal IP. Server looks at X-Forwarded-For header or X-Real-Ip header or request.RemoteAddr (in that order) to get the client IP.
-- | - `versions`: versions are the api versions that are available.
newtype APIVersions = APIVersions
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , serverAddressByClientCIDRs :: (NullOrUndefined (Array ServerAddressByClientCIDR))
  , versions :: (NullOrUndefined (Array String)) }

derive instance newtypeAPIVersions :: Newtype APIVersions _
derive instance genericAPIVersions :: Generic APIVersions _
instance showAPIVersions :: Show APIVersions where show a = genericShow a
instance decodeAPIVersions :: Decode APIVersions where
  decode a = genericDecode jsonOptions a 
instance encodeAPIVersions :: Encode APIVersions where
  encode a = genericEncode jsonOptions a

instance defaultAPIVersions :: Default APIVersions where
  default = APIVersions
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , serverAddressByClientCIDRs: NullOrUndefined Nothing
    , versions: NullOrUndefined Nothing }

-- | DeleteOptions may be provided when deleting an API object.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `preconditions`: Must be fulfilled before a deletion is carried out. If not possible, a 409 Conflict status will be returned.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteOptions = DeleteOptions
  { apiVersion :: (NullOrUndefined String)
  , gracePeriodSeconds :: (NullOrUndefined Int)
  , kind :: (NullOrUndefined String)
  , orphanDependents :: (NullOrUndefined Boolean)
  , preconditions :: (NullOrUndefined Preconditions)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteOptions :: Newtype DeleteOptions _
derive instance genericDeleteOptions :: Generic DeleteOptions _
instance showDeleteOptions :: Show DeleteOptions where show a = genericShow a
instance decodeDeleteOptions :: Decode DeleteOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteOptions :: Encode DeleteOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteOptions :: Default DeleteOptions where
  default = DeleteOptions
    { apiVersion: NullOrUndefined Nothing
    , gracePeriodSeconds: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , preconditions: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | GroupVersion contains the "group/version" and "version" string of a version. It is made a struct to keep extensibility.
-- |
-- | Fields:
-- | - `groupVersion`: groupVersion specifies the API group and version in the form "group/version"
-- | - `version`: version specifies the version in the form of "version". This is to save the clients the trouble of splitting the GroupVersion.
newtype GroupVersionForDiscovery = GroupVersionForDiscovery
  { groupVersion :: (NullOrUndefined String)
  , version :: (NullOrUndefined String) }

derive instance newtypeGroupVersionForDiscovery :: Newtype GroupVersionForDiscovery _
derive instance genericGroupVersionForDiscovery :: Generic GroupVersionForDiscovery _
instance showGroupVersionForDiscovery :: Show GroupVersionForDiscovery where show a = genericShow a
instance decodeGroupVersionForDiscovery :: Decode GroupVersionForDiscovery where
  decode a = genericDecode jsonOptions a 
instance encodeGroupVersionForDiscovery :: Encode GroupVersionForDiscovery where
  encode a = genericEncode jsonOptions a

instance defaultGroupVersionForDiscovery :: Default GroupVersionForDiscovery where
  default = GroupVersionForDiscovery
    { groupVersion: NullOrUndefined Nothing
    , version: NullOrUndefined Nothing }

-- | Initializer is information about an initializer that has not yet completed.
-- |
-- | Fields:
-- | - `name`: name of the process that is responsible for initializing this object.
newtype Initializer = Initializer
  { name :: (NullOrUndefined String) }

derive instance newtypeInitializer :: Newtype Initializer _
derive instance genericInitializer :: Generic Initializer _
instance showInitializer :: Show Initializer where show a = genericShow a
instance decodeInitializer :: Decode Initializer where
  decode a = genericDecode jsonOptions a 
instance encodeInitializer :: Encode Initializer where
  encode a = genericEncode jsonOptions a

instance defaultInitializer :: Default Initializer where
  default = Initializer
    { name: NullOrUndefined Nothing }

-- | Initializers tracks the progress of initialization.
-- |
-- | Fields:
-- | - `pending`: Pending is a list of initializers that must execute in order before this object is visible. When the last pending initializer is removed, and no failing result is set, the initializers struct will be set to nil and the object is considered as initialized and visible to all clients.
-- | - `result`: If result is set with the Failure field, the object will be persisted to storage and then deleted, ensuring that other clients can observe the deletion.
newtype Initializers = Initializers
  { pending :: (NullOrUndefined (Array Initializer))
  , result :: (NullOrUndefined Status) }

derive instance newtypeInitializers :: Newtype Initializers _
derive instance genericInitializers :: Generic Initializers _
instance showInitializers :: Show Initializers where show a = genericShow a
instance decodeInitializers :: Decode Initializers where
  decode a = genericDecode jsonOptions a 
instance encodeInitializers :: Encode Initializers where
  encode a = genericEncode jsonOptions a

instance defaultInitializers :: Default Initializers where
  default = Initializers
    { pending: NullOrUndefined Nothing
    , result: NullOrUndefined Nothing }

-- | A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects.
-- |
-- | Fields:
-- | - `matchExpressions`: matchExpressions is a list of label selector requirements. The requirements are ANDed.
-- | - `matchLabels`: matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.
newtype LabelSelector = LabelSelector
  { matchExpressions :: (NullOrUndefined (Array LabelSelectorRequirement))
  , matchLabels :: (NullOrUndefined (StrMap String)) }

derive instance newtypeLabelSelector :: Newtype LabelSelector _
derive instance genericLabelSelector :: Generic LabelSelector _
instance showLabelSelector :: Show LabelSelector where show a = genericShow a
instance decodeLabelSelector :: Decode LabelSelector where
  decode a = genericDecode jsonOptions a 
instance encodeLabelSelector :: Encode LabelSelector where
  encode a = genericEncode jsonOptions a

instance defaultLabelSelector :: Default LabelSelector where
  default = LabelSelector
    { matchExpressions: NullOrUndefined Nothing
    , matchLabels: NullOrUndefined Nothing }

-- | A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.
-- |
-- | Fields:
-- | - `key`: key is the label key that the selector applies to.
-- | - `operator`: operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.
-- | - `values`: values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.
newtype LabelSelectorRequirement = LabelSelectorRequirement
  { key :: (NullOrUndefined String)
  , operator :: (NullOrUndefined String)
  , values :: (NullOrUndefined (Array String)) }

derive instance newtypeLabelSelectorRequirement :: Newtype LabelSelectorRequirement _
derive instance genericLabelSelectorRequirement :: Generic LabelSelectorRequirement _
instance showLabelSelectorRequirement :: Show LabelSelectorRequirement where show a = genericShow a
instance decodeLabelSelectorRequirement :: Decode LabelSelectorRequirement where
  decode a = genericDecode jsonOptions a 
instance encodeLabelSelectorRequirement :: Encode LabelSelectorRequirement where
  encode a = genericEncode jsonOptions a

instance defaultLabelSelectorRequirement :: Default LabelSelectorRequirement where
  default = LabelSelectorRequirement
    { key: NullOrUndefined Nothing
    , operator: NullOrUndefined Nothing
    , values: NullOrUndefined Nothing }

-- | ListMeta describes metadata that synthetic resources must have, including lists and various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
-- |
-- | Fields:
-- | - `continue`: continue may be set if the user set a limit on the number of items returned, and indicates that the server has more data available. The value is opaque and may be used to issue another request to the endpoint that served this list to retrieve the next set of available objects. Continuing a list may not be possible if the server configuration has changed or more than a few minutes have passed. The resourceVersion field returned when using this continue value will be identical to the value in the first response.
-- | - `resourceVersion`: String that identifies the server's internal version of this object that can be used by clients to determine when objects have changed. Value must be treated as opaque by clients and passed unmodified back to the server. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#concurrency-control-and-consistency
-- | - `selfLink`: selfLink is a URL representing this object. Populated by the system. Read-only.
newtype ListMeta = ListMeta
  { continue :: (NullOrUndefined String)
  , resourceVersion :: (NullOrUndefined String)
  , selfLink :: (NullOrUndefined String) }

derive instance newtypeListMeta :: Newtype ListMeta _
derive instance genericListMeta :: Generic ListMeta _
instance showListMeta :: Show ListMeta where show a = genericShow a
instance decodeListMeta :: Decode ListMeta where
  decode a = genericDecode jsonOptions a 
instance encodeListMeta :: Encode ListMeta where
  encode a = genericEncode jsonOptions a

instance defaultListMeta :: Default ListMeta where
  default = ListMeta
    { continue: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , selfLink: NullOrUndefined Nothing }

newtype MicroTime = MicroTime String

derive instance newtypeMicroTime :: Newtype MicroTime _
derive instance genericMicroTime :: Generic MicroTime _
instance showMicroTime :: Show MicroTime where show a = genericShow a
instance decodeMicroTime :: Decode MicroTime where
  decode a = genericDecode jsonOptions a 
instance encodeMicroTime :: Encode MicroTime where
  encode a = genericEncode jsonOptions a

-- | ObjectMeta is metadata that all persisted resources must have, which includes all objects users must create.
-- |
-- | Fields:
-- | - `annotations`: Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations
-- | - `clusterName`: The name of the cluster which the object belongs to. This is used to distinguish resources with same name and namespace in different clusters. This field is not set anywhere right now and apiserver is going to ignore it if set in create or update request.
-- | - `creationTimestamp`: CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC.
-- |    
-- |    Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `deletionGracePeriodSeconds`: Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only.
-- | - `deletionTimestamp`: DeletionTimestamp is RFC 3339 date and time at which this resource will be deleted. This field is set by the server when a graceful deletion is requested by the user, and is not directly settable by a client. The resource is expected to be deleted (no longer visible from resource lists, and not reachable by name) after the time in this field, once the finalizers list is empty. As long as the finalizers list contains items, deletion is blocked. Once the deletionTimestamp is set, this value may not be unset or be set further into the future, although it may be shortened or the resource may be deleted prior to this time. For example, a user may request that a pod is deleted in 30 seconds. The Kubelet will react by sending a graceful termination signal to the containers in the pod. After that 30 seconds, the Kubelet will send a hard termination signal (SIGKILL) to the container and after cleanup, remove the pod from the API. In the presence of network partitions, this object may still exist after this timestamp, until an administrator or automated process can determine the resource is fully terminated. If not set, graceful deletion of the object has not been requested.
-- |    
-- |    Populated by the system when a graceful deletion is requested. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `finalizers`: Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed.
-- | - `generateName`: GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided. If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with a unique suffix. The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.
-- |    
-- |    If this field is specified and the generated name exists, the server will NOT return a 409 - instead, it will either return 201 Created or 500 with Reason ServerTimeout indicating a unique name could not be found in the time allotted, and the client should retry (optionally after the time indicated in the Retry-After header).
-- |    
-- |    Applied only if Name is not specified. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#idempotency
-- | - `generation`: A sequence number representing a specific generation of the desired state. Populated by the system. Read-only.
-- | - `initializers`: An initializer is a controller which enforces some system invariant at object creation time. This field is a list of initializers that have not yet acted on this object. If nil or empty, this object has been completely initialized. Otherwise, the object is considered uninitialized and is hidden (in list/watch and get calls) from clients that haven't explicitly asked to observe uninitialized objects.
-- |    
-- |    When an object is created, the system will populate this list with the current set of initializers. Only privileged users may set or modify this list. Once it is empty, it may not be modified further by any user.
-- | - `labels`: Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels
-- | - `name`: Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names
-- | - `namespace`: Namespace defines the space within each name must be unique. An empty namespace is equivalent to the "default" namespace, but "default" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.
-- |    
-- |    Must be a DNS_LABEL. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/namespaces
-- | - `ownerReferences`: List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller.
-- | - `resourceVersion`: An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.
-- |    
-- |    Populated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#concurrency-control-and-consistency
-- | - `selfLink`: SelfLink is a URL representing this object. Populated by the system. Read-only.
-- | - `uid`: UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.
-- |    
-- |    Populated by the system. Read-only. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
newtype ObjectMeta = ObjectMeta
  { annotations :: (NullOrUndefined (StrMap String))
  , clusterName :: (NullOrUndefined String)
  , creationTimestamp :: (NullOrUndefined Time)
  , deletionGracePeriodSeconds :: (NullOrUndefined Int)
  , deletionTimestamp :: (NullOrUndefined Time)
  , finalizers :: (NullOrUndefined (Array String))
  , generateName :: (NullOrUndefined String)
  , generation :: (NullOrUndefined Int)
  , initializers :: (NullOrUndefined Initializers)
  , labels :: (NullOrUndefined (StrMap String))
  , name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String)
  , ownerReferences :: (NullOrUndefined (Array OwnerReference))
  , resourceVersion :: (NullOrUndefined String)
  , selfLink :: (NullOrUndefined String)
  , uid :: (NullOrUndefined String) }

derive instance newtypeObjectMeta :: Newtype ObjectMeta _
derive instance genericObjectMeta :: Generic ObjectMeta _
instance showObjectMeta :: Show ObjectMeta where show a = genericShow a
instance decodeObjectMeta :: Decode ObjectMeta where
  decode a = genericDecode jsonOptions a 
instance encodeObjectMeta :: Encode ObjectMeta where
  encode a = genericEncode jsonOptions a

instance defaultObjectMeta :: Default ObjectMeta where
  default = ObjectMeta
    { annotations: NullOrUndefined Nothing
    , clusterName: NullOrUndefined Nothing
    , creationTimestamp: NullOrUndefined Nothing
    , deletionGracePeriodSeconds: NullOrUndefined Nothing
    , deletionTimestamp: NullOrUndefined Nothing
    , finalizers: NullOrUndefined Nothing
    , generateName: NullOrUndefined Nothing
    , generation: NullOrUndefined Nothing
    , initializers: NullOrUndefined Nothing
    , labels: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing
    , ownerReferences: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , selfLink: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing }

-- | OwnerReference contains enough information to let you identify an owning object. Currently, an owning object must be in the same namespace, so there is no namespace field.
-- |
-- | Fields:
-- | - `apiVersion`: API version of the referent.
-- | - `blockOwnerDeletion`: If true, AND if the owner has the "foregroundDeletion" finalizer, then the owner cannot be deleted from the key-value store until this reference is removed. Defaults to false. To set this field, a user needs "delete" permission of the owner, otherwise 422 (Unprocessable Entity) will be returned.
-- | - `controller`: If true, this reference points to the managing controller.
-- | - `kind`: Kind of the referent. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `name`: Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names
-- | - `uid`: UID of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
newtype OwnerReference = OwnerReference
  { apiVersion :: (NullOrUndefined String)
  , blockOwnerDeletion :: (NullOrUndefined Boolean)
  , controller :: (NullOrUndefined Boolean)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , uid :: (NullOrUndefined String) }

derive instance newtypeOwnerReference :: Newtype OwnerReference _
derive instance genericOwnerReference :: Generic OwnerReference _
instance showOwnerReference :: Show OwnerReference where show a = genericShow a
instance decodeOwnerReference :: Decode OwnerReference where
  decode a = genericDecode jsonOptions a 
instance encodeOwnerReference :: Encode OwnerReference where
  encode a = genericEncode jsonOptions a

instance defaultOwnerReference :: Default OwnerReference where
  default = OwnerReference
    { apiVersion: NullOrUndefined Nothing
    , blockOwnerDeletion: NullOrUndefined Nothing
    , controller: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing }

-- | Preconditions must be fulfilled before an operation (update, delete, etc.) is carried out.
-- |
-- | Fields:
-- | - `uid`: Specifies the target UID.
newtype Preconditions = Preconditions
  { uid :: (NullOrUndefined String) }

derive instance newtypePreconditions :: Newtype Preconditions _
derive instance genericPreconditions :: Generic Preconditions _
instance showPreconditions :: Show Preconditions where show a = genericShow a
instance decodePreconditions :: Decode Preconditions where
  decode a = genericDecode jsonOptions a 
instance encodePreconditions :: Encode Preconditions where
  encode a = genericEncode jsonOptions a

instance defaultPreconditions :: Default Preconditions where
  default = Preconditions
    { uid: NullOrUndefined Nothing }

-- | ServerAddressByClientCIDR helps the client to determine the server address that they should use, depending on the clientCIDR that they match.
-- |
-- | Fields:
-- | - `clientCIDR`: The CIDR with which clients can match their IP to figure out the server address that they should use.
-- | - `serverAddress`: Address of this server, suitable for a client that matches the above CIDR. This can be a hostname, hostname:port, IP or IP:port.
newtype ServerAddressByClientCIDR = ServerAddressByClientCIDR
  { clientCIDR :: (NullOrUndefined String)
  , serverAddress :: (NullOrUndefined String) }

derive instance newtypeServerAddressByClientCIDR :: Newtype ServerAddressByClientCIDR _
derive instance genericServerAddressByClientCIDR :: Generic ServerAddressByClientCIDR _
instance showServerAddressByClientCIDR :: Show ServerAddressByClientCIDR where show a = genericShow a
instance decodeServerAddressByClientCIDR :: Decode ServerAddressByClientCIDR where
  decode a = genericDecode jsonOptions a 
instance encodeServerAddressByClientCIDR :: Encode ServerAddressByClientCIDR where
  encode a = genericEncode jsonOptions a

instance defaultServerAddressByClientCIDR :: Default ServerAddressByClientCIDR where
  default = ServerAddressByClientCIDR
    { clientCIDR: NullOrUndefined Nothing
    , serverAddress: NullOrUndefined Nothing }

-- | Status is a return value for calls that don't return other objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `code`: Suggested HTTP return code for this status, 0 if not set.
-- | - `details`: Extended data associated with the reason.  Each reason may define its own extended details. This field is optional and the data returned is not guaranteed to conform to any schema except that defined by the reason type.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `message`: A human-readable description of the status of this operation.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `reason`: A machine-readable description of why this operation is in the "Failure" status. If this value is empty there is no information available. A Reason clarifies an HTTP status code but does not override it.
-- | - `status`: Status of the operation. One of: "Success" or "Failure". More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Status = Status
  { apiVersion :: (NullOrUndefined String)
  , code :: (NullOrUndefined Int)
  , details :: (NullOrUndefined StatusDetails)
  , kind :: (NullOrUndefined String)
  , message :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined ListMeta)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeStatus :: Newtype Status _
derive instance genericStatus :: Generic Status _
instance showStatus :: Show Status where show a = genericShow a
instance decodeStatus :: Decode Status where
  decode a = genericDecode jsonOptions a 
instance encodeStatus :: Encode Status where
  encode a = genericEncode jsonOptions a

instance defaultStatus :: Default Status where
  default = Status
    { apiVersion: NullOrUndefined Nothing
    , code: NullOrUndefined Nothing
    , details: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | StatusCause provides more information about an api.Status failure, including cases when multiple errors are encountered.
-- |
-- | Fields:
-- | - `field`: The field of the resource that has caused this error, as named by its JSON serialization. May include dot and postfix notation for nested attributes. Arrays are zero-indexed.  Fields may appear more than once in an array of causes due to fields having multiple errors. Optional.
-- |    
-- |    Examples:
-- |      "name" - the field "name" on the current resource
-- |      "items[0].name" - the field "name" on the first array entry in "items"
-- | - `message`: A human-readable description of the cause of the error.  This field may be presented as-is to a reader.
-- | - `reason`: A machine-readable description of the cause of the error. If this value is empty there is no information available.
newtype StatusCause = StatusCause
  { field :: (NullOrUndefined String)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String) }

derive instance newtypeStatusCause :: Newtype StatusCause _
derive instance genericStatusCause :: Generic StatusCause _
instance showStatusCause :: Show StatusCause where show a = genericShow a
instance decodeStatusCause :: Decode StatusCause where
  decode a = genericDecode jsonOptions a 
instance encodeStatusCause :: Encode StatusCause where
  encode a = genericEncode jsonOptions a

instance defaultStatusCause :: Default StatusCause where
  default = StatusCause
    { field: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing }

-- | StatusDetails is a set of additional properties that MAY be set by the server to provide additional information about a response. The Reason field of a Status object defines what attributes will be set. Clients must ignore fields that do not match the defined type of each attribute, and should assume that any attribute may be empty, invalid, or under defined.
-- |
-- | Fields:
-- | - `causes`: The Causes array includes more details associated with the StatusReason failure. Not all StatusReasons may provide detailed causes.
-- | - `group`: The group attribute of the resource associated with the status StatusReason.
-- | - `kind`: The kind attribute of the resource associated with the status StatusReason. On some operations may differ from the requested resource Kind. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `name`: The name attribute of the resource associated with the status StatusReason (when there is a single name which can be described).
-- | - `retryAfterSeconds`: If specified, the time in seconds before the operation should be retried. Some errors may indicate the client must take an alternate action - for those errors this field may indicate how long to wait before taking the alternate action.
-- | - `uid`: UID of the resource. (when there is a single resource which can be described). More info: http://kubernetes.io/docs/user-guide/identifiers#uids
newtype StatusDetails = StatusDetails
  { causes :: (NullOrUndefined (Array StatusCause))
  , group :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , retryAfterSeconds :: (NullOrUndefined Int)
  , uid :: (NullOrUndefined String) }

derive instance newtypeStatusDetails :: Newtype StatusDetails _
derive instance genericStatusDetails :: Generic StatusDetails _
instance showStatusDetails :: Show StatusDetails where show a = genericShow a
instance decodeStatusDetails :: Decode StatusDetails where
  decode a = genericDecode jsonOptions a 
instance encodeStatusDetails :: Encode StatusDetails where
  encode a = genericEncode jsonOptions a

instance defaultStatusDetails :: Default StatusDetails where
  default = StatusDetails
    { causes: NullOrUndefined Nothing
    , group: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , retryAfterSeconds: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing }

newtype Time = Time String

derive instance newtypeTime :: Newtype Time _
derive instance genericTime :: Generic Time _
instance showTime :: Show Time where show a = genericShow a
instance decodeTime :: Decode Time where
  decode a = genericDecode jsonOptions a 
instance encodeTime :: Encode Time where
  encode a = genericEncode jsonOptions a

-- | Event represents a single event to a watched resource.
-- |
-- | Fields:
-- | - `object`: Object is:
-- |     * If Type is Added or Modified: the new state of the object.
-- |     * If Type is Deleted: the state of the object immediately before deletion.
-- |     * If Type is Error: *Status is recommended; other types may make sense
-- |       depending on context.
-- | - `_type`
newtype WatchEvent = WatchEvent
  { _type :: (NullOrUndefined String)
  , object :: (NullOrUndefined Runtime.RawExtension) }

derive instance newtypeWatchEvent :: Newtype WatchEvent _
derive instance genericWatchEvent :: Generic WatchEvent _
instance showWatchEvent :: Show WatchEvent where show a = genericShow a
instance decodeWatchEvent :: Decode WatchEvent where
  decode a = genericDecode jsonOptions a 
instance encodeWatchEvent :: Encode WatchEvent where
  encode a = genericEncode jsonOptions a

instance defaultWatchEvent :: Default WatchEvent where
  default = WatchEvent
    { _type: NullOrUndefined Nothing
    , object: NullOrUndefined Nothing }