module Kubernetes.Api.APIExtensions.V1Beta1 where

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
import Kubernetes.Api.Core.V1 as CoreV1
import Kubernetes.Api.Meta.V1 as MetaV1
import Kubernetes.Api.Util as Util
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | AllowedFlexVolume represents a single Flexvolume that is allowed to be used.
-- |
-- | Fields:
-- | - `driver`: Driver is the name of the Flexvolume driver.
newtype AllowedFlexVolume = AllowedFlexVolume
  { driver :: (Maybe String) }

derive instance newtypeAllowedFlexVolume :: Newtype AllowedFlexVolume _
derive instance genericAllowedFlexVolume :: Generic AllowedFlexVolume _
instance showAllowedFlexVolume :: Show AllowedFlexVolume where show a = genericShow a
instance decodeAllowedFlexVolume :: Decode AllowedFlexVolume where
  decode a = do
               driver <- decodeMaybe "driver" a
               pure $ AllowedFlexVolume { driver }
instance encodeAllowedFlexVolume :: Encode AllowedFlexVolume where
  encode (AllowedFlexVolume a) = encode $ StrMap.fromFoldable $
               [ Tuple "driver" (encodeMaybe a.driver) ]


instance defaultAllowedFlexVolume :: Default AllowedFlexVolume where
  default = AllowedFlexVolume
    { driver: Nothing }

-- | defines the host volume conditions that will be enabled by a policy for pods to use. It requires the path prefix to be defined.
-- |
-- | Fields:
-- | - `pathPrefix`: is the path prefix that the host volume must match. It does not support `*`. Trailing slashes are trimmed when validating the path prefix with a host path.
-- |    
-- |    Examples: `/foo` would allow `/foo`, `/foo/` and `/foo/bar` `/foo` would not allow `/food` or `/etc/foo`
newtype AllowedHostPath = AllowedHostPath
  { pathPrefix :: (Maybe String) }

derive instance newtypeAllowedHostPath :: Newtype AllowedHostPath _
derive instance genericAllowedHostPath :: Generic AllowedHostPath _
instance showAllowedHostPath :: Show AllowedHostPath where show a = genericShow a
instance decodeAllowedHostPath :: Decode AllowedHostPath where
  decode a = do
               pathPrefix <- decodeMaybe "pathPrefix" a
               pure $ AllowedHostPath { pathPrefix }
instance encodeAllowedHostPath :: Encode AllowedHostPath where
  encode (AllowedHostPath a) = encode $ StrMap.fromFoldable $
               [ Tuple "pathPrefix" (encodeMaybe a.pathPrefix) ]


instance defaultAllowedHostPath :: Default AllowedHostPath where
  default = AllowedHostPath
    { pathPrefix: Nothing }

-- | CustomResourceDefinition represents a resource that should be exposed on the API server.  Its name MUST be in the format <.spec.name>.<.spec.group>.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Spec describes how the user wants the resources to appear
-- | - `status`: Status indicates the actual state of the CustomResourceDefinition
newtype CustomResourceDefinition = CustomResourceDefinition
  { apiVersion :: (Maybe String)
  , kind :: (Maybe String)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe CustomResourceDefinitionSpec)
  , status :: (Maybe CustomResourceDefinitionStatus) }

