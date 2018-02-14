module Kubernetes.Api.Core.V1.Pod where

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

-- | connect DELETE requests to proxy of Pod
connectDeleteNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedProxy cfg namespace name = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect DELETE requests to proxy of Pod
connectDeleteNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect GET requests to attach of Pod
connectGetNamespacedAttach :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedAttach cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/attach"

-- | connect GET requests to exec of Pod
connectGetNamespacedExec :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedExec cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/exec"

-- | connect GET requests to portforward of Pod
connectGetNamespacedPortforward :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPortforward cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/portforward"

-- | connect GET requests to proxy of Pod
connectGetNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedProxy cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect GET requests to proxy of Pod
connectGetNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect HEAD requests to proxy of Pod
connectHeadNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedProxy cfg namespace name = Client.makeRequest (Client.head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect HEAD requests to proxy of Pod
connectHeadNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect OPTIONS requests to proxy of Pod
connectOptionsNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedProxy cfg namespace name = Client.makeRequest (Client.options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect OPTIONS requests to proxy of Pod
connectOptionsNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect POST requests to attach of Pod
connectPostNamespacedAttach :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedAttach cfg namespace name = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/attach"

-- | connect POST requests to exec of Pod
connectPostNamespacedExec :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedExec cfg namespace name = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/exec"

-- | connect POST requests to portforward of Pod
connectPostNamespacedPortforward :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPortforward cfg namespace name = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/portforward"

-- | connect POST requests to proxy of Pod
connectPostNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedProxy cfg namespace name = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect POST requests to proxy of Pod
connectPostNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect PUT requests to proxy of Pod
connectPutNamespacedProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedProxy cfg namespace name = Client.makeRequest (Client.put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect PUT requests to proxy of Pod
connectPutNamespacedProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedProxyWithPath cfg namespace name path = Client.makeRequest (Client.put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | create a Pod
createNamespaced :: forall e. Config -> String -> CoreV1.Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
createNamespaced cfg namespace body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods"
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
newtype DeleteCollectionNamespacedOptions = DeleteCollectionNamespacedOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionNamespacedOptions :: Newtype DeleteCollectionNamespacedOptions _
derive instance genericDeleteCollectionNamespacedOptions :: Generic DeleteCollectionNamespacedOptions _
instance showDeleteCollectionNamespacedOptions :: Show DeleteCollectionNamespacedOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedOptions :: Decode DeleteCollectionNamespacedOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionNamespacedOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionNamespacedOptions :: Encode DeleteCollectionNamespacedOptions where
  encode (DeleteCollectionNamespacedOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionNamespacedOptions :: Default DeleteCollectionNamespacedOptions where
  default = DeleteCollectionNamespacedOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | delete collection of Pod
deleteCollectionNamespaced :: forall e. Config -> String -> DeleteCollectionNamespacedOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespaced cfg namespace options = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods" <> Client.formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedOptions = DeleteNamespacedOptions
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeleteNamespacedOptions :: Newtype DeleteNamespacedOptions _
derive instance genericDeleteNamespacedOptions :: Generic DeleteNamespacedOptions _
instance showDeleteNamespacedOptions :: Show DeleteNamespacedOptions where show a = genericShow a
instance decodeDeleteNamespacedOptions :: Decode DeleteNamespacedOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeleteNamespacedOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteNamespacedOptions :: Encode DeleteNamespacedOptions where
  encode (DeleteNamespacedOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeleteNamespacedOptions :: Default DeleteNamespacedOptions where
  default = DeleteNamespacedOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a Pod
deleteNamespaced :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespaced cfg namespace name body options = Client.makeRequest (Client.delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "" <> Client.formatQueryString options
    encodedBody = encodeJSON body

-- | list or watch objects of kind Pod
listForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.PodList)
listForAllNamespaces cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/pods"

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

-- | list or watch objects of kind Pod
listNamespaced :: forall e. Config -> String -> ListNamespacedOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.PodList)
listNamespaced cfg namespace options = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods" <> Client.formatQueryString options

-- | proxy DELETE requests to Pod
proxyDELETENamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespaced cfg namespace name = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy DELETE requests to Pod
proxyDELETENamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedWithPath cfg namespace name path = Client.makeRequest (Client.delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy GET requests to Pod
proxyGETNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespaced cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy GET requests to Pod
proxyGETNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy HEAD requests to Pod
proxyHEADNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespaced cfg namespace name = Client.makeRequest (Client.head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy HEAD requests to Pod
proxyHEADNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy OPTIONS requests to Pod
proxyOPTIONSNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespaced cfg namespace name = Client.makeRequest (Client.options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy OPTIONS requests to Pod
proxyOPTIONSNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy POST requests to Pod
proxyPOSTNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespaced cfg namespace name = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy POST requests to Pod
proxyPOSTNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy PUT requests to Pod
proxyPUTNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespaced cfg namespace name = Client.makeRequest (Client.put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy PUT requests to Pod
proxyPUTNamespacedWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedWithPath cfg namespace name path = Client.makeRequest (Client.put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

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

-- | read the specified Pod
readNamespaced :: forall e. Config -> String -> String -> ReadNamespacedOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
readNamespaced cfg namespace name options = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "" <> Client.formatQueryString options

-- | read log of the specified Pod
readNamespacedLog :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
readNamespacedLog cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/log"

-- | read status of the specified Pod
readNamespacedStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
readNamespacedStatus cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/status"

-- | replace the specified Pod
replaceNamespaced :: forall e. Config -> String -> String -> CoreV1.Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
replaceNamespaced cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Pod
replaceNamespacedStatus :: forall e. Config -> String -> String -> CoreV1.Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
replaceNamespacedStatus cfg namespace name body = Client.makeRequest (Client.put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of Pod
watchListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchListForAllNamespaces cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/watch/pods"

-- | watch changes to an object of kind Pod
watchNamespaced :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespaced cfg namespace name = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | watch individual changes to a list of Pod
watchNamespacedList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedList cfg namespace = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/pods"