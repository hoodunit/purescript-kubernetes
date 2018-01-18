module Kubernetes.Api.CoreV1.Node where

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

-- | connect DELETE requests to proxy of Node
connectDeleteNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNodeProxy cfg name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect DELETE requests to proxy of Node
connectDeleteNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectDeleteNodeProxyWithPath cfg name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect GET requests to proxy of Node
connectGetNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNodeProxy cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect GET requests to proxy of Node
connectGetNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectGetNodeProxyWithPath cfg name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect HEAD requests to proxy of Node
connectHeadNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNodeProxy cfg name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect HEAD requests to proxy of Node
connectHeadNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectHeadNodeProxyWithPath cfg name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect OPTIONS requests to proxy of Node
connectOptionsNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNodeProxy cfg name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect OPTIONS requests to proxy of Node
connectOptionsNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectOptionsNodeProxyWithPath cfg name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect POST requests to proxy of Node
connectPostNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNodeProxy cfg name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect POST requests to proxy of Node
connectPostNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPostNodeProxyWithPath cfg name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | connect PUT requests to proxy of Node
connectPutNodeProxy :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNodeProxy cfg name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy"

-- | connect PUT requests to proxy of Node
connectPutNodeProxyWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
connectPutNodeProxyWithPath cfg name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/proxy/" <> path <> ""

-- | create a Node
createNode :: forall e. Config -> CoreV1.Node -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Node)
createNode cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/nodes"
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
newtype DeleteCollectionNodeOptions = DeleteCollectionNodeOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeDeleteCollectionNodeOptions :: Newtype DeleteCollectionNodeOptions _
derive instance genericDeleteCollectionNodeOptions :: Generic DeleteCollectionNodeOptions _
instance showDeleteCollectionNodeOptions :: Show DeleteCollectionNodeOptions where show a = genericShow a
instance decodeDeleteCollectionNodeOptions :: Decode DeleteCollectionNodeOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ DeleteCollectionNodeOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeDeleteCollectionNodeOptions :: Encode DeleteCollectionNodeOptions where
  encode (DeleteCollectionNodeOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultDeleteCollectionNodeOptions :: Default DeleteCollectionNodeOptions where
  default = DeleteCollectionNodeOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | delete collection of Node
deleteCollectionNode :: forall e. Config -> DeleteCollectionNodeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNode cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/nodes" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNodeOptions = DeleteNodeOptions
  { gracePeriodSeconds :: (Maybe Int)
  , orphanDependents :: (Maybe Boolean)
  , propagationPolicy :: (Maybe String) }

derive instance newtypeDeleteNodeOptions :: Newtype DeleteNodeOptions _
derive instance genericDeleteNodeOptions :: Generic DeleteNodeOptions _
instance showDeleteNodeOptions :: Show DeleteNodeOptions where show a = genericShow a
instance decodeDeleteNodeOptions :: Decode DeleteNodeOptions where
  decode a = do
               gracePeriodSeconds <- decodeMaybe "gracePeriodSeconds" a
               orphanDependents <- decodeMaybe "orphanDependents" a
               propagationPolicy <- decodeMaybe "propagationPolicy" a
               pure $ DeleteNodeOptions { gracePeriodSeconds, orphanDependents, propagationPolicy }
instance encodeDeleteNodeOptions :: Encode DeleteNodeOptions where
  encode (DeleteNodeOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "gracePeriodSeconds" (encodeMaybe a.gracePeriodSeconds)
               , Tuple "orphanDependents" (encodeMaybe a.orphanDependents)
               , Tuple "propagationPolicy" (encodeMaybe a.propagationPolicy) ]


instance defaultDeleteNodeOptions :: Default DeleteNodeOptions where
  default = DeleteNodeOptions
    { gracePeriodSeconds: Nothing
    , orphanDependents: Nothing
    , propagationPolicy: Nothing }

-- | delete a Node
deleteNode :: forall e. Config -> String -> MetaV1.DeleteOptions -> DeleteNodeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNode cfg name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/api/v1/nodes/" <> name <> "" <> formatQueryString options
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
newtype ListNodeOptions = ListNodeOptions
  { continue :: (Maybe String)
  , fieldSelector :: (Maybe String)
  , includeUninitialized :: (Maybe Boolean)
  , labelSelector :: (Maybe String)
  , limit :: (Maybe Int)
  , resourceVersion :: (Maybe String)
  , timeoutSeconds :: (Maybe Int)
  , watch :: (Maybe Boolean) }

derive instance newtypeListNodeOptions :: Newtype ListNodeOptions _
derive instance genericListNodeOptions :: Generic ListNodeOptions _
instance showListNodeOptions :: Show ListNodeOptions where show a = genericShow a
instance decodeListNodeOptions :: Decode ListNodeOptions where
  decode a = do
               continue <- decodeMaybe "continue" a
               fieldSelector <- decodeMaybe "fieldSelector" a
               includeUninitialized <- decodeMaybe "includeUninitialized" a
               labelSelector <- decodeMaybe "labelSelector" a
               limit <- decodeMaybe "limit" a
               resourceVersion <- decodeMaybe "resourceVersion" a
               timeoutSeconds <- decodeMaybe "timeoutSeconds" a
               watch <- decodeMaybe "watch" a
               pure $ ListNodeOptions { continue, fieldSelector, includeUninitialized, labelSelector, limit, resourceVersion, timeoutSeconds, watch }
instance encodeListNodeOptions :: Encode ListNodeOptions where
  encode (ListNodeOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "continue" (encodeMaybe a.continue)
               , Tuple "fieldSelector" (encodeMaybe a.fieldSelector)
               , Tuple "includeUninitialized" (encodeMaybe a.includeUninitialized)
               , Tuple "labelSelector" (encodeMaybe a.labelSelector)
               , Tuple "limit" (encodeMaybe a.limit)
               , Tuple "resourceVersion" (encodeMaybe a.resourceVersion)
               , Tuple "timeoutSeconds" (encodeMaybe a.timeoutSeconds)
               , Tuple "watch" (encodeMaybe a.watch) ]


instance defaultListNodeOptions :: Default ListNodeOptions where
  default = ListNodeOptions
    { continue: Nothing
    , fieldSelector: Nothing
    , includeUninitialized: Nothing
    , labelSelector: Nothing
    , limit: Nothing
    , resourceVersion: Nothing
    , timeoutSeconds: Nothing
    , watch: Nothing }

-- | list or watch objects of kind Node
listNode :: forall e. Config -> ListNodeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.NodeList)
listNode cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes" <> formatQueryString options

