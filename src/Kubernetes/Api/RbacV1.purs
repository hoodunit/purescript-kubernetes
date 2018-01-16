module Kubernetes.Api.RbacV1 where

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

-- | create a ClusterRole
createClusterRole :: forall e. Config -> ClusterRole -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRole)
createClusterRole cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterroles"
    encodedBody = encodeJSON body

-- | create a ClusterRoleBinding
createClusterRoleBinding :: forall e. Config -> ClusterRoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRoleBinding)
createClusterRoleBinding cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings"
    encodedBody = encodeJSON body

-- | create a Role
createNamespacedRole :: forall e. Config -> Role -> Aff (http :: HTTP | e) (Either MetaV1.Status Role)
createNamespacedRole cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/roles"
    encodedBody = encodeJSON body

-- | create a RoleBinding
createNamespacedRoleBinding :: forall e. Config -> RoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBinding)
createNamespacedRoleBinding cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteClusterRoleOptions = DeleteClusterRoleOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteClusterRoleOptions :: Newtype DeleteClusterRoleOptions _
derive instance genericDeleteClusterRoleOptions :: Generic DeleteClusterRoleOptions _
instance showDeleteClusterRoleOptions :: Show DeleteClusterRoleOptions where show a = genericShow a
instance decodeDeleteClusterRoleOptions :: Decode DeleteClusterRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteClusterRoleOptions :: Encode DeleteClusterRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteClusterRoleOptions :: Default DeleteClusterRoleOptions where
  default = DeleteClusterRoleOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ClusterRole
deleteClusterRole :: forall e. Config -> MetaV1.DeleteOptions -> DeleteClusterRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteClusterRole cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterroles/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteClusterRoleBindingOptions = DeleteClusterRoleBindingOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteClusterRoleBindingOptions :: Newtype DeleteClusterRoleBindingOptions _
derive instance genericDeleteClusterRoleBindingOptions :: Generic DeleteClusterRoleBindingOptions _
instance showDeleteClusterRoleBindingOptions :: Show DeleteClusterRoleBindingOptions where show a = genericShow a
instance decodeDeleteClusterRoleBindingOptions :: Decode DeleteClusterRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteClusterRoleBindingOptions :: Encode DeleteClusterRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteClusterRoleBindingOptions :: Default DeleteClusterRoleBindingOptions where
  default = DeleteClusterRoleBindingOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a ClusterRoleBinding
deleteClusterRoleBinding :: forall e. Config -> MetaV1.DeleteOptions -> DeleteClusterRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteClusterRoleBinding cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/{name}" <> formatQueryString options
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
newtype DeleteCollectionClusterRoleOptions = DeleteCollectionClusterRoleOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionClusterRoleOptions :: Newtype DeleteCollectionClusterRoleOptions _
derive instance genericDeleteCollectionClusterRoleOptions :: Generic DeleteCollectionClusterRoleOptions _
instance showDeleteCollectionClusterRoleOptions :: Show DeleteCollectionClusterRoleOptions where show a = genericShow a
instance decodeDeleteCollectionClusterRoleOptions :: Decode DeleteCollectionClusterRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionClusterRoleOptions :: Encode DeleteCollectionClusterRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionClusterRoleOptions :: Default DeleteCollectionClusterRoleOptions where
  default = DeleteCollectionClusterRoleOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ClusterRole
deleteCollectionClusterRole :: forall e. Config -> DeleteCollectionClusterRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionClusterRole cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterroles" <> formatQueryString options

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
newtype DeleteCollectionClusterRoleBindingOptions = DeleteCollectionClusterRoleBindingOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionClusterRoleBindingOptions :: Newtype DeleteCollectionClusterRoleBindingOptions _
derive instance genericDeleteCollectionClusterRoleBindingOptions :: Generic DeleteCollectionClusterRoleBindingOptions _
instance showDeleteCollectionClusterRoleBindingOptions :: Show DeleteCollectionClusterRoleBindingOptions where show a = genericShow a
instance decodeDeleteCollectionClusterRoleBindingOptions :: Decode DeleteCollectionClusterRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionClusterRoleBindingOptions :: Encode DeleteCollectionClusterRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionClusterRoleBindingOptions :: Default DeleteCollectionClusterRoleBindingOptions where
  default = DeleteCollectionClusterRoleBindingOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of ClusterRoleBinding
