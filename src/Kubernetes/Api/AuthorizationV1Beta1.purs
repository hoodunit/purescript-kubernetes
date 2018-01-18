module Kubernetes.Api.AuthorizationV1Beta1 where

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

-- | LocalSubjectAccessReview checks whether or not a user or group can perform an action in a given namespace. Having a namespace scoped resource makes it much easier to grant namespace scoped policy that includes permissions checking.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated.  spec.namespace must be equal to the namespace you made the request against.  If empty, it is defaulted.
-- | - `status`: Status is filled in by the server and indicates whether the request is allowed or not
newtype LocalSubjectAccessReview = LocalSubjectAccessReview
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined SubjectAccessReviewSpec)
  , status :: (NullOrUndefined SubjectAccessReviewStatus) }

derive instance newtypeLocalSubjectAccessReview :: Newtype LocalSubjectAccessReview _
derive instance genericLocalSubjectAccessReview :: Generic LocalSubjectAccessReview _
instance showLocalSubjectAccessReview :: Show LocalSubjectAccessReview where show a = genericShow a
instance decodeLocalSubjectAccessReview :: Decode LocalSubjectAccessReview where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ LocalSubjectAccessReview { apiVersion, kind, metadata, spec, status }
instance encodeLocalSubjectAccessReview :: Encode LocalSubjectAccessReview where
  encode (LocalSubjectAccessReview a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultLocalSubjectAccessReview :: Default LocalSubjectAccessReview where
  default = LocalSubjectAccessReview
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | NonResourceAttributes includes the authorization attributes available for non-resource requests to the Authorizer interface
-- |
-- | Fields:
-- | - `path`: Path is the URL path of the request
-- | - `verb`: Verb is the standard HTTP verb
newtype NonResourceAttributes = NonResourceAttributes
  { path :: (NullOrUndefined String)
  , verb :: (NullOrUndefined String) }

derive instance newtypeNonResourceAttributes :: Newtype NonResourceAttributes _
derive instance genericNonResourceAttributes :: Generic NonResourceAttributes _
instance showNonResourceAttributes :: Show NonResourceAttributes where show a = genericShow a
instance decodeNonResourceAttributes :: Decode NonResourceAttributes where
  decode a = do
               path <- readProp "path" a >>= decode
               verb <- readProp "verb" a >>= decode
               pure $ NonResourceAttributes { path, verb }
instance encodeNonResourceAttributes :: Encode NonResourceAttributes where
  encode (NonResourceAttributes a) = encode $ StrMap.fromFoldable $
               [ Tuple "path" (encode a.path)
               , Tuple "verb" (encode a.verb) ]


instance defaultNonResourceAttributes :: Default NonResourceAttributes where
  default = NonResourceAttributes
    { path: NullOrUndefined Nothing
    , verb: NullOrUndefined Nothing }

-- | NonResourceRule holds information that describes a rule for the non-resource
-- |
-- | Fields:
-- | - `nonResourceURLs`: NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path.  "*" means all.
-- | - `verbs`: Verb is a list of kubernetes non-resource API verbs, like: get, post, put, delete, patch, head, options.  "*" means all.
newtype NonResourceRule = NonResourceRule
  { nonResourceURLs :: (NullOrUndefined (Array String))
  , verbs :: (NullOrUndefined (Array String)) }

derive instance newtypeNonResourceRule :: Newtype NonResourceRule _
derive instance genericNonResourceRule :: Generic NonResourceRule _
instance showNonResourceRule :: Show NonResourceRule where show a = genericShow a
instance decodeNonResourceRule :: Decode NonResourceRule where
  decode a = do
               nonResourceURLs <- readProp "nonResourceURLs" a >>= decode
               verbs <- readProp "verbs" a >>= decode
               pure $ NonResourceRule { nonResourceURLs, verbs }
instance encodeNonResourceRule :: Encode NonResourceRule where
  encode (NonResourceRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "nonResourceURLs" (encode a.nonResourceURLs)
               , Tuple "verbs" (encode a.verbs) ]


instance defaultNonResourceRule :: Default NonResourceRule where
  default = NonResourceRule
    { nonResourceURLs: NullOrUndefined Nothing
    , verbs: NullOrUndefined Nothing }

-- | ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface
-- |
-- | Fields:
-- | - `group`: Group is the API Group of the Resource.  "*" means all.
-- | - `name`: Name is the name of the resource being requested for a "get" or deleted for a "delete". "" (empty) means all.
-- | - `namespace`: Namespace is the namespace of the action being requested.  Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview
-- | - `resource`: Resource is one of the existing resource types.  "*" means all.
-- | - `subresource`: Subresource is one of the existing resource types.  "" means none.
-- | - `verb`: Verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.  "*" means all.
-- | - `version`: Version is the API Version of the Resource.  "*" means all.
newtype ResourceAttributes = ResourceAttributes
  { group :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , namespace :: (NullOrUndefined String)
  , resource :: (NullOrUndefined String)
  , subresource :: (NullOrUndefined String)
  , verb :: (NullOrUndefined String)
  , version :: (NullOrUndefined String) }

derive instance newtypeResourceAttributes :: Newtype ResourceAttributes _
derive instance genericResourceAttributes :: Generic ResourceAttributes _
instance showResourceAttributes :: Show ResourceAttributes where show a = genericShow a
instance decodeResourceAttributes :: Decode ResourceAttributes where
  decode a = do
               group <- readProp "group" a >>= decode
               name <- readProp "name" a >>= decode
               namespace <- readProp "namespace" a >>= decode
               resource <- readProp "resource" a >>= decode
               subresource <- readProp "subresource" a >>= decode
               verb <- readProp "verb" a >>= decode
               version <- readProp "version" a >>= decode
               pure $ ResourceAttributes { group, name, namespace, resource, subresource, verb, version }
instance encodeResourceAttributes :: Encode ResourceAttributes where
  encode (ResourceAttributes a) = encode $ StrMap.fromFoldable $
               [ Tuple "group" (encode a.group)
               , Tuple "name" (encode a.name)
               , Tuple "namespace" (encode a.namespace)
               , Tuple "resource" (encode a.resource)
               , Tuple "subresource" (encode a.subresource)
               , Tuple "verb" (encode a.verb)
               , Tuple "version" (encode a.version) ]


instance defaultResourceAttributes :: Default ResourceAttributes where
  default = ResourceAttributes
    { group: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , namespace: NullOrUndefined Nothing
    , resource: NullOrUndefined Nothing
    , subresource: NullOrUndefined Nothing
    , verb: NullOrUndefined Nothing
    , version: NullOrUndefined Nothing }

-- | ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
-- |
-- | Fields:
-- | - `apiGroups`: APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.  "*" means all.
-- | - `resourceNames`: ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.  "*" means all.
-- | - `resources`: Resources is a list of resources this rule applies to.  "*" means all in the specified apiGroups.
-- |     "*/foo" represents the subresource 'foo' for all resources in the specified apiGroups.
-- | - `verbs`: Verb is a list of kubernetes resource API verbs, like: get, list, watch, create, update, delete, proxy.  "*" means all.
newtype ResourceRule = ResourceRule
  { apiGroups :: (NullOrUndefined (Array String))
  , resourceNames :: (NullOrUndefined (Array String))
  , resources :: (NullOrUndefined (Array String))
  , verbs :: (NullOrUndefined (Array String)) }

derive instance newtypeResourceRule :: Newtype ResourceRule _
derive instance genericResourceRule :: Generic ResourceRule _
instance showResourceRule :: Show ResourceRule where show a = genericShow a
instance decodeResourceRule :: Decode ResourceRule where
  decode a = do
               apiGroups <- readProp "apiGroups" a >>= decode
               resourceNames <- readProp "resourceNames" a >>= decode
               resources <- readProp "resources" a >>= decode
               verbs <- readProp "verbs" a >>= decode
               pure $ ResourceRule { apiGroups, resourceNames, resources, verbs }
instance encodeResourceRule :: Encode ResourceRule where
  encode (ResourceRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroups" (encode a.apiGroups)
               , Tuple "resourceNames" (encode a.resourceNames)
               , Tuple "resources" (encode a.resources)
               , Tuple "verbs" (encode a.verbs) ]


instance defaultResourceRule :: Default ResourceRule where
  default = ResourceRule
    { apiGroups: NullOrUndefined Nothing
    , resourceNames: NullOrUndefined Nothing
    , resources: NullOrUndefined Nothing
    , verbs: NullOrUndefined Nothing }

-- | SelfSubjectAccessReview checks whether or the current user can perform an action.  Not filling in a spec.namespace means "in all namespaces".  Self is a special case, because users should always be able to check whether they can perform an action
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated.  user and groups must be empty
-- | - `status`: Status is filled in by the server and indicates whether the request is allowed or not
newtype SelfSubjectAccessReview = SelfSubjectAccessReview
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined SelfSubjectAccessReviewSpec)
  , status :: (NullOrUndefined SubjectAccessReviewStatus) }

