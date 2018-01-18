module Kubernetes.Api.AutoscalingV1 where

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
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | CrossVersionObjectReference contains enough information to let you identify the referred resource.
-- |
-- | Fields:
-- | - `apiVersion`: API version of the referent
-- | - `kind`: Kind of the referent; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds"
-- | - `name`: Name of the referent; More info: http://kubernetes.io/docs/user-guide/identifiers#names
newtype CrossVersionObjectReference = CrossVersionObjectReference
  { apiVersion :: (Maybe String)
  , kind :: (Maybe String)
  , name :: (Maybe String) }

derive instance newtypeCrossVersionObjectReference :: Newtype CrossVersionObjectReference _
derive instance genericCrossVersionObjectReference :: Generic CrossVersionObjectReference _
instance showCrossVersionObjectReference :: Show CrossVersionObjectReference where show a = genericShow a
instance decodeCrossVersionObjectReference :: Decode CrossVersionObjectReference where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               kind <- decodeMaybe "kind" a
               name <- decodeMaybe "name" a
               pure $ CrossVersionObjectReference { apiVersion, kind, name }
instance encodeCrossVersionObjectReference :: Encode CrossVersionObjectReference where
  encode (CrossVersionObjectReference a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "name" (encodeMaybe a.name) ]


instance defaultCrossVersionObjectReference :: Default CrossVersionObjectReference where
  default = CrossVersionObjectReference
    { apiVersion: Nothing
    , kind: Nothing
    , name: Nothing }

-- | configuration of a horizontal pod autoscaler.
-- |
-- | Fields:
-- | - `metadata`: Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: behaviour of autoscaler. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status.
-- | - `status`: current information about the autoscaler.
newtype HorizontalPodAutoscaler = HorizontalPodAutoscaler
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe HorizontalPodAutoscalerSpec)
  , status :: (Maybe HorizontalPodAutoscalerStatus) }

derive instance newtypeHorizontalPodAutoscaler :: Newtype HorizontalPodAutoscaler _
derive instance genericHorizontalPodAutoscaler :: Generic HorizontalPodAutoscaler _
instance showHorizontalPodAutoscaler :: Show HorizontalPodAutoscaler where show a = genericShow a
instance decodeHorizontalPodAutoscaler :: Decode HorizontalPodAutoscaler where
  decode a = do
               assertPropEq "apiVersion" "autoscaling/v1" a
               assertPropEq "kind" "HorizontalPodAutoscaler" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ HorizontalPodAutoscaler { metadata, spec, status }
