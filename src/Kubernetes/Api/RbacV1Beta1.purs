module Kubernetes.Api.RbacV1Beta1 where

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
  decode a = genericDecode jsonOptions a 
instance encodeAggregationRule :: Encode AggregationRule where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeClusterRole :: Encode ClusterRole where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeClusterRoleBinding :: Encode ClusterRoleBinding where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeClusterRoleBindingList :: Encode ClusterRoleBindingList where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeClusterRoleList :: Encode ClusterRoleList where
  encode a = genericEncode jsonOptions a

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
-- | - `nonResourceURLs`: NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding. Rules can either apply to API resources (such as "pods" or "secrets") or non-resource URL paths (such as "/api"),  but not both.
-- | - `resourceNames`: ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.
-- | - `resources`: Resources is a list of resources this rule applies to.  '*' represents all resources in the specified apiGroups. '*/foo' represents the subresource 'foo' for all resources in the specified apiGroups.
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
  decode a = genericDecode jsonOptions a 
instance encodePolicyRule :: Encode PolicyRule where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeRole :: Encode Role where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeRoleBinding :: Encode RoleBinding where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeRoleBindingList :: Encode RoleBindingList where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeRoleList :: Encode RoleList where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeRoleRef :: Encode RoleRef where
  encode a = genericEncode jsonOptions a

instance defaultRoleRef :: Default RoleRef where
  default = RoleRef
    { apiGroup: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing }

-- | Subject contains a reference to the object or user identities a role binding applies to.  This can either hold a direct API object reference, or a value for non-objects such as user and group names.
-- |
-- | Fields:
-- | - `apiGroup`: APIGroup holds the API group of the referenced subject. Defaults to "" for ServiceAccount subjects. Defaults to "rbac.authorization.k8s.io" for User and Group subjects.
-- | - `kind`: Kind of object being referenced. Values defined by this API group are "User", "Group", and "ServiceAccount". If the Authorizer does not recognized the kind value, the Authorizer should report an error.
-- | - `name`: Name of the object being referenced.
-- | - `namespace`: Namespace of the referenced object.  If the object kind is non-namespace, such as "User" or "Group", and this value is not empty the Authorizer should report an error.
newtype Subject = Subject
  { apiGroup :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String) }

derive instance newtypeSubject :: Newtype Subject _
derive instance genericSubject :: Generic Subject _
instance showSubject :: Show Subject where show a = genericShow a
instance decodeSubject :: Decode Subject where
  decode a = genericDecode jsonOptions a 
instance encodeSubject :: Encode Subject where
  encode a = genericEncode jsonOptions a

instance defaultSubject :: Default Subject where
  default = Subject
    { apiGroup: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1beta1/"