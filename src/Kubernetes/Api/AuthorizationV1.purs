module Kubernetes.Api.AuthorizationV1 where

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

-- | LocalSubjectAccessReview checks whether or not a user or group can perform an action in a given namespace. Having a namespace scoped resource makes it much easier to grant namespace scoped policy that includes permissions checking.
-- |
-- | Fields:
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated.  spec.namespace must be equal to the namespace you made the request against.  If empty, it is defaulted.
-- | - `status`: Status is filled in by the server and indicates whether the request is allowed or not
newtype LocalSubjectAccessReview = LocalSubjectAccessReview
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe SubjectAccessReviewSpec)
  , status :: (Maybe SubjectAccessReviewStatus) }

derive instance newtypeLocalSubjectAccessReview :: Newtype LocalSubjectAccessReview _
derive instance genericLocalSubjectAccessReview :: Generic LocalSubjectAccessReview _
instance showLocalSubjectAccessReview :: Show LocalSubjectAccessReview where show a = genericShow a
instance decodeLocalSubjectAccessReview :: Decode LocalSubjectAccessReview where
  decode a = do
               assertPropEq "apiVersion" "authorization.k8s.io/v1" a
               assertPropEq "kind" "LocalSubjectAccessReview" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ LocalSubjectAccessReview { metadata, spec, status }
instance encodeLocalSubjectAccessReview :: Encode LocalSubjectAccessReview where
  encode (LocalSubjectAccessReview a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "authorization.k8s.io/v1")
               , Tuple "kind" (encode "LocalSubjectAccessReview")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultLocalSubjectAccessReview :: Default LocalSubjectAccessReview where
  default = LocalSubjectAccessReview
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | NonResourceAttributes includes the authorization attributes available for non-resource requests to the Authorizer interface
-- |
-- | Fields:
-- | - `path`: Path is the URL path of the request
-- | - `verb`: Verb is the standard HTTP verb
newtype NonResourceAttributes = NonResourceAttributes
  { path :: (Maybe String)
  , verb :: (Maybe String) }

derive instance newtypeNonResourceAttributes :: Newtype NonResourceAttributes _
derive instance genericNonResourceAttributes :: Generic NonResourceAttributes _
instance showNonResourceAttributes :: Show NonResourceAttributes where show a = genericShow a
instance decodeNonResourceAttributes :: Decode NonResourceAttributes where
  decode a = do
               path <- decodeMaybe "path" a
               verb <- decodeMaybe "verb" a
               pure $ NonResourceAttributes { path, verb }
instance encodeNonResourceAttributes :: Encode NonResourceAttributes where
  encode (NonResourceAttributes a) = encode $ StrMap.fromFoldable $
               [ Tuple "path" (encodeMaybe a.path)
               , Tuple "verb" (encodeMaybe a.verb) ]


instance defaultNonResourceAttributes :: Default NonResourceAttributes where
  default = NonResourceAttributes
    { path: Nothing
    , verb: Nothing }

-- | NonResourceRule holds information that describes a rule for the non-resource
-- |
-- | Fields:
-- | - `nonResourceURLs`: NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path.  "*" means all.
-- | - `verbs`: Verb is a list of kubernetes non-resource API verbs, like: get, post, put, delete, patch, head, options.  "*" means all.
newtype NonResourceRule = NonResourceRule
  { nonResourceURLs :: (Maybe (Array String))
  , verbs :: (Maybe (Array String)) }

derive instance newtypeNonResourceRule :: Newtype NonResourceRule _
derive instance genericNonResourceRule :: Generic NonResourceRule _
instance showNonResourceRule :: Show NonResourceRule where show a = genericShow a
instance decodeNonResourceRule :: Decode NonResourceRule where
  decode a = do
               nonResourceURLs <- decodeMaybe "nonResourceURLs" a
               verbs <- decodeMaybe "verbs" a
               pure $ NonResourceRule { nonResourceURLs, verbs }
