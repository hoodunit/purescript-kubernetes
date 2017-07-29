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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.APIGroup
-- | APIGroup contains the name, the supported versions, and the preferred version of a group.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.APIGroupList
-- | APIGroupList is a list of APIGroup, to allow clients to discover the API at /apis.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.APIResource
-- | APIResource specifies the name of a resource and whether it is namespaced.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.APIResourceList
-- | APIResourceList is a list of APIResource, it is used to expose the name of the resources supported in a specific group and version, and if the resource is namespaced.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.APIVersions
-- | APIVersions lists the versions that are available, to allow clients to discover the API at /api, which is the root path of the legacy v1 API.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.DeleteOptions
-- | DeleteOptions may be provided when deleting an API object.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.GroupVersionForDiscovery
-- | GroupVersion contains the "group/version" and "version" string of a version. It is made a struct to keep extensibility.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.Initializer
-- | Initializer is information about an initializer that has not yet completed.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.Initializers
-- | Initializers tracks the progress of initialization.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector
-- | A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelectorRequirement
-- | A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta
-- | ListMeta describes metadata that synthetic resources must have, including lists and various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime
newtype MicroTime = MicroTime String

derive instance newtypeMicroTime :: Newtype MicroTime _
derive instance genericMicroTime :: Generic MicroTime _
instance showMicroTime :: Show MicroTime where show a = genericShow a
instance decodeMicroTime :: Decode MicroTime where
  decode a = genericDecode jsonOptions a 
instance encodeMicroTime :: Encode MicroTime where
  encode a = genericEncode jsonOptions a

-- | io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta
-- | ObjectMeta is metadata that all persisted resources must have, which includes all objects users must create.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.OwnerReference
-- | OwnerReference contains enough information to let you identify an owning object. Currently, an owning object must be in the same namespace, so there is no namespace field.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.Preconditions
-- | Preconditions must be fulfilled before an operation (update, delete, etc.) is carried out.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.ServerAddressByClientCIDR
-- | ServerAddressByClientCIDR helps the client to determine the server address that they should use, depending on the clientCIDR that they match.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.Status
-- | Status is a return value for calls that don't return other objects.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.StatusCause
-- | StatusCause provides more information about an api.Status failure, including cases when multiple errors are encountered.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.StatusDetails
-- | StatusDetails is a set of additional properties that MAY be set by the server to provide additional information about a response. The Reason field of a Status object defines what attributes will be set. Clients must ignore fields that do not match the defined type of each attribute, and should assume that any attribute may be empty, invalid, or under defined.
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

-- | io.k8s.apimachinery.pkg.apis.meta.v1.Time
newtype Time = Time String

derive instance newtypeTime :: Newtype Time _
derive instance genericTime :: Generic Time _
instance showTime :: Show Time where show a = genericShow a
instance decodeTime :: Decode Time where
  decode a = genericDecode jsonOptions a 
instance encodeTime :: Encode Time where
  encode a = genericEncode jsonOptions a

-- | io.k8s.apimachinery.pkg.apis.meta.v1.WatchEvent
-- | Event represents a single event to a watched resource.
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