deleteCollectionClusterRoleBinding :: forall e. Config -> DeleteCollectionClusterRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionClusterRoleBinding cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings" <> formatQueryString options

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
newtype DeleteCollectionNamespacedRoleOptions = DeleteCollectionNamespacedRoleOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedRoleOptions :: Newtype DeleteCollectionNamespacedRoleOptions _
derive instance genericDeleteCollectionNamespacedRoleOptions :: Generic DeleteCollectionNamespacedRoleOptions _
instance showDeleteCollectionNamespacedRoleOptions :: Show DeleteCollectionNamespacedRoleOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedRoleOptions :: Decode DeleteCollectionNamespacedRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedRoleOptions :: Encode DeleteCollectionNamespacedRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedRoleOptions :: Default DeleteCollectionNamespacedRoleOptions where
  default = DeleteCollectionNamespacedRoleOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Role
deleteCollectionNamespacedRole :: forall e. Config -> DeleteCollectionNamespacedRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedRole cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/roles" <> formatQueryString options

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
newtype DeleteCollectionNamespacedRoleBindingOptions = DeleteCollectionNamespacedRoleBindingOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedRoleBindingOptions :: Newtype DeleteCollectionNamespacedRoleBindingOptions _
derive instance genericDeleteCollectionNamespacedRoleBindingOptions :: Generic DeleteCollectionNamespacedRoleBindingOptions _
instance showDeleteCollectionNamespacedRoleBindingOptions :: Show DeleteCollectionNamespacedRoleBindingOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedRoleBindingOptions :: Decode DeleteCollectionNamespacedRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedRoleBindingOptions :: Encode DeleteCollectionNamespacedRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedRoleBindingOptions :: Default DeleteCollectionNamespacedRoleBindingOptions where
  default = DeleteCollectionNamespacedRoleBindingOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of RoleBinding
deleteCollectionNamespacedRoleBinding :: forall e. Config -> DeleteCollectionNamespacedRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedRoleBinding cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings" <> formatQueryString options

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedRoleOptions = DeleteNamespacedRoleOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedRoleOptions :: Newtype DeleteNamespacedRoleOptions _
derive instance genericDeleteNamespacedRoleOptions :: Generic DeleteNamespacedRoleOptions _
instance showDeleteNamespacedRoleOptions :: Show DeleteNamespacedRoleOptions where show a = genericShow a
instance decodeDeleteNamespacedRoleOptions :: Decode DeleteNamespacedRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedRoleOptions :: Encode DeleteNamespacedRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedRoleOptions :: Default DeleteNamespacedRoleOptions where
  default = DeleteNamespacedRoleOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a Role
deleteNamespacedRole :: forall e. Config -> MetaV1.DeleteOptions -> DeleteNamespacedRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedRole cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/roles/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
newtype DeleteNamespacedRoleBindingOptions = DeleteNamespacedRoleBindingOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedRoleBindingOptions :: Newtype DeleteNamespacedRoleBindingOptions _
derive instance genericDeleteNamespacedRoleBindingOptions :: Generic DeleteNamespacedRoleBindingOptions _
instance showDeleteNamespacedRoleBindingOptions :: Show DeleteNamespacedRoleBindingOptions where show a = genericShow a
instance decodeDeleteNamespacedRoleBindingOptions :: Decode DeleteNamespacedRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedRoleBindingOptions :: Encode DeleteNamespacedRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedRoleBindingOptions :: Default DeleteNamespacedRoleBindingOptions where
  default = DeleteNamespacedRoleBindingOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a RoleBinding
deleteNamespacedRoleBinding :: forall e. Config -> MetaV1.DeleteOptions -> DeleteNamespacedRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedRoleBinding cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/"

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
newtype ListClusterRoleOptions = ListClusterRoleOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListClusterRoleOptions :: Newtype ListClusterRoleOptions _
derive instance genericListClusterRoleOptions :: Generic ListClusterRoleOptions _
instance showListClusterRoleOptions :: Show ListClusterRoleOptions where show a = genericShow a
instance decodeListClusterRoleOptions :: Decode ListClusterRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListClusterRoleOptions :: Encode ListClusterRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultListClusterRoleOptions :: Default ListClusterRoleOptions where
  default = ListClusterRoleOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ClusterRole
listClusterRole :: forall e. Config -> ListClusterRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRoleList)
listClusterRole cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterroles" <> formatQueryString options

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
newtype ListClusterRoleBindingOptions = ListClusterRoleBindingOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListClusterRoleBindingOptions :: Newtype ListClusterRoleBindingOptions _
derive instance genericListClusterRoleBindingOptions :: Generic ListClusterRoleBindingOptions _
instance showListClusterRoleBindingOptions :: Show ListClusterRoleBindingOptions where show a = genericShow a
instance decodeListClusterRoleBindingOptions :: Decode ListClusterRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListClusterRoleBindingOptions :: Encode ListClusterRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultListClusterRoleBindingOptions :: Default ListClusterRoleBindingOptions where
  default = ListClusterRoleBindingOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind ClusterRoleBinding