instance encodeNonResourceRule :: Encode NonResourceRule where
  encode (NonResourceRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "nonResourceURLs" (encodeMaybe a.nonResourceURLs)
               , Tuple "verbs" (encodeMaybe a.verbs) ]


instance defaultNonResourceRule :: Default NonResourceRule where
  default = NonResourceRule
    { nonResourceURLs: Nothing
    , verbs: Nothing }

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
  { group :: (Maybe String)
  , name :: (Maybe String)
  , namespace :: (Maybe String)
  , resource :: (Maybe String)
  , subresource :: (Maybe String)
  , verb :: (Maybe String)
  , version :: (Maybe String) }

derive instance newtypeResourceAttributes :: Newtype ResourceAttributes _
derive instance genericResourceAttributes :: Generic ResourceAttributes _
instance showResourceAttributes :: Show ResourceAttributes where show a = genericShow a
instance decodeResourceAttributes :: Decode ResourceAttributes where
  decode a = do
               group <- decodeMaybe "group" a
               name <- decodeMaybe "name" a
               namespace <- decodeMaybe "namespace" a
               resource <- decodeMaybe "resource" a
               subresource <- decodeMaybe "subresource" a
               verb <- decodeMaybe "verb" a
               version <- decodeMaybe "version" a
               pure $ ResourceAttributes { group, name, namespace, resource, subresource, verb, version }
instance encodeResourceAttributes :: Encode ResourceAttributes where
  encode (ResourceAttributes a) = encode $ StrMap.fromFoldable $
               [ Tuple "group" (encodeMaybe a.group)
               , Tuple "name" (encodeMaybe a.name)
               , Tuple "namespace" (encodeMaybe a.namespace)
               , Tuple "resource" (encodeMaybe a.resource)
               , Tuple "subresource" (encodeMaybe a.subresource)
               , Tuple "verb" (encodeMaybe a.verb)
               , Tuple "version" (encodeMaybe a.version) ]


instance defaultResourceAttributes :: Default ResourceAttributes where
  default = ResourceAttributes
    { group: Nothing
    , name: Nothing
    , namespace: Nothing
    , resource: Nothing
    , subresource: Nothing
    , verb: Nothing
    , version: Nothing }

-- | ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
-- |
-- | Fields:
-- | - `apiGroups`: APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.  "*" means all.
-- | - `resourceNames`: ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.  "*" means all.
-- | - `resources`: Resources is a list of resources this rule applies to.  "*" means all in the specified apiGroups.
-- |     "*/foo" represents the subresource 'foo' for all resources in the specified apiGroups.
-- | - `verbs`: Verb is a list of kubernetes resource API verbs, like: get, list, watch, create, update, delete, proxy.  "*" means all.
newtype ResourceRule = ResourceRule
  { apiGroups :: (Maybe (Array String))
  , resourceNames :: (Maybe (Array String))
  , resources :: (Maybe (Array String))
  , verbs :: (Maybe (Array String)) }

derive instance newtypeResourceRule :: Newtype ResourceRule _
derive instance genericResourceRule :: Generic ResourceRule _
instance showResourceRule :: Show ResourceRule where show a = genericShow a
instance decodeResourceRule :: Decode ResourceRule where
  decode a = do
               apiGroups <- decodeMaybe "apiGroups" a
               resourceNames <- decodeMaybe "resourceNames" a
               resources <- decodeMaybe "resources" a
               verbs <- decodeMaybe "verbs" a
               pure $ ResourceRule { apiGroups, resourceNames, resources, verbs }
instance encodeResourceRule :: Encode ResourceRule where
  encode (ResourceRule a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiGroups" (encodeMaybe a.apiGroups)
               , Tuple "resourceNames" (encodeMaybe a.resourceNames)
               , Tuple "resources" (encodeMaybe a.resources)
               , Tuple "verbs" (encodeMaybe a.verbs) ]


