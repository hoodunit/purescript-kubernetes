module Kubernetes.Api.RbacV1Alpha1 where

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

-- | create a ClusterRole
createClusterRole :: forall e. Config -> ClusterRole -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRole)
createClusterRole cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles"
    encodedBody = encodeJSON body

-- | create a ClusterRoleBinding
createClusterRoleBinding :: forall e. Config -> ClusterRoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRoleBinding)
createClusterRoleBinding cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterrolebindings"
    encodedBody = encodeJSON body

-- | create a Role
createNamespacedRole :: forall e. Config -> Role -> Aff (http :: HTTP | e) (Either MetaV1.Status Role)
createNamespacedRole cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/roles"
    encodedBody = encodeJSON body

-- | create a RoleBinding
createNamespacedRoleBinding :: forall e. Config -> RoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBinding)
createNamespacedRoleBinding cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/rolebindings"
    encodedBody = encodeJSON body

-- | DeleteClusterRoleOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteClusterRoleBindingOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterrolebindings/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteCollectionClusterRoleOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles" <> formatQueryString options

-- | DeleteCollectionClusterRoleBindingOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterrolebindings" <> formatQueryString options

-- | DeleteCollectionNamespacedRoleOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/roles" <> formatQueryString options

-- | DeleteCollectionNamespacedRoleBindingOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/rolebindings" <> formatQueryString options

-- | DeleteNamespacedRoleOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/roles/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | DeleteNamespacedRoleBindingOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/rolebindings/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/"

-- | io.k8s.api.rbac.v1alpha1.AggregationRule
-- | AggregationRule describes how to locate ClusterRoles to aggregate into the ClusterRole
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

-- | io.k8s.api.rbac.v1alpha1.ClusterRole
-- | ClusterRole is a cluster level, logical grouping of PolicyRules that can be referenced as a unit by a RoleBinding or ClusterRoleBinding.
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

-- | io.k8s.api.rbac.v1alpha1.ClusterRoleBinding
-- | ClusterRoleBinding references a ClusterRole, but not contain it.  It can reference a ClusterRole in the global namespace, and adds who information via Subject.
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

-- | io.k8s.api.rbac.v1alpha1.ClusterRoleBindingList
-- | ClusterRoleBindingList is a collection of ClusterRoleBindings
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

-- | io.k8s.api.rbac.v1alpha1.ClusterRoleList
-- | ClusterRoleList is a collection of ClusterRoles
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

-- | io.k8s.api.rbac.v1alpha1.PolicyRule
-- | PolicyRule holds information that describes a policy rule, but does not contain information about who the rule applies to or which namespace the rule applies to.
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

-- | io.k8s.api.rbac.v1alpha1.Role
-- | Role is a namespaced, logical grouping of PolicyRules that can be referenced as a unit by a RoleBinding.
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

-- | io.k8s.api.rbac.v1alpha1.RoleBinding
-- | RoleBinding references a role, but does not contain it.  It can reference a Role in the same namespace or a ClusterRole in the global namespace. It adds who information via Subjects and namespace information by which namespace it exists in.  RoleBindings in a given namespace only have effect in that namespace.
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

-- | io.k8s.api.rbac.v1alpha1.RoleBindingList
-- | RoleBindingList is a collection of RoleBindings
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

-- | io.k8s.api.rbac.v1alpha1.RoleList
-- | RoleList is a collection of Roles
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

-- | io.k8s.api.rbac.v1alpha1.RoleRef
-- | RoleRef contains information that points to the role being used
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

-- | io.k8s.api.rbac.v1alpha1.Subject
-- | Subject contains a reference to the object or user identities a role binding applies to.  This can either hold a direct API object reference, or a value for non-objects such as user and group names.
newtype Subject = Subject
  { apiVersion :: (NullOrUndefined String)
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
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing }

-- | ListClusterRoleOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles" <> formatQueryString options

-- | ListClusterRoleBindingOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterrolebindings" <> formatQueryString options

-- | ListNamespacedRoleOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/roles" <> formatQueryString options

-- | ListNamespacedRoleBindingOptions
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
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/rolebindings" <> formatQueryString options

-- | list or watch objects of kind RoleBinding
listRoleBindingForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBindingList)
listRoleBindingForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/rolebindings"

-- | list or watch objects of kind Role
listRoleForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleList)
listRoleForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/roles"

-- | read the specified ClusterRole
readClusterRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRole)
readClusterRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles/{name}"

-- | read the specified ClusterRoleBinding
readClusterRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRoleBinding)
readClusterRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterrolebindings/{name}"

-- | read the specified Role
readNamespacedRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status Role)
readNamespacedRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/roles/{name}"

-- | read the specified RoleBinding
readNamespacedRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBinding)
readNamespacedRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/rolebindings/{name}"

-- | replace the specified ClusterRole
replaceClusterRole :: forall e. Config -> ClusterRole -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRole)
replaceClusterRole cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterroles/{name}"
    encodedBody = encodeJSON body

-- | replace the specified ClusterRoleBinding
replaceClusterRoleBinding :: forall e. Config -> ClusterRoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status ClusterRoleBinding)
replaceClusterRoleBinding cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/clusterrolebindings/{name}"
    encodedBody = encodeJSON body

-- | replace the specified Role
replaceNamespacedRole :: forall e. Config -> Role -> Aff (http :: HTTP | e) (Either MetaV1.Status Role)
replaceNamespacedRole cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/roles/{name}"
    encodedBody = encodeJSON body

-- | replace the specified RoleBinding
replaceNamespacedRoleBinding :: forall e. Config -> RoleBinding -> Aff (http :: HTTP | e) (Either MetaV1.Status RoleBinding)
replaceNamespacedRoleBinding cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/namespaces/{namespace}/rolebindings/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind ClusterRole
watchClusterRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/clusterroles/{name}"

-- | watch changes to an object of kind ClusterRoleBinding
watchClusterRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/clusterrolebindings/{name}"

-- | watch individual changes to a list of ClusterRoleBinding
watchClusterRoleBindingList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleBindingList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/clusterrolebindings"

-- | watch individual changes to a list of ClusterRole
watchClusterRoleList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchClusterRoleList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/clusterroles"

-- | watch changes to an object of kind Role
watchNamespacedRole :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedRole cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/namespaces/{namespace}/roles/{name}"

-- | watch changes to an object of kind RoleBinding
watchNamespacedRoleBinding :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedRoleBinding cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/namespaces/{namespace}/rolebindings/{name}"

-- | watch individual changes to a list of RoleBinding
watchNamespacedRoleBindingList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedRoleBindingList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/namespaces/{namespace}/rolebindings"

-- | watch individual changes to a list of Role
watchNamespacedRoleList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedRoleList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/namespaces/{namespace}/roles"

-- | watch individual changes to a list of RoleBinding
watchRoleBindingListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchRoleBindingListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/rolebindings"

-- | watch individual changes to a list of Role
watchRoleListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchRoleListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/rbac.authorization.k8s.io/v1alpha1/watch/roles"