module Kubernetes.Api.RbacV1Alpha1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
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
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | AggregationRule describes how to locate ClusterRoles to aggregate into the ClusterRole
-- |
-- | Fields:
-- | - `clusterRoleSelectors`: ClusterRoleSelectors holds a list of selectors which will be used to find ClusterRoles and create the rules. If any of the selectors match, then the ClusterRole's permissions will be added
newtype AggregationRule = AggregationRule
  { clusterRoleSelectors :: (NullOrUndefined (Array MetaV1.LabelSelector)) }

derive instance newtypeAggregationRule :: Newtype AggregationRule _
derive instance genericAggregationRule :: Generic AggregationRule _
instance showAggregationRule :: Show AggregationRule where show a = genericShow a
instance decodeAggregationRule :: Decode AggregationRule where
  decode a = do
               clusterRoleSelectors <- readProp "clusterRoleSelectors" a >>= decode
               pure $ AggregationRule { clusterRoleSelectors }
instance encodeAggregationRule :: Encode AggregationRule where
  encode (AggregationRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "clusterRoleSelectors" (encode a.clusterRoleSelectors) ]


instance defaultAggregationRule :: Default AggregationRule where
  default = AggregationRule
    { clusterRoleSelectors: NullOrUndefined Nothing }

-- | ClusterRole is a cluster level, logical grouping of PolicyRules that can be referenced as a unit by a RoleBinding or ClusterRoleBinding.
-- |
-- | Fields:
-- | - `aggregationRule`: AggregationRule is an optional field that describes how to build the Rules for this ClusterRole. If AggregationRule is set, then the Rules are controller managed and direct changes to Rules will be stomped by the controller.
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata.
-- | - `rules`: Rules holds all the PolicyRules for this ClusterRole
newtype ClusterRole = ClusterRole
  { aggregationRule :: (NullOrUndefined AggregationRule)
  , apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , rules :: (NullOrUndefined (Array PolicyRule)) }

derive instance newtypeClusterRole :: Newtype ClusterRole _
derive instance genericClusterRole :: Generic ClusterRole _
instance showClusterRole :: Show ClusterRole where show a = genericShow a
instance decodeClusterRole :: Decode ClusterRole where
  decode a = do
               aggregationRule <- readProp "aggregationRule" a >>= decode
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               rules <- readProp "rules" a >>= decode
               pure $ ClusterRole { aggregationRule, apiVersion, kind, metadata, rules }
instance encodeClusterRole :: Encode ClusterRole where
  encode (ClusterRole a) = encode $ StrMap.fromFoldable $
               [ Tuple "aggregationRule" (encode a.aggregationRule)
               , Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "rules" (encode a.rules) ]


instance defaultClusterRole :: Default ClusterRole where
  default = ClusterRole
    { aggregationRule: NullOrUndefined Nothing
    , apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , rules: NullOrUndefined Nothing }

-- | ClusterRoleBinding references a ClusterRole, but not contain it.  It can reference a ClusterRole in the global namespace, and adds who information via Subject.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata.
-- | - `roleRef`: RoleRef can only reference a ClusterRole in the global namespace. If the RoleRef cannot be resolved, the Authorizer must return an error.
-- | - `subjects`: Subjects holds references to the objects the role applies to.
newtype ClusterRoleBinding = ClusterRoleBinding
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , roleRef :: (NullOrUndefined RoleRef)
  , subjects :: (NullOrUndefined (Array Subject)) }

derive instance newtypeClusterRoleBinding :: Newtype ClusterRoleBinding _
derive instance genericClusterRoleBinding :: Generic ClusterRoleBinding _
instance showClusterRoleBinding :: Show ClusterRoleBinding where show a = genericShow a
instance decodeClusterRoleBinding :: Decode ClusterRoleBinding where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               roleRef <- readProp "roleRef" a >>= decode
               subjects <- readProp "subjects" a >>= decode
               pure $ ClusterRoleBinding { apiVersion, kind, metadata, roleRef, subjects }
instance encodeClusterRoleBinding :: Encode ClusterRoleBinding where
  encode (ClusterRoleBinding a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "roleRef" (encode a.roleRef)
               , Tuple "subjects" (encode a.subjects) ]


instance defaultClusterRoleBinding :: Default ClusterRoleBinding where
  default = ClusterRoleBinding
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , roleRef: NullOrUndefined Nothing
    , subjects: NullOrUndefined Nothing }