derive instance newtypeSelfSubjectAccessReview :: Newtype SelfSubjectAccessReview _
derive instance genericSelfSubjectAccessReview :: Generic SelfSubjectAccessReview _
instance showSelfSubjectAccessReview :: Show SelfSubjectAccessReview where show a = genericShow a
instance decodeSelfSubjectAccessReview :: Decode SelfSubjectAccessReview where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ SelfSubjectAccessReview { apiVersion, kind, metadata, spec, status }
instance encodeSelfSubjectAccessReview :: Encode SelfSubjectAccessReview where
  encode (SelfSubjectAccessReview a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultSelfSubjectAccessReview :: Default SelfSubjectAccessReview where
  default = SelfSubjectAccessReview
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | SelfSubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
-- |
-- | Fields:
-- | - `nonResourceAttributes`: NonResourceAttributes describes information for a non-resource access request
-- | - `resourceAttributes`: ResourceAuthorizationAttributes describes information for a resource access request
newtype SelfSubjectAccessReviewSpec = SelfSubjectAccessReviewSpec
  { nonResourceAttributes :: (NullOrUndefined NonResourceAttributes)
  , resourceAttributes :: (NullOrUndefined ResourceAttributes) }

derive instance newtypeSelfSubjectAccessReviewSpec :: Newtype SelfSubjectAccessReviewSpec _
derive instance genericSelfSubjectAccessReviewSpec :: Generic SelfSubjectAccessReviewSpec _
instance showSelfSubjectAccessReviewSpec :: Show SelfSubjectAccessReviewSpec where show a = genericShow a
instance decodeSelfSubjectAccessReviewSpec :: Decode SelfSubjectAccessReviewSpec where
  decode a = do
               nonResourceAttributes <- readProp "nonResourceAttributes" a >>= decode
               resourceAttributes <- readProp "resourceAttributes" a >>= decode
               pure $ SelfSubjectAccessReviewSpec { nonResourceAttributes, resourceAttributes }
instance encodeSelfSubjectAccessReviewSpec :: Encode SelfSubjectAccessReviewSpec where
  encode (SelfSubjectAccessReviewSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "nonResourceAttributes" (encode a.nonResourceAttributes)
               , Tuple "resourceAttributes" (encode a.resourceAttributes) ]


instance defaultSelfSubjectAccessReviewSpec :: Default SelfSubjectAccessReviewSpec where
  default = SelfSubjectAccessReviewSpec
    { nonResourceAttributes: NullOrUndefined Nothing
    , resourceAttributes: NullOrUndefined Nothing }

-- | SelfSubjectRulesReview enumerates the set of actions the current user can perform within a namespace. The returned list of actions may be incomplete depending on the server's authorization mode, and any errors experienced during the evaluation. SelfSubjectRulesReview should be used by UIs to show/hide actions, or to quickly let an end user reason about their permissions. It should NOT Be used by external systems to drive authorization decisions as this raises confused deputy, cache lifetime/revocation, and correctness concerns. SubjectAccessReview, and LocalAccessReview are the correct way to defer authorization decisions to the API server.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated.
-- | - `status`: Status is filled in by the server and indicates the set of actions a user can perform.
newtype SelfSubjectRulesReview = SelfSubjectRulesReview
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined SelfSubjectRulesReviewSpec)
  , status :: (NullOrUndefined SubjectRulesReviewStatus) }

