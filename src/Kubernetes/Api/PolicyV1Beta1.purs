module Kubernetes.Api.PolicyV1Beta1 where

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
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | create a PodDisruptionBudget
createNamespacedPodDisruptionBudget :: forall e. Config -> String -> PodDisruptionBudget -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
createNamespacedPodDisruptionBudget cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets"
    encodedBody = encodeJSON body

-- | create eviction of a Pod
createNamespacedPodEviction :: forall e. Config -> String -> String -> Eviction -> Aff (http :: HTTP | e) (Either MetaV1.Status Eviction)
createNamespacedPodEviction cfg namespace name body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/api/v1/namespaces/" <> namespace <> "/pods/" <> name <> "/eviction"
    encodedBody = encodeJSON body

-- | DeleteCollectionNamespacedPodDisruptionBudgetOptions
newtype DeleteCollectionNamespacedPodDisruptionBudgetOptions = DeleteCollectionNamespacedPodDisruptionBudgetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Newtype DeleteCollectionNamespacedPodDisruptionBudgetOptions _
derive instance genericDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Generic DeleteCollectionNamespacedPodDisruptionBudgetOptions _
instance showDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Show DeleteCollectionNamespacedPodDisruptionBudgetOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Decode DeleteCollectionNamespacedPodDisruptionBudgetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Encode DeleteCollectionNamespacedPodDisruptionBudgetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedPodDisruptionBudgetOptions :: Default DeleteCollectionNamespacedPodDisruptionBudgetOptions where
  default = DeleteCollectionNamespacedPodDisruptionBudgetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of PodDisruptionBudget
deleteCollectionNamespacedPodDisruptionBudget :: forall e. Config -> String -> DeleteCollectionNamespacedPodDisruptionBudgetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedPodDisruptionBudget cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets" <> formatQueryString options

-- | DeleteNamespacedPodDisruptionBudgetOptions
newtype DeleteNamespacedPodDisruptionBudgetOptions = DeleteNamespacedPodDisruptionBudgetOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedPodDisruptionBudgetOptions :: Newtype DeleteNamespacedPodDisruptionBudgetOptions _
derive instance genericDeleteNamespacedPodDisruptionBudgetOptions :: Generic DeleteNamespacedPodDisruptionBudgetOptions _
instance showDeleteNamespacedPodDisruptionBudgetOptions :: Show DeleteNamespacedPodDisruptionBudgetOptions where show a = genericShow a
instance decodeDeleteNamespacedPodDisruptionBudgetOptions :: Decode DeleteNamespacedPodDisruptionBudgetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedPodDisruptionBudgetOptions :: Encode DeleteNamespacedPodDisruptionBudgetOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedPodDisruptionBudgetOptions :: Default DeleteNamespacedPodDisruptionBudgetOptions where
  default = DeleteNamespacedPodDisruptionBudgetOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a PodDisruptionBudget
deleteNamespacedPodDisruptionBudget :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedPodDisruptionBudgetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedPodDisruptionBudget cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/"

-- | io.k8s.api.policy.v1beta1.Eviction
-- | Eviction evicts a pod from its node subject to certain policies and safety constraints. This is a subresource of Pod.  A request to cause such an eviction is created by POSTing to .../pods/<pod name>/evictions.
newtype Eviction = Eviction
  { apiVersion :: (NullOrUndefined String)
  , deleteOptions :: (NullOrUndefined MetaV1.DeleteOptions)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta) }

derive instance newtypeEviction :: Newtype Eviction _
derive instance genericEviction :: Generic Eviction _
instance showEviction :: Show Eviction where show a = genericShow a
instance decodeEviction :: Decode Eviction where
  decode a = genericDecode jsonOptions a 
instance encodeEviction :: Encode Eviction where
  encode a = genericEncode jsonOptions a

instance defaultEviction :: Default Eviction where
  default = Eviction
    { apiVersion: NullOrUndefined Nothing
    , deleteOptions: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.policy.v1beta1.PodDisruptionBudget
-- | PodDisruptionBudget is an object to define the max disruption that can be caused to a collection of pods
newtype PodDisruptionBudget = PodDisruptionBudget
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodDisruptionBudgetSpec)
  , status :: (NullOrUndefined PodDisruptionBudgetStatus) }