-- | ClusterRoleBindingList is a collection of ClusterRoleBindings
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of ClusterRoleBindings
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata.
newtype ClusterRoleBindingList = ClusterRoleBindingList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ClusterRoleBinding))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeClusterRoleBindingList :: Newtype ClusterRoleBindingList _
derive instance genericClusterRoleBindingList :: Generic ClusterRoleBindingList _
instance showClusterRoleBindingList :: Show ClusterRoleBindingList where show a = genericShow a
instance decodeClusterRoleBindingList :: Decode ClusterRoleBindingList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ClusterRoleBindingList { apiVersion, items, kind, metadata }
instance encodeClusterRoleBindingList :: Encode ClusterRoleBindingList where
  encode (ClusterRoleBindingList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultClusterRoleBindingList :: Default ClusterRoleBindingList where
  default = ClusterRoleBindingList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | ClusterRoleList is a collection of ClusterRoles
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of ClusterRoles
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata.
newtype ClusterRoleList = ClusterRoleList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ClusterRole))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeClusterRoleList :: Newtype ClusterRoleList _
derive instance genericClusterRoleList :: Generic ClusterRoleList _
instance showClusterRoleList :: Show ClusterRoleList where show a = genericShow a
instance decodeClusterRoleList :: Decode ClusterRoleList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ ClusterRoleList { apiVersion, items, kind, metadata }
instance encodeClusterRoleList :: Encode ClusterRoleList where
  encode (ClusterRoleList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultClusterRoleList :: Default ClusterRoleList where
  default = ClusterRoleList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | PolicyRule holds information that describes a policy rule, but does not contain information about who the rule applies to or which namespace the rule applies to.
-- |
-- | Fields:
-- | - `apiGroups`: APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.
-- | - `nonResourceURLs`: NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path This name is intentionally different than the internal type so that the DefaultConvert works nicely and because the ordering may be different. Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding. Rules can either apply to API resources (such as "pods" or "secrets") or non-resource URL paths (such as "/api"),  but not both.
-- | - `resourceNames`: ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.
-- | - `resources`: Resources is a list of resources this rule applies to.  ResourceAll represents all resources.
-- | - `verbs`: Verbs is a list of Verbs that apply to ALL the ResourceKinds and AttributeRestrictions contained in this rule.  VerbAll represents all kinds.
newtype PolicyRule = PolicyRule
  { apiGroups :: (NullOrUndefined (Array String))
  , nonResourceURLs :: (NullOrUndefined (Array String))
  , resourceNames :: (NullOrUndefined (Array String))
  , resources :: (NullOrUndefined (Array String))
  , verbs :: (NullOrUndefined (Array String)) }

derive instance newtypePolicyRule :: Newtype PolicyRule _
derive instance genericPolicyRule :: Generic PolicyRule _
instance showPolicyRule :: Show PolicyRule where show a = genericShow a
instance decodePolicyRule :: Decode PolicyRule where
  decode a = do
               apiGroups <- readProp "apiGroups" a >>= decode
               nonResourceURLs <- readProp "nonResourceURLs" a >>= decode
               resourceNames <- readProp "resourceNames" a >>= decode
               resources <- readProp "resources" a >>= decode
               verbs <- readProp "verbs" a >>= decode
               pure $ PolicyRule { apiGroups, nonResourceURLs, resourceNames, resources, verbs }
instance encodePolicyRule :: Encode PolicyRule where
  encode (PolicyRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroups" (encode a.apiGroups)
               , Tuple "nonResourceURLs" (encode a.nonResourceURLs)
               , Tuple "resourceNames" (encode a.resourceNames)
               , Tuple "resources" (encode a.resources)
               , Tuple "verbs" (encode a.verbs) ]


instance defaultPolicyRule :: Default PolicyRule where
  default = PolicyRule
    { apiGroups: NullOrUndefined Nothing
    , nonResourceURLs: NullOrUndefined Nothing
    , resourceNames: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing
    , verbs: NullOrUndefined Nothing }

-- | Role is a namespaced, logical grouping of PolicyRules that can be referenced as a unit by a RoleBinding.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata.
-- | - `rules`: Rules holds all the PolicyRules for this Role
newtype Role = Role
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , rules :: (NullOrUndefined (Array PolicyRule)) }

derive instance newtypeRole :: Newtype Role _
derive instance genericRole :: Generic Role _
instance showRole :: Show Role where show a = genericShow a
instance decodeRole :: Decode Role where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               rules <- readProp "rules" a >>= decode
               pure $ Role { apiVersion, kind, metadata, rules }
instance encodeRole :: Encode Role where
  encode (Role a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "rules" (encode a.rules) ]


instance defaultRole :: Default Role where
  default = Role
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , rules: NullOrUndefined Nothing }

-- | RoleBinding references a role, but does not contain it.  It can reference a Role in the same namespace or a ClusterRole in the global namespace. It adds who information via Subjects and namespace information by which namespace it exists in.  RoleBindings in a given namespace only have effect in that namespace.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata.
-- | - `roleRef`: RoleRef can reference a Role in the current namespace or a ClusterRole in the global namespace. If the RoleRef cannot be resolved, the Authorizer must return an error.
-- | - `subjects`: Subjects holds references to the objects the role applies to.
newtype RoleBinding = RoleBinding
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , roleRef :: (NullOrUndefined RoleRef)
  , subjects :: (NullOrUndefined (Array Subject)) }

