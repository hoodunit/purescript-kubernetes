module Kubernetes.Api.Policy.V1Beta1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Kubernetes.Api.Meta.V1 as MetaV1
import Kubernetes.Api.Util as Util
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Eviction evicts a pod from its node subject to certain policies and safety constraints. This is a subresource of Pod.  A request to cause such an eviction is created by POSTing to .../pods/<pod name>/evictions.
-- |
-- | Fields:
-- | - `deleteOptions`: DeleteOptions may be provided
-- | - `metadata`: ObjectMeta describes the pod that is being evicted.
newtype Eviction = Eviction
  { deleteOptions :: (Maybe MetaV1.DeleteOptions)
  , metadata :: (Maybe MetaV1.ObjectMeta) }

derive instance newtypeEviction :: Newtype Eviction _
derive instance genericEviction :: Generic Eviction _
instance showEviction :: Show Eviction where show a = genericShow a
instance decodeEviction :: Decode Eviction where
  decode a = do
               assertPropEq "apiVersion" "policy/v1beta1" a
               deleteOptions <- decodeMaybe "deleteOptions" a
               assertPropEq "kind" "Eviction" a
               metadata <- decodeMaybe "metadata" a
               pure $ Eviction { deleteOptions, metadata }
instance encodeEviction :: Encode Eviction where
  encode (Eviction a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "policy/v1beta1")
               , Tuple "deleteOptions" (encodeMaybe a.deleteOptions)
               , Tuple "kind" (encode "Eviction")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultEviction :: Default Eviction where
  default = Eviction
    { deleteOptions: Nothing
    , metadata: Nothing }

-- | PodDisruptionBudget is an object to define the max disruption that can be caused to a collection of pods
-- |
-- | Fields:
-- | - `metadata`
-- | - `spec`: Specification of the desired behavior of the PodDisruptionBudget.
-- | - `status`: Most recently observed status of the PodDisruptionBudget.
newtype PodDisruptionBudget = PodDisruptionBudget
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe PodDisruptionBudgetSpec)
  , status :: (Maybe PodDisruptionBudgetStatus) }

derive instance newtypePodDisruptionBudget :: Newtype PodDisruptionBudget _
derive instance genericPodDisruptionBudget :: Generic PodDisruptionBudget _
instance showPodDisruptionBudget :: Show PodDisruptionBudget where show a = genericShow a
instance decodePodDisruptionBudget :: Decode PodDisruptionBudget where
  decode a = do
               assertPropEq "apiVersion" "policy/v1beta1" a
               assertPropEq "kind" "PodDisruptionBudget" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ PodDisruptionBudget { metadata, spec, status }
