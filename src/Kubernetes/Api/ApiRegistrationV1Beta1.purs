module Kubernetes.Api.ApiRegistrationV1Beta1 where

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

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiregistration.k8s.io/v1beta1/"