instance defaultResourceRule :: Default ResourceRule where
  default = ResourceRule
    { apiGroups: Nothing
    , resourceNames: Nothing
    , resources: Nothing
    , verbs: Nothing }

-- | SelfSubjectAccessReview checks whether or the current user can perform an action.  Not filling in a spec.namespace means "in all namespaces".  Self is a special case, because users should always be able to check whether they can perform an action
-- |
-- | Fields:
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated.  user and groups must be empty
-- | - `status`: Status is filled in by the server and indicates whether the request is allowed or not
newtype SelfSubjectAccessReview = SelfSubjectAccessReview
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe SelfSubjectAccessReviewSpec)
  , status :: (Maybe SubjectAccessReviewStatus) }

derive instance newtypeSelfSubjectAccessReview :: Newtype SelfSubjectAccessReview _
derive instance genericSelfSubjectAccessReview :: Generic SelfSubjectAccessReview _
instance showSelfSubjectAccessReview :: Show SelfSubjectAccessReview where show a = genericShow a
instance decodeSelfSubjectAccessReview :: Decode SelfSubjectAccessReview where
  decode a = do
               assertPropEq "apiVersion" "authorization.k8s.io/v1" a
               assertPropEq "kind" "SelfSubjectAccessReview" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ SelfSubjectAccessReview { metadata, spec, status }
instance encodeSelfSubjectAccessReview :: Encode SelfSubjectAccessReview where
  encode (SelfSubjectAccessReview a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "authorization.k8s.io/v1")
               , Tuple "kind" (encode "SelfSubjectAccessReview")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultSelfSubjectAccessReview :: Default SelfSubjectAccessReview where
  default = SelfSubjectAccessReview
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | SelfSubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
-- |
-- | Fields:
-- | - `nonResourceAttributes`: NonResourceAttributes describes information for a non-resource access request
-- | - `resourceAttributes`: ResourceAuthorizationAttributes describes information for a resource access request
newtype SelfSubjectAccessReviewSpec = SelfSubjectAccessReviewSpec
  { nonResourceAttributes :: (Maybe NonResourceAttributes)
  , resourceAttributes :: (Maybe ResourceAttributes) }

derive instance newtypeSelfSubjectAccessReviewSpec :: Newtype SelfSubjectAccessReviewSpec _
derive instance genericSelfSubjectAccessReviewSpec :: Generic SelfSubjectAccessReviewSpec _
instance showSelfSubjectAccessReviewSpec :: Show SelfSubjectAccessReviewSpec where show a = genericShow a
instance decodeSelfSubjectAccessReviewSpec :: Decode SelfSubjectAccessReviewSpec where
  decode a = do
               nonResourceAttributes <- decodeMaybe "nonResourceAttributes" a
               resourceAttributes <- decodeMaybe "resourceAttributes" a
               pure $ SelfSubjectAccessReviewSpec { nonResourceAttributes, resourceAttributes }
instance encodeSelfSubjectAccessReviewSpec :: Encode SelfSubjectAccessReviewSpec where
  encode (SelfSubjectAccessReviewSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "nonResourceAttributes" (encodeMaybe a.nonResourceAttributes)
               , Tuple "resourceAttributes" (encodeMaybe a.resourceAttributes) ]


instance defaultSelfSubjectAccessReviewSpec :: Default SelfSubjectAccessReviewSpec where
  default = SelfSubjectAccessReviewSpec
    { nonResourceAttributes: Nothing
    , resourceAttributes: Nothing }

