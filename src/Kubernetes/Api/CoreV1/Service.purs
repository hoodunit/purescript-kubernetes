module Kubernetes.Api.CoreV1.Service where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Index (readProp)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1

-- | connect DELETE requests to proxy of Service
connectDeleteNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedServiceProxy cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect DELETE requests to proxy of Service
connectDeleteNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect GET requests to proxy of Service
connectGetNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedServiceProxy cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect GET requests to proxy of Service
connectGetNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect HEAD requests to proxy of Service
connectHeadNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedServiceProxy cfg namespace name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect HEAD requests to proxy of Service
connectHeadNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect OPTIONS requests to proxy of Service
connectOptionsNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedServiceProxy cfg namespace name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect OPTIONS requests to proxy of Service
connectOptionsNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect POST requests to proxy of Service
connectPostNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedServiceProxy cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect POST requests to proxy of Service
connectPostNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect PUT requests to proxy of Service
connectPutNamespacedServiceProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedServiceProxy cfg namespace name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect PUT requests to proxy of Service
connectPutNamespacedServiceProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedServiceProxyWithPath cfg namespace name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | create a Service
createNamespacedService :: forall e. Config -> String -> CoreV1.Service -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
createNamespacedService cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services"
    encodedBody = encodeJSON body

-- | delete a Service
deleteNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedService cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> ""

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
newtype ListNamespacedServiceOptions = ListNamespacedServiceOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListNamespacedServiceOptions :: Newtype ListNamespacedServiceOptions _
derive instance genericListNamespacedServiceOptions :: Generic ListNamespacedServiceOptions _
instance showListNamespacedServiceOptions :: Show ListNamespacedServiceOptions where show a = genericShow a
instance decodeListNamespacedServiceOptions :: Decode ListNamespacedServiceOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListNamespacedServiceOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListNamespacedServiceOptions :: Encode ListNamespacedServiceOptions where
  encode (ListNamespacedServiceOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListNamespacedServiceOptions :: Default ListNamespacedServiceOptions where
  default = ListNamespacedServiceOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind Service
listNamespacedService :: forall e. Config -> String -> ListNamespacedServiceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.ServiceList)
listNamespacedService cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services" <> formatQueryString options

-- | list or watch objects of kind Service
listServiceForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.ServiceList)
listServiceForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/services"

-- | proxy DELETE requests to Service
proxyDELETENamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedService cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy DELETE requests to Service
proxyDELETENamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedServiceWithPath cfg namespace name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy GET requests to Service
proxyGETNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedService cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy GET requests to Service
proxyGETNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedServiceWithPath cfg namespace name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy HEAD requests to Service
proxyHEADNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedService cfg namespace name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy HEAD requests to Service
proxyHEADNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedServiceWithPath cfg namespace name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy OPTIONS requests to Service
proxyOPTIONSNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedService cfg namespace name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy OPTIONS requests to Service
proxyOPTIONSNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedServiceWithPath cfg namespace name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy POST requests to Service
proxyPOSTNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedService cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy POST requests to Service
proxyPOSTNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedServiceWithPath cfg namespace name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy PUT requests to Service
proxyPUTNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedService cfg namespace name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy PUT requests to Service
proxyPUTNamespacedServiceWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedServiceWithPath cfg namespace name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedServiceOptions = ReadNamespacedServiceOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadNamespacedServiceOptions :: Newtype ReadNamespacedServiceOptions _
derive instance genericReadNamespacedServiceOptions :: Generic ReadNamespacedServiceOptions _
instance showReadNamespacedServiceOptions :: Show ReadNamespacedServiceOptions where show a = genericShow a
instance decodeReadNamespacedServiceOptions :: Decode ReadNamespacedServiceOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadNamespacedServiceOptions { exact, export }
instance encodeReadNamespacedServiceOptions :: Encode ReadNamespacedServiceOptions where
  encode (ReadNamespacedServiceOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadNamespacedServiceOptions :: Default ReadNamespacedServiceOptions where
  default = ReadNamespacedServiceOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified Service
readNamespacedService :: forall e. Config -> String -> String -> ReadNamespacedServiceOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
readNamespacedService cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "" <> formatQueryString options

-- | read status of the specified Service
readNamespacedServiceStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
readNamespacedServiceStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/status"

-- | replace the specified Service
replaceNamespacedService :: forall e. Config -> String -> String -> CoreV1.Service -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
replaceNamespacedService cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Service
replaceNamespacedServiceStatus :: forall e. Config -> String -> String -> CoreV1.Service -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
replaceNamespacedServiceStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind Service
watchNamespacedService :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedService cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | watch individual changes to a list of Service
watchNamespacedServiceList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedServiceList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/services"

-- | watch individual changes to a list of Service
watchServiceListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchServiceListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/services"