derive instance newtypeRoleBinding :: Newtype RoleBinding _
derive instance genericRoleBinding :: Generic RoleBinding _
instance showRoleBinding :: Show RoleBinding where show a = genericShow a
instance decodeRoleBinding :: Decode RoleBinding where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               roleRef <- readProp "roleRef" a >>= decode
               subjects <- readProp "subjects" a >>= decode
               pure $ RoleBinding { apiVersion, kind, metadata, roleRef, subjects }
instance encodeRoleBinding :: Encode RoleBinding where
  encode (RoleBinding a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "roleRef" (encode a.roleRef)
               , Tuple "subjects" (encode a.subjects) ]


instance defaultRoleBinding :: Default RoleBinding where
  default = RoleBinding
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , roleRef: NullOrUndefined Nothing
    , subjects: NullOrUndefined Nothing }

-- | RoleBindingList is a collection of RoleBindings
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of RoleBindings
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata.
newtype RoleBindingList = RoleBindingList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array RoleBinding))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeRoleBindingList :: Newtype RoleBindingList _
derive instance genericRoleBindingList :: Generic RoleBindingList _
instance showRoleBindingList :: Show RoleBindingList where show a = genericShow a
instance decodeRoleBindingList :: Decode RoleBindingList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ RoleBindingList { apiVersion, items, kind, metadata }
instance encodeRoleBindingList :: Encode RoleBindingList where
  encode (RoleBindingList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultRoleBindingList :: Default RoleBindingList where
  default = RoleBindingList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | RoleList is a collection of Roles
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of Roles
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata.
newtype RoleList = RoleList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Role))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeRoleList :: Newtype RoleList _
derive instance genericRoleList :: Generic RoleList _
instance showRoleList :: Show RoleList where show a = genericShow a
instance decodeRoleList :: Decode RoleList where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               items <- readProp "items" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               pure $ RoleList { apiVersion, items, kind, metadata }
instance encodeRoleList :: Encode RoleList where
  encode (RoleList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "items" (encode a.items)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata) ]


instance defaultRoleList :: Default RoleList where
  default = RoleList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | RoleRef contains information that points to the role being used
-- |
-- | Fields:
-- | - `apiGroup`: APIGroup is the group for the resource being referenced
-- | - `kind`: Kind is the type of resource being referenced
-- | - `name`: Name is the name of resource being referenced
newtype RoleRef = RoleRef
  { apiGroup :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String) }

derive instance newtypeRoleRef :: Newtype RoleRef _
derive instance genericRoleRef :: Generic RoleRef _
instance showRoleRef :: Show RoleRef where show a = genericShow a
instance decodeRoleRef :: Decode RoleRef where
  decode a = do
               apiGroup <- readProp "apiGroup" a >>= decode
               kind <- readProp "kind" a >>= decode
               name <- readProp "name" a >>= decode
               pure $ RoleRef { apiGroup, kind, name }
instance encodeRoleRef :: Encode RoleRef where
  encode (RoleRef a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroup" (encode a.apiGroup)
               , Tuple "kind" (encode a.kind)
               , Tuple "name" (encode a.name) ]


instance defaultRoleRef :: Default RoleRef where
  default = RoleRef
    { apiGroup: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | Subject contains a reference to the object or user identities a role binding applies to.  This can either hold a direct API object reference, or a value for non-objects such as user and group names.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion holds the API group and version of the referenced subject. Defaults to "v1" for ServiceAccount subjects. Defaults to "rbac.authorization.k8s.io/v1alpha1" for User and Group subjects.
-- | - `kind`: Kind of object being referenced. Values defined by this API group are "User", "Group", and "ServiceAccount". If the Authorizer does not recognized the kind value, the Authorizer should report an error.
-- | - `name`: Name of the object being referenced.
-- | - `namespace`: Namespace of the referenced object.  If the object kind is non-namespace, such as "User" or "Group", and this value is not empty the Authorizer should report an error.
newtype Subject = Subject
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String) }

derive instance newtypeSubject :: Newtype Subject _
derive instance genericSubject :: Generic Subject _
instance showSubject :: Show Subject where show a = genericShow a
instance decodeSubject :: Decode Subject where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               name <- readProp "name" a >>= decode
               namespace <- readProp "namespace" a >>= decode
               pure $ Subject { apiVersion, kind, name, namespace }
instance encodeSubject :: Encode Subject where
  encode (Subject a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "name" (encode a.name)
               , Tuple "namespace" (encode a.namespace) ]


instance defaultSubject :: Default Subject where
  default = Subject
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/"