derive instance newtypeCustomResourceDefinition :: Newtype CustomResourceDefinition _
derive instance genericCustomResourceDefinition :: Generic CustomResourceDefinition _
instance showCustomResourceDefinition :: Show CustomResourceDefinition where show a = genericShow a
instance decodeCustomResourceDefinition :: Decode CustomResourceDefinition where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               kind <- decodeMaybe "kind" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ CustomResourceDefinition { apiVersion, kind, metadata, spec, status }
instance encodeCustomResourceDefinition :: Encode CustomResourceDefinition where
  encode (CustomResourceDefinition a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultCustomResourceDefinition :: Default CustomResourceDefinition where
  default = CustomResourceDefinition
    { apiVersion: Nothing
    , kind: Nothing
    , metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | CustomResourceDefinitionCondition contains details for the current condition of this pod.
-- |
-- | Fields:
-- | - `_type`: Type is the type of the condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: Human-readable message indicating details about last transition.
-- | - `reason`: Unique, one-word, CamelCase reason for the condition's last transition.
-- | - `status`: Status is the status of the condition. Can be True, False, Unknown.
newtype CustomResourceDefinitionCondition = CustomResourceDefinitionCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeCustomResourceDefinitionCondition :: Newtype CustomResourceDefinitionCondition _
derive instance genericCustomResourceDefinitionCondition :: Generic CustomResourceDefinitionCondition _
instance showCustomResourceDefinitionCondition :: Show CustomResourceDefinitionCondition where show a = genericShow a
instance decodeCustomResourceDefinitionCondition :: Decode CustomResourceDefinitionCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ CustomResourceDefinitionCondition { _type, lastTransitionTime, message, reason, status }
instance encodeCustomResourceDefinitionCondition :: Encode CustomResourceDefinitionCondition where
  encode (CustomResourceDefinitionCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultCustomResourceDefinitionCondition :: Default CustomResourceDefinitionCondition where
  default = CustomResourceDefinitionCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | CustomResourceDefinitionList is a list of CustomResourceDefinition objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items individual CustomResourceDefinitions
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
newtype CustomResourceDefinitionList = CustomResourceDefinitionList
  { apiVersion :: (Maybe String)
  , items :: (Maybe (Array CustomResourceDefinition))
  , kind :: (Maybe String)
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeCustomResourceDefinitionList :: Newtype CustomResourceDefinitionList _
derive instance genericCustomResourceDefinitionList :: Generic CustomResourceDefinitionList _
instance showCustomResourceDefinitionList :: Show CustomResourceDefinitionList where show a = genericShow a
instance decodeCustomResourceDefinitionList :: Decode CustomResourceDefinitionList where
  decode a = do
               apiVersion <- decodeMaybe "apiVersion" a
               items <- decodeMaybe "items" a
               kind <- decodeMaybe "kind" a
               metadata <- decodeMaybe "metadata" a
               pure $ CustomResourceDefinitionList { apiVersion, items, kind, metadata }
instance encodeCustomResourceDefinitionList :: Encode CustomResourceDefinitionList where
  encode (CustomResourceDefinitionList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encodeMaybe a.apiVersion)
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultCustomResourceDefinitionList :: Default CustomResourceDefinitionList where
  default = CustomResourceDefinitionList
    { apiVersion: Nothing
    , items: Nothing
    , kind: Nothing
    , metadata: Nothing }

-- | CustomResourceDefinitionNames indicates the names to serve this CustomResourceDefinition
-- |
-- | Fields:
-- | - `kind`: Kind is the serialized kind of the resource.  It is normally CamelCase and singular.
-- | - `listKind`: ListKind is the serialized kind of the list for this resource.  Defaults to <kind>List.
-- | - `plural`: Plural is the plural name of the resource to serve.  It must match the name of the CustomResourceDefinition-registration too: plural.group and it must be all lowercase.
-- | - `shortNames`: ShortNames are short names for the resource.  It must be all lowercase.
-- | - `singular`: Singular is the singular name of the resource.  It must be all lowercase  Defaults to lowercased <kind>
newtype CustomResourceDefinitionNames = CustomResourceDefinitionNames
  { kind :: (Maybe String)
  , listKind :: (Maybe String)
  , plural :: (Maybe String)
  , shortNames :: (Maybe (Array String))
  , singular :: (Maybe String) }

derive instance newtypeCustomResourceDefinitionNames :: Newtype CustomResourceDefinitionNames _
derive instance genericCustomResourceDefinitionNames :: Generic CustomResourceDefinitionNames _
instance showCustomResourceDefinitionNames :: Show CustomResourceDefinitionNames where show a = genericShow a
instance decodeCustomResourceDefinitionNames :: Decode CustomResourceDefinitionNames where
  decode a = do
               kind <- decodeMaybe "kind" a
               listKind <- decodeMaybe "listKind" a
               plural <- decodeMaybe "plural" a
               shortNames <- decodeMaybe "shortNames" a
               singular <- decodeMaybe "singular" a
               pure $ CustomResourceDefinitionNames { kind, listKind, plural, shortNames, singular }
instance encodeCustomResourceDefinitionNames :: Encode CustomResourceDefinitionNames where
  encode (CustomResourceDefinitionNames a) = encode $ StrMap.fromFoldable $
               [ Tuple "kind" (encodeMaybe a.kind)
               , Tuple "listKind" (encodeMaybe a.listKind)
               , Tuple "plural" (encodeMaybe a.plural)
               , Tuple "shortNames" (encodeMaybe a.shortNames)
               , Tuple "singular" (encodeMaybe a.singular) ]


instance defaultCustomResourceDefinitionNames :: Default CustomResourceDefinitionNames where
  default = CustomResourceDefinitionNames
    { kind: Nothing
    , listKind: Nothing
    , plural: Nothing
    , shortNames: Nothing
    , singular: Nothing }

-- | CustomResourceDefinitionSpec describes how a user wants their resource to appear
-- |
-- | Fields:
-- | - `group`: Group is the group this resource belongs in
-- | - `names`: Names are the names used to describe this custom resource
-- | - `scope`: Scope indicates whether this resource is cluster or namespace scoped.  Default is namespaced
-- | - `validation`: Validation describes the validation methods for CustomResources
-- | - `version`: Version is the version this resource belongs in
newtype CustomResourceDefinitionSpec = CustomResourceDefinitionSpec
  { group :: (Maybe String)
  , names :: (Maybe CustomResourceDefinitionNames)
  , scope :: (Maybe String)
  , validation :: (Maybe CustomResourceValidation)
  , version :: (Maybe String) }

derive instance newtypeCustomResourceDefinitionSpec :: Newtype CustomResourceDefinitionSpec _
derive instance genericCustomResourceDefinitionSpec :: Generic CustomResourceDefinitionSpec _
instance showCustomResourceDefinitionSpec :: Show CustomResourceDefinitionSpec where show a = genericShow a
instance decodeCustomResourceDefinitionSpec :: Decode CustomResourceDefinitionSpec where
  decode a = do
               group <- decodeMaybe "group" a
               names <- decodeMaybe "names" a
               scope <- decodeMaybe "scope" a
               validation <- decodeMaybe "validation" a
               version <- decodeMaybe "version" a
               pure $ CustomResourceDefinitionSpec { group, names, scope, validation, version }
instance encodeCustomResourceDefinitionSpec :: Encode CustomResourceDefinitionSpec where
  encode (CustomResourceDefinitionSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "group" (encodeMaybe a.group)
               , Tuple "names" (encodeMaybe a.names)
               , Tuple "scope" (encodeMaybe a.scope)
               , Tuple "validation" (encodeMaybe a.validation)
               , Tuple "version" (encodeMaybe a.version) ]


instance defaultCustomResourceDefinitionSpec :: Default CustomResourceDefinitionSpec where
  default = CustomResourceDefinitionSpec
    { group: Nothing
    , names: Nothing
    , scope: Nothing
    , validation: Nothing
    , version: Nothing }

-- | CustomResourceDefinitionStatus indicates the state of the CustomResourceDefinition
-- |
-- | Fields:
-- | - `acceptedNames`: AcceptedNames are the names that are actually being used to serve discovery They may be different than the names in spec.
-- | - `conditions`: Conditions indicate state for particular aspects of a CustomResourceDefinition
newtype CustomResourceDefinitionStatus = CustomResourceDefinitionStatus
  { acceptedNames :: (Maybe CustomResourceDefinitionNames)
  , conditions :: (Maybe (Array CustomResourceDefinitionCondition)) }

derive instance newtypeCustomResourceDefinitionStatus :: Newtype CustomResourceDefinitionStatus _
derive instance genericCustomResourceDefinitionStatus :: Generic CustomResourceDefinitionStatus _
instance showCustomResourceDefinitionStatus :: Show CustomResourceDefinitionStatus where show a = genericShow a
instance decodeCustomResourceDefinitionStatus :: Decode CustomResourceDefinitionStatus where
  decode a = do
               acceptedNames <- decodeMaybe "acceptedNames" a
               conditions <- decodeMaybe "conditions" a
               pure $ CustomResourceDefinitionStatus { acceptedNames, conditions }
instance encodeCustomResourceDefinitionStatus :: Encode CustomResourceDefinitionStatus where
  encode (CustomResourceDefinitionStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "acceptedNames" (encodeMaybe a.acceptedNames)
               , Tuple "conditions" (encodeMaybe a.conditions) ]


instance defaultCustomResourceDefinitionStatus :: Default CustomResourceDefinitionStatus where
  default = CustomResourceDefinitionStatus
    { acceptedNames: Nothing
    , conditions: Nothing }

-- | CustomResourceValidation is a list of validation methods for CustomResources.
-- |
-- | Fields:
-- | - `openAPIV3Schema`: OpenAPIV3Schema is the OpenAPI v3 schema to be validated against.
newtype CustomResourceValidation = CustomResourceValidation
  { openAPIV3Schema :: (Maybe JSONSchemaProps) }

derive instance newtypeCustomResourceValidation :: Newtype CustomResourceValidation _
derive instance genericCustomResourceValidation :: Generic CustomResourceValidation _
instance showCustomResourceValidation :: Show CustomResourceValidation where show a = genericShow a
instance decodeCustomResourceValidation :: Decode CustomResourceValidation where
  decode a = do
               openAPIV3Schema <- decodeMaybe "openAPIV3Schema" a
               pure $ CustomResourceValidation { openAPIV3Schema }
instance encodeCustomResourceValidation :: Encode CustomResourceValidation where
  encode (CustomResourceValidation a) = encode $ StrMap.fromFoldable $
               [ Tuple "openAPIV3Schema" (encodeMaybe a.openAPIV3Schema) ]


instance defaultCustomResourceValidation :: Default CustomResourceValidation where
  default = CustomResourceValidation
    { openAPIV3Schema: Nothing }

-- | DEPRECATED - This group version of DaemonSet is deprecated by apps/v1beta2/DaemonSet. See the release notes for more information. DaemonSet represents the configuration of a daemon set.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: The desired behavior of this daemon set. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: The current status of this daemon set. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype DaemonSet = DaemonSet
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe DaemonSetSpec)
  , status :: (Maybe DaemonSetStatus) }

derive instance newtypeDaemonSet :: Newtype DaemonSet _
derive instance genericDaemonSet :: Generic DaemonSet _
instance showDaemonSet :: Show DaemonSet where show a = genericShow a
instance decodeDaemonSet :: Decode DaemonSet where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               assertPropEq "kind" "DaemonSet" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ DaemonSet { metadata, spec, status }
instance encodeDaemonSet :: Encode DaemonSet where
  encode (DaemonSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "kind" (encode "DaemonSet")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultDaemonSet :: Default DaemonSet where
  default = DaemonSet
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | DaemonSetCondition describes the state of a DaemonSet at a certain point.
-- |
-- | Fields:
-- | - `_type`: Type of DaemonSet condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype DaemonSetCondition = DaemonSetCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeDaemonSetCondition :: Newtype DaemonSetCondition _
derive instance genericDaemonSetCondition :: Generic DaemonSetCondition _
instance showDaemonSetCondition :: Show DaemonSetCondition where show a = genericShow a
instance decodeDaemonSetCondition :: Decode DaemonSetCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ DaemonSetCondition { _type, lastTransitionTime, message, reason, status }
instance encodeDaemonSetCondition :: Encode DaemonSetCondition where
  encode (DaemonSetCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultDaemonSetCondition :: Default DaemonSetCondition where
  default = DaemonSetCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | DaemonSetList is a collection of daemon sets.
-- |
-- | Fields:
-- | - `items`: A list of daemon sets.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype DaemonSetList = DaemonSetList
  { items :: (Maybe (Array DaemonSet))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeDaemonSetList :: Newtype DaemonSetList _
derive instance genericDaemonSetList :: Generic DaemonSetList _
instance showDaemonSetList :: Show DaemonSetList where show a = genericShow a
instance decodeDaemonSetList :: Decode DaemonSetList where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "DaemonSetList" a
               metadata <- decodeMaybe "metadata" a
               pure $ DaemonSetList { items, metadata }
instance encodeDaemonSetList :: Encode DaemonSetList where
  encode (DaemonSetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "DaemonSetList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultDaemonSetList :: Default DaemonSetList where
  default = DaemonSetList
    { items: Nothing
    , metadata: Nothing }

-- | DaemonSetSpec is the specification of a daemon set.
-- |
-- | Fields:
-- | - `minReadySeconds`: The minimum number of seconds for which a newly created DaemonSet pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready).
-- | - `revisionHistoryLimit`: The number of old history to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
-- | - `selector`: A label query over pods that are managed by the daemon set. Must match in order to be controlled. If empty, defaulted to labels on Pod template. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: An object that describes the pod that will be created. The DaemonSet will create exactly one copy of this pod on every node that matches the template's node selector (or on every node if no node selector is specified). More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
-- | - `templateGeneration`: DEPRECATED. A sequence number representing a specific generation of the template. Populated by the system. It can be set only during the creation.
-- | - `updateStrategy`: An update strategy to replace existing DaemonSet pods with new pods.
newtype DaemonSetSpec = DaemonSetSpec
  { minReadySeconds :: (Maybe Int)
  , revisionHistoryLimit :: (Maybe Int)
  , selector :: (Maybe MetaV1.LabelSelector)
  , template :: (Maybe CoreV1.PodTemplateSpec)
  , templateGeneration :: (Maybe Int)
  , updateStrategy :: (Maybe DaemonSetUpdateStrategy) }

derive instance newtypeDaemonSetSpec :: Newtype DaemonSetSpec _
derive instance genericDaemonSetSpec :: Generic DaemonSetSpec _
instance showDaemonSetSpec :: Show DaemonSetSpec where show a = genericShow a
instance decodeDaemonSetSpec :: Decode DaemonSetSpec where
  decode a = do
               minReadySeconds <- decodeMaybe "minReadySeconds" a
               revisionHistoryLimit <- decodeMaybe "revisionHistoryLimit" a
               selector <- decodeMaybe "selector" a
               template <- decodeMaybe "template" a
               templateGeneration <- decodeMaybe "templateGeneration" a
               updateStrategy <- decodeMaybe "updateStrategy" a
               pure $ DaemonSetSpec { minReadySeconds, revisionHistoryLimit, selector, template, templateGeneration, updateStrategy }
instance encodeDaemonSetSpec :: Encode DaemonSetSpec where
  encode (DaemonSetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encodeMaybe a.minReadySeconds)
               , Tuple "revisionHistoryLimit" (encodeMaybe a.revisionHistoryLimit)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "template" (encodeMaybe a.template)
               , Tuple "templateGeneration" (encodeMaybe a.templateGeneration)
               , Tuple "updateStrategy" (encodeMaybe a.updateStrategy) ]


instance defaultDaemonSetSpec :: Default DaemonSetSpec where
  default = DaemonSetSpec
    { minReadySeconds: Nothing
    , revisionHistoryLimit: Nothing
    , selector: Nothing
    , template: Nothing
    , templateGeneration: Nothing
    , updateStrategy: Nothing }

-- | DaemonSetStatus represents the current status of a daemon set.
-- |
-- | Fields:
-- | - `collisionCount`: Count of hash collisions for the DaemonSet. The DaemonSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
-- | - `conditions`: Represents the latest available observations of a DaemonSet's current state.
-- | - `currentNumberScheduled`: The number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
-- | - `desiredNumberScheduled`: The total number of nodes that should be running the daemon pod (including nodes correctly running the daemon pod). More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
-- | - `numberAvailable`: The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and available (ready for at least spec.minReadySeconds)
-- | - `numberMisscheduled`: The number of nodes that are running the daemon pod, but are not supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
-- | - `numberReady`: The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and ready.
-- | - `numberUnavailable`: The number of nodes that should be running the daemon pod and have none of the daemon pod running and available (ready for at least spec.minReadySeconds)
-- | - `observedGeneration`: The most recent generation observed by the daemon set controller.
-- | - `updatedNumberScheduled`: The total number of nodes that are running updated daemon pod
newtype DaemonSetStatus = DaemonSetStatus
  { collisionCount :: (Maybe Int)
  , conditions :: (Maybe (Array DaemonSetCondition))
  , currentNumberScheduled :: (Maybe Int)
  , desiredNumberScheduled :: (Maybe Int)
  , numberAvailable :: (Maybe Int)
  , numberMisscheduled :: (Maybe Int)
  , numberReady :: (Maybe Int)
  , numberUnavailable :: (Maybe Int)
  , observedGeneration :: (Maybe Int)
  , updatedNumberScheduled :: (Maybe Int) }

derive instance newtypeDaemonSetStatus :: Newtype DaemonSetStatus _
derive instance genericDaemonSetStatus :: Generic DaemonSetStatus _
instance showDaemonSetStatus :: Show DaemonSetStatus where show a = genericShow a
instance decodeDaemonSetStatus :: Decode DaemonSetStatus where
  decode a = do
               collisionCount <- decodeMaybe "collisionCount" a
               conditions <- decodeMaybe "conditions" a
               currentNumberScheduled <- decodeMaybe "currentNumberScheduled" a
               desiredNumberScheduled <- decodeMaybe "desiredNumberScheduled" a
               numberAvailable <- decodeMaybe "numberAvailable" a
               numberMisscheduled <- decodeMaybe "numberMisscheduled" a
               numberReady <- decodeMaybe "numberReady" a
               numberUnavailable <- decodeMaybe "numberUnavailable" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               updatedNumberScheduled <- decodeMaybe "updatedNumberScheduled" a
               pure $ DaemonSetStatus { collisionCount, conditions, currentNumberScheduled, desiredNumberScheduled, numberAvailable, numberMisscheduled, numberReady, numberUnavailable, observedGeneration, updatedNumberScheduled }
instance encodeDaemonSetStatus :: Encode DaemonSetStatus where
  encode (DaemonSetStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "collisionCount" (encodeMaybe a.collisionCount)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "currentNumberScheduled" (encodeMaybe a.currentNumberScheduled)
               , Tuple "desiredNumberScheduled" (encodeMaybe a.desiredNumberScheduled)
               , Tuple "numberAvailable" (encodeMaybe a.numberAvailable)
               , Tuple "numberMisscheduled" (encodeMaybe a.numberMisscheduled)
               , Tuple "numberReady" (encodeMaybe a.numberReady)
               , Tuple "numberUnavailable" (encodeMaybe a.numberUnavailable)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration)
               , Tuple "updatedNumberScheduled" (encodeMaybe a.updatedNumberScheduled) ]


instance defaultDaemonSetStatus :: Default DaemonSetStatus where
  default = DaemonSetStatus
    { collisionCount: Nothing
    , conditions: Nothing
    , currentNumberScheduled: Nothing
    , desiredNumberScheduled: Nothing
    , numberAvailable: Nothing
    , numberMisscheduled: Nothing
    , numberReady: Nothing
    , numberUnavailable: Nothing
    , observedGeneration: Nothing
    , updatedNumberScheduled: Nothing }

-- | Fields:
-- | - `_type`: Type of daemon set update. Can be "RollingUpdate" or "OnDelete". Default is OnDelete.
-- | - `rollingUpdate`: Rolling update config params. Present only if type = "RollingUpdate".
newtype DaemonSetUpdateStrategy = DaemonSetUpdateStrategy
  { _type :: (Maybe String)
  , rollingUpdate :: (Maybe RollingUpdateDaemonSet) }

derive instance newtypeDaemonSetUpdateStrategy :: Newtype DaemonSetUpdateStrategy _
derive instance genericDaemonSetUpdateStrategy :: Generic DaemonSetUpdateStrategy _
instance showDaemonSetUpdateStrategy :: Show DaemonSetUpdateStrategy where show a = genericShow a
instance decodeDaemonSetUpdateStrategy :: Decode DaemonSetUpdateStrategy where
  decode a = do
               _type <- decodeMaybe "_type" a
               rollingUpdate <- decodeMaybe "rollingUpdate" a
               pure $ DaemonSetUpdateStrategy { _type, rollingUpdate }
instance encodeDaemonSetUpdateStrategy :: Encode DaemonSetUpdateStrategy where
  encode (DaemonSetUpdateStrategy a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "rollingUpdate" (encodeMaybe a.rollingUpdate) ]


instance defaultDaemonSetUpdateStrategy :: Default DaemonSetUpdateStrategy where
  default = DaemonSetUpdateStrategy
    { _type: Nothing
    , rollingUpdate: Nothing }

-- | DEPRECATED - This group version of Deployment is deprecated by apps/v1beta2/Deployment. See the release notes for more information. Deployment enables declarative updates for Pods and ReplicaSets.
-- |
-- | Fields:
-- | - `metadata`: Standard object metadata.
-- | - `spec`: Specification of the desired behavior of the Deployment.
-- | - `status`: Most recently observed status of the Deployment.
newtype Deployment = Deployment
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe DeploymentSpec)
  , status :: (Maybe DeploymentStatus) }

derive instance newtypeDeployment :: Newtype Deployment _
derive instance genericDeployment :: Generic Deployment _
instance showDeployment :: Show Deployment where show a = genericShow a
instance decodeDeployment :: Decode Deployment where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               assertPropEq "kind" "Deployment" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Deployment { metadata, spec, status }
instance encodeDeployment :: Encode Deployment where
  encode (Deployment a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "kind" (encode "Deployment")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultDeployment :: Default Deployment where
  default = Deployment
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | DeploymentCondition describes the state of a deployment at a certain point.
-- |
-- | Fields:
-- | - `_type`: Type of deployment condition.
-- | - `lastTransitionTime`: Last time the condition transitioned from one status to another.
-- | - `lastUpdateTime`: The last time this condition was updated.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype DeploymentCondition = DeploymentCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , lastUpdateTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeDeploymentCondition :: Newtype DeploymentCondition _
derive instance genericDeploymentCondition :: Generic DeploymentCondition _
instance showDeploymentCondition :: Show DeploymentCondition where show a = genericShow a
instance decodeDeploymentCondition :: Decode DeploymentCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               lastUpdateTime <- decodeMaybe "lastUpdateTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ DeploymentCondition { _type, lastTransitionTime, lastUpdateTime, message, reason, status }
instance encodeDeploymentCondition :: Encode DeploymentCondition where
  encode (DeploymentCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "lastUpdateTime" (encodeMaybe a.lastUpdateTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultDeploymentCondition :: Default DeploymentCondition where
  default = DeploymentCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , lastUpdateTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | DeploymentList is a list of Deployments.
-- |
-- | Fields:
-- | - `items`: Items is the list of Deployments.
-- | - `metadata`: Standard list metadata.
newtype DeploymentList = DeploymentList
  { items :: (Maybe (Array Deployment))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeDeploymentList :: Newtype DeploymentList _
derive instance genericDeploymentList :: Generic DeploymentList _
instance showDeploymentList :: Show DeploymentList where show a = genericShow a
instance decodeDeploymentList :: Decode DeploymentList where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "DeploymentList" a
               metadata <- decodeMaybe "metadata" a
               pure $ DeploymentList { items, metadata }
instance encodeDeploymentList :: Encode DeploymentList where
  encode (DeploymentList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "DeploymentList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultDeploymentList :: Default DeploymentList where
  default = DeploymentList
    { items: Nothing
    , metadata: Nothing }

-- | DEPRECATED. DeploymentRollback stores the information required to rollback a deployment.
-- |
-- | Fields:
-- | - `name`: Required: This must match the Name of a deployment.
-- | - `rollbackTo`: The config of this deployment rollback.
-- | - `updatedAnnotations`: The annotations to be updated to a deployment
newtype DeploymentRollback = DeploymentRollback
  { name :: (Maybe String)
  , rollbackTo :: (Maybe RollbackConfig)
  , updatedAnnotations :: (Maybe (StrMap String)) }

derive instance newtypeDeploymentRollback :: Newtype DeploymentRollback _
derive instance genericDeploymentRollback :: Generic DeploymentRollback _
instance showDeploymentRollback :: Show DeploymentRollback where show a = genericShow a
instance decodeDeploymentRollback :: Decode DeploymentRollback where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               assertPropEq "kind" "DeploymentRollback" a
               name <- decodeMaybe "name" a
               rollbackTo <- decodeMaybe "rollbackTo" a
               updatedAnnotations <- decodeMaybe "updatedAnnotations" a
               pure $ DeploymentRollback { name, rollbackTo, updatedAnnotations }
instance encodeDeploymentRollback :: Encode DeploymentRollback where
  encode (DeploymentRollback a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "kind" (encode "DeploymentRollback")
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "rollbackTo" (encodeMaybe a.rollbackTo)
               , Tuple "updatedAnnotations" (encodeMaybe a.updatedAnnotations) ]


instance defaultDeploymentRollback :: Default DeploymentRollback where
  default = DeploymentRollback
    { name: Nothing
    , rollbackTo: Nothing
    , updatedAnnotations: Nothing }

-- | DeploymentSpec is the specification of the desired behavior of the Deployment.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `paused`: Indicates that the deployment is paused and will not be processed by the deployment controller.
-- | - `progressDeadlineSeconds`: The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. This is not set by default.
-- | - `replicas`: Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
-- | - `revisionHistoryLimit`: The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified.
-- | - `rollbackTo`: DEPRECATED. The config this deployment is rolling back to. Will be cleared after rollback is done.
-- | - `selector`: Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment.
-- | - `strategy`: The deployment strategy to use to replace existing pods with new ones.
-- | - `template`: Template describes the pods that will be created.
newtype DeploymentSpec = DeploymentSpec
  { minReadySeconds :: (Maybe Int)
  , paused :: (Maybe Boolean)
  , progressDeadlineSeconds :: (Maybe Int)
  , replicas :: (Maybe Int)
  , revisionHistoryLimit :: (Maybe Int)
  , rollbackTo :: (Maybe RollbackConfig)
  , selector :: (Maybe MetaV1.LabelSelector)
  , strategy :: (Maybe DeploymentStrategy)
  , template :: (Maybe CoreV1.PodTemplateSpec) }

derive instance newtypeDeploymentSpec :: Newtype DeploymentSpec _
derive instance genericDeploymentSpec :: Generic DeploymentSpec _
instance showDeploymentSpec :: Show DeploymentSpec where show a = genericShow a
instance decodeDeploymentSpec :: Decode DeploymentSpec where
  decode a = do
               minReadySeconds <- decodeMaybe "minReadySeconds" a
               paused <- decodeMaybe "paused" a
               progressDeadlineSeconds <- decodeMaybe "progressDeadlineSeconds" a
               replicas <- decodeMaybe "replicas" a
               revisionHistoryLimit <- decodeMaybe "revisionHistoryLimit" a
               rollbackTo <- decodeMaybe "rollbackTo" a
               selector <- decodeMaybe "selector" a
               strategy <- decodeMaybe "strategy" a
               template <- decodeMaybe "template" a
               pure $ DeploymentSpec { minReadySeconds, paused, progressDeadlineSeconds, replicas, revisionHistoryLimit, rollbackTo, selector, strategy, template }
instance encodeDeploymentSpec :: Encode DeploymentSpec where
  encode (DeploymentSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encodeMaybe a.minReadySeconds)
               , Tuple "paused" (encodeMaybe a.paused)
               , Tuple "progressDeadlineSeconds" (encodeMaybe a.progressDeadlineSeconds)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "revisionHistoryLimit" (encodeMaybe a.revisionHistoryLimit)
               , Tuple "rollbackTo" (encodeMaybe a.rollbackTo)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "strategy" (encodeMaybe a.strategy)
               , Tuple "template" (encodeMaybe a.template) ]


instance defaultDeploymentSpec :: Default DeploymentSpec where
  default = DeploymentSpec
    { minReadySeconds: Nothing
    , paused: Nothing
    , progressDeadlineSeconds: Nothing
    , replicas: Nothing
    , revisionHistoryLimit: Nothing
    , rollbackTo: Nothing
    , selector: Nothing
    , strategy: Nothing
    , template: Nothing }

-- | DeploymentStatus is the most recently observed status of the Deployment.
-- |
-- | Fields:
-- | - `availableReplicas`: Total number of available pods (ready for at least minReadySeconds) targeted by this deployment.
-- | - `collisionCount`: Count of hash collisions for the Deployment. The Deployment controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ReplicaSet.
-- | - `conditions`: Represents the latest available observations of a deployment's current state.
-- | - `observedGeneration`: The generation observed by the deployment controller.
-- | - `readyReplicas`: Total number of ready pods targeted by this deployment.
-- | - `replicas`: Total number of non-terminated pods targeted by this deployment (their labels match the selector).
-- | - `unavailableReplicas`: Total number of unavailable pods targeted by this deployment. This is the total number of pods that are still required for the deployment to have 100% available capacity. They may either be pods that are running but not yet available or pods that still have not been created.
-- | - `updatedReplicas`: Total number of non-terminated pods targeted by this deployment that have the desired template spec.
newtype DeploymentStatus = DeploymentStatus
  { availableReplicas :: (Maybe Int)
  , collisionCount :: (Maybe Int)
  , conditions :: (Maybe (Array DeploymentCondition))
  , observedGeneration :: (Maybe Int)
  , readyReplicas :: (Maybe Int)
  , replicas :: (Maybe Int)
  , unavailableReplicas :: (Maybe Int)
  , updatedReplicas :: (Maybe Int) }

derive instance newtypeDeploymentStatus :: Newtype DeploymentStatus _
derive instance genericDeploymentStatus :: Generic DeploymentStatus _
instance showDeploymentStatus :: Show DeploymentStatus where show a = genericShow a
instance decodeDeploymentStatus :: Decode DeploymentStatus where
  decode a = do
               availableReplicas <- decodeMaybe "availableReplicas" a
               collisionCount <- decodeMaybe "collisionCount" a
               conditions <- decodeMaybe "conditions" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               readyReplicas <- decodeMaybe "readyReplicas" a
               replicas <- decodeMaybe "replicas" a
               unavailableReplicas <- decodeMaybe "unavailableReplicas" a
               updatedReplicas <- decodeMaybe "updatedReplicas" a
               pure $ DeploymentStatus { availableReplicas, collisionCount, conditions, observedGeneration, readyReplicas, replicas, unavailableReplicas, updatedReplicas }
instance encodeDeploymentStatus :: Encode DeploymentStatus where
  encode (DeploymentStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "availableReplicas" (encodeMaybe a.availableReplicas)
               , Tuple "collisionCount" (encodeMaybe a.collisionCount)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration)
               , Tuple "readyReplicas" (encodeMaybe a.readyReplicas)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "unavailableReplicas" (encodeMaybe a.unavailableReplicas)
               , Tuple "updatedReplicas" (encodeMaybe a.updatedReplicas) ]


instance defaultDeploymentStatus :: Default DeploymentStatus where
  default = DeploymentStatus
    { availableReplicas: Nothing
    , collisionCount: Nothing
    , conditions: Nothing
    , observedGeneration: Nothing
    , readyReplicas: Nothing
    , replicas: Nothing
    , unavailableReplicas: Nothing
    , updatedReplicas: Nothing }

-- | DeploymentStrategy describes how to replace existing pods with new ones.
-- |
-- | Fields:
-- | - `_type`: Type of deployment. Can be "Recreate" or "RollingUpdate". Default is RollingUpdate.
-- | - `rollingUpdate`: Rolling update config params. Present only if DeploymentStrategyType = RollingUpdate.
newtype DeploymentStrategy = DeploymentStrategy
  { _type :: (Maybe String)
  , rollingUpdate :: (Maybe RollingUpdateDeployment) }

derive instance newtypeDeploymentStrategy :: Newtype DeploymentStrategy _
derive instance genericDeploymentStrategy :: Generic DeploymentStrategy _
instance showDeploymentStrategy :: Show DeploymentStrategy where show a = genericShow a
instance decodeDeploymentStrategy :: Decode DeploymentStrategy where
  decode a = do
               _type <- decodeMaybe "_type" a
               rollingUpdate <- decodeMaybe "rollingUpdate" a
               pure $ DeploymentStrategy { _type, rollingUpdate }
instance encodeDeploymentStrategy :: Encode DeploymentStrategy where
  encode (DeploymentStrategy a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "rollingUpdate" (encodeMaybe a.rollingUpdate) ]


instance defaultDeploymentStrategy :: Default DeploymentStrategy where
  default = DeploymentStrategy
    { _type: Nothing
    , rollingUpdate: Nothing }

-- | ExternalDocumentation allows referencing an external resource for extended documentation.
-- |
-- | Fields:
-- | - `description`
-- | - `url`
newtype ExternalDocumentation = ExternalDocumentation
  { description :: (Maybe String)
  , url :: (Maybe String) }

derive instance newtypeExternalDocumentation :: Newtype ExternalDocumentation _
derive instance genericExternalDocumentation :: Generic ExternalDocumentation _
instance showExternalDocumentation :: Show ExternalDocumentation where show a = genericShow a
instance decodeExternalDocumentation :: Decode ExternalDocumentation where
  decode a = do
               description <- decodeMaybe "description" a
               url <- decodeMaybe "url" a
               pure $ ExternalDocumentation { description, url }
instance encodeExternalDocumentation :: Encode ExternalDocumentation where
  encode (ExternalDocumentation a) = encode $ StrMap.fromFoldable $
               [ Tuple "description" (encodeMaybe a.description)
               , Tuple "url" (encodeMaybe a.url) ]


instance defaultExternalDocumentation :: Default ExternalDocumentation where
  default = ExternalDocumentation
    { description: Nothing
    , url: Nothing }

-- | FSGroupStrategyOptions defines the strategy type and options used to create the strategy.
-- |
-- | Fields:
-- | - `ranges`: Ranges are the allowed ranges of fs groups.  If you would like to force a single fs group then supply a single range with the same start and end.
-- | - `rule`: Rule is the strategy that will dictate what FSGroup is used in the SecurityContext.
newtype FSGroupStrategyOptions = FSGroupStrategyOptions
  { ranges :: (Maybe (Array IDRange))
  , rule :: (Maybe String) }

derive instance newtypeFSGroupStrategyOptions :: Newtype FSGroupStrategyOptions _
derive instance genericFSGroupStrategyOptions :: Generic FSGroupStrategyOptions _
instance showFSGroupStrategyOptions :: Show FSGroupStrategyOptions where show a = genericShow a
instance decodeFSGroupStrategyOptions :: Decode FSGroupStrategyOptions where
  decode a = do
               ranges <- decodeMaybe "ranges" a
               rule <- decodeMaybe "rule" a
               pure $ FSGroupStrategyOptions { ranges, rule }
instance encodeFSGroupStrategyOptions :: Encode FSGroupStrategyOptions where
  encode (FSGroupStrategyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "ranges" (encodeMaybe a.ranges)
               , Tuple "rule" (encodeMaybe a.rule) ]


instance defaultFSGroupStrategyOptions :: Default FSGroupStrategyOptions where
  default = FSGroupStrategyOptions
    { ranges: Nothing
    , rule: Nothing }

-- | HTTPIngressPath associates a path regex with a backend. Incoming urls matching the path are forwarded to the backend.
-- |
-- | Fields:
-- | - `backend`: Backend defines the referenced service endpoint to which the traffic will be forwarded to.
-- | - `path`: Path is an extended POSIX regex as defined by IEEE Std 1003.1, (i.e this follows the egrep/unix syntax, not the perl syntax) matched against the path of an incoming request. Currently it can contain characters disallowed from the conventional "path" part of a URL as defined by RFC 3986. Paths must begin with a '/'. If unspecified, the path defaults to a catch all sending traffic to the backend.
newtype HTTPIngressPath = HTTPIngressPath
  { backend :: (Maybe IngressBackend)
  , path :: (Maybe String) }

derive instance newtypeHTTPIngressPath :: Newtype HTTPIngressPath _
derive instance genericHTTPIngressPath :: Generic HTTPIngressPath _
instance showHTTPIngressPath :: Show HTTPIngressPath where show a = genericShow a
instance decodeHTTPIngressPath :: Decode HTTPIngressPath where
  decode a = do
               backend <- decodeMaybe "backend" a
               path <- decodeMaybe "path" a
               pure $ HTTPIngressPath { backend, path }
instance encodeHTTPIngressPath :: Encode HTTPIngressPath where
  encode (HTTPIngressPath a) = encode $ StrMap.fromFoldable $
               [ Tuple "backend" (encodeMaybe a.backend)
               , Tuple "path" (encodeMaybe a.path) ]


instance defaultHTTPIngressPath :: Default HTTPIngressPath where
  default = HTTPIngressPath
    { backend: Nothing
    , path: Nothing }

-- | HTTPIngressRuleValue is a list of http selectors pointing to backends. In the example: http://<host>/<path>?<searchpart> -> backend where where parts of the url correspond to RFC 3986, this resource will be used to match against everything after the last '/' and before the first '?' or '#'.
-- |
-- | Fields:
-- | - `paths`: A collection of paths that map requests to backends.
newtype HTTPIngressRuleValue = HTTPIngressRuleValue
  { paths :: (Maybe (Array HTTPIngressPath)) }

derive instance newtypeHTTPIngressRuleValue :: Newtype HTTPIngressRuleValue _
derive instance genericHTTPIngressRuleValue :: Generic HTTPIngressRuleValue _
instance showHTTPIngressRuleValue :: Show HTTPIngressRuleValue where show a = genericShow a
instance decodeHTTPIngressRuleValue :: Decode HTTPIngressRuleValue where
  decode a = do
               paths <- decodeMaybe "paths" a
               pure $ HTTPIngressRuleValue { paths }
instance encodeHTTPIngressRuleValue :: Encode HTTPIngressRuleValue where
  encode (HTTPIngressRuleValue a) = encode $ StrMap.fromFoldable $
               [ Tuple "paths" (encodeMaybe a.paths) ]


instance defaultHTTPIngressRuleValue :: Default HTTPIngressRuleValue where
  default = HTTPIngressRuleValue
    { paths: Nothing }

-- | Host Port Range defines a range of host ports that will be enabled by a policy for pods to use.  It requires both the start and end to be defined.
-- |
-- | Fields:
-- | - `max`: max is the end of the range, inclusive.
-- | - `min`: min is the start of the range, inclusive.
newtype HostPortRange = HostPortRange
  { max :: (Maybe Int)
  , min :: (Maybe Int) }

derive instance newtypeHostPortRange :: Newtype HostPortRange _
derive instance genericHostPortRange :: Generic HostPortRange _
instance showHostPortRange :: Show HostPortRange where show a = genericShow a
instance decodeHostPortRange :: Decode HostPortRange where
  decode a = do
               max <- decodeMaybe "max" a
               min <- decodeMaybe "min" a
               pure $ HostPortRange { max, min }
instance encodeHostPortRange :: Encode HostPortRange where
  encode (HostPortRange a) = encode $ StrMap.fromFoldable $
               [ Tuple "max" (encodeMaybe a.max)
               , Tuple "min" (encodeMaybe a.min) ]


instance defaultHostPortRange :: Default HostPortRange where
  default = HostPortRange
    { max: Nothing
    , min: Nothing }

-- | ID Range provides a min/max of an allowed range of IDs.
-- |
-- | Fields:
-- | - `max`: Max is the end of the range, inclusive.
-- | - `min`: Min is the start of the range, inclusive.
newtype IDRange = IDRange
  { max :: (Maybe Int)
  , min :: (Maybe Int) }

derive instance newtypeIDRange :: Newtype IDRange _
derive instance genericIDRange :: Generic IDRange _
instance showIDRange :: Show IDRange where show a = genericShow a
instance decodeIDRange :: Decode IDRange where
  decode a = do
               max <- decodeMaybe "max" a
               min <- decodeMaybe "min" a
               pure $ IDRange { max, min }
instance encodeIDRange :: Encode IDRange where
  encode (IDRange a) = encode $ StrMap.fromFoldable $
               [ Tuple "max" (encodeMaybe a.max)
               , Tuple "min" (encodeMaybe a.min) ]


instance defaultIDRange :: Default IDRange where
  default = IDRange
    { max: Nothing
    , min: Nothing }

-- | DEPRECATED 1.9 - This group version of IPBlock is deprecated by networking/v1/IPBlock. IPBlock describes a particular CIDR (Ex. "192.168.1.1/24") that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The except entry describes CIDRs that should not be included within this rule.
-- |
-- | Fields:
-- | - `cidr`: CIDR is a string representing the IP Block Valid examples are "192.168.1.1/24"
-- | - `except`: Except is a slice of CIDRs that should not be included within an IP Block Valid examples are "192.168.1.1/24" Except values will be rejected if they are outside the CIDR range
newtype IPBlock = IPBlock
  { cidr :: (Maybe String)
  , except :: (Maybe (Array String)) }

derive instance newtypeIPBlock :: Newtype IPBlock _
derive instance genericIPBlock :: Generic IPBlock _
instance showIPBlock :: Show IPBlock where show a = genericShow a
instance decodeIPBlock :: Decode IPBlock where
  decode a = do
               cidr <- decodeMaybe "cidr" a
               except <- decodeMaybe "except" a
               pure $ IPBlock { cidr, except }
instance encodeIPBlock :: Encode IPBlock where
  encode (IPBlock a) = encode $ StrMap.fromFoldable $
               [ Tuple "cidr" (encodeMaybe a.cidr)
               , Tuple "except" (encodeMaybe a.except) ]


instance defaultIPBlock :: Default IPBlock where
  default = IPBlock
    { cidr: Nothing
    , except: Nothing }

-- | Ingress is a collection of rules that allow inbound connections to reach the endpoints defined by a backend. An Ingress can be configured to give services externally-reachable urls, load balance traffic, terminate SSL, offer name based virtual hosting etc.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec is the desired state of the Ingress. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status is the current state of the Ingress. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Ingress = Ingress
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe IngressSpec)
  , status :: (Maybe IngressStatus) }

derive instance newtypeIngress :: Newtype Ingress _
derive instance genericIngress :: Generic Ingress _
instance showIngress :: Show Ingress where show a = genericShow a
instance decodeIngress :: Decode Ingress where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               assertPropEq "kind" "Ingress" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Ingress { metadata, spec, status }
instance encodeIngress :: Encode Ingress where
  encode (Ingress a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "kind" (encode "Ingress")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultIngress :: Default Ingress where
  default = Ingress
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | IngressBackend describes all endpoints for a given service and port.
-- |
-- | Fields:
-- | - `serviceName`: Specifies the name of the referenced service.
-- | - `servicePort`: Specifies the port of the referenced service.
newtype IngressBackend = IngressBackend
  { serviceName :: (Maybe String)
  , servicePort :: (Maybe Util.IntOrString) }

derive instance newtypeIngressBackend :: Newtype IngressBackend _
derive instance genericIngressBackend :: Generic IngressBackend _
instance showIngressBackend :: Show IngressBackend where show a = genericShow a
instance decodeIngressBackend :: Decode IngressBackend where
  decode a = do
               serviceName <- decodeMaybe "serviceName" a
               servicePort <- decodeMaybe "servicePort" a
               pure $ IngressBackend { serviceName, servicePort }
instance encodeIngressBackend :: Encode IngressBackend where
  encode (IngressBackend a) = encode $ StrMap.fromFoldable $
               [ Tuple "serviceName" (encodeMaybe a.serviceName)
               , Tuple "servicePort" (encodeMaybe a.servicePort) ]


instance defaultIngressBackend :: Default IngressBackend where
  default = IngressBackend
    { serviceName: Nothing
    , servicePort: Nothing }

-- | IngressList is a collection of Ingress.
-- |
-- | Fields:
-- | - `items`: Items is the list of Ingress.
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype IngressList = IngressList
  { items :: (Maybe (Array Ingress))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeIngressList :: Newtype IngressList _
derive instance genericIngressList :: Generic IngressList _
instance showIngressList :: Show IngressList where show a = genericShow a
instance decodeIngressList :: Decode IngressList where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "IngressList" a
               metadata <- decodeMaybe "metadata" a
               pure $ IngressList { items, metadata }
instance encodeIngressList :: Encode IngressList where
  encode (IngressList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "IngressList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultIngressList :: Default IngressList where
  default = IngressList
    { items: Nothing
    , metadata: Nothing }

-- | IngressRule represents the rules mapping the paths under a specified host to the related backend services. Incoming requests are first evaluated for a host match, then routed to the backend associated with the matching IngressRuleValue.
-- |
-- | Fields:
-- | - `host`: Host is the fully qualified domain name of a network host, as defined by RFC 3986. Note the following deviations from the "host" part of the URI as defined in the RFC: 1. IPs are not allowed. Currently an IngressRuleValue can only apply to the
-- |    	  IP in the Spec of the parent Ingress.
-- |    2. The `:` delimiter is not respected because ports are not allowed.
-- |    	  Currently the port of an Ingress is implicitly :80 for http and
-- |    	  :443 for https.
-- |    Both these may change in the future. Incoming requests are matched against the host before the IngressRuleValue. If the host is unspecified, the Ingress routes all traffic based on the specified IngressRuleValue.
-- | - `http`
newtype IngressRule = IngressRule
  { host :: (Maybe String)
  , http :: (Maybe HTTPIngressRuleValue) }

derive instance newtypeIngressRule :: Newtype IngressRule _
derive instance genericIngressRule :: Generic IngressRule _
instance showIngressRule :: Show IngressRule where show a = genericShow a
instance decodeIngressRule :: Decode IngressRule where
  decode a = do
               host <- decodeMaybe "host" a
               http <- decodeMaybe "http" a
               pure $ IngressRule { host, http }
instance encodeIngressRule :: Encode IngressRule where
  encode (IngressRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "host" (encodeMaybe a.host)
               , Tuple "http" (encodeMaybe a.http) ]


instance defaultIngressRule :: Default IngressRule where
  default = IngressRule
    { host: Nothing
    , http: Nothing }

-- | IngressSpec describes the Ingress the user wishes to exist.
-- |
-- | Fields:
-- | - `backend`: A default backend capable of servicing requests that don't match any rule. At least one of 'backend' or 'rules' must be specified. This field is optional to allow the loadbalancer controller or defaulting logic to specify a global default.
-- | - `rules`: A list of host rules used to configure the Ingress. If unspecified, or no rule matches, all traffic is sent to the default backend.
-- | - `tls`: TLS configuration. Currently the Ingress only supports a single TLS port, 443. If multiple members of this list specify different hosts, they will be multiplexed on the same port according to the hostname specified through the SNI TLS extension, if the ingress controller fulfilling the ingress supports SNI.
newtype IngressSpec = IngressSpec
  { backend :: (Maybe IngressBackend)
  , rules :: (Maybe (Array IngressRule))
  , tls :: (Maybe (Array IngressTLS)) }

derive instance newtypeIngressSpec :: Newtype IngressSpec _
derive instance genericIngressSpec :: Generic IngressSpec _
instance showIngressSpec :: Show IngressSpec where show a = genericShow a
instance decodeIngressSpec :: Decode IngressSpec where
  decode a = do
               backend <- decodeMaybe "backend" a
               rules <- decodeMaybe "rules" a
               tls <- decodeMaybe "tls" a
               pure $ IngressSpec { backend, rules, tls }
instance encodeIngressSpec :: Encode IngressSpec where
  encode (IngressSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "backend" (encodeMaybe a.backend)
               , Tuple "rules" (encodeMaybe a.rules)
               , Tuple "tls" (encodeMaybe a.tls) ]


instance defaultIngressSpec :: Default IngressSpec where
  default = IngressSpec
    { backend: Nothing
    , rules: Nothing
    , tls: Nothing }

-- | IngressStatus describe the current state of the Ingress.
-- |
-- | Fields:
-- | - `loadBalancer`: LoadBalancer contains the current status of the load-balancer.
newtype IngressStatus = IngressStatus
  { loadBalancer :: (Maybe CoreV1.LoadBalancerStatus) }

derive instance newtypeIngressStatus :: Newtype IngressStatus _
derive instance genericIngressStatus :: Generic IngressStatus _
instance showIngressStatus :: Show IngressStatus where show a = genericShow a
instance decodeIngressStatus :: Decode IngressStatus where
  decode a = do
               loadBalancer <- decodeMaybe "loadBalancer" a
               pure $ IngressStatus { loadBalancer }
instance encodeIngressStatus :: Encode IngressStatus where
  encode (IngressStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "loadBalancer" (encodeMaybe a.loadBalancer) ]


instance defaultIngressStatus :: Default IngressStatus where
  default = IngressStatus
    { loadBalancer: Nothing }

-- | IngressTLS describes the transport layer security associated with an Ingress.
-- |
-- | Fields:
-- | - `hosts`: Hosts are a list of hosts included in the TLS certificate. The values in this list must match the name/s used in the tlsSecret. Defaults to the wildcard host setting for the loadbalancer controller fulfilling this Ingress, if left unspecified.
-- | - `secretName`: SecretName is the name of the secret used to terminate SSL traffic on 443. Field is left optional to allow SSL routing based on SNI hostname alone. If the SNI host in a listener conflicts with the "Host" header field used by an IngressRule, the SNI host is used for termination and value of the Host header is used for routing.
newtype IngressTLS = IngressTLS
  { hosts :: (Maybe (Array String))
  , secretName :: (Maybe String) }

derive instance newtypeIngressTLS :: Newtype IngressTLS _
derive instance genericIngressTLS :: Generic IngressTLS _
instance showIngressTLS :: Show IngressTLS where show a = genericShow a
instance decodeIngressTLS :: Decode IngressTLS where
  decode a = do
               hosts <- decodeMaybe "hosts" a
               secretName <- decodeMaybe "secretName" a
               pure $ IngressTLS { hosts, secretName }
instance encodeIngressTLS :: Encode IngressTLS where
  encode (IngressTLS a) = encode $ StrMap.fromFoldable $
               [ Tuple "hosts" (encodeMaybe a.hosts)
               , Tuple "secretName" (encodeMaybe a.secretName) ]


instance defaultIngressTLS :: Default IngressTLS where
  default = IngressTLS
    { hosts: Nothing
    , secretName: Nothing }

-- | JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil.
-- |
-- | Fields:
-- | - `_Raw`
newtype JSON = JSON
  { _Raw :: (Maybe String) }

derive instance newtypeJSON :: Newtype JSON _
derive instance genericJSON :: Generic JSON _
instance showJSON :: Show JSON where show a = genericShow a
instance decodeJSON :: Decode JSON where
  decode a = do
               _Raw <- decodeMaybe "_Raw" a
               pure $ JSON { _Raw }
instance encodeJSON :: Encode JSON where
  encode (JSON a) = encode $ StrMap.fromFoldable $
               [ Tuple "_Raw" (encodeMaybe a._Raw) ]


instance defaultJSON :: Default JSON where
  default = JSON
    { _Raw: Nothing }

-- | JSONSchemaProps is a JSON-Schema following Specification Draft 4 (http://json-schema.org/).
-- |
-- | Fields:
-- | - `_default`
-- | - `_ref`
-- | - `_schema`
-- | - `_type`
-- | - `additionalItems`
-- | - `additionalProperties`
-- | - `allOf`
-- | - `anyOf`
-- | - `definitions`
-- | - `dependencies`
-- | - `description`
-- | - `enum`
-- | - `example`
-- | - `exclusiveMaximum`
-- | - `exclusiveMinimum`
-- | - `externalDocs`
-- | - `format`
-- | - `id`
-- | - `items`
-- | - `maxItems`
-- | - `maxLength`
-- | - `maxProperties`
-- | - `maximum`
-- | - `minItems`
-- | - `minLength`
-- | - `minProperties`
-- | - `minimum`
-- | - `multipleOf`
-- | - `not`
-- | - `oneOf`
-- | - `pattern`
-- | - `patternProperties`
-- | - `properties`
-- | - `required`
-- | - `title`
-- | - `uniqueItems`
newtype JSONSchemaProps = JSONSchemaProps
  { _default :: (Maybe JSON)
  , _ref :: (Maybe String)
  , _schema :: (Maybe String)
  , _type :: (Maybe String)
  , additionalItems :: (Maybe JSONSchemaPropsOrBool)
  , additionalProperties :: (Maybe JSONSchemaPropsOrBool)
  , allOf :: (Maybe (Array JSONSchemaProps))
  , anyOf :: (Maybe (Array JSONSchemaProps))
  , definitions :: (Maybe (StrMap JSONSchemaProps))
  , dependencies :: (Maybe (StrMap JSONSchemaPropsOrStringArray))
  , description :: (Maybe String)
  , enum :: (Maybe (Array JSON))
  , example :: (Maybe JSON)
  , exclusiveMaximum :: (Maybe Boolean)
  , exclusiveMinimum :: (Maybe Boolean)
  , externalDocs :: (Maybe ExternalDocumentation)
  , format :: (Maybe String)
  , id :: (Maybe String)
  , items :: (Maybe JSONSchemaPropsOrArray)
  , maxItems :: (Maybe Int)
  , maxLength :: (Maybe Int)
  , maxProperties :: (Maybe Int)
  , maximum :: (Maybe Number)
  , minItems :: (Maybe Int)
  , minLength :: (Maybe Int)
  , minProperties :: (Maybe Int)
  , minimum :: (Maybe Number)
  , multipleOf :: (Maybe Number)
  , not :: (Maybe JSONSchemaProps)
  , oneOf :: (Maybe (Array JSONSchemaProps))
  , pattern :: (Maybe String)
  , patternProperties :: (Maybe (StrMap JSONSchemaProps))
  , properties :: (Maybe (StrMap JSONSchemaProps))
  , required :: (Maybe (Array String))
  , title :: (Maybe String)
  , uniqueItems :: (Maybe Boolean) }

derive instance newtypeJSONSchemaProps :: Newtype JSONSchemaProps _
derive instance genericJSONSchemaProps :: Generic JSONSchemaProps _
instance showJSONSchemaProps :: Show JSONSchemaProps where show a = genericShow a
instance decodeJSONSchemaProps :: Decode JSONSchemaProps where
  decode a = do
               _default <- decodeMaybe "_default" a
               _ref <- decodeMaybe "_ref" a
               _schema <- decodeMaybe "_schema" a
               _type <- decodeMaybe "_type" a
               additionalItems <- decodeMaybe "additionalItems" a
               additionalProperties <- decodeMaybe "additionalProperties" a
               allOf <- decodeMaybe "allOf" a
               anyOf <- decodeMaybe "anyOf" a
               definitions <- decodeMaybe "definitions" a
               dependencies <- decodeMaybe "dependencies" a
               description <- decodeMaybe "description" a
               enum <- decodeMaybe "enum" a
               example <- decodeMaybe "example" a
               exclusiveMaximum <- decodeMaybe "exclusiveMaximum" a
               exclusiveMinimum <- decodeMaybe "exclusiveMinimum" a
               externalDocs <- decodeMaybe "externalDocs" a
               format <- decodeMaybe "format" a
               id <- decodeMaybe "id" a
               items <- decodeMaybe "items" a
               maxItems <- decodeMaybe "maxItems" a
               maxLength <- decodeMaybe "maxLength" a
               maxProperties <- decodeMaybe "maxProperties" a
               maximum <- decodeMaybe "maximum" a
               minItems <- decodeMaybe "minItems" a
               minLength <- decodeMaybe "minLength" a
               minProperties <- decodeMaybe "minProperties" a
               minimum <- decodeMaybe "minimum" a
               multipleOf <- decodeMaybe "multipleOf" a
               not <- decodeMaybe "not" a
               oneOf <- decodeMaybe "oneOf" a
               pattern <- decodeMaybe "pattern" a
               patternProperties <- decodeMaybe "patternProperties" a
               properties <- decodeMaybe "properties" a
               required <- decodeMaybe "required" a
               title <- decodeMaybe "title" a
               uniqueItems <- decodeMaybe "uniqueItems" a
               pure $ JSONSchemaProps { _default, _ref, _schema, _type, additionalItems, additionalProperties, allOf, anyOf, definitions, dependencies, description, enum, example, exclusiveMaximum, exclusiveMinimum, externalDocs, format, id, items, maxItems, maxLength, maxProperties, maximum, minItems, minLength, minProperties, minimum, multipleOf, not, oneOf, pattern, patternProperties, properties, required, title, uniqueItems }
instance encodeJSONSchemaProps :: Encode JSONSchemaProps where
  encode (JSONSchemaProps a) = encode $ StrMap.fromFoldable $
               [ Tuple "_default" (encodeMaybe a._default)
               , Tuple "_ref" (encodeMaybe a._ref)
               , Tuple "_schema" (encodeMaybe a._schema)
               , Tuple "_type" (encodeMaybe a._type)
               , Tuple "additionalItems" (encodeMaybe a.additionalItems)
               , Tuple "additionalProperties" (encodeMaybe a.additionalProperties)
               , Tuple "allOf" (encodeMaybe a.allOf)
               , Tuple "anyOf" (encodeMaybe a.anyOf)
               , Tuple "definitions" (encodeMaybe a.definitions)
               , Tuple "dependencies" (encodeMaybe a.dependencies)
               , Tuple "description" (encodeMaybe a.description)
               , Tuple "enum" (encodeMaybe a.enum)
               , Tuple "example" (encodeMaybe a.example)
               , Tuple "exclusiveMaximum" (encodeMaybe a.exclusiveMaximum)
               , Tuple "exclusiveMinimum" (encodeMaybe a.exclusiveMinimum)
               , Tuple "externalDocs" (encodeMaybe a.externalDocs)
               , Tuple "format" (encodeMaybe a.format)
               , Tuple "id" (encodeMaybe a.id)
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "maxItems" (encodeMaybe a.maxItems)
               , Tuple "maxLength" (encodeMaybe a.maxLength)
               , Tuple "maxProperties" (encodeMaybe a.maxProperties)
               , Tuple "maximum" (encodeMaybe a.maximum)
               , Tuple "minItems" (encodeMaybe a.minItems)
               , Tuple "minLength" (encodeMaybe a.minLength)
               , Tuple "minProperties" (encodeMaybe a.minProperties)
               , Tuple "minimum" (encodeMaybe a.minimum)
               , Tuple "multipleOf" (encodeMaybe a.multipleOf)
               , Tuple "not" (encodeMaybe a.not)
               , Tuple "oneOf" (encodeMaybe a.oneOf)
               , Tuple "pattern" (encodeMaybe a.pattern)
               , Tuple "patternProperties" (encodeMaybe a.patternProperties)
               , Tuple "properties" (encodeMaybe a.properties)
               , Tuple "required" (encodeMaybe a.required)
               , Tuple "title" (encodeMaybe a.title)
               , Tuple "uniqueItems" (encodeMaybe a.uniqueItems) ]


instance defaultJSONSchemaProps :: Default JSONSchemaProps where
  default = JSONSchemaProps
    { _default: Nothing
    , _ref: Nothing
    , _schema: Nothing
    , _type: Nothing
    , additionalItems: Nothing
    , additionalProperties: Nothing
    , allOf: Nothing
    , anyOf: Nothing
    , definitions: Nothing
    , dependencies: Nothing
    , description: Nothing
    , enum: Nothing
    , example: Nothing
    , exclusiveMaximum: Nothing
    , exclusiveMinimum: Nothing
    , externalDocs: Nothing
    , format: Nothing
    , id: Nothing
    , items: Nothing
    , maxItems: Nothing
    , maxLength: Nothing
    , maxProperties: Nothing
    , maximum: Nothing
    , minItems: Nothing
    , minLength: Nothing
    , minProperties: Nothing
    , minimum: Nothing
    , multipleOf: Nothing
    , not: Nothing
    , oneOf: Nothing
    , pattern: Nothing
    , patternProperties: Nothing
    , properties: Nothing
    , required: Nothing
    , title: Nothing
    , uniqueItems: Nothing }

-- | JSONSchemaPropsOrArray represents a value that can either be a JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization purposes.
-- |
-- | Fields:
-- | - `_JSONSchemas`
-- | - `_Schema`
newtype JSONSchemaPropsOrArray = JSONSchemaPropsOrArray
  { _JSONSchemas :: (Maybe (Array JSONSchemaProps))
  , _Schema :: (Maybe JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrArray :: Newtype JSONSchemaPropsOrArray _
derive instance genericJSONSchemaPropsOrArray :: Generic JSONSchemaPropsOrArray _
instance showJSONSchemaPropsOrArray :: Show JSONSchemaPropsOrArray where show a = genericShow a
instance decodeJSONSchemaPropsOrArray :: Decode JSONSchemaPropsOrArray where
  decode a = do
               _JSONSchemas <- decodeMaybe "_JSONSchemas" a
               _Schema <- decodeMaybe "_Schema" a
               pure $ JSONSchemaPropsOrArray { _JSONSchemas, _Schema }
instance encodeJSONSchemaPropsOrArray :: Encode JSONSchemaPropsOrArray where
  encode (JSONSchemaPropsOrArray a) = encode $ StrMap.fromFoldable $
               [ Tuple "_JSONSchemas" (encodeMaybe a._JSONSchemas)
               , Tuple "_Schema" (encodeMaybe a._Schema) ]


instance defaultJSONSchemaPropsOrArray :: Default JSONSchemaPropsOrArray where
  default = JSONSchemaPropsOrArray
    { _JSONSchemas: Nothing
    , _Schema: Nothing }

-- | JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property.
-- |
-- | Fields:
-- | - `_Allows`
-- | - `_Schema`
newtype JSONSchemaPropsOrBool = JSONSchemaPropsOrBool
  { _Allows :: (Maybe Boolean)
  , _Schema :: (Maybe JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrBool :: Newtype JSONSchemaPropsOrBool _
derive instance genericJSONSchemaPropsOrBool :: Generic JSONSchemaPropsOrBool _
instance showJSONSchemaPropsOrBool :: Show JSONSchemaPropsOrBool where show a = genericShow a
instance decodeJSONSchemaPropsOrBool :: Decode JSONSchemaPropsOrBool where
  decode a = do
               _Allows <- decodeMaybe "_Allows" a
               _Schema <- decodeMaybe "_Schema" a
               pure $ JSONSchemaPropsOrBool { _Allows, _Schema }
instance encodeJSONSchemaPropsOrBool :: Encode JSONSchemaPropsOrBool where
  encode (JSONSchemaPropsOrBool a) = encode $ StrMap.fromFoldable $
               [ Tuple "_Allows" (encodeMaybe a._Allows)
               , Tuple "_Schema" (encodeMaybe a._Schema) ]


instance defaultJSONSchemaPropsOrBool :: Default JSONSchemaPropsOrBool where
  default = JSONSchemaPropsOrBool
    { _Allows: Nothing
    , _Schema: Nothing }

-- | JSONSchemaPropsOrStringArray represents a JSONSchemaProps or a string array.
-- |
-- | Fields:
-- | - `_Property`
-- | - `_Schema`
newtype JSONSchemaPropsOrStringArray = JSONSchemaPropsOrStringArray
  { _Property :: (Maybe (Array String))
  , _Schema :: (Maybe JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrStringArray :: Newtype JSONSchemaPropsOrStringArray _
derive instance genericJSONSchemaPropsOrStringArray :: Generic JSONSchemaPropsOrStringArray _
instance showJSONSchemaPropsOrStringArray :: Show JSONSchemaPropsOrStringArray where show a = genericShow a
instance decodeJSONSchemaPropsOrStringArray :: Decode JSONSchemaPropsOrStringArray where
  decode a = do
               _Property <- decodeMaybe "_Property" a
               _Schema <- decodeMaybe "_Schema" a
               pure $ JSONSchemaPropsOrStringArray { _Property, _Schema }
instance encodeJSONSchemaPropsOrStringArray :: Encode JSONSchemaPropsOrStringArray where
  encode (JSONSchemaPropsOrStringArray a) = encode $ StrMap.fromFoldable $
               [ Tuple "_Property" (encodeMaybe a._Property)
               , Tuple "_Schema" (encodeMaybe a._Schema) ]


instance defaultJSONSchemaPropsOrStringArray :: Default JSONSchemaPropsOrStringArray where
  default = JSONSchemaPropsOrStringArray
    { _Property: Nothing
    , _Schema: Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicy is deprecated by networking/v1/NetworkPolicy. NetworkPolicy describes what network traffic is allowed for a set of Pods
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior for this NetworkPolicy.
newtype NetworkPolicy = NetworkPolicy
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe NetworkPolicySpec) }

derive instance newtypeNetworkPolicy :: Newtype NetworkPolicy _
derive instance genericNetworkPolicy :: Generic NetworkPolicy _
instance showNetworkPolicy :: Show NetworkPolicy where show a = genericShow a
instance decodeNetworkPolicy :: Decode NetworkPolicy where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               assertPropEq "kind" "NetworkPolicy" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               pure $ NetworkPolicy { metadata, spec }
instance encodeNetworkPolicy :: Encode NetworkPolicy where
  encode (NetworkPolicy a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "kind" (encode "NetworkPolicy")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec) ]


instance defaultNetworkPolicy :: Default NetworkPolicy where
  default = NetworkPolicy
    { metadata: Nothing
    , spec: Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyEgressRule is deprecated by networking/v1/NetworkPolicyEgressRule. NetworkPolicyEgressRule describes a particular set of traffic that is allowed out of pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and to. This type is beta-level in 1.8
-- |
-- | Fields:
-- | - `ports`: List of destination ports for outgoing traffic. Each item in this list is combined using a logical OR. If this field is empty or missing, this rule matches all ports (traffic not restricted by port). If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list.
-- | - `to`: List of destinations for outgoing traffic of pods selected for this rule. Items in this list are combined using a logical OR operation. If this field is empty or missing, this rule matches all destinations (traffic not restricted by destination). If this field is present and contains at least one item, this rule allows traffic only if the traffic matches at least one item in the to list.
newtype NetworkPolicyEgressRule = NetworkPolicyEgressRule
  { ports :: (Maybe (Array NetworkPolicyPort))
  , to :: (Maybe (Array NetworkPolicyPeer)) }

derive instance newtypeNetworkPolicyEgressRule :: Newtype NetworkPolicyEgressRule _
derive instance genericNetworkPolicyEgressRule :: Generic NetworkPolicyEgressRule _
instance showNetworkPolicyEgressRule :: Show NetworkPolicyEgressRule where show a = genericShow a
instance decodeNetworkPolicyEgressRule :: Decode NetworkPolicyEgressRule where
  decode a = do
               ports <- decodeMaybe "ports" a
               to <- decodeMaybe "to" a
               pure $ NetworkPolicyEgressRule { ports, to }
instance encodeNetworkPolicyEgressRule :: Encode NetworkPolicyEgressRule where
  encode (NetworkPolicyEgressRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "ports" (encodeMaybe a.ports)
               , Tuple "to" (encodeMaybe a.to) ]


instance defaultNetworkPolicyEgressRule :: Default NetworkPolicyEgressRule where
  default = NetworkPolicyEgressRule
    { ports: Nothing
    , to: Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyIngressRule is deprecated by networking/v1/NetworkPolicyIngressRule. This NetworkPolicyIngressRule matches traffic if and only if the traffic matches both ports AND from.
-- |
-- | Fields:
-- | - `from`: List of sources which should be able to access the pods selected for this rule. Items in this list are combined using a logical OR operation. If this field is empty or missing, this rule matches all sources (traffic not restricted by source). If this field is present and contains at least on item, this rule allows traffic only if the traffic matches at least one item in the from list.
-- | - `ports`: List of ports which should be made accessible on the pods selected for this rule. Each item in this list is combined using a logical OR. If this field is empty or missing, this rule matches all ports (traffic not restricted by port). If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list.
newtype NetworkPolicyIngressRule = NetworkPolicyIngressRule
  { from :: (Maybe (Array NetworkPolicyPeer))
  , ports :: (Maybe (Array NetworkPolicyPort)) }

derive instance newtypeNetworkPolicyIngressRule :: Newtype NetworkPolicyIngressRule _
derive instance genericNetworkPolicyIngressRule :: Generic NetworkPolicyIngressRule _
instance showNetworkPolicyIngressRule :: Show NetworkPolicyIngressRule where show a = genericShow a
instance decodeNetworkPolicyIngressRule :: Decode NetworkPolicyIngressRule where
  decode a = do
               from <- decodeMaybe "from" a
               ports <- decodeMaybe "ports" a
               pure $ NetworkPolicyIngressRule { from, ports }
instance encodeNetworkPolicyIngressRule :: Encode NetworkPolicyIngressRule where
  encode (NetworkPolicyIngressRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "from" (encodeMaybe a.from)
               , Tuple "ports" (encodeMaybe a.ports) ]


instance defaultNetworkPolicyIngressRule :: Default NetworkPolicyIngressRule where
  default = NetworkPolicyIngressRule
    { from: Nothing
    , ports: Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyList is deprecated by networking/v1/NetworkPolicyList. Network Policy List is a list of NetworkPolicy objects.
-- |
-- | Fields:
-- | - `items`: Items is a list of schema objects.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype NetworkPolicyList = NetworkPolicyList
  { items :: (Maybe (Array NetworkPolicy))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeNetworkPolicyList :: Newtype NetworkPolicyList _
derive instance genericNetworkPolicyList :: Generic NetworkPolicyList _
instance showNetworkPolicyList :: Show NetworkPolicyList where show a = genericShow a
instance decodeNetworkPolicyList :: Decode NetworkPolicyList where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "NetworkPolicyList" a
               metadata <- decodeMaybe "metadata" a
               pure $ NetworkPolicyList { items, metadata }
instance encodeNetworkPolicyList :: Encode NetworkPolicyList where
  encode (NetworkPolicyList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "NetworkPolicyList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultNetworkPolicyList :: Default NetworkPolicyList where
  default = NetworkPolicyList
    { items: Nothing
    , metadata: Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyPeer is deprecated by networking/v1/NetworkPolicyPeer.
-- |
-- | Fields:
-- | - `ipBlock`: IPBlock defines policy on a particular IPBlock
-- | - `namespaceSelector`: Selects Namespaces using cluster scoped-labels.  This matches all pods in all namespaces selected by this label selector. This field follows standard label selector semantics. If present but empty, this selector selects all namespaces.
-- | - `podSelector`: This is a label selector which selects Pods in this namespace. This field follows standard label selector semantics. If present but empty, this selector selects all pods in this namespace.
newtype NetworkPolicyPeer = NetworkPolicyPeer
  { ipBlock :: (Maybe IPBlock)
  , namespaceSelector :: (Maybe MetaV1.LabelSelector)
  , podSelector :: (Maybe MetaV1.LabelSelector) }

derive instance newtypeNetworkPolicyPeer :: Newtype NetworkPolicyPeer _
derive instance genericNetworkPolicyPeer :: Generic NetworkPolicyPeer _
instance showNetworkPolicyPeer :: Show NetworkPolicyPeer where show a = genericShow a
instance decodeNetworkPolicyPeer :: Decode NetworkPolicyPeer where
  decode a = do
               ipBlock <- decodeMaybe "ipBlock" a
               namespaceSelector <- decodeMaybe "namespaceSelector" a
               podSelector <- decodeMaybe "podSelector" a
               pure $ NetworkPolicyPeer { ipBlock, namespaceSelector, podSelector }
instance encodeNetworkPolicyPeer :: Encode NetworkPolicyPeer where
  encode (NetworkPolicyPeer a) = encode $ StrMap.fromFoldable $
               [ Tuple "ipBlock" (encodeMaybe a.ipBlock)
               , Tuple "namespaceSelector" (encodeMaybe a.namespaceSelector)
               , Tuple "podSelector" (encodeMaybe a.podSelector) ]


instance defaultNetworkPolicyPeer :: Default NetworkPolicyPeer where
  default = NetworkPolicyPeer
    { ipBlock: Nothing
    , namespaceSelector: Nothing
    , podSelector: Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicyPort is deprecated by networking/v1/NetworkPolicyPort.
-- |
-- | Fields:
-- | - `port`: If specified, the port on the given protocol.  This can either be a numerical or named port on a pod.  If this field is not provided, this matches all port names and numbers. If present, only traffic on the specified protocol AND port will be matched.
-- | - `protocol`: Optional.  The protocol (TCP or UDP) which traffic must match. If not specified, this field defaults to TCP.
newtype NetworkPolicyPort = NetworkPolicyPort
  { port :: (Maybe Util.IntOrString)
  , protocol :: (Maybe String) }

derive instance newtypeNetworkPolicyPort :: Newtype NetworkPolicyPort _
derive instance genericNetworkPolicyPort :: Generic NetworkPolicyPort _
instance showNetworkPolicyPort :: Show NetworkPolicyPort where show a = genericShow a
instance decodeNetworkPolicyPort :: Decode NetworkPolicyPort where
  decode a = do
               port <- decodeMaybe "port" a
               protocol <- decodeMaybe "protocol" a
               pure $ NetworkPolicyPort { port, protocol }
instance encodeNetworkPolicyPort :: Encode NetworkPolicyPort where
  encode (NetworkPolicyPort a) = encode $ StrMap.fromFoldable $
               [ Tuple "port" (encodeMaybe a.port)
               , Tuple "protocol" (encodeMaybe a.protocol) ]


instance defaultNetworkPolicyPort :: Default NetworkPolicyPort where
  default = NetworkPolicyPort
    { port: Nothing
    , protocol: Nothing }

-- | DEPRECATED 1.9 - This group version of NetworkPolicySpec is deprecated by networking/v1/NetworkPolicySpec.
-- |
-- | Fields:
-- | - `egress`: List of egress rules to be applied to the selected pods. Outgoing traffic is allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic matches at least one egress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it selects are isolated by default). This field is beta-level in 1.8
-- | - `ingress`: List of ingress rules to be applied to the selected pods. Traffic is allowed to a pod if there are no NetworkPolicies selecting the pod OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy does not allow any traffic (and serves solely to ensure that the pods it selects are isolated by default).
-- | - `podSelector`: Selects the pods to which this NetworkPolicy object applies.  The array of ingress rules is applied to any pods selected by this field. Multiple network policies can select the same set of pods.  In this case, the ingress rules for each are combined additively. This field is NOT optional and follows standard label selector semantics. An empty podSelector matches all pods in this namespace.
-- | - `policyTypes`: List of rule types that the NetworkPolicy relates to. Valid options are Ingress, Egress, or Ingress,Egress. If this field is not specified, it will default based on the existence of Ingress or Egress rules; policies that contain an Egress section are assumed to affect Egress, and all policies (whether or not they contain an Ingress section) are assumed to affect Ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ "Egress" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include "Egress" (since such a policy would not include an Egress section and would otherwise default to just [ "Ingress" ]). This field is beta-level in 1.8
newtype NetworkPolicySpec = NetworkPolicySpec
  { egress :: (Maybe (Array NetworkPolicyEgressRule))
  , ingress :: (Maybe (Array NetworkPolicyIngressRule))
  , podSelector :: (Maybe MetaV1.LabelSelector)
  , policyTypes :: (Maybe (Array String)) }

derive instance newtypeNetworkPolicySpec :: Newtype NetworkPolicySpec _
derive instance genericNetworkPolicySpec :: Generic NetworkPolicySpec _
instance showNetworkPolicySpec :: Show NetworkPolicySpec where show a = genericShow a
instance decodeNetworkPolicySpec :: Decode NetworkPolicySpec where
  decode a = do
               egress <- decodeMaybe "egress" a
               ingress <- decodeMaybe "ingress" a
               podSelector <- decodeMaybe "podSelector" a
               policyTypes <- decodeMaybe "policyTypes" a
               pure $ NetworkPolicySpec { egress, ingress, podSelector, policyTypes }
instance encodeNetworkPolicySpec :: Encode NetworkPolicySpec where
  encode (NetworkPolicySpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "egress" (encodeMaybe a.egress)
               , Tuple "ingress" (encodeMaybe a.ingress)
               , Tuple "podSelector" (encodeMaybe a.podSelector)
               , Tuple "policyTypes" (encodeMaybe a.policyTypes) ]


instance defaultNetworkPolicySpec :: Default NetworkPolicySpec where
  default = NetworkPolicySpec
    { egress: Nothing
    , ingress: Nothing
    , podSelector: Nothing
    , policyTypes: Nothing }

-- | Pod Security Policy governs the ability to make requests that affect the Security Context that will be applied to a pod and container.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: spec defines the policy enforced.
newtype PodSecurityPolicy = PodSecurityPolicy
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe PodSecurityPolicySpec) }

derive instance newtypePodSecurityPolicy :: Newtype PodSecurityPolicy _
derive instance genericPodSecurityPolicy :: Generic PodSecurityPolicy _
instance showPodSecurityPolicy :: Show PodSecurityPolicy where show a = genericShow a
instance decodePodSecurityPolicy :: Decode PodSecurityPolicy where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               assertPropEq "kind" "PodSecurityPolicy" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               pure $ PodSecurityPolicy { metadata, spec }
instance encodePodSecurityPolicy :: Encode PodSecurityPolicy where
  encode (PodSecurityPolicy a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "kind" (encode "PodSecurityPolicy")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec) ]


instance defaultPodSecurityPolicy :: Default PodSecurityPolicy where
  default = PodSecurityPolicy
    { metadata: Nothing
    , spec: Nothing }

-- | Pod Security Policy List is a list of PodSecurityPolicy objects.
-- |
-- | Fields:
-- | - `items`: Items is a list of schema objects.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype PodSecurityPolicyList = PodSecurityPolicyList
  { items :: (Maybe (Array PodSecurityPolicy))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypePodSecurityPolicyList :: Newtype PodSecurityPolicyList _
derive instance genericPodSecurityPolicyList :: Generic PodSecurityPolicyList _
instance showPodSecurityPolicyList :: Show PodSecurityPolicyList where show a = genericShow a
instance decodePodSecurityPolicyList :: Decode PodSecurityPolicyList where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "PodSecurityPolicyList" a
               metadata <- decodeMaybe "metadata" a
               pure $ PodSecurityPolicyList { items, metadata }
instance encodePodSecurityPolicyList :: Encode PodSecurityPolicyList where
  encode (PodSecurityPolicyList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "PodSecurityPolicyList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultPodSecurityPolicyList :: Default PodSecurityPolicyList where
  default = PodSecurityPolicyList
    { items: Nothing
    , metadata: Nothing }

-- | Pod Security Policy Spec defines the policy enforced.
-- |
-- | Fields:
-- | - `allowPrivilegeEscalation`: AllowPrivilegeEscalation determines if a pod can request to allow privilege escalation. If unspecified, defaults to true.
-- | - `allowedCapabilities`: AllowedCapabilities is a list of capabilities that can be requested to add to the container. Capabilities in this field may be added at the pod author's discretion. You must not list a capability in both AllowedCapabilities and RequiredDropCapabilities.
-- | - `allowedFlexVolumes`: AllowedFlexVolumes is a whitelist of allowed Flexvolumes.  Empty or nil indicates that all Flexvolumes may be used.  This parameter is effective only when the usage of the Flexvolumes is allowed in the "Volumes" field.
-- | - `allowedHostPaths`: is a white list of allowed host paths. Empty indicates that all host paths may be used.
-- | - `defaultAddCapabilities`: DefaultAddCapabilities is the default set of capabilities that will be added to the container unless the pod spec specifically drops the capability.  You may not list a capability in both DefaultAddCapabilities and RequiredDropCapabilities. Capabilities added here are implicitly allowed, and need not be included in the AllowedCapabilities list.
-- | - `defaultAllowPrivilegeEscalation`: DefaultAllowPrivilegeEscalation controls the default setting for whether a process can gain more privileges than its parent process.
-- | - `fsGroup`: FSGroup is the strategy that will dictate what fs group is used by the SecurityContext.
-- | - `hostIPC`: hostIPC determines if the policy allows the use of HostIPC in the pod spec.
-- | - `hostNetwork`: hostNetwork determines if the policy allows the use of HostNetwork in the pod spec.
-- | - `hostPID`: hostPID determines if the policy allows the use of HostPID in the pod spec.
-- | - `hostPorts`: hostPorts determines which host port ranges are allowed to be exposed.
-- | - `privileged`: privileged determines if a pod can request to be run as privileged.
-- | - `readOnlyRootFilesystem`: ReadOnlyRootFilesystem when set to true will force containers to run with a read only root file system.  If the container specifically requests to run with a non-read only root file system the PSP should deny the pod. If set to false the container may run with a read only root file system if it wishes but it will not be forced to.
-- | - `requiredDropCapabilities`: RequiredDropCapabilities are the capabilities that will be dropped from the container.  These are required to be dropped and cannot be added.
-- | - `runAsUser`: runAsUser is the strategy that will dictate the allowable RunAsUser values that may be set.
-- | - `seLinux`: seLinux is the strategy that will dictate the allowable labels that may be set.
-- | - `supplementalGroups`: SupplementalGroups is the strategy that will dictate what supplemental groups are used by the SecurityContext.
-- | - `volumes`: volumes is a white list of allowed volume plugins.  Empty indicates that all plugins may be used.
newtype PodSecurityPolicySpec = PodSecurityPolicySpec
  { allowPrivilegeEscalation :: (Maybe Boolean)
  , allowedCapabilities :: (Maybe (Array String))
  , allowedFlexVolumes :: (Maybe (Array AllowedFlexVolume))
  , allowedHostPaths :: (Maybe (Array AllowedHostPath))
  , defaultAddCapabilities :: (Maybe (Array String))
  , defaultAllowPrivilegeEscalation :: (Maybe Boolean)
  , fsGroup :: (Maybe FSGroupStrategyOptions)
  , hostIPC :: (Maybe Boolean)
  , hostNetwork :: (Maybe Boolean)
  , hostPID :: (Maybe Boolean)
  , hostPorts :: (Maybe (Array HostPortRange))
  , privileged :: (Maybe Boolean)
  , readOnlyRootFilesystem :: (Maybe Boolean)
  , requiredDropCapabilities :: (Maybe (Array String))
  , runAsUser :: (Maybe RunAsUserStrategyOptions)
  , seLinux :: (Maybe SELinuxStrategyOptions)
  , supplementalGroups :: (Maybe SupplementalGroupsStrategyOptions)
  , volumes :: (Maybe (Array String)) }

derive instance newtypePodSecurityPolicySpec :: Newtype PodSecurityPolicySpec _
derive instance genericPodSecurityPolicySpec :: Generic PodSecurityPolicySpec _
instance showPodSecurityPolicySpec :: Show PodSecurityPolicySpec where show a = genericShow a
instance decodePodSecurityPolicySpec :: Decode PodSecurityPolicySpec where
  decode a = do
               allowPrivilegeEscalation <- decodeMaybe "allowPrivilegeEscalation" a
               allowedCapabilities <- decodeMaybe "allowedCapabilities" a
               allowedFlexVolumes <- decodeMaybe "allowedFlexVolumes" a
               allowedHostPaths <- decodeMaybe "allowedHostPaths" a
               defaultAddCapabilities <- decodeMaybe "defaultAddCapabilities" a
               defaultAllowPrivilegeEscalation <- decodeMaybe "defaultAllowPrivilegeEscalation" a
               fsGroup <- decodeMaybe "fsGroup" a
               hostIPC <- decodeMaybe "hostIPC" a
               hostNetwork <- decodeMaybe "hostNetwork" a
               hostPID <- decodeMaybe "hostPID" a
               hostPorts <- decodeMaybe "hostPorts" a
               privileged <- decodeMaybe "privileged" a
               readOnlyRootFilesystem <- decodeMaybe "readOnlyRootFilesystem" a
               requiredDropCapabilities <- decodeMaybe "requiredDropCapabilities" a
               runAsUser <- decodeMaybe "runAsUser" a
               seLinux <- decodeMaybe "seLinux" a
               supplementalGroups <- decodeMaybe "supplementalGroups" a
               volumes <- decodeMaybe "volumes" a
               pure $ PodSecurityPolicySpec { allowPrivilegeEscalation, allowedCapabilities, allowedFlexVolumes, allowedHostPaths, defaultAddCapabilities, defaultAllowPrivilegeEscalation, fsGroup, hostIPC, hostNetwork, hostPID, hostPorts, privileged, readOnlyRootFilesystem, requiredDropCapabilities, runAsUser, seLinux, supplementalGroups, volumes }
instance encodePodSecurityPolicySpec :: Encode PodSecurityPolicySpec where
  encode (PodSecurityPolicySpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "allowPrivilegeEscalation" (encodeMaybe a.allowPrivilegeEscalation)
               , Tuple "allowedCapabilities" (encodeMaybe a.allowedCapabilities)
               , Tuple "allowedFlexVolumes" (encodeMaybe a.allowedFlexVolumes)
               , Tuple "allowedHostPaths" (encodeMaybe a.allowedHostPaths)
               , Tuple "defaultAddCapabilities" (encodeMaybe a.defaultAddCapabilities)
               , Tuple "defaultAllowPrivilegeEscalation" (encodeMaybe a.defaultAllowPrivilegeEscalation)
               , Tuple "fsGroup" (encodeMaybe a.fsGroup)
               , Tuple "hostIPC" (encodeMaybe a.hostIPC)
               , Tuple "hostNetwork" (encodeMaybe a.hostNetwork)
               , Tuple "hostPID" (encodeMaybe a.hostPID)
               , Tuple "hostPorts" (encodeMaybe a.hostPorts)
               , Tuple "privileged" (encodeMaybe a.privileged)
               , Tuple "readOnlyRootFilesystem" (encodeMaybe a.readOnlyRootFilesystem)
               , Tuple "requiredDropCapabilities" (encodeMaybe a.requiredDropCapabilities)
               , Tuple "runAsUser" (encodeMaybe a.runAsUser)
               , Tuple "seLinux" (encodeMaybe a.seLinux)
               , Tuple "supplementalGroups" (encodeMaybe a.supplementalGroups)
               , Tuple "volumes" (encodeMaybe a.volumes) ]


instance defaultPodSecurityPolicySpec :: Default PodSecurityPolicySpec where
  default = PodSecurityPolicySpec
    { allowPrivilegeEscalation: Nothing
    , allowedCapabilities: Nothing
    , allowedFlexVolumes: Nothing
    , allowedHostPaths: Nothing
    , defaultAddCapabilities: Nothing
    , defaultAllowPrivilegeEscalation: Nothing
    , fsGroup: Nothing
    , hostIPC: Nothing
    , hostNetwork: Nothing
    , hostPID: Nothing
    , hostPorts: Nothing
    , privileged: Nothing
    , readOnlyRootFilesystem: Nothing
    , requiredDropCapabilities: Nothing
    , runAsUser: Nothing
    , seLinux: Nothing
    , supplementalGroups: Nothing
    , volumes: Nothing }

-- | DEPRECATED - This group version of ReplicaSet is deprecated by apps/v1beta2/ReplicaSet. See the release notes for more information. ReplicaSet ensures that a specified number of pod replicas are running at any given time.
-- |
-- | Fields:
-- | - `metadata`: If the Labels of a ReplicaSet are empty, they are defaulted to be the same as the Pod(s) that the ReplicaSet manages. Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Spec defines the specification of the desired behavior of the ReplicaSet. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Status is the most recently observed status of the ReplicaSet. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype ReplicaSet = ReplicaSet
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe ReplicaSetSpec)
  , status :: (Maybe ReplicaSetStatus) }

derive instance newtypeReplicaSet :: Newtype ReplicaSet _
derive instance genericReplicaSet :: Generic ReplicaSet _
instance showReplicaSet :: Show ReplicaSet where show a = genericShow a
instance decodeReplicaSet :: Decode ReplicaSet where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               assertPropEq "kind" "ReplicaSet" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ ReplicaSet { metadata, spec, status }
instance encodeReplicaSet :: Encode ReplicaSet where
  encode (ReplicaSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "kind" (encode "ReplicaSet")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultReplicaSet :: Default ReplicaSet where
  default = ReplicaSet
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | ReplicaSetCondition describes the state of a replica set at a certain point.
-- |
-- | Fields:
-- | - `_type`: Type of replica set condition.
-- | - `lastTransitionTime`: The last time the condition transitioned from one status to another.
-- | - `message`: A human readable message indicating details about the transition.
-- | - `reason`: The reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype ReplicaSetCondition = ReplicaSetCondition
  { _type :: (Maybe String)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeReplicaSetCondition :: Newtype ReplicaSetCondition _
derive instance genericReplicaSetCondition :: Generic ReplicaSetCondition _
instance showReplicaSetCondition :: Show ReplicaSetCondition where show a = genericShow a
instance decodeReplicaSetCondition :: Decode ReplicaSetCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ ReplicaSetCondition { _type, lastTransitionTime, message, reason, status }
instance encodeReplicaSetCondition :: Encode ReplicaSetCondition where
  encode (ReplicaSetCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultReplicaSetCondition :: Default ReplicaSetCondition where
  default = ReplicaSetCondition
    { _type: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | ReplicaSetList is a collection of ReplicaSets.
-- |
-- | Fields:
-- | - `items`: List of ReplicaSets. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
newtype ReplicaSetList = ReplicaSetList
  { items :: (Maybe (Array ReplicaSet))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeReplicaSetList :: Newtype ReplicaSetList _
derive instance genericReplicaSetList :: Generic ReplicaSetList _
instance showReplicaSetList :: Show ReplicaSetList where show a = genericShow a
instance decodeReplicaSetList :: Decode ReplicaSetList where
  decode a = do
               assertPropEq "apiVersion" "extensions/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ReplicaSetList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ReplicaSetList { items, metadata }
instance encodeReplicaSetList :: Encode ReplicaSetList where
  encode (ReplicaSetList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ReplicaSetList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultReplicaSetList :: Default ReplicaSetList where
  default = ReplicaSetList
    { items: Nothing
    , metadata: Nothing }

-- | ReplicaSetSpec is the specification of a ReplicaSet.
-- |
-- | Fields:
-- | - `minReadySeconds`: Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
-- | - `replicas`: Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
-- | - `selector`: Selector is a label query over pods that should match the replica count. If the selector is empty, it is defaulted to the labels present on the pod template. Label keys and values that must match in order to be controlled by this replica set. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: Template is the object that describes the pod that will be created if insufficient replicas are detected. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
newtype ReplicaSetSpec = ReplicaSetSpec
  { minReadySeconds :: (Maybe Int)
  , replicas :: (Maybe Int)
  , selector :: (Maybe MetaV1.LabelSelector)
  , template :: (Maybe CoreV1.PodTemplateSpec) }

derive instance newtypeReplicaSetSpec :: Newtype ReplicaSetSpec _
derive instance genericReplicaSetSpec :: Generic ReplicaSetSpec _
instance showReplicaSetSpec :: Show ReplicaSetSpec where show a = genericShow a
instance decodeReplicaSetSpec :: Decode ReplicaSetSpec where
  decode a = do
               minReadySeconds <- decodeMaybe "minReadySeconds" a
               replicas <- decodeMaybe "replicas" a
               selector <- decodeMaybe "selector" a
               template <- decodeMaybe "template" a
               pure $ ReplicaSetSpec { minReadySeconds, replicas, selector, template }
instance encodeReplicaSetSpec :: Encode ReplicaSetSpec where
  encode (ReplicaSetSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "minReadySeconds" (encodeMaybe a.minReadySeconds)
               , Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "template" (encodeMaybe a.template) ]


instance defaultReplicaSetSpec :: Default ReplicaSetSpec where
  default = ReplicaSetSpec
    { minReadySeconds: Nothing
    , replicas: Nothing
    , selector: Nothing
    , template: Nothing }

-- | ReplicaSetStatus represents the current status of a ReplicaSet.
-- |
-- | Fields:
-- | - `availableReplicas`: The number of available replicas (ready for at least minReadySeconds) for this replica set.
-- | - `conditions`: Represents the latest available observations of a replica set's current state.
-- | - `fullyLabeledReplicas`: The number of pods that have labels matching the labels of the pod template of the replicaset.
-- | - `observedGeneration`: ObservedGeneration reflects the generation of the most recently observed ReplicaSet.
-- | - `readyReplicas`: The number of ready replicas for this replica set.
-- | - `replicas`: Replicas is the most recently oberved number of replicas. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
newtype ReplicaSetStatus = ReplicaSetStatus
  { availableReplicas :: (Maybe Int)
  , conditions :: (Maybe (Array ReplicaSetCondition))
  , fullyLabeledReplicas :: (Maybe Int)
  , observedGeneration :: (Maybe Int)
  , readyReplicas :: (Maybe Int)
  , replicas :: (Maybe Int) }

derive instance newtypeReplicaSetStatus :: Newtype ReplicaSetStatus _
derive instance genericReplicaSetStatus :: Generic ReplicaSetStatus _
instance showReplicaSetStatus :: Show ReplicaSetStatus where show a = genericShow a
instance decodeReplicaSetStatus :: Decode ReplicaSetStatus where
  decode a = do
               availableReplicas <- decodeMaybe "availableReplicas" a
               conditions <- decodeMaybe "conditions" a
               fullyLabeledReplicas <- decodeMaybe "fullyLabeledReplicas" a
               observedGeneration <- decodeMaybe "observedGeneration" a
               readyReplicas <- decodeMaybe "readyReplicas" a
               replicas <- decodeMaybe "replicas" a
               pure $ ReplicaSetStatus { availableReplicas, conditions, fullyLabeledReplicas, observedGeneration, readyReplicas, replicas }
instance encodeReplicaSetStatus :: Encode ReplicaSetStatus where
  encode (ReplicaSetStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "availableReplicas" (encodeMaybe a.availableReplicas)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "fullyLabeledReplicas" (encodeMaybe a.fullyLabeledReplicas)
               , Tuple "observedGeneration" (encodeMaybe a.observedGeneration)
               , Tuple "readyReplicas" (encodeMaybe a.readyReplicas)
               , Tuple "replicas" (encodeMaybe a.replicas) ]


instance defaultReplicaSetStatus :: Default ReplicaSetStatus where
  default = ReplicaSetStatus
    { availableReplicas: Nothing
    , conditions: Nothing
    , fullyLabeledReplicas: Nothing
    , observedGeneration: Nothing
    , readyReplicas: Nothing
    , replicas: Nothing }

-- | DEPRECATED.
-- |
-- | Fields:
-- | - `revision`: The revision to rollback to. If set to 0, rollback to the last revision.
newtype RollbackConfig = RollbackConfig
  { revision :: (Maybe Int) }

derive instance newtypeRollbackConfig :: Newtype RollbackConfig _
derive instance genericRollbackConfig :: Generic RollbackConfig _
instance showRollbackConfig :: Show RollbackConfig where show a = genericShow a
instance decodeRollbackConfig :: Decode RollbackConfig where
  decode a = do
               revision <- decodeMaybe "revision" a
               pure $ RollbackConfig { revision }
instance encodeRollbackConfig :: Encode RollbackConfig where
  encode (RollbackConfig a) = encode $ StrMap.fromFoldable $
               [ Tuple "revision" (encodeMaybe a.revision) ]


instance defaultRollbackConfig :: Default RollbackConfig where
  default = RollbackConfig
    { revision: Nothing }

-- | Spec to control the desired behavior of daemon set rolling update.
-- |
-- | Fields:
-- | - `maxUnavailable`: The maximum number of DaemonSet pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of total number of DaemonSet pods at the start of the update (ex: 10%). Absolute number is calculated from percentage by rounding up. This cannot be 0. Default value is 1. Example: when this is set to 30%, at most 30% of the total number of nodes that should be running the daemon pod (i.e. status.desiredNumberScheduled) can have their pods stopped for an update at any given time. The update starts by stopping at most 30% of those DaemonSet pods and then brings up new DaemonSet pods in their place. Once the new pods are available, it then proceeds onto other DaemonSet pods, thus ensuring that at least 70% of original number of DaemonSet pods are available at all times during the update.
newtype RollingUpdateDaemonSet = RollingUpdateDaemonSet
  { maxUnavailable :: (Maybe Util.IntOrString) }

derive instance newtypeRollingUpdateDaemonSet :: Newtype RollingUpdateDaemonSet _
derive instance genericRollingUpdateDaemonSet :: Generic RollingUpdateDaemonSet _
instance showRollingUpdateDaemonSet :: Show RollingUpdateDaemonSet where show a = genericShow a
instance decodeRollingUpdateDaemonSet :: Decode RollingUpdateDaemonSet where
  decode a = do
               maxUnavailable <- decodeMaybe "maxUnavailable" a
               pure $ RollingUpdateDaemonSet { maxUnavailable }
instance encodeRollingUpdateDaemonSet :: Encode RollingUpdateDaemonSet where
  encode (RollingUpdateDaemonSet a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxUnavailable" (encodeMaybe a.maxUnavailable) ]


instance defaultRollingUpdateDaemonSet :: Default RollingUpdateDaemonSet where
  default = RollingUpdateDaemonSet
    { maxUnavailable: Nothing }

-- | Spec to control the desired behavior of rolling update.
-- |
-- | Fields:
-- | - `maxSurge`: The maximum number of pods that can be scheduled above the desired number of pods. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). This can not be 0 if MaxUnavailable is 0. Absolute number is calculated from percentage by rounding up. By default, a value of 1 is used. Example: when this is set to 30%, the new RC can be scaled up immediately when the rolling update starts, such that the total number of old and new pods do not exceed 130% of desired pods. Once old pods have been killed, new RC can be scaled up further, ensuring that total number of pods running at any time during the update is atmost 130% of desired pods.
-- | - `maxUnavailable`: The maximum number of pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). Absolute number is calculated from percentage by rounding down. This can not be 0 if MaxSurge is 0. By default, a fixed value of 1 is used. Example: when this is set to 30%, the old RC can be scaled down to 70% of desired pods immediately when the rolling update starts. Once new pods are ready, old RC can be scaled down further, followed by scaling up the new RC, ensuring that the total number of pods available at all times during the update is at least 70% of desired pods.
newtype RollingUpdateDeployment = RollingUpdateDeployment
  { maxSurge :: (Maybe Util.IntOrString)
  , maxUnavailable :: (Maybe Util.IntOrString) }

derive instance newtypeRollingUpdateDeployment :: Newtype RollingUpdateDeployment _
derive instance genericRollingUpdateDeployment :: Generic RollingUpdateDeployment _
instance showRollingUpdateDeployment :: Show RollingUpdateDeployment where show a = genericShow a
instance decodeRollingUpdateDeployment :: Decode RollingUpdateDeployment where
  decode a = do
               maxSurge <- decodeMaybe "maxSurge" a
               maxUnavailable <- decodeMaybe "maxUnavailable" a
               pure $ RollingUpdateDeployment { maxSurge, maxUnavailable }
instance encodeRollingUpdateDeployment :: Encode RollingUpdateDeployment where
  encode (RollingUpdateDeployment a) = encode $ StrMap.fromFoldable $
               [ Tuple "maxSurge" (encodeMaybe a.maxSurge)
               , Tuple "maxUnavailable" (encodeMaybe a.maxUnavailable) ]


instance defaultRollingUpdateDeployment :: Default RollingUpdateDeployment where
  default = RollingUpdateDeployment
    { maxSurge: Nothing
    , maxUnavailable: Nothing }

-- | Run A sUser Strategy Options defines the strategy type and any options used to create the strategy.
-- |
-- | Fields:
-- | - `ranges`: Ranges are the allowed ranges of uids that may be used.
-- | - `rule`: Rule is the strategy that will dictate the allowable RunAsUser values that may be set.
newtype RunAsUserStrategyOptions = RunAsUserStrategyOptions
  { ranges :: (Maybe (Array IDRange))
  , rule :: (Maybe String) }

derive instance newtypeRunAsUserStrategyOptions :: Newtype RunAsUserStrategyOptions _
derive instance genericRunAsUserStrategyOptions :: Generic RunAsUserStrategyOptions _
instance showRunAsUserStrategyOptions :: Show RunAsUserStrategyOptions where show a = genericShow a
instance decodeRunAsUserStrategyOptions :: Decode RunAsUserStrategyOptions where
  decode a = do
               ranges <- decodeMaybe "ranges" a
               rule <- decodeMaybe "rule" a
               pure $ RunAsUserStrategyOptions { ranges, rule }
instance encodeRunAsUserStrategyOptions :: Encode RunAsUserStrategyOptions where
  encode (RunAsUserStrategyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "ranges" (encodeMaybe a.ranges)
               , Tuple "rule" (encodeMaybe a.rule) ]


instance defaultRunAsUserStrategyOptions :: Default RunAsUserStrategyOptions where
  default = RunAsUserStrategyOptions
    { ranges: Nothing
    , rule: Nothing }

-- | SELinux  Strategy Options defines the strategy type and any options used to create the strategy.
-- |
-- | Fields:
-- | - `rule`: type is the strategy that will dictate the allowable labels that may be set.
-- | - `seLinuxOptions`: seLinuxOptions required to run as; required for MustRunAs More info: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
newtype SELinuxStrategyOptions = SELinuxStrategyOptions
  { rule :: (Maybe String)
  , seLinuxOptions :: (Maybe CoreV1.SELinuxOptions) }

derive instance newtypeSELinuxStrategyOptions :: Newtype SELinuxStrategyOptions _
derive instance genericSELinuxStrategyOptions :: Generic SELinuxStrategyOptions _
instance showSELinuxStrategyOptions :: Show SELinuxStrategyOptions where show a = genericShow a
instance decodeSELinuxStrategyOptions :: Decode SELinuxStrategyOptions where
  decode a = do
               rule <- decodeMaybe "rule" a
               seLinuxOptions <- decodeMaybe "seLinuxOptions" a
               pure $ SELinuxStrategyOptions { rule, seLinuxOptions }
instance encodeSELinuxStrategyOptions :: Encode SELinuxStrategyOptions where
  encode (SELinuxStrategyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "rule" (encodeMaybe a.rule)
               , Tuple "seLinuxOptions" (encodeMaybe a.seLinuxOptions) ]


instance defaultSELinuxStrategyOptions :: Default SELinuxStrategyOptions where
  default = SELinuxStrategyOptions
    { rule: Nothing
    , seLinuxOptions: Nothing }

-- | represents a scaling request for a resource.
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
               assertPropEq "apiVersion" "extensions/v1beta1" a
               assertPropEq "kind" "Scale" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Scale { metadata, spec, status }
instance encodeScale :: Encode Scale where
  encode (Scale a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "extensions/v1beta1")
               , Tuple "kind" (encode "Scale")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultScale :: Default Scale where
  default = Scale
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | describes the attributes of a scale subresource
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

-- | represents the current status of a scale subresource.
-- |
-- | Fields:
-- | - `replicas`: actual number of observed instances of the scaled object.
-- | - `selector`: label query over pods that should match the replicas count. More info: http://kubernetes.io/docs/user-guide/labels#label-selectors
-- | - `targetSelector`: label selector for pods that should match the replicas count. This is a serializated version of both map-based and more expressive set-based selectors. This is done to avoid introspection in the clients. The string will be in the same format as the query-param syntax. If the target type only supports map-based selectors, both this field and map-based selector field are populated. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
newtype ScaleStatus = ScaleStatus
  { replicas :: (Maybe Int)
  , selector :: (Maybe (StrMap String))
  , targetSelector :: (Maybe String) }

derive instance newtypeScaleStatus :: Newtype ScaleStatus _
derive instance genericScaleStatus :: Generic ScaleStatus _
instance showScaleStatus :: Show ScaleStatus where show a = genericShow a
instance decodeScaleStatus :: Decode ScaleStatus where
  decode a = do
               replicas <- decodeMaybe "replicas" a
               selector <- decodeMaybe "selector" a
               targetSelector <- decodeMaybe "targetSelector" a
               pure $ ScaleStatus { replicas, selector, targetSelector }
instance encodeScaleStatus :: Encode ScaleStatus where
  encode (ScaleStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "replicas" (encodeMaybe a.replicas)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "targetSelector" (encodeMaybe a.targetSelector) ]


instance defaultScaleStatus :: Default ScaleStatus where
  default = ScaleStatus
    { replicas: Nothing
    , selector: Nothing
    , targetSelector: Nothing }

-- | SupplementalGroupsStrategyOptions defines the strategy type and options used to create the strategy.
-- |
-- | Fields:
-- | - `ranges`: Ranges are the allowed ranges of supplemental groups.  If you would like to force a single supplemental group then supply a single range with the same start and end.
-- | - `rule`: Rule is the strategy that will dictate what supplemental groups is used in the SecurityContext.
newtype SupplementalGroupsStrategyOptions = SupplementalGroupsStrategyOptions
  { ranges :: (Maybe (Array IDRange))
  , rule :: (Maybe String) }

derive instance newtypeSupplementalGroupsStrategyOptions :: Newtype SupplementalGroupsStrategyOptions _
derive instance genericSupplementalGroupsStrategyOptions :: Generic SupplementalGroupsStrategyOptions _
instance showSupplementalGroupsStrategyOptions :: Show SupplementalGroupsStrategyOptions where show a = genericShow a
instance decodeSupplementalGroupsStrategyOptions :: Decode SupplementalGroupsStrategyOptions where
  decode a = do
               ranges <- decodeMaybe "ranges" a
               rule <- decodeMaybe "rule" a
               pure $ SupplementalGroupsStrategyOptions { ranges, rule }
instance encodeSupplementalGroupsStrategyOptions :: Encode SupplementalGroupsStrategyOptions where
  encode (SupplementalGroupsStrategyOptions a) = encode $ StrMap.fromFoldable $
               [ Tuple "ranges" (encodeMaybe a.ranges)
               , Tuple "rule" (encodeMaybe a.rule) ]


instance defaultSupplementalGroupsStrategyOptions :: Default SupplementalGroupsStrategyOptions where
  default = SupplementalGroupsStrategyOptions
    { ranges: Nothing
    , rule: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/"