-- | SelfSubjectRulesReview enumerates the set of actions the current user can perform within a namespace. The returned list of actions may be incomplete depending on the server's authorization mode, and any errors experienced during the evaluation. SelfSubjectRulesReview should be used by UIs to show/hide actions, or to quickly let an end user reason about their permissions. It should NOT Be used by external systems to drive authorization decisions as this raises confused deputy, cache lifetime/revocation, and correctness concerns. SubjectAccessReview, and LocalAccessReview are the correct way to defer authorization decisions to the API server.
-- |
-- | Fields:
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated.
-- | - `status`: Status is filled in by the server and indicates the set of actions a user can perform.
newtype SelfSubjectRulesReview = SelfSubjectRulesReview
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe SelfSubjectRulesReviewSpec)
  , status :: (Maybe SubjectRulesReviewStatus) }

derive instance newtypeSelfSubjectRulesReview :: Newtype SelfSubjectRulesReview _
derive instance genericSelfSubjectRulesReview :: Generic SelfSubjectRulesReview _
instance showSelfSubjectRulesReview :: Show SelfSubjectRulesReview where show a = genericShow a
instance decodeSelfSubjectRulesReview :: Decode SelfSubjectRulesReview where
  decode a = do
               assertPropEq "apiVersion" "authorization.k8s.io/v1" a
               assertPropEq "kind" "SelfSubjectRulesReview" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ SelfSubjectRulesReview { metadata, spec, status }
instance encodeSelfSubjectRulesReview :: Encode SelfSubjectRulesReview where
  encode (SelfSubjectRulesReview a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "authorization.k8s.io/v1")
               , Tuple "kind" (encode "SelfSubjectRulesReview")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultSelfSubjectRulesReview :: Default SelfSubjectRulesReview where
  default = SelfSubjectRulesReview
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | Fields:
-- | - `namespace`: Namespace to evaluate rules for. Required.
newtype SelfSubjectRulesReviewSpec = SelfSubjectRulesReviewSpec
  { namespace :: (Maybe String) }

derive instance newtypeSelfSubjectRulesReviewSpec :: Newtype SelfSubjectRulesReviewSpec _
derive instance genericSelfSubjectRulesReviewSpec :: Generic SelfSubjectRulesReviewSpec _
instance showSelfSubjectRulesReviewSpec :: Show SelfSubjectRulesReviewSpec where show a = genericShow a
instance decodeSelfSubjectRulesReviewSpec :: Decode SelfSubjectRulesReviewSpec where
  decode a = do
               namespace <- decodeMaybe "namespace" a
               pure $ SelfSubjectRulesReviewSpec { namespace }
instance encodeSelfSubjectRulesReviewSpec :: Encode SelfSubjectRulesReviewSpec where
  encode (SelfSubjectRulesReviewSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "namespace" (encodeMaybe a.namespace) ]


instance defaultSelfSubjectRulesReviewSpec :: Default SelfSubjectRulesReviewSpec where
  default = SelfSubjectRulesReviewSpec
    { namespace: Nothing }

-- | SubjectAccessReview checks whether or not a user or group can perform an action.
-- |
-- | Fields:
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated
-- | - `status`: Status is filled in by the server and indicates whether the request is allowed or not
newtype SubjectAccessReview = SubjectAccessReview
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe SubjectAccessReviewSpec)
  , status :: (Maybe SubjectAccessReviewStatus) }

derive instance newtypeSubjectAccessReview :: Newtype SubjectAccessReview _
derive instance genericSubjectAccessReview :: Generic SubjectAccessReview _
instance showSubjectAccessReview :: Show SubjectAccessReview where show a = genericShow a
instance decodeSubjectAccessReview :: Decode SubjectAccessReview where
  decode a = do
               assertPropEq "apiVersion" "authorization.k8s.io/v1" a
               assertPropEq "kind" "SubjectAccessReview" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ SubjectAccessReview { metadata, spec, status }
