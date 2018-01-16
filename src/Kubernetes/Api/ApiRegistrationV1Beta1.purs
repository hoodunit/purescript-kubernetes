module Kubernetes.Api.ApiRegistrationV1Beta1 where

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

-- | APIService represents a server for a particular GroupVersion. Name must be "version.group".
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Spec contains information for locating and communicating with a server
-- | - `status`: Status contains derived information about an API server
newtype APIService = APIService
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined APIServiceSpec)
  , status :: (NullOrUndefined APIServiceStatus) }

derive instance newtypeAPIService :: Newtype APIService _
derive instance genericAPIService :: Generic APIService _
instance showAPIService :: Show APIService where show a = genericShow a
instance decodeAPIService :: Decode APIService where
  decode a = genericDecode jsonOptions a 
instance encodeAPIService :: Encode APIService where
  encode a = genericEncode jsonOptions a

instance defaultAPIService :: Default APIService where
  default = APIService
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | Fields:
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: Human-readable message indicating details about last transition.
-- | - `reason`: Unique, one-word, CamelCase reason for the condition's last transition.
-- | - `status`: Status is the status of the condition. Can be True, False, Unknown.
-- | - `_type`: Type is the type of the condition.
newtype APIServiceCondition = APIServiceCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeAPIServiceCondition :: Newtype APIServiceCondition _
derive instance genericAPIServiceCondition :: Generic APIServiceCondition _
instance showAPIServiceCondition :: Show APIServiceCondition where show a = genericShow a
instance decodeAPIServiceCondition :: Decode APIServiceCondition where
  decode a = genericDecode jsonOptions a 
instance encodeAPIServiceCondition :: Encode APIServiceCondition where
  encode a = genericEncode jsonOptions a

instance defaultAPIServiceCondition :: Default APIServiceCondition where
  default = APIServiceCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | APIServiceList is a list of APIService objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
newtype APIServiceList = APIServiceList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array APIService))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeAPIServiceList :: Newtype APIServiceList _
derive instance genericAPIServiceList :: Generic APIServiceList _
instance showAPIServiceList :: Show APIServiceList where show a = genericShow a
instance decodeAPIServiceList :: Decode APIServiceList where
  decode a = genericDecode jsonOptions a 
instance encodeAPIServiceList :: Encode APIServiceList where
  encode a = genericEncode jsonOptions a

instance defaultAPIServiceList :: Default APIServiceList where
  default = APIServiceList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | APIServiceSpec contains information for locating and communicating with a server. Only https is supported, though you are able to disable certificate verification.
-- |
-- | Fields:
-- | - `caBundle`: CABundle is a PEM encoded CA bundle which will be used to validate an API server's serving certificate.
-- | - `group`: Group is the API group name this server hosts
-- | - `groupPriorityMinimum`: GroupPriorityMininum is the priority this group should have at least. Higher priority means that the group is preferred by clients over lower priority ones. Note that other versions of this group might specify even higher GroupPriorityMininum values such that the whole group gets a higher priority. The primary sort is based on GroupPriorityMinimum, ordered highest number to lowest (20 before 10). The secondary sort is based on the alphabetical comparison of the name of the object.  (v1.bar before v1.foo) We'd recommend something like: *.k8s.io (except extensions) at 18000 and PaaSes (OpenShift, Deis) are recommended to be in the 2000s
-- | - `insecureSkipTLSVerify`: InsecureSkipTLSVerify disables TLS certificate verification when communicating with this server. This is strongly discouraged.  You should use the CABundle instead.
-- | - `service`: Service is a reference to the service for this API server.  It must communicate on port 443 If the Service is nil, that means the handling for the API groupversion is handled locally on this server. The call will simply delegate to the normal handler chain to be fulfilled.
-- | - `version`: Version is the API version this server hosts.  For example, "v1"
-- | - `versionPriority`: VersionPriority controls the ordering of this API version inside of its group.  Must be greater than zero. The primary sort is based on VersionPriority, ordered highest to lowest (20 before 10). The secondary sort is based on the alphabetical comparison of the name of the object.  (v1.bar before v1.foo) Since it's inside of a group, the number can be small, probably in the 10s.
newtype APIServiceSpec = APIServiceSpec
  { caBundle :: (NullOrUndefined String)
  , group :: (NullOrUndefined String)
  , groupPriorityMinimum :: (NullOrUndefined Int)
  , insecureSkipTLSVerify :: (NullOrUndefined Boolean)
  , service :: (NullOrUndefined ServiceReference)
  , version :: (NullOrUndefined String)
  , versionPriority :: (NullOrUndefined Int) }

derive instance newtypeAPIServiceSpec :: Newtype APIServiceSpec _
derive instance genericAPIServiceSpec :: Generic APIServiceSpec _
instance showAPIServiceSpec :: Show APIServiceSpec where show a = genericShow a
instance decodeAPIServiceSpec :: Decode APIServiceSpec where
  decode a = genericDecode jsonOptions a 
instance encodeAPIServiceSpec :: Encode APIServiceSpec where
  encode a = genericEncode jsonOptions a

instance defaultAPIServiceSpec :: Default APIServiceSpec where
  default = APIServiceSpec
    { caBundle: NullOrUndefined Nothing
    , group: NullOrUndefined Nothing
    , groupPriorityMinimum: NullOrUndefined Nothing
    , insecureSkipTLSVerify: NullOrUndefined Nothing
    , service: NullOrUndefined Nothing
    , version: NullOrUndefined Nothing
    , versionPriority: NullOrUndefined Nothing }