-- | proxy DELETE requests to Node
proxyDELETENode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENode cfg name = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy DELETE requests to Node
proxyDELETENodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyDELETENodeWithPath cfg name path = makeRequest (delete cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy GET requests to Node
proxyGETNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNode cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy GET requests to Node
proxyGETNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyGETNodeWithPath cfg name path = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy HEAD requests to Node
proxyHEADNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNode cfg name = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy HEAD requests to Node
proxyHEADNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyHEADNodeWithPath cfg name path = makeRequest (head cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy OPTIONS requests to Node
proxyOPTIONSNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNode cfg name = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy OPTIONS requests to Node
proxyOPTIONSNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyOPTIONSNodeWithPath cfg name path = makeRequest (options cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy POST requests to Node
proxyPOSTNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNode cfg name = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy POST requests to Node
proxyPOSTNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPOSTNodeWithPath cfg name path = makeRequest (post cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | proxy PUT requests to Node
proxyPUTNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNode cfg name = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> ""

-- | proxy PUT requests to Node
proxyPUTNodeWithPath :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
proxyPUTNodeWithPath cfg name path = makeRequest (put cfg url Nothing)
  where
    url = "/api/v1/proxy/nodes/" <> name <> "/" <> path <> ""

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
newtype ReadNodeOptions = ReadNodeOptions
  { exact :: (Maybe Boolean)
  , export :: (Maybe Boolean) }

derive instance newtypeReadNodeOptions :: Newtype ReadNodeOptions _
derive instance genericReadNodeOptions :: Generic ReadNodeOptions _
instance showReadNodeOptions :: Show ReadNodeOptions where show a = genericShow a
instance decodeReadNodeOptions :: Decode ReadNodeOptions where
  decode a = do
               exact <- decodeMaybe "exact" a
               export <- decodeMaybe "export" a
               pure $ ReadNodeOptions { exact, export }
instance encodeReadNodeOptions :: Encode ReadNodeOptions where
  encode (ReadNodeOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "exact" (encodeMaybe a.exact)
               , Tuple "export" (encodeMaybe a.export) ]


instance defaultReadNodeOptions :: Default ReadNodeOptions where
  default = ReadNodeOptions
    { exact: Nothing
    , export: Nothing }

-- | read the specified Node
readNode :: forall e. Config -> String -> ReadNodeOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Node)
readNode cfg name options = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "" <> formatQueryString options

-- | read status of the specified Node
readNodeStatus :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Node)
readNodeStatus cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/nodes/" <> name <> "/status"

-- | replace the specified Node
replaceNode :: forall e. Config -> String -> CoreV1.Node -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Node)
replaceNode cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/nodes/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Node
replaceNodeStatus :: forall e. Config -> String -> CoreV1.Node -> Aff (http :: HTTP | e) (Either MetaV1.Status CoreV1.Node)
replaceNodeStatus cfg name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/api/v1/nodes/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind Node
watchNode :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNode cfg name = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/nodes/" <> name <> ""

-- | watch individual changes to a list of Node
watchNodeList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNodeList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/v1/watch/nodes"