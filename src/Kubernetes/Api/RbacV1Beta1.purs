module Kubernetes.Api.RbacV1Beta1 where

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
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | AggregationRule describes how to locate ClusterRoles to aggregate into the ClusterRole
-- |
-- | Fields:
-- | - `clusterRoleSelectors`: ClusterRoleSelectors holds a list of selectors which will be used to find ClusterRoles and create the rules. If any of the selectors match, then the ClusterRole's permissions will be added
newtype AggregationRule = AggregationRule
  { clusterRoleSelectors :: (Maybe (Array MetaV1.LabelSelector)) }

derive instance newtypeAggregationRule :: Newtype AggregationRule _
derive instance genericAggregationRule :: Generic AggregationRule _
instance showAggregationRule :: Show AggregationRule where show a = genericShow a
instance decodeAggregationRule :: Decode AggregationRule where
  decode a = do
               clusterRoleSelectors <- decodeMaybe "clusterRoleSelectors" a
               pure $ AggregationRule { clusterRoleSelectors }
instance encodeAggregationRule :: Encode AggregationRule where
  encode (AggregationRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "clusterRoleSelectors" (encodeMaybe a.clusterRoleSelectors) ]


instance defaultAggregationRule :: Default AggregationRule where
  default = AggregationRule
    { clusterRoleSelectors: Nothing }

-- | ClusterRole is a cluster level, logical grouping of PolicyRules that can be referenced as a unit by a RoleBinding or ClusterRoleBinding.
-- |
-- | Fields:
-- | - `aggregationRule`: AggregationRule is an optional field that describes how to build the Rules for this ClusterRole. If AggregationRule is set, then the Rules are controller managed and direct changes to Rules will be stomped by the controller.
-- | - `metadata`: Standard object's metadata.
-- | - `rules`: Rules holds all the PolicyRules for this ClusterRole
newtype ClusterRole = ClusterRole
  { aggregationRule :: (Maybe AggregationRule)
  , metadata :: (Maybe MetaV1.ObjectMeta)
  , rules :: (Maybe (Array PolicyRule)) }

derive instance newtypeClusterRole :: Newtype ClusterRole _
derive instance genericClusterRole :: Generic ClusterRole _
instance showClusterRole :: Show ClusterRole where show a = genericShow a
instance decodeClusterRole :: Decode ClusterRole where
  decode a = do
               aggregationRule <- decodeMaybe "aggregationRule" a
               assertPropEq "apiVersion" "rbac.authorization.k8s.io/v1beta1" a
               assertPropEq "kind" "ClusterRole" a
               metadata <- decodeMaybe "metadata" a
               rules <- decodeMaybe "rules" a
               pure $ ClusterRole { aggregationRule, metadata, rules }
instance encodeClusterRole :: Encode ClusterRole where
  encode (ClusterRole a) = encode $ StrMap.fromFoldable $
               [ Tuple "aggregationRule" (encodeMaybe a.aggregationRule)
               , Tuple "apiVersion" (encode "rbac.authorization.k8s.io/v1beta1")
               , Tuple "kind" (encode "ClusterRole")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "rules" (encodeMaybe a.rules) ]


instance defaultClusterRole :: Default ClusterRole where
  default = ClusterRole
    { aggregationRule: Nothing
    , metadata: Nothing
    , rules: Nothing }

-- | ClusterRoleBinding references a ClusterRole, but not contain it.  It can reference a ClusterRole in the global namespace, and adds who information via Subject.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata.
-- | - `roleRef`: RoleRef can only reference a ClusterRole in the global namespace. If the RoleRef cannot be resolved, the Authorizer must return an error.
-- | - `subjects`: Subjects holds references to the objects the role applies to.
newtype ClusterRoleBinding = ClusterRoleBinding
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , roleRef :: (Maybe RoleRef)
  , subjects :: (Maybe (Array Subject)) }

derive instance newtypeClusterRoleBinding :: Newtype ClusterRoleBinding _
derive instance genericClusterRoleBinding :: Generic ClusterRoleBinding _
instance showClusterRoleBinding :: Show ClusterRoleBinding where show a = genericShow a
instance decodeClusterRoleBinding :: Decode ClusterRoleBinding where
  decode a = do
               assertPropEq "apiVersion" "rbac.authorization.k8s.io/v1beta1" a
               assertPropEq "kind" "ClusterRoleBinding" a
               metadata <- decodeMaybe "metadata" a
               roleRef <- decodeMaybe "roleRef" a
               subjects <- decodeMaybe "subjects" a
               pure $ ClusterRoleBinding { metadata, roleRef, subjects }
