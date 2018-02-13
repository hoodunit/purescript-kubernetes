module Kubernetes.Api.Core.V1.Service where

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
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Kubernetes.Api.Core.V1 as CoreV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | connect DELETE requests to proxy of Service
connectDeleteNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedProxy cfg namespace name = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect DELETE requests to proxy of Service
connectDeleteNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect GET requests to proxy of Service
connectGetNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedProxy cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect GET requests to proxy of Service
connectGetNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect HEAD requests to proxy of Service
connectHeadNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedProxy cfg namespace name = Client.makeRequest (Client.head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect HEAD requests to proxy of Service
connectHeadNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect OPTIONS requests to proxy of Service
connectOptionsNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedProxy cfg namespace name = Client.makeRequest (Client.options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect OPTIONS requests to proxy of Service
connectOptionsNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect POST requests to proxy of Service
connectPostNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedProxy cfg namespace name = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect POST requests to proxy of Service
connectPostNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | connect PUT requests to proxy of Service
connectPutNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedProxy cfg namespace name = Client.makeRequest (Client.put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy"

-- | connect PUT requests to proxy of Service
connectPutNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/proxy/" <> path <> ""

-- | create a Service
createNamespaced :: forall e. Config -> String -> CoreV1.Service -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
createNamespaced cfg namespace body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services"
    encodedBody = encodeJSON body

-- | delete a Service
deleteNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespaced cfg namespace name = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | list or watch objects of kind Service
listForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.ServiceList)
listForAllNamespaces cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/services"

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
newtype ListNamespacedOptions = ListNamespacedOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListNamespacedOptions :: Newtype ListNamespacedOptions _
derive instance genericListNamespacedOptions :: Generic ListNamespacedOptions _
instance showListNamespacedOptions :: Show ListNamespacedOptions where show a = genericShow a
instance decodeListNamespacedOptions :: Decode ListNamespacedOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListNamespacedOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListNamespacedOptions :: Encode ListNamespacedOptions where
  encode (ListNamespacedOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListNamespacedOptions :: Default ListNamespacedOptions where
  default = ListNamespacedOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind Service
listNamespaced :: forall e. Config -> String -> ListNamespacedOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.ServiceList)
listNamespaced cfg namespace options = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services" <> Client.formatQueryString options

-- | proxy DELETE requests to Service
proxyDELETENamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespaced cfg namespace name = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy DELETE requests to Service
proxyDELETENamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedWithPath cfg namespace name path = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy GET requests to Service
proxyGETNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespaced cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy GET requests to Service
proxyGETNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy HEAD requests to Service
proxyHEADNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespaced cfg namespace name = Client.makeRequest (Client.head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy HEAD requests to Service
proxyHEADNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy OPTIONS requests to Service
proxyOPTIONSNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespaced cfg namespace name = Client.makeRequest (Client.options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy OPTIONS requests to Service
proxyOPTIONSNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy POST requests to Service
proxyPOSTNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespaced cfg namespace name = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy POST requests to Service
proxyPOSTNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | proxy PUT requests to Service
proxyPUTNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespaced cfg namespace name = Client.makeRequest (Client.put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | proxy PUT requests to Service
proxyPUTNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/services/" <> name <> "/" <> path <> ""

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedOptions = ReadNamespacedOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadNamespacedOptions :: Newtype ReadNamespacedOptions _
derive instance genericReadNamespacedOptions :: Generic ReadNamespacedOptions _
instance showReadNamespacedOptions :: Show ReadNamespacedOptions where show a = genericShow a
instance decodeReadNamespacedOptions :: Decode ReadNamespacedOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadNamespacedOptions { exact, export }
instance encodeReadNamespacedOptions :: Encode ReadNamespacedOptions where
  encode (ReadNamespacedOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadNamespacedOptions :: Default ReadNamespacedOptions where
  default = ReadNamespacedOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified Service
readNamespaced :: forall e. Config -> String -> String -> ReadNamespacedOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
readNamespaced cfg namespace name options = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "" <> Client.formatQueryString options

-- | read status of the specified Service
readNamespacedStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
readNamespacedStatus cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/status"

-- | replace the specified Service
replaceNamespaced :: forall e. Config -> String -> String -> CoreV1.Service -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
replaceNamespaced cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Service
replaceNamespacedStatus :: forall e. Config -> String -> String -> CoreV1.Service -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Service)
replaceNamespacedStatus cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/services/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of Service
watchListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchListForAllNamespaces cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/watch/services"

-- | watch changes to an object of kind Service
watchNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespaced cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/services/" <> name <> ""

-- | watch individual changes to a list of Service
watchNamespacedList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedList cfg namespace = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/services"