instance encodeHorizontalPodAutoscaler :: Encode HorizontalPodAutoscaler where
  encode (HorizontalPodAutoscaler a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "autoscaling/v1")
               , Tuple "kind" (encode "HorizontalPodAutoscaler")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultHorizontalPodAutoscaler :: Default HorizontalPodAutoscaler where
  default = HorizontalPodAutoscaler
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | list of horizontal pod autoscaler objects.
-- |
-- | Fields:
-- | - `items`: list of horizontal pod autoscaler objects.
-- | - `metadata`: Standard list metadata.
newtype HorizontalPodAutoscalerList = HorizontalPodAutoscalerList
  { items :: (Maybe (Array HorizontalPodAutoscaler))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeHorizontalPodAutoscalerList :: Newtype HorizontalPodAutoscalerList _
derive instance genericHorizontalPodAutoscalerList :: Generic HorizontalPodAutoscalerList _
instance showHorizontalPodAutoscalerList :: Show HorizontalPodAutoscalerList where show a = genericShow a
instance decodeHorizontalPodAutoscalerList :: Decode HorizontalPodAutoscalerList where
  decode a = do
               assertPropEq "apiVersion" "autoscaling/v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "HorizontalPodAutoscalerList" a
               metadata <- decodeMaybe "metadata" a
               pure $ HorizontalPodAutoscalerList { items, metadata }
instance encodeHorizontalPodAutoscalerList :: Encode HorizontalPodAutoscalerList where
  encode (HorizontalPodAutoscalerList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "autoscaling/v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "HorizontalPodAutoscalerList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultHorizontalPodAutoscalerList :: Default HorizontalPodAutoscalerList where
  default = HorizontalPodAutoscalerList
    { items: Nothing
    , metadata: Nothing }

-- | specification of a horizontal pod autoscaler.
-- |
-- | Fields:
-- | - `maxReplicas`: upper limit for the number of pods that can be set by the autoscaler; cannot be smaller than MinReplicas.
-- | - `minReplicas`: lower limit for the number of pods that can be set by the autoscaler, default 1.
-- | - `scaleTargetRef`: reference to scaled resource; horizontal pod autoscaler will learn the current resource consumption and will set the desired number of pods by using its Scale subresource.
-- | - `targetCPUUtilizationPercentage`: target average CPU utilization (represented as a percentage of requested CPU) over all the pods; if not specified the default autoscaling policy will be used.
newtype HorizontalPodAutoscalerSpec = HorizontalPodAutoscalerSpec
  { maxReplicas :: (Maybe Int)
  , minReplicas :: (Maybe Int)
  , scaleTargetRef :: (Maybe CrossVersionObjectReference)
  , targetCPUUtilizationPercentage :: (Maybe Int) }

derive instance newtypeHorizontalPodAutoscalerSpec :: Newtype HorizontalPodAutoscalerSpec _
derive instance genericHorizontalPodAutoscalerSpec :: Generic HorizontalPodAutoscalerSpec _
instance showHorizontalPodAutoscalerSpec :: Show HorizontalPodAutoscalerSpec where show a = genericShow a
instance decodeHorizontalPodAutoscalerSpec :: Decode HorizontalPodAutoscalerSpec where
  decode a = do
               maxReplicas <- decodeMaybe "maxReplicas" a
               minReplicas <- decodeMaybe "minReplicas" a
               scaleTargetRef <- decodeMaybe "scaleTargetRef" a
               targetCPUUtilizationPercentage <- decodeMaybe "targetCPUUtilizationPercentage" a
               pure $ HorizontalPodAutoscalerSpec { maxReplicas, minReplicas, scaleTargetRef, targetCPUUtilizationPercentage }
instance encodeHorizontalPodAutoscalerSpec :: Encode HorizontalPodAutoscalerSpec where
  encode (HorizontalPodAutoscalerSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxReplicas" (encodeMaybe a.maxReplicas)
               , Tuple "minReplicas" (encodeMaybe a.minReplicas)
               , Tuple "scaleTargetRef" (encodeMaybe a.scaleTargetRef)
               , Tuple "targetCPUUtilizationPercentage" (encodeMaybe a.targetCPUUtilizationPercentage) ]


instance defaultHorizontalPodAutoscalerSpec :: Default HorizontalPodAutoscalerSpec where
  default = HorizontalPodAutoscalerSpec
    { maxReplicas: Nothing
    , minReplicas: Nothing
    , scaleTargetRef: Nothing
    , targetCPUUtilizationPercentage: Nothing }

-- | current status of a horizontal pod autoscaler
-- |
-- | Fields:
-- | - `currentCPUUtilizationPercentage`: current average CPU utilization over all pods, represented as a percentage of requested CPU, e.g. 70 means that an average pod is using now 70% of its requested CPU.
-- | - `currentReplicas`: current number of replicas of pods managed by this autoscaler.
-- | - `desiredReplicas`: desired number of replicas of pods managed by this autoscaler.
-- | - `lastScaleTime`: last time the HorizontalPodAutoscaler scaled the number of pods; used by the autoscaler to control how often the number of pods is changed.
-- | - `observedGeneration`: most recent generation observed by this autoscaler.
newtype HorizontalPodAutoscalerStatus = HorizontalPodAutoscalerStatus
  { currentCPUUtilizationPercentage :: (Maybe Int)
  , currentReplicas :: (Maybe Int)
  , desiredReplicas :: (Maybe Int)
  , lastScaleTime :: (Maybe MetaV1.Time)
  , observedGeneration :: (Maybe Int) }

derive instance newtypeHorizontalPodAutoscalerStatus :: Newtype HorizontalPodAutoscalerStatus _
derive instance genericHorizontalPodAutoscalerStatus :: Generic HorizontalPodAutoscalerStatus _
instance showHorizontalPodAutoscalerStatus :: Show HorizontalPodAutoscalerStatus where show a = genericShow a
instance decodeHorizontalPodAutoscalerStatus :: Decode HorizontalPodAutoscalerStatus where
  decode a = do
               currentCPUUtilizationPercentage <- decodeMaybe "currentCPUUtilizationPercentage" a
               currentReplicas <- decodeMaybe "currentReplicas" a
               desiredReplicas <- decodeMaybe "desiredReplicas" a
               lastScaleTime <- decodeMaybe "lastScaleTime" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               pure $ HorizontalPodAutoscalerStatus { currentCPUUtilizationPercentage, currentReplicas, desiredReplicas, lastScaleTime, observedGeneration }
instance encodeHorizontalPodAutoscalerStatus :: Encode HorizontalPodAutoscalerStatus where
  encode (HorizontalPodAutoscalerStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "currentCPUUtilizationPercentage" (encodeMaybe a.currentCPUUtilizationPercentage)
               , Tuple "currentReplicas" (encodeMaybe a.currentReplicas)
               , Tuple "desiredReplicas" (encodeMaybe a.desiredReplicas)
               , Tuple "lastScaleTime" (encodeMaybe a.lastScaleTime)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration) ]


instance defaultHorizontalPodAutoscalerStatus :: Default HorizontalPodAutoscalerStatus where
  default = HorizontalPodAutoscalerStatus
    { currentCPUUtilizationPercentage: Nothing
    , currentReplicas: Nothing
    , desiredReplicas: Nothing
    , lastScaleTime: Nothing
    , observedGeneration: Nothing }

-- | Scale represents a scaling request for a resource.
-- |
-- | Fields:
-- | - `metadata`: Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata.
-- | - `spec`: defines the behavior of the scale. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status.
-- | - `status`: current status of the scale. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status. Read-only.
newtype Scale = Scale
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe ScaleSpec)
  , status :: (Maybe ScaleStatus) }