instance encodeClusterRoleBinding :: Encode ClusterRoleBinding where
  encode (ClusterRoleBinding a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "rbac.authorization.k8s.io/v1beta1")
               , Tuple "kind" (encode "ClusterRoleBinding")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "roleRef" (encodeMaybe a.roleRef)
               , Tuple "subjects" (encodeMaybe a.subjects) ]


instance defaultClusterRoleBinding :: Default ClusterRoleBinding where
  default = ClusterRoleBinding
    { metadata: Nothing
    , roleRef: Nothing
    , subjects: Nothing }

-- | ClusterRoleBindingList is a collection of ClusterRoleBindings
-- |
-- | Fields:
-- | - `items`: Items is a list of ClusterRoleBindings
-- | - `metadata`: Standard object's metadata.
newtype ClusterRoleBindingList = ClusterRoleBindingList
  { items :: (Maybe (Array ClusterRoleBinding))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeClusterRoleBindingList :: Newtype ClusterRoleBindingList _
derive instance genericClusterRoleBindingList :: Generic ClusterRoleBindingList _
instance showClusterRoleBindingList :: Show ClusterRoleBindingList where show a = genericShow a
instance decodeClusterRoleBindingList :: Decode ClusterRoleBindingList where
  decode a = do
               assertPropEq "apiVersion" "rbac.authorization.k8s.io/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ClusterRoleBindingList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ClusterRoleBindingList { items, metadata }
instance encodeClusterRoleBindingList :: Encode ClusterRoleBindingList where
  encode (ClusterRoleBindingList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "rbac.authorization.k8s.io/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ClusterRoleBindingList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultClusterRoleBindingList :: Default ClusterRoleBindingList where
  default = ClusterRoleBindingList
    { items: Nothing
    , metadata: Nothing }

-- | ClusterRoleList is a collection of ClusterRoles
-- |
-- | Fields:
-- | - `items`: Items is a list of ClusterRoles
-- | - `metadata`: Standard object's metadata.
newtype ClusterRoleList = ClusterRoleList
  { items :: (Maybe (Array ClusterRole))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeClusterRoleList :: Newtype ClusterRoleList _
derive instance genericClusterRoleList :: Generic ClusterRoleList _
instance showClusterRoleList :: Show ClusterRoleList where show a = genericShow a
instance decodeClusterRoleList :: Decode ClusterRoleList where
  decode a = do
               assertPropEq "apiVersion" "rbac.authorization.k8s.io/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "ClusterRoleList" a
               metadata <- decodeMaybe "metadata" a
               pure $ ClusterRoleList { items, metadata }
instance encodeClusterRoleList :: Encode ClusterRoleList where
  encode (ClusterRoleList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "rbac.authorization.k8s.io/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "ClusterRoleList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultClusterRoleList :: Default ClusterRoleList where
  default = ClusterRoleList
    { items: Nothing
    , metadata: Nothing }

-- | PolicyRule holds information that describes a policy rule, but does not contain information about who the rule applies to or which namespace the rule applies to.
-- |
-- | Fields:
-- | - `apiGroups`: APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.
-- | - `nonResourceURLs`: NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding. Rules can either apply to API resources (such as "pods" or "secrets") or non-resource URL paths (such as "/api"),  but not both.
-- | - `resourceNames`: ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.
-- | - `resources`: Resources is a list of resources this rule applies to.  '*' represents all resources in the specified apiGroups. '*/foo' represents the subresource 'foo' for all resources in the specified apiGroups.
-- | - `verbs`: Verbs is a list of Verbs that apply to ALL the ResourceKinds and AttributeRestrictions contained in this rule.  VerbAll represents all kinds.
newtype PolicyRule = PolicyRule
  { apiGroups :: (Maybe (Array String))
  , nonResourceURLs :: (Maybe (Array String))
  , resourceNames :: (Maybe (Array String))
  , resources :: (Maybe (Array String))
  , verbs :: (Maybe (Array String)) }

derive instance newtypePolicyRule :: Newtype PolicyRule _
derive instance genericPolicyRule :: Generic PolicyRule _
instance showPolicyRule :: Show PolicyRule where show a = genericShow a
instance decodePolicyRule :: Decode PolicyRule where
  decode a = do
               apiGroups <- decodeMaybe "apiGroups" a
               nonResourceURLs <- decodeMaybe "nonResourceURLs" a
               resourceNames <- decodeMaybe "resourceNames" a
               resources <- decodeMaybe "resources" a
               verbs <- decodeMaybe "verbs" a
               pure $ PolicyRule { apiGroups, nonResourceURLs, resourceNames, resources, verbs }
instance encodePolicyRule :: Encode PolicyRule where
  encode (PolicyRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroups" (encodeMaybe a.apiGroups)
               , Tuple "nonResourceURLs" (encodeMaybe a.nonResourceURLs)
               , Tuple "resourceNames" (encodeMaybe a.resourceNames)
               , Tuple "resources" (encodeMaybe a.resources)
               , Tuple "verbs" (encodeMaybe a.verbs) ]


instance defaultPolicyRule :: Default PolicyRule where
  default = PolicyRule
    { apiGroups: Nothing
    , nonResourceURLs: Nothing
    , resourceNames: Nothing
    , resources: Nothing
    , verbs: Nothing }

-- | Role is a namespaced, logical grouping of PolicyRules that can be referenced as a unit by a RoleBinding.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata.
-- | - `rules`: Rules holds all the PolicyRules for this Role
newtype Role = Role
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , rules :: (Maybe (Array PolicyRule)) }

derive instance newtypeRole :: Newtype Role _
derive instance genericRole :: Generic Role _
instance showRole :: Show Role where show a = genericShow a
instance decodeRole :: Decode Role where
  decode a = do
               assertPropEq "apiVersion" "rbac.authorization.k8s.io/v1beta1" a
               assertPropEq "kind" "Role" a
               metadata <- decodeMaybe "metadata" a
               rules <- decodeMaybe "rules" a
               pure $ Role { metadata, rules }
instance encodeRole :: Encode Role where
  encode (Role a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "rbac.authorization.k8s.io/v1beta1")
               , Tuple "kind" (encode "Role")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "rules" (encodeMaybe a.rules) ]


instance defaultRole :: Default Role where
  default = Role
    { metadata: Nothing
    , rules: Nothing }

-- | RoleBinding references a role, but does not contain it.  It can reference a Role in the same namespace or a ClusterRole in the global namespace. It adds who information via Subjects and namespace information by which namespace it exists in.  RoleBindings in a given namespace only have effect in that namespace.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata.
-- | - `roleRef`: RoleRef can reference a Role in the current namespace or a ClusterRole in the global namespace. If the RoleRef cannot be resolved, the Authorizer must return an error.
-- | - `subjects`: Subjects holds references to the objects the role applies to.
newtype RoleBinding = RoleBinding
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , roleRef :: (Maybe RoleRef)
  , subjects :: (Maybe (Array Subject)) }

derive instance newtypeRoleBinding :: Newtype RoleBinding _
derive instance genericRoleBinding :: Generic RoleBinding _
instance showRoleBinding :: Show RoleBinding where show a = genericShow a
instance decodeRoleBinding :: Decode RoleBinding where
  decode a = do
               assertPropEq "apiVersion" "rbac.authorization.k8s.io/v1beta1" a
               assertPropEq "kind" "RoleBinding" a
               metadata <- decodeMaybe "metadata" a
               roleRef <- decodeMaybe "roleRef" a
               subjects <- decodeMaybe "subjects" a
               pure $ RoleBinding { metadata, roleRef, subjects }
instance encodeRoleBinding :: Encode RoleBinding where
  encode (RoleBinding a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "rbac.authorization.k8s.io/v1beta1")
               , Tuple "kind" (encode "RoleBinding")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "roleRef" (encodeMaybe a.roleRef)
               , Tuple "subjects" (encodeMaybe a.subjects) ]