derive instance newtypeSelfSubjectRulesReview :: Newtype SelfSubjectRulesReview _
derive instance genericSelfSubjectRulesReview :: Generic SelfSubjectRulesReview _
instance showSelfSubjectRulesReview :: Show SelfSubjectRulesReview where show a = genericShow a
instance decodeSelfSubjectRulesReview :: Decode SelfSubjectRulesReview where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ SelfSubjectRulesReview { apiVersion, kind, metadata, spec, status }
instance encodeSelfSubjectRulesReview :: Encode SelfSubjectRulesReview where
  encode (SelfSubjectRulesReview a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultSelfSubjectRulesReview :: Default SelfSubjectRulesReview where
  default = SelfSubjectRulesReview
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | Fields:
-- | - `namespace`: Namespace to evaluate rules for. Required.
newtype SelfSubjectRulesReviewSpec = SelfSubjectRulesReviewSpec
  { namespace :: (NullOrUndefined String) }

derive instance newtypeSelfSubjectRulesReviewSpec :: Newtype SelfSubjectRulesReviewSpec _
derive instance genericSelfSubjectRulesReviewSpec :: Generic SelfSubjectRulesReviewSpec _
instance showSelfSubjectRulesReviewSpec :: Show SelfSubjectRulesReviewSpec where show a = genericShow a
instance decodeSelfSubjectRulesReviewSpec :: Decode SelfSubjectRulesReviewSpec where
  decode a = do
               namespace <- readProp "namespace" a >>= decode
               pure $ SelfSubjectRulesReviewSpec { namespace }
instance encodeSelfSubjectRulesReviewSpec :: Encode SelfSubjectRulesReviewSpec where
  encode (SelfSubjectRulesReviewSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "namespace" (encode a.namespace) ]


instance defaultSelfSubjectRulesReviewSpec :: Default SelfSubjectRulesReviewSpec where
  default = SelfSubjectRulesReviewSpec
    { namespace: NullOrUndefined Nothing }

-- | SubjectAccessReview checks whether or not a user or group can perform an action.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated
-- | - `status`: Status is filled in by the server and indicates whether the request is allowed or not
newtype SubjectAccessReview = SubjectAccessReview
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined SubjectAccessReviewSpec)
  , status :: (NullOrUndefined SubjectAccessReviewStatus) }