listClusterRoleBinding :: forall e. Config -> ListClusterRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRoleBindingList)
listClusterRoleBinding cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings" <> formatQueryString options

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
newtype ListNamespacedRoleOptions = ListNamespacedRoleOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedRoleOptions :: Newtype ListNamespacedRoleOptions _
derive instance genericListNamespacedRoleOptions :: Generic ListNamespacedRoleOptions _
instance showListNamespacedRoleOptions :: Show ListNamespacedRoleOptions where show a = genericShow a
instance decodeListNamespacedRoleOptions :: Decode ListNamespacedRoleOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedRoleOptions :: Encode ListNamespacedRoleOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedRoleOptions :: Default ListNamespacedRoleOptions where
  default = ListNamespacedRoleOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Role
listNamespacedRole :: forall e. Config -> ListNamespacedRoleOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleList)
listNamespacedRole cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/roles" <> formatQueryString options

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
newtype ListNamespacedRoleBindingOptions = ListNamespacedRoleBindingOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedRoleBindingOptions :: Newtype ListNamespacedRoleBindingOptions _
derive instance genericListNamespacedRoleBindingOptions :: Generic ListNamespacedRoleBindingOptions _
instance showListNamespacedRoleBindingOptions :: Show ListNamespacedRoleBindingOptions where show a = genericShow a
instance decodeListNamespacedRoleBindingOptions :: Decode ListNamespacedRoleBindingOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedRoleBindingOptions :: Encode ListNamespacedRoleBindingOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedRoleBindingOptions :: Default ListNamespacedRoleBindingOptions where
  default = ListNamespacedRoleBindingOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind RoleBinding
listNamespacedRoleBinding :: forall e. Config -> ListNamespacedRoleBindingOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBindingList)
listNamespacedRoleBinding cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings" <> formatQueryString options

-- | list or watch objects of kind RoleBinding
listRoleBindingForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBindingList)
listRoleBindingForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/rolebindings"

-- | list or watch objects of kind Role
listRoleForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleList)
listRoleForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/roles"

-- | read the specified ClusterRole
readClusterRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRole)
readClusterRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterroles/{name}"

-- | read the specified ClusterRoleBinding
readClusterRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRoleBinding)
readClusterRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/{name}"

-- | read the specified Role
readNamespacedRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status Role)
readNamespacedRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/roles/{name}"

-- | read the specified RoleBinding
readNamespacedRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBinding)
readNamespacedRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings/{name}"

-- | replace the specified ClusterRole
replaceClusterRole :: forall e. Config -> ClusterRole -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRole)
replaceClusterRole cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterroles/{name}"
    encodedBody = encodeJSON body

-- | replace the specified ClusterRoleBinding
replaceClusterRoleBinding :: forall e. Config -> ClusterRoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRoleBinding)
replaceClusterRoleBinding cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/{name}"
    encodedBody = encodeJSON body

-- | replace the specified Role
replaceNamespacedRole :: forall e. Config -> Role -> Aff (http :: HTTP | e) (Either MetaV1.Status Role)
replaceNamespacedRole cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/roles/{name}"
    encodedBody = encodeJSON body

-- | replace the specified RoleBinding
replaceNamespacedRoleBinding :: forall e. Config -> RoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBinding)
replaceNamespacedRoleBinding cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind ClusterRole
watchClusterRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/clusterroles/{name}"

-- | watch changes to an object of kind ClusterRoleBinding
watchClusterRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/clusterrolebindings/{name}"

-- | watch individual changes to a list of ClusterRoleBinding
watchClusterRoleBindingList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleBindingList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/clusterrolebindings"

-- | watch individual changes to a list of ClusterRole
watchClusterRoleList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/clusterroles"

-- | watch changes to an object of kind Role
watchNamespacedRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/namespaces/{namespace}/roles/{name}"

-- | watch changes to an object of kind RoleBinding
watchNamespacedRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/namespaces/{namespace}/rolebindings/{name}"

-- | watch individual changes to a list of RoleBinding
watchNamespacedRoleBindingList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedRoleBindingList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/namespaces/{namespace}/rolebindings"

-- | watch individual changes to a list of Role
watchNamespacedRoleList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedRoleList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/namespaces/{namespace}/roles"

-- | watch individual changes to a list of RoleBinding
watchRoleBindingListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchRoleBindingListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/rolebindings"

-- | watch individual changes to a list of Role
watchRoleListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchRoleListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1/watch/roles"