derive instance newtypePodDisruptionBudget :: Newtype PodDisruptionBudget _
derive instance genericPodDisruptionBudget :: Generic PodDisruptionBudget _
instance showPodDisruptionBudget :: Show PodDisruptionBudget where show a = genericShow a
instance decodePodDisruptionBudget :: Decode PodDisruptionBudget where
  decode a = genericDecode jsonOptions a 
instance encodePodDisruptionBudget :: Encode PodDisruptionBudget where
  encode a = genericEncode jsonOptions a

instance defaultPodDisruptionBudget :: Default PodDisruptionBudget where
  default = PodDisruptionBudget
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.policy.v1beta1.PodDisruptionBudgetList
-- | PodDisruptionBudgetList is a collection of PodDisruptionBudgets.
newtype PodDisruptionBudgetList = PodDisruptionBudgetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PodDisruptionBudget))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodDisruptionBudgetList :: Newtype PodDisruptionBudgetList _
derive instance genericPodDisruptionBudgetList :: Generic PodDisruptionBudgetList _
instance showPodDisruptionBudgetList :: Show PodDisruptionBudgetList where show a = genericShow a
instance decodePodDisruptionBudgetList :: Decode PodDisruptionBudgetList where
  decode a = genericDecode jsonOptions a 
instance encodePodDisruptionBudgetList :: Encode PodDisruptionBudgetList where
  encode a = genericEncode jsonOptions a

instance defaultPodDisruptionBudgetList :: Default PodDisruptionBudgetList where
  default = PodDisruptionBudgetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.policy.v1beta1.PodDisruptionBudgetSpec
-- | PodDisruptionBudgetSpec is a description of a PodDisruptionBudget.
newtype PodDisruptionBudgetSpec = PodDisruptionBudgetSpec
  { maxUnavailable :: (NullOrUndefined Util.IntOrString)
  , minAvailable :: (NullOrUndefined Util.IntOrString)
  , selector :: (NullOrUndefined MetaV1.LabelSelector) }

derive instance newtypePodDisruptionBudgetSpec :: Newtype PodDisruptionBudgetSpec _
derive instance genericPodDisruptionBudgetSpec :: Generic PodDisruptionBudgetSpec _
instance showPodDisruptionBudgetSpec :: Show PodDisruptionBudgetSpec where show a = genericShow a
instance decodePodDisruptionBudgetSpec :: Decode PodDisruptionBudgetSpec where
  decode a = genericDecode jsonOptions a 
instance encodePodDisruptionBudgetSpec :: Encode PodDisruptionBudgetSpec where
  encode a = genericEncode jsonOptions a

instance defaultPodDisruptionBudgetSpec :: Default PodDisruptionBudgetSpec where
  default = PodDisruptionBudgetSpec
    { maxUnavailable: NullOrUndefined Nothing
    , minAvailable: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing }

-- | io.k8s.api.policy.v1beta1.PodDisruptionBudgetStatus
-- | PodDisruptionBudgetStatus represents information about the status of a PodDisruptionBudget. Status may trail the actual state of a system.
newtype PodDisruptionBudgetStatus = PodDisruptionBudgetStatus
  { currentHealthy :: (NullOrUndefined Int)
  , desiredHealthy :: (NullOrUndefined Int)
  , disruptedPods :: (NullOrUndefined (StrMap MetaV1.Time))
  , disruptionsAllowed :: (NullOrUndefined Int)
  , expectedPods :: (NullOrUndefined Int)
  , observedGeneration :: (NullOrUndefined Int) }

derive instance newtypePodDisruptionBudgetStatus :: Newtype PodDisruptionBudgetStatus _
derive instance genericPodDisruptionBudgetStatus :: Generic PodDisruptionBudgetStatus _
instance showPodDisruptionBudgetStatus :: Show PodDisruptionBudgetStatus where show a = genericShow a
instance decodePodDisruptionBudgetStatus :: Decode PodDisruptionBudgetStatus where
  decode a = genericDecode jsonOptions a 
instance encodePodDisruptionBudgetStatus :: Encode PodDisruptionBudgetStatus where
  encode a = genericEncode jsonOptions a