instance encodeSubjectAccessReview :: Encode SubjectAccessReview where
  encode (SubjectAccessReview a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "authorization.k8s.io/v1")
               , Tuple "kind" (encode "SubjectAccessReview")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultSubjectAccessReview :: Default SubjectAccessReview where
  default = SubjectAccessReview
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | SubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
-- |
-- | Fields:
-- | - `extra`: Extra corresponds to the user.Info.GetExtra() method from the authenticator.  Since that is input to the authorizer it needs a reflection here.
-- | - `groups`: Groups is the groups you're testing for.
-- | - `nonResourceAttributes`: NonResourceAttributes describes information for a non-resource access request
-- | - `resourceAttributes`: ResourceAuthorizationAttributes describes information for a resource access request
-- | - `uid`: UID information about the requesting user.
-- | - `user`: User is the user you're testing for. If you specify "User" but not "Groups", then is it interpreted as "What if User were not a member of any groups
newtype SubjectAccessReviewSpec = SubjectAccessReviewSpec
  { extra :: (Maybe (StrMap (Array String)))
  , groups :: (Maybe (Array String))
  , nonResourceAttributes :: (Maybe NonResourceAttributes)
  , resourceAttributes :: (Maybe ResourceAttributes)
  , uid :: (Maybe String)
  , user :: (Maybe String) }

derive instance newtypeSubjectAccessReviewSpec :: Newtype SubjectAccessReviewSpec _
derive instance genericSubjectAccessReviewSpec :: Generic SubjectAccessReviewSpec _
instance showSubjectAccessReviewSpec :: Show SubjectAccessReviewSpec where show a = genericShow a
instance decodeSubjectAccessReviewSpec :: Decode SubjectAccessReviewSpec where
  decode a = do
               extra <- decodeMaybe "extra" a
               groups <- decodeMaybe "groups" a
               nonResourceAttributes <- decodeMaybe "nonResourceAttributes" a
               resourceAttributes <- decodeMaybe "resourceAttributes" a
               uid <- decodeMaybe "uid" a
               user <- decodeMaybe "user" a
               pure $ SubjectAccessReviewSpec { extra, groups, nonResourceAttributes, resourceAttributes, uid, user }
instance encodeSubjectAccessReviewSpec :: Encode SubjectAccessReviewSpec where
  encode (SubjectAccessReviewSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "extra" (encodeMaybe a.extra)
               , Tuple "groups" (encodeMaybe a.groups)
               , Tuple "nonResourceAttributes" (encodeMaybe a.nonResourceAttributes)
               , Tuple "resourceAttributes" (encodeMaybe a.resourceAttributes)
               , Tuple "uid" (encodeMaybe a.uid)
               , Tuple "user" (encodeMaybe a.user) ]


instance defaultSubjectAccessReviewSpec :: Default SubjectAccessReviewSpec where
  default = SubjectAccessReviewSpec
    { extra: Nothing
    , groups: Nothing
    , nonResourceAttributes: Nothing
    , resourceAttributes: Nothing
    , uid: Nothing
    , user: Nothing }

-- | SubjectAccessReviewStatus
-- |
-- | Fields:
-- | - `allowed`: Allowed is required. True if the action would be allowed, false otherwise.
-- | - `denied`: Denied is optional. True if the action would be denied, otherwise false. If both allowed is false and denied is false, then the authorizer has no opinion on whether to authorize the action. Denied may not be true if Allowed is true.
-- | - `evaluationError`: EvaluationError is an indication that some error occurred during the authorization check. It is entirely possible to get an error and be able to continue determine authorization status in spite of it. For instance, RBAC can be missing a role, but enough roles are still present and bound to reason about the request.
-- | - `reason`: Reason is optional.  It indicates why a request was allowed or denied.
newtype SubjectAccessReviewStatus = SubjectAccessReviewStatus
  { allowed :: (Maybe Boolean)
  , denied :: (Maybe Boolean)
  , evaluationError :: (Maybe String)
  , reason :: (Maybe String) }