instance encodePodDisruptionBudget :: Encode PodDisruptionBudget where
  encode (PodDisruptionBudget a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "policy/v1beta1")
               , Tuple "kind" (encode "PodDisruptionBudget")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultPodDisruptionBudget :: Default PodDisruptionBudget where
  default = PodDisruptionBudget
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | PodDisruptionBudgetList is a collection of PodDisruptionBudgets.
-- |
-- | Fields:
-- | - `items`
-- | - `metadata`
newtype PodDisruptionBudgetList = PodDisruptionBudgetList
  { items :: (Maybe (Array PodDisruptionBudget))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePodDisruptionBudgetList :: Newtype PodDisruptionBudgetList _
derive instance genericPodDisruptionBudgetList :: Generic PodDisruptionBudgetList _
instance showPodDisruptionBudgetList :: Show PodDisruptionBudgetList where show a = genericShow a
instance decodePodDisruptionBudgetList :: Decode PodDisruptionBudgetList where
  decode a = do
               assertPropEq "apiVersion" "policy/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "PodDisruptionBudgetList" a
               metadata <- decodeMaybe "metadata" a
               pure $ PodDisruptionBudgetList { items, metadata }
instance encodePodDisruptionBudgetList :: Encode PodDisruptionBudgetList where
  encode (PodDisruptionBudgetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "policy/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "PodDisruptionBudgetList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPodDisruptionBudgetList :: Default PodDisruptionBudgetList where
  default = PodDisruptionBudgetList
    { items: Nothing
    , metadata: Nothing }

-- | PodDisruptionBudgetSpec is a description of a PodDisruptionBudget.
-- |
-- | Fields:
-- | - `maxUnavailable`: An eviction is allowed if at most "maxUnavailable" pods selected by "selector" are unavailable after the eviction, i.e. even in absence of the evicted pod. For example, one can prevent all voluntary evictions by specifying 0. This is a mutually exclusive setting with "minAvailable".
-- | - `minAvailable`: An eviction is allowed if at least "minAvailable" pods selected by "selector" will still be available after the eviction, i.e. even in the absence of the evicted pod.  So for example you can prevent all voluntary evictions by specifying "100%".
-- | - `selector`: Label query over pods whose evictions are managed by the disruption budget.
newtype PodDisruptionBudgetSpec = PodDisruptionBudgetSpec
  { maxUnavailable :: (Maybe Util.IntOrString)
  , minAvailable :: (Maybe Util.IntOrString)
  , selector :: (Maybe MetaV1.LabelSelector) }

derive instance newtypePodDisruptionBudgetSpec :: Newtype PodDisruptionBudgetSpec _
derive instance genericPodDisruptionBudgetSpec :: Generic PodDisruptionBudgetSpec _
instance showPodDisruptionBudgetSpec :: Show PodDisruptionBudgetSpec where show a = genericShow a
instance decodePodDisruptionBudgetSpec :: Decode PodDisruptionBudgetSpec where
  decode a = do
               maxUnavailable <- decodeMaybe "maxUnavailable" a
               minAvailable <- decodeMaybe "minAvailable" a
               selector <- decodeMaybe "selector" a
               pure $ PodDisruptionBudgetSpec { maxUnavailable, minAvailable, selector }
instance encodePodDisruptionBudgetSpec :: Encode PodDisruptionBudgetSpec where
  encode (PodDisruptionBudgetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxUnavailable" (encodeMaybe a.maxUnavailable)
               , Tuple "minAvailable" (encodeMaybe a.minAvailable)
               , Tuple "selector" (encodeMaybe a.selector) ]


instance defaultPodDisruptionBudgetSpec :: Default PodDisruptionBudgetSpec where
  default = PodDisruptionBudgetSpec
    { maxUnavailable: Nothing
    , minAvailable: Nothing
    , selector: Nothing }

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
  { currentHealthy :: (Maybe Int)
  , desiredHealthy :: (Maybe Int)
  , disruptedPods :: (Maybe (StrMap MetaV1.Time))
  , disruptionsAllowed :: (Maybe Int)
  , expectedPods :: (Maybe Int)
  , observedGeneration :: (Maybe Int) }

derive instance newtypePodDisruptionBudgetStatus :: Newtype PodDisruptionBudgetStatus _
derive instance genericPodDisruptionBudgetStatus :: Generic PodDisruptionBudgetStatus _
instance showPodDisruptionBudgetStatus :: Show PodDisruptionBudgetStatus where show a = genericShow a
instance decodePodDisruptionBudgetStatus :: Decode PodDisruptionBudgetStatus where
  decode a = do
               currentHealthy <- decodeMaybe "currentHealthy" a
               desiredHealthy <- decodeMaybe "desiredHealthy" a
               disruptedPods <- decodeMaybe "disruptedPods" a
               disruptionsAllowed <- decodeMaybe "disruptionsAllowed" a
               expectedPods <- decodeMaybe "expectedPods" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               pure $ PodDisruptionBudgetStatus { currentHealthy, desiredHealthy, disruptedPods, disruptionsAllowed, expectedPods, observedGeneration }
instance encodePodDisruptionBudgetStatus :: Encode PodDisruptionBudgetStatus where
  encode (PodDisruptionBudgetStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "currentHealthy" (encodeMaybe a.currentHealthy)
               , Tuple "desiredHealthy" (encodeMaybe a.desiredHealthy)
               , Tuple "disruptedPods" (encodeMaybe a.disruptedPods)
               , Tuple "disruptionsAllowed" (encodeMaybe a.disruptionsAllowed)
               , Tuple "expectedPods" (encodeMaybe a.expectedPods)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration) ]


instance defaultPodDisruptionBudgetStatus :: Default PodDisruptionBudgetStatus where
  default = PodDisruptionBudgetStatus
    { currentHealthy: Nothing
    , desiredHealthy: Nothing
    , disruptedPods: Nothing
    , disruptionsAllowed: Nothing
    , expectedPods: Nothing
    , observedGeneration: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/policy/v1beta1/"