instance defaultPodDisruptionBudgetStatus :: Default PodDisruptionBudgetStatus where
  default = PodDisruptionBudgetStatus
    { currentHealthy: NullOrUndefined Nothing
    , desiredHealthy: NullOrUndefined Nothing
    , disruptedPods: NullOrUndefined Nothing
    , disruptionsAllowed: NullOrUndefined Nothing
    , expectedPods: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing }

-- | ListNamespacedPodDisruptionBudgetOptions
newtype ListNamespacedPodDisruptionBudgetOptions = ListNamespacedPodDisruptionBudgetOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedPodDisruptionBudgetOptions :: Newtype ListNamespacedPodDisruptionBudgetOptions _
derive instance genericListNamespacedPodDisruptionBudgetOptions :: Generic ListNamespacedPodDisruptionBudgetOptions _
instance showListNamespacedPodDisruptionBudgetOptions :: Show ListNamespacedPodDisruptionBudgetOptions where show a = genericShow a
instance decodeListNamespacedPodDisruptionBudgetOptions :: Decode ListNamespacedPodDisruptionBudgetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedPodDisruptionBudgetOptions :: Encode ListNamespacedPodDisruptionBudgetOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedPodDisruptionBudgetOptions :: Default ListNamespacedPodDisruptionBudgetOptions where
  default = ListNamespacedPodDisruptionBudgetOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind PodDisruptionBudget
listNamespacedPodDisruptionBudget :: forall e. Config -> String -> ListNamespacedPodDisruptionBudgetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudgetList)
listNamespacedPodDisruptionBudget cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets" <> formatQueryString options

-- | list or watch objects of kind PodDisruptionBudget
listPodDisruptionBudgetForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudgetList)
listPodDisruptionBudgetForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/poddisruptionbudgets"

-- | ReadNamespacedPodDisruptionBudgetOptions
newtype ReadNamespacedPodDisruptionBudgetOptions = ReadNamespacedPodDisruptionBudgetOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedPodDisruptionBudgetOptions :: Newtype ReadNamespacedPodDisruptionBudgetOptions _
derive instance genericReadNamespacedPodDisruptionBudgetOptions :: Generic ReadNamespacedPodDisruptionBudgetOptions _
instance showReadNamespacedPodDisruptionBudgetOptions :: Show ReadNamespacedPodDisruptionBudgetOptions where show a = genericShow a
instance decodeReadNamespacedPodDisruptionBudgetOptions :: Decode ReadNamespacedPodDisruptionBudgetOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedPodDisruptionBudgetOptions :: Encode ReadNamespacedPodDisruptionBudgetOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedPodDisruptionBudgetOptions :: Default ReadNamespacedPodDisruptionBudgetOptions where
  default = ReadNamespacedPodDisruptionBudgetOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified PodDisruptionBudget
readNamespacedPodDisruptionBudget :: forall e. Config -> String -> String -> ReadNamespacedPodDisruptionBudgetOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
readNamespacedPodDisruptionBudget cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> "" <> formatQueryString options

-- | read status of the specified PodDisruptionBudget
readNamespacedPodDisruptionBudgetStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
readNamespacedPodDisruptionBudgetStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> "/status"

-- | replace the specified PodDisruptionBudget
replaceNamespacedPodDisruptionBudget :: forall e. Config -> String -> String -> PodDisruptionBudget -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
replaceNamespacedPodDisruptionBudget cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified PodDisruptionBudget
replaceNamespacedPodDisruptionBudgetStatus :: forall e. Config -> String -> String -> PodDisruptionBudget -> Aff (http :: HTTP | e) (Either MetaV1.Status PodDisruptionBudget)
replaceNamespacedPodDisruptionBudgetStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/policy/v1beta1/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind PodDisruptionBudget
watchNamespacedPodDisruptionBudget :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodDisruptionBudget cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/watch/namespaces/" <> namespace <> "/poddisruptionbudgets/" <> name <> ""

-- | watch individual changes to a list of PodDisruptionBudget
watchNamespacedPodDisruptionBudgetList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedPodDisruptionBudgetList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/watch/namespaces/" <> namespace <> "/poddisruptionbudgets"

-- | watch individual changes to a list of PodDisruptionBudget
watchPodDisruptionBudgetListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchPodDisruptionBudgetListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/watch/poddisruptionbudgets"