derive instance newtypeScale :: Newtype Scale _
derive instance genericScale :: Generic Scale _
instance showScale :: Show Scale where show a = genericShow a
instance decodeScale :: Decode Scale where
  decode a = do
               assertPropEq "apiVersion" "autoscaling/v1" a
               assertPropEq "kind" "Scale" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Scale { metadata, spec, status }
instance encodeScale :: Encode Scale where
  encode (Scale a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "autoscaling/v1")
               , Tuple "kind" (encode "Scale")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultScale :: Default Scale where
  default = Scale
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | ScaleSpec describes the attributes of a scale subresource.
-- |
-- | Fields:
-- | - `replicas`: desired number of instances for the scaled object.
newtype ScaleSpec = ScaleSpec
  { replicas :: (Maybe Int) }

derive instance newtypeScaleSpec :: Newtype ScaleSpec _
derive instance genericScaleSpec :: Generic ScaleSpec _
instance showScaleSpec :: Show ScaleSpec where show a = genericShow a
instance decodeScaleSpec :: Decode ScaleSpec where
  decode a = do
               replicas <- decodeMaybe "replicas" a
               pure $ ScaleSpec { replicas }
instance encodeScaleSpec :: Encode ScaleSpec where
  encode (ScaleSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "replicas" (encodeMaybe a.replicas) ]


instance defaultScaleSpec :: Default ScaleSpec where
  default = ScaleSpec
    { replicas: Nothing }

-- | ScaleStatus represents the current status of a scale subresource.
-- |
-- | Fields:
-- | - `replicas`: actual number of observed instances of the scaled object.
-- | - `selector`: label query over pods that should match the replicas count. This is same as the label selector but in the string format to avoid introspection by clients. The string will be in the same format as the query-param syntax. More info about label selectors: http://kubernetes.io/docs/user-guide/labels#label-selectors
newtype ScaleStatus = ScaleStatus
  { replicas :: (Maybe Int)
  , selector :: (Maybe String) }

derive instance newtypeScaleStatus :: Newtype ScaleStatus _
derive instance genericScaleStatus :: Generic ScaleStatus _
instance showScaleStatus :: Show ScaleStatus where show a = genericShow a
instance decodeScaleStatus :: Decode ScaleStatus where
  decode a = do
               replicas <- decodeMaybe "replicas" a
               selector <- decodeMaybe "selector" a
               pure $ ScaleStatus { replicas, selector }
instance encodeScaleStatus :: Encode ScaleStatus where
  encode (ScaleStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "selector" (encodeMaybe a.selector) ]


instance defaultScaleStatus :: Default ScaleStatus where
  default = ScaleStatus
    { replicas: Nothing
    , selector: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/autoscaling/v1/"