-- | APIServiceStatus contains derived information about an API server
-- |
-- | Fields:
-- | - `conditions`: Current service state of apiService.
newtype APIServiceStatus = APIServiceStatus
  { conditions :: (NullOrUndefined (Array APIServiceCondition)) }

derive instance newtypeAPIServiceStatus :: Newtype APIServiceStatus _
derive instance genericAPIServiceStatus :: Generic APIServiceStatus _
instance showAPIServiceStatus :: Show APIServiceStatus where show a = genericShow a
instance decodeAPIServiceStatus :: Decode APIServiceStatus where
  decode a = genericDecode jsonOptions a 
instance encodeAPIServiceStatus :: Encode APIServiceStatus where
  encode a = genericEncode jsonOptions a

instance defaultAPIServiceStatus :: Default APIServiceStatus where
  default = APIServiceStatus
    { conditions: NullOrUndefined Nothing }

-- | ServiceReference holds a reference to Service.legacy.k8s.io
-- |
-- | Fields:
-- | - `name`: Name is the name of the service
-- | - `namespace`: Namespace is the namespace of the service
newtype ServiceReference = ServiceReference
  { name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String) }

derive instance newtypeServiceReference :: Newtype ServiceReference _
derive instance genericServiceReference :: Generic ServiceReference _
instance showServiceReference :: Show ServiceReference where show a = genericShow a
instance decodeServiceReference :: Decode ServiceReference where
  decode a = genericDecode jsonOptions a 
instance encodeServiceReference :: Encode ServiceReference where
  encode a = genericEncode jsonOptions a

instance defaultServiceReference :: Default ServiceReference where
  default = ServiceReference
    { name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing }

-- | create an APIService
createAPIService :: forall e. Config -> APIService -> Aff (http :: HTTP | e) (Either MetaV1.Status APIService)
createAPIService cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/apiservices"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteAPIServiceOptions = DeleteAPIServiceOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteAPIServiceOptions :: Newtype DeleteAPIServiceOptions _
derive instance genericDeleteAPIServiceOptions :: Generic DeleteAPIServiceOptions _
instance showDeleteAPIServiceOptions :: Show DeleteAPIServiceOptions where show a = genericShow a
instance decodeDeleteAPIServiceOptions :: Decode DeleteAPIServiceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteAPIServiceOptions :: Encode DeleteAPIServiceOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteAPIServiceOptions :: Default DeleteAPIServiceOptions where
  default = DeleteAPIServiceOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete an APIService
deleteAPIService :: forall e. Config -> MetaV1.DeleteOptions -> DeleteAPIServiceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteAPIService cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/apiservices/{name}" <> formatQueryString options
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
newtype DeleteCollectionAPIServiceOptions = DeleteCollectionAPIServiceOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionAPIServiceOptions :: Newtype DeleteCollectionAPIServiceOptions _
derive instance genericDeleteCollectionAPIServiceOptions :: Generic DeleteCollectionAPIServiceOptions _
instance showDeleteCollectionAPIServiceOptions :: Show DeleteCollectionAPIServiceOptions where show a = genericShow a
instance decodeDeleteCollectionAPIServiceOptions :: Decode DeleteCollectionAPIServiceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionAPIServiceOptions :: Encode DeleteCollectionAPIServiceOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionAPIServiceOptions :: Default DeleteCollectionAPIServiceOptions where
  default = DeleteCollectionAPIServiceOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of APIService
deleteCollectionAPIService :: forall e. Config -> DeleteCollectionAPIServiceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionAPIService cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/apiservices" <> formatQueryString options

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/"

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
newtype ListAPIServiceOptions = ListAPIServiceOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListAPIServiceOptions :: Newtype ListAPIServiceOptions _
derive instance genericListAPIServiceOptions :: Generic ListAPIServiceOptions _
instance showListAPIServiceOptions :: Show ListAPIServiceOptions where show a = genericShow a
instance decodeListAPIServiceOptions :: Decode ListAPIServiceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListAPIServiceOptions :: Encode ListAPIServiceOptions where
  encode a = genericEncode jsonOptions a

instance defaultListAPIServiceOptions :: Default ListAPIServiceOptions where
  default = ListAPIServiceOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind APIService
listAPIService :: forall e. Config -> ListAPIServiceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIServiceList)
listAPIService cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/apiservices" <> formatQueryString options

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadAPIServiceOptions = ReadAPIServiceOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadAPIServiceOptions :: Newtype ReadAPIServiceOptions _
derive instance genericReadAPIServiceOptions :: Generic ReadAPIServiceOptions _
instance showReadAPIServiceOptions :: Show ReadAPIServiceOptions where show a = genericShow a
instance decodeReadAPIServiceOptions :: Decode ReadAPIServiceOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadAPIServiceOptions :: Encode ReadAPIServiceOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadAPIServiceOptions :: Default ReadAPIServiceOptions where
  default = ReadAPIServiceOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified APIService
readAPIService :: forall e. Config -> ReadAPIServiceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status APIService)
readAPIService cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/apiservices/{name}" <> formatQueryString options

-- | replace the specified APIService
replaceAPIService :: forall e. Config -> APIService -> Aff (http :: HTTP | e) (Either MetaV1.Status APIService)
replaceAPIService cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/apiservices/{name}"
    encodedBody = encodeJSON body

-- | replace status of the specified APIService
replaceAPIServiceStatus :: forall e. Config -> APIService -> Aff (http :: HTTP | e) (Either MetaV1.Status APIService)
replaceAPIServiceStatus cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/apiservices/{name}/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind APIService
watchAPIService :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchAPIService cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/watch/apiservices/{name}"

-- | watch individual changes to a list of APIService
watchAPIServiceList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchAPIServiceList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/watch/apiservices"