instance defaultRoleBinding :: Default RoleBinding where
  default = RoleBinding
    { metadata: Nothing
    , roleRef: Nothing
    , subjects: Nothing }

-- | RoleBindingList is a collection of RoleBindings
-- |
-- | Fields:
-- | - `items`: Items is a list of RoleBindings
-- | - `metadata`: Standard object's metadata.
newtype RoleBindingList = RoleBindingList
  { items :: (Maybe (Array RoleBinding))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeRoleBindingList :: Newtype RoleBindingList _
derive instance genericRoleBindingList :: Generic RoleBindingList _
instance showRoleBindingList :: Show RoleBindingList where show a = genericShow a
instance decodeRoleBindingList :: Decode RoleBindingList where
  decode a = do
               assertPropEq "apiVersion" "rbac.authorization.k8s.io/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "RoleBindingList" a
               metadata <- decodeMaybe "metadata" a
               pure $ RoleBindingList { items, metadata }
instance encodeRoleBindingList :: Encode RoleBindingList where
  encode (RoleBindingList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "rbac.authorization.k8s.io/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "RoleBindingList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultRoleBindingList :: Default RoleBindingList where
  default = RoleBindingList
    { items: Nothing
    , metadata: Nothing }

-- | RoleList is a collection of Roles
-- |
-- | Fields:
-- | - `items`: Items is a list of Roles
-- | - `metadata`: Standard object's metadata.
newtype RoleList = RoleList
  { items :: (Maybe (Array Role))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeRoleList :: Newtype RoleList _
derive instance genericRoleList :: Generic RoleList _
instance showRoleList :: Show RoleList where show a = genericShow a
instance decodeRoleList :: Decode RoleList where
  decode a = do
               assertPropEq "apiVersion" "rbac.authorization.k8s.io/v1beta1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "RoleList" a
               metadata <- decodeMaybe "metadata" a
               pure $ RoleList { items, metadata }
instance encodeRoleList :: Encode RoleList where
  encode (RoleList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "rbac.authorization.k8s.io/v1beta1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "RoleList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultRoleList :: Default RoleList where
  default = RoleList
    { items: Nothing
    , metadata: Nothing }

-- | RoleRef contains information that points to the role being used
-- |
-- | Fields:
-- | - `apiGroup`: APIGroup is the group for the resource being referenced
-- | - `kind`: Kind is the type of resource being referenced
-- | - `name`: Name is the name of resource being referenced
newtype RoleRef = RoleRef
  { apiGroup :: (Maybe String)
  , kind :: (Maybe String)
  , name :: (Maybe String) }

derive instance newtypeRoleRef :: Newtype RoleRef _
derive instance genericRoleRef :: Generic RoleRef _
instance showRoleRef :: Show RoleRef where show a = genericShow a
instance decodeRoleRef :: Decode RoleRef where
  decode a = do
               apiGroup <- decodeMaybe "apiGroup" a
               kind <- decodeMaybe "kind" a
               name <- decodeMaybe "name" a
               pure $ RoleRef { apiGroup, kind, name }
instance encodeRoleRef :: Encode RoleRef where
  encode (RoleRef a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroup" (encodeMaybe a.apiGroup)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "name" (encodeMaybe a.name) ]


instance defaultRoleRef :: Default RoleRef where
  default = RoleRef
    { apiGroup: Nothing
    , kind: Nothing
    , name: Nothing }

-- | Subject contains a reference to the object or user identities a role binding applies to.  This can either hold a direct API object reference, or a value for non-objects such as user and group names.
-- |
-- | Fields:
-- | - `apiGroup`: APIGroup holds the API group of the referenced subject. Defaults to "" for ServiceAccount subjects. Defaults to "rbac.authorization.k8s.io" for User and Group subjects.
-- | - `kind`: Kind of object being referenced. Values defined by this API group are "User", "Group", and "ServiceAccount". If the Authorizer does not recognized the kind value, the Authorizer should report an error.
-- | - `name`: Name of the object being referenced.
-- | - `namespace`: Namespace of the referenced object.  If the object kind is non-namespace, such as "User" or "Group", and this value is not empty the Authorizer should report an error.
newtype Subject = Subject
  { apiGroup :: (Maybe String)
  , kind :: (Maybe String)
  , name :: (Maybe String)
  , namespace :: (Maybe String) }

derive instance newtypeSubject :: Newtype Subject _
derive instance genericSubject :: Generic Subject _
instance showSubject :: Show Subject where show a = genericShow a
instance decodeSubject :: Decode Subject where
  decode a = do
               apiGroup <- decodeMaybe "apiGroup" a
               kind <- decodeMaybe "kind" a
               name <- decodeMaybe "name" a
               namespace <- decodeMaybe "namespace" a
               pure $ Subject { apiGroup, kind, name, namespace }
instance encodeSubject :: Encode Subject where
  encode (Subject a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroup" (encodeMaybe a.apiGroup)
               , Tuple "kind" (encodeMaybe a.kind)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "namespace" (encodeMaybe a.namespace) ]


instance defaultSubject :: Default Subject where
  default = Subject
    { apiGroup: Nothing
    , kind: Nothing
    , name: Nothing
    , namespace: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1beta1/"