derive instance newtypeSubjectAccessReview :: Newtype SubjectAccessReview _
derive instance genericSubjectAccessReview :: Generic SubjectAccessReview _
instance showSubjectAccessReview :: Show SubjectAccessReview where show a = genericShow a
instance decodeSubjectAccessReview :: Decode SubjectAccessReview where
  decode a = do
               apiVersion <- readProp "apiVersion" a >>= decode
               kind <- readProp "kind" a >>= decode
               metadata <- readProp "metadata" a >>= decode
               spec <- readProp "spec" a >>= decode
               status <- readProp "status" a >>= decode
               pure $ SubjectAccessReview { apiVersion, kind, metadata, spec, status }
instance encodeSubjectAccessReview :: Encode SubjectAccessReview where
  encode (SubjectAccessReview a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode a.apiVersion)
               , Tuple "kind" (encode a.kind)
               , Tuple "metadata" (encode a.metadata)
               , Tuple "spec" (encode a.spec)
               , Tuple "status" (encode a.status) ]


instance defaultSubjectAccessReview :: Default SubjectAccessReview where
  default = SubjectAccessReview
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | SubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
-- |
-- | Fields:
-- | - `extra`: Extra corresponds to the user.Info.GetExtra() method from the authenticator.  Since that is input to the authorizer it needs a reflection here.
-- | - `group`: Groups is the groups you're testing for.
-- | - `nonResourceAttributes`: NonResourceAttributes describes information for a non-resource access request
-- | - `resourceAttributes`: ResourceAuthorizationAttributes describes information for a resource access request
-- | - `uid`: UID information about the requesting user.
-- | - `user`: User is the user you're testing for. If you specify "User" but not "Group", then is it interpreted as "What if User were not a member of any groups
newtype SubjectAccessReviewSpec = SubjectAccessReviewSpec
  { extra :: (NullOrUndefined (StrMap (Array String)))
  , group :: (NullOrUndefined (Array String))
  , nonResourceAttributes :: (NullOrUndefined NonResourceAttributes)
  , resourceAttributes :: (NullOrUndefined ResourceAttributes)
  , uid :: (NullOrUndefined String)
  , user :: (NullOrUndefined String) }

