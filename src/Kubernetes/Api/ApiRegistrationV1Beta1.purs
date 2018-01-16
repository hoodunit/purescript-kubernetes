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

-- | io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.APIService
-- | APIService represents a server for a particular GroupVersion. Name must be "version.group".
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

-- | io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.APIServiceCondition
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

-- | io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.APIServiceList
-- | APIServiceList is a list of APIService objects.
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

-- | io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.APIServiceSpec
-- | APIServiceSpec contains information for locating and communicating with a server. Only https is supported, though you are able to disable certificate verification.
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

-- | io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.APIServiceStatus
-- | APIServiceStatus contains derived information about an API server
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

-- | io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.ServiceReference
-- | ServiceReference holds a reference to Service.legacy.k8s.io
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

-- | DeleteAPIServiceOptions
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

-- | DeleteCollectionAPIServiceOptions
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

-- | ListAPIServiceOptions
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

-- | ReadAPIServiceOptions
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