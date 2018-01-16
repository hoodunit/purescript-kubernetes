module Kubernetes.Api.AuthorizationV1Beta1 where

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
  decode a = genericDecode jsonOptions a 
instance encodeLocalSubjectAccessReview :: Encode LocalSubjectAccessReview where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeNonResourceAttributes :: Encode NonResourceAttributes where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeNonResourceRule :: Encode NonResourceRule where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeResourceAttributes :: Encode ResourceAttributes where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeResourceRule :: Encode ResourceRule where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeSelfSubjectAccessReview :: Encode SelfSubjectAccessReview where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeSelfSubjectAccessReviewSpec :: Encode SelfSubjectAccessReviewSpec where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeSelfSubjectRulesReview :: Encode SelfSubjectRulesReview where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeSelfSubjectRulesReviewSpec :: Encode SelfSubjectRulesReviewSpec where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeSubjectAccessReview :: Encode SubjectAccessReview where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeSubjectAccessReviewSpec :: Encode SubjectAccessReviewSpec where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeSubjectAccessReviewStatus :: Encode SubjectAccessReviewStatus where
  encode a = genericEncode jsonOptions a

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
  decode a = genericDecode jsonOptions a 
instance encodeSubjectRulesReviewStatus :: Encode SubjectRulesReviewStatus where
  encode a = genericEncode jsonOptions a

instance defaultSubjectRulesReviewStatus :: Default SubjectRulesReviewStatus where
  default = SubjectRulesReviewStatus
    { evaluationError: NullOrUndefined Nothing
    , incomplete: NullOrUndefined Nothing
    , nonResourceRules: NullOrUndefined Nothing
    , resourceRules: NullOrUndefined Nothing }

-- | create a LocalSubjectAccessReview
createNamespacedLocalSubjectAccessReview :: forall e. Config -> LocalSubjectAccessReview -> Aff (http :: HTTP | e) (Either MetaV1.Status LocalSubjectAccessReview)
createNamespacedLocalSubjectAccessReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1beta1/namespaces/{namespace}/localsubjectaccessreviews"
    encodedBody = encodeJSON body

-- | create a SelfSubjectAccessReview
createSelfSubjectAccessReview :: forall e. Config -> SelfSubjectAccessReview -> Aff (http :: HTTP | e) (Either MetaV1.Status SelfSubjectAccessReview)
createSelfSubjectAccessReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1beta1/selfsubjectaccessreviews"
    encodedBody = encodeJSON body

-- | create a SelfSubjectRulesReview
createSelfSubjectRulesReview :: forall e. Config -> SelfSubjectRulesReview -> Aff (http :: HTTP | e) (Either MetaV1.Status SelfSubjectRulesReview)
createSelfSubjectRulesReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1beta1/selfsubjectrulesreviews"
    encodedBody = encodeJSON body

-- | create a SubjectAccessReview
createSubjectAccessReview :: forall e. Config -> SubjectAccessReview -> Aff (http :: HTTP | e) (Either MetaV1.Status SubjectAccessReview)
createSubjectAccessReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1beta1/subjectaccessreviews"
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/authorization.k8s.io/v1beta1/"