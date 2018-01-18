module Kubernetes.Api.PolicyV1Beta1 where

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
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Eviction evicts a pod from its node subject to certain policies and safety constraints. This is a subresource of Pod.  A request to cause such an eviction is created by POSTing to .../pods/<pod name>/evictions.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `deleteOptions`: DeleteOptions may be provided
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: ObjectMeta describes the pod that is being evicted.
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

-- | PodDisruptionBudget is an object to define the max disruption that can be caused to a collection of pods
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Specification of the desired behavior of the PodDisruptionBudget.
-- | - `status`: Most recently observed status of the PodDisruptionBudget.
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

-- | PodDisruptionBudgetList is a collection of PodDisruptionBudgets.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
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

-- | PodDisruptionBudgetSpec is a description of a PodDisruptionBudget.
-- |
-- | Fields:
-- | - `maxUnavailable`: An eviction is allowed if at most "maxUnavailable" pods selected by "selector" are unavailable after the eviction, i.e. even in absence of the evicted pod. For example, one can prevent all voluntary evictions by specifying 0. This is a mutually exclusive setting with "minAvailable".
-- | - `minAvailable`: An eviction is allowed if at least "minAvailable" pods selected by "selector" will still be available after the eviction, i.e. even in the absence of the evicted pod.  So for example you can prevent all voluntary evictions by specifying "100%".
-- | - `selector`: Label query over pods whose evictions are managed by the disruption budget.
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

-- | PodDisruptionBudgetStatus represents information about the status of a PodDisruptionBudget. Status may trail the actual state of a system.
-- |
-- | Fields:
-- | - `currentHealthy`: current number of healthy pods
-- | - `desiredHealthy`: minimum desired number of healthy pods
-- | - `disruptedPods`: DisruptedPods contains information about pods whose eviction was processed by the API server eviction subresource handler but has not yet been observed by the PodDisruptionBudget controller. A pod will be in this map from the time when the API server processed the eviction request to the time when the pod is seen by PDB controller as having been marked for deletion (or after a timeout). The key in the map is the name of the pod and the value is the time when the API server processed the eviction request. If the deletion didn't occur and a pod is still there it will be removed from the list automatically by PodDisruptionBudget controller after some time. If everything goes smooth this map should be empty for the most of the time. Large number of entries in the map may indicate problems with pod deletions.
-- | - `disruptionsAllowed`: Number of pod disruptions that are currently allowed.
-- | - `expectedPods`: total number of pods counted by this disruption budget
-- | - `observedGeneration`: Most recent generation observed when updating this PDB status. PodDisruptionsAllowed and other status informatio is valid only if observedGeneration equals to PDB's object generation.
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

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/"