derive instance newtypeSubjectAccessReviewSpec :: Newtype SubjectAccessReviewSpec _
derive instance genericSubjectAccessReviewSpec :: Generic SubjectAccessReviewSpec _
instance showSubjectAccessReviewSpec :: Show SubjectAccessReviewSpec where show a = genericShow a
instance decodeSubjectAccessReviewSpec :: Decode SubjectAccessReviewSpec where
  decode a = do
               extra <- readProp "extra" a >>= decode
               group <- readProp "group" a >>= decode
               nonResourceAttributes <- readProp "nonResourceAttributes" a >>= decode
               resourceAttributes <- readProp "resourceAttributes" a >>= decode
               uid <- readProp "uid" a >>= decode
               user <- readProp "user" a >>= decode
               pure $ SubjectAccessReviewSpec { extra, group, nonResourceAttributes, resourceAttributes, uid, user }
instance encodeSubjectAccessReviewSpec :: Encode SubjectAccessReviewSpec where
  encode (SubjectAccessReviewSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "extra" (encode a.extra)
               , Tuple "group" (encode a.group)
               , Tuple "nonResourceAttributes" (encode a.nonResourceAttributes)
               , Tuple "resourceAttributes" (encode a.resourceAttributes)
               , Tuple "uid" (encode a.uid)
               , Tuple "user" (encode a.user) ]


instance defaultSubjectAccessReviewSpec :: Default SubjectAccessReviewSpec where
  default = SubjectAccessReviewSpec
    { extra: NullOrUndefined Nothing
    , group: NullOrUndefined Nothing
    , nonResourceAttributes: NullOrUndefined Nothing
    , resourceAttributes: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | SubjectAccessReviewStatus
-- |
-- | Fields:
-- | - `allowed`: Allowed is required. True if the action would be allowed, false otherwise.
-- | - `denied`: Denied is optional. True if the action would be denied, otherwise false. If both allowed is false and denied is false, then the authorizer has no opinion on whether to authorize the action. Denied may not be true if Allowed is true.
-- | - `evaluationError`: EvaluationError is an indication that some error occurred during the authorization check. It is entirely possible to get an error and be able to continue determine authorization status in spite of it. For instance, RBAC can be missing a role, but enough roles are still present and bound to reason about the request.
-- | - `reason`: Reason is optional.  It indicates why a request was allowed or denied.
newtype SubjectAccessReviewStatus = SubjectAccessReviewStatus
  { allowed :: (NullOrUndefined Boolean)
  , denied :: (NullOrUndefined Boolean)
  , evaluationError :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String) }