derive instance newtypeSubjectAccessReviewStatus :: Newtype SubjectAccessReviewStatus _
derive instance genericSubjectAccessReviewStatus :: Generic SubjectAccessReviewStatus _
instance showSubjectAccessReviewStatus :: Show SubjectAccessReviewStatus where show a = genericShow a
instance decodeSubjectAccessReviewStatus :: Decode SubjectAccessReviewStatus where
  decode a = do
               allowed <- decodeMaybe "allowed" a
               denied <- decodeMaybe "denied" a
               evaluationError <- decodeMaybe "evaluationError" a
               reason <- decodeMaybe "reason" a
               pure $ SubjectAccessReviewStatus { allowed, denied, evaluationError, reason }
instance encodeSubjectAccessReviewStatus :: Encode SubjectAccessReviewStatus where
  encode (SubjectAccessReviewStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "allowed" (encodeMaybe a.allowed)
               , Tuple "denied" (encodeMaybe a.denied)
               , Tuple "evaluationError" (encodeMaybe a.evaluationError)
               , Tuple "reason" (encodeMaybe a.reason) ]


instance defaultSubjectAccessReviewStatus :: Default SubjectAccessReviewStatus where
  default = SubjectAccessReviewStatus
    { allowed: Nothing
    , denied: Nothing
    , evaluationError: Nothing
    , reason: Nothing }

-- | SubjectRulesReviewStatus contains the result of a rules check. This check can be incomplete depending on the set of authorizers the server is configured with and any errors experienced during evaluation. Because authorization rules are additive, if a rule appears in a list it's safe to assume the subject has that permission, even if that list is incomplete.
-- |
-- | Fields:
-- | - `evaluationError`: EvaluationError can appear in combination with Rules. It indicates an error occurred during rule evaluation, such as an authorizer that doesn't support rule evaluation, and that ResourceRules and/or NonResourceRules may be incomplete.
-- | - `incomplete`: Incomplete is true when the rules returned by this call are incomplete. This is most commonly encountered when an authorizer, such as an external authorizer, doesn't support rules evaluation.
-- | - `nonResourceRules`: NonResourceRules is the list of actions the subject is allowed to perform on non-resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
-- | - `resourceRules`: ResourceRules is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
newtype SubjectRulesReviewStatus = SubjectRulesReviewStatus
  { evaluationError :: (Maybe String)
  , incomplete :: (Maybe Boolean)
  , nonResourceRules :: (Maybe (Array NonResourceRule))
  , resourceRules :: (Maybe (Array ResourceRule)) }

derive instance newtypeSubjectRulesReviewStatus :: Newtype SubjectRulesReviewStatus _
derive instance genericSubjectRulesReviewStatus :: Generic SubjectRulesReviewStatus _
instance showSubjectRulesReviewStatus :: Show SubjectRulesReviewStatus where show a = genericShow a
instance decodeSubjectRulesReviewStatus :: Decode SubjectRulesReviewStatus where
  decode a = do
               evaluationError <- decodeMaybe "evaluationError" a
               incomplete <- decodeMaybe "incomplete" a
               nonResourceRules <- decodeMaybe "nonResourceRules" a
               resourceRules <- decodeMaybe "resourceRules" a
               pure $ SubjectRulesReviewStatus { evaluationError, incomplete, nonResourceRules, resourceRules }
instance encodeSubjectRulesReviewStatus :: Encode SubjectRulesReviewStatus where
  encode (SubjectRulesReviewStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "evaluationError" (encodeMaybe a.evaluationError)
               , Tuple "incomplete" (encodeMaybe a.incomplete)
               , Tuple "nonResourceRules" (encodeMaybe a.nonResourceRules)
               , Tuple "resourceRules" (encodeMaybe a.resourceRules) ]


instance defaultSubjectRulesReviewStatus :: Default SubjectRulesReviewStatus where
  default = SubjectRulesReviewStatus
    { evaluationError: Nothing
    , incomplete: Nothing
    , nonResourceRules: Nothing
    , resourceRules: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/authorization.k8s.io/v1/"