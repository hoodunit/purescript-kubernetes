module Kubernetes.Api.CoreV1.Pod where

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

-- | connect DELETE requests to proxy of Pod
connectDeleteNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedPodProxy cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect DELETE requests to proxy of Pod
connectDeleteNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNamespacedPodProxyWithPath cfg namespace name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect GET requests to attach of Pod
connectGetNamespacedPodAttach :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodAttach cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/attach"

-- | connect GET requests to exec of Pod
connectGetNamespacedPodExec :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodExec cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/exec"

-- | connect GET requests to portforward of Pod
connectGetNamespacedPodPortforward :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodPortforward cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/portforward"

-- | connect GET requests to proxy of Pod
connectGetNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodProxy cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect GET requests to proxy of Pod
connectGetNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNamespacedPodProxyWithPath cfg namespace name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect HEAD requests to proxy of Pod
connectHeadNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedPodProxy cfg namespace name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect HEAD requests to proxy of Pod
connectHeadNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNamespacedPodProxyWithPath cfg namespace name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect OPTIONS requests to proxy of Pod
connectOptionsNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedPodProxy cfg namespace name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect OPTIONS requests to proxy of Pod
connectOptionsNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNamespacedPodProxyWithPath cfg namespace name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect POST requests to attach of Pod
connectPostNamespacedPodAttach :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodAttach cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/attach"

-- | connect POST requests to exec of Pod
connectPostNamespacedPodExec :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodExec cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/exec"

-- | connect POST requests to portforward of Pod
connectPostNamespacedPodPortforward :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodPortforward cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/portforward"

-- | connect POST requests to proxy of Pod
connectPostNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodProxy cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect POST requests to proxy of Pod
connectPostNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNamespacedPodProxyWithPath cfg namespace name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | connect PUT requests to proxy of Pod
connectPutNamespacedPodProxy :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedPodProxy cfg namespace name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy"

-- | connect PUT requests to proxy of Pod
connectPutNamespacedPodProxyWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNamespacedPodProxyWithPath cfg namespace name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/proxy/" <> path <> ""

-- | create a Pod
createNamespacedPod :: forall e. Config -> String -> CoreV1.Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
createNamespacedPod cfg namespace body = makeRequest (post cfg url (Just encodedBody))
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
newtype DeleteCollectionNamespacedPodOptions = DeleteCollectionNamespacedPodOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionNamespacedPodOptions :: Newtype DeleteCollectionNamespacedPodOptions _
derive instance genericDeleteCollectionNamespacedPodOptions :: Generic DeleteCollectionNamespacedPodOptions _
instance showDeleteCollectionNamespacedPodOptions :: Show DeleteCollectionNamespacedPodOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedPodOptions :: Decode DeleteCollectionNamespacedPodOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionNamespacedPodOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionNamespacedPodOptions :: Encode DeleteCollectionNamespacedPodOptions where
  encode (DeleteCollectionNamespacedPodOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionNamespacedPodOptions :: Default DeleteCollectionNamespacedPodOptions where
  default = DeleteCollectionNamespacedPodOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | delete collection of Pod
deleteCollectionNamespacedPod :: forall e. Config -> String -> DeleteCollectionNamespacedPodOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedPod cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedPodOptions = DeleteNamespacedPodOptions
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeleteNamespacedPodOptions :: Newtype DeleteNamespacedPodOptions _
derive instance genericDeleteNamespacedPodOptions :: Generic DeleteNamespacedPodOptions _
instance showDeleteNamespacedPodOptions :: Show DeleteNamespacedPodOptions where show a = genericShow a
instance decodeDeleteNamespacedPodOptions :: Decode DeleteNamespacedPodOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeleteNamespacedPodOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteNamespacedPodOptions :: Encode DeleteNamespacedPodOptions where
  encode (DeleteNamespacedPodOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeleteNamespacedPodOptions :: Default DeleteNamespacedPodOptions where
  default = DeleteNamespacedPodOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a Pod
deleteNamespacedPod :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedPodOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedPod cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "" <> formatQueryString options
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
newtype ListNamespacedPodOptions = ListNamespacedPodOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListNamespacedPodOptions :: Newtype ListNamespacedPodOptions _
derive instance genericListNamespacedPodOptions :: Generic ListNamespacedPodOptions _
instance showListNamespacedPodOptions :: Show ListNamespacedPodOptions where show a = genericShow a
instance decodeListNamespacedPodOptions :: Decode ListNamespacedPodOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListNamespacedPodOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListNamespacedPodOptions :: Encode ListNamespacedPodOptions where
  encode (ListNamespacedPodOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListNamespacedPodOptions :: Default ListNamespacedPodOptions where
  default = ListNamespacedPodOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind Pod
listNamespacedPod :: forall e. Config -> String -> ListNamespacedPodOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.PodList)
listNamespacedPod cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods" <> formatQueryString options

-- | list or watch objects of kind Pod
listPodForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.PodList)
listPodForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/pods"

-- | proxy DELETE requests to Pod
proxyDELETENamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedPod cfg namespace name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy DELETE requests to Pod
proxyDELETENamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENamespacedPodWithPath cfg namespace name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy GET requests to Pod
proxyGETNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedPod cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy GET requests to Pod
proxyGETNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNamespacedPodWithPath cfg namespace name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy HEAD requests to Pod
proxyHEADNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedPod cfg namespace name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy HEAD requests to Pod
proxyHEADNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNamespacedPodWithPath cfg namespace name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy OPTIONS requests to Pod
proxyOPTIONSNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedPod cfg namespace name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy OPTIONS requests to Pod
proxyOPTIONSNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNamespacedPodWithPath cfg namespace name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy POST requests to Pod
proxyPOSTNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedPod cfg namespace name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy POST requests to Pod
proxyPOSTNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNamespacedPodWithPath cfg namespace name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | proxy PUT requests to Pod
proxyPUTNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedPod cfg namespace name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | proxy PUT requests to Pod
proxyPUTNamespacedPodWithPath :: forall e. Config -> String -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNamespacedPodWithPath cfg namespace name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/namespaces/" <> namespace <> "/pods/" <> name <> "/" <> path <> ""

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNamespacedPodOptions = ReadNamespacedPodOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadNamespacedPodOptions :: Newtype ReadNamespacedPodOptions _
derive instance genericReadNamespacedPodOptions :: Generic ReadNamespacedPodOptions _
instance showReadNamespacedPodOptions :: Show ReadNamespacedPodOptions where show a = genericShow a
instance decodeReadNamespacedPodOptions :: Decode ReadNamespacedPodOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadNamespacedPodOptions { exact, export }
instance encodeReadNamespacedPodOptions :: Encode ReadNamespacedPodOptions where
  encode (ReadNamespacedPodOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadNamespacedPodOptions :: Default ReadNamespacedPodOptions where
  default = ReadNamespacedPodOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified Pod
readNamespacedPod :: forall e. Config -> String -> String -> ReadNamespacedPodOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
readNamespacedPod cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "" <> formatQueryString options

-- | read log of the specified Pod
readNamespacedPodLog :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
readNamespacedPodLog cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/log"

-- | read status of the specified Pod
readNamespacedPodStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
readNamespacedPodStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/status"

-- | replace the specified Pod
replaceNamespacedPod :: forall e. Config -> String -> String -> CoreV1.Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
replaceNamespacedPod cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Pod
replaceNamespacedPodStatus :: forall e. Config -> String -> String -> CoreV1.Pod -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Pod)
replaceNamespacedPodStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind Pod
watchNamespacedPod :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPod cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/pods/" <> name <> ""

-- | watch individual changes to a list of Pod
watchNamespacedPodList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/namespaces/" <> namespace <> "/pods"

-- | watch individual changes to a list of Pod
watchPodListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/pods"