derive instance newtypeSubjectAccessReviewStatus :: Newtype SubjectAccessReviewStatus _
derive instance genericSubjectAccessReviewStatus :: Generic SubjectAccessReviewStatus _
instance showSubjectAccessReviewStatus :: Show SubjectAccessReviewStatus where show a = genericShow a
instance decodeSubjectAccessReviewStatus :: Decode SubjectAccessReviewStatus where
  decode a = do
               allowed <- readProp "allowed" a >>= decode
               denied <- readProp "denied" a >>= decode
               evaluationError <- readProp "evaluationError" a >>= decode
               reason <- readProp "reason" a >>= decode
               pure $ SubjectAccessReviewStatus { allowed, denied, evaluationError, reason }
instance encodeSubjectAccessReviewStatus :: Encode SubjectAccessReviewStatus where
  encode (SubjectAccessReviewStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "allowed" (encode a.allowed)
               , Tuple "denied" (encode a.denied)
               , Tuple "evaluationError" (encode a.evaluationError)
               , Tuple "reason" (encode a.reason) ]


instance defaultSubjectAccessReviewStatus :: Default SubjectAccessReviewStatus where
  default = SubjectAccessReviewStatus
    { allowed: NullOrUndefined Nothing
    , denied: NullOrUndefined Nothing
    , evaluationError: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing }

-- | SubjectRulesReviewStatus contains the result of a rules check. This check can be incomplete depending on the set of authorizers the server is configured with and any errors experienced during evaluation. Because authorization rules are additive, if a rule appears in a list it's safe to assume the subject has that permission, even if that list is incomplete.
-- |
-- | Fields:
-- | - `evaluationError`: EvaluationError can appear in combination with Rules. It indicates an error occurred during rule evaluation, such as an authorizer that doesn't support rule evaluation, and that ResourceRules and/or NonResourceRules may be incomplete.
-- | - `incomplete`: Incomplete is true when the rules returned by this call are incomplete. This is most commonly encountered when an authorizer, such as an external authorizer, doesn't support rules evaluation.
-- | - `nonResourceRules`: NonResourceRules is the list of actions the subject is allowed to perform on non-resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
-- | - `resourceRules`: ResourceRules is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
newtype SubjectRulesReviewStatus = SubjectRulesReviewStatus
  { evaluationError :: (NullOrUndefined String)
  , incomplete :: (NullOrUndefined Boolean)
  , nonResourceRules :: (NullOrUndefined (Array NonResourceRule))
  , resourceRules :: (NullOrUndefined (Array ResourceRule)) }

derive instance newtypeSubjectRulesReviewStatus :: Newtype SubjectRulesReviewStatus _
derive instance genericSubjectRulesReviewStatus :: Generic SubjectRulesReviewStatus _
instance showSubjectRulesReviewStatus :: Show SubjectRulesReviewStatus where show a = genericShow a
instance decodeSubjectRulesReviewStatus :: Decode SubjectRulesReviewStatus where
  decode a = do
               evaluationError <- readProp "evaluationError" a >>= decode
               incomplete <- readProp "incomplete" a >>= decode
               nonResourceRules <- readProp "nonResourceRules" a >>= decode
               resourceRules <- readProp "resourceRules" a >>= decode
               pure $ SubjectRulesReviewStatus { evaluationError, incomplete, nonResourceRules, resourceRules }
instance encodeSubjectRulesReviewStatus :: Encode SubjectRulesReviewStatus where
  encode (SubjectRulesReviewStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "evaluationError" (encode a.evaluationError)
               , Tuple "incomplete" (encode a.incomplete)
               , Tuple "nonResourceRules" (encode a.nonResourceRules)
               , Tuple "resourceRules" (encode a.resourceRules) ]


instance defaultSubjectRulesReviewStatus :: Default SubjectRulesReviewStatus where
  default = SubjectRulesReviewStatus
    { evaluationError: NullOrUndefined Nothing
    , incomplete: NullOrUndefined Nothing
    , nonResourceRules: NullOrUndefined Nothing
    , resourceRules: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/authorization.k8s.io/v1beta1/"