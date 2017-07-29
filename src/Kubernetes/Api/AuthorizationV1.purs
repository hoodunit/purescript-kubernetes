module Kubernetes.Api.AuthorizationV1 where

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

-- | create a LocalSubjectAccessReview
createNamespacedLocalSubjectAccessReview :: forall e. Config -> LocalSubjectAccessReview -> Aff (http :: HTTP | e) (Either MetaV1.Status LocalSubjectAccessReview)
createNamespacedLocalSubjectAccessReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1/namespaces/{namespace}/localsubjectaccessreviews"
    encodedBody = encodeJSON body

-- | create a SelfSubjectAccessReview
createSelfSubjectAccessReview :: forall e. Config -> SelfSubjectAccessReview -> Aff (http :: HTTP | e) (Either MetaV1.Status SelfSubjectAccessReview)
createSelfSubjectAccessReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1/selfsubjectaccessreviews"
    encodedBody = encodeJSON body

-- | create a SelfSubjectRulesReview
createSelfSubjectRulesReview :: forall e. Config -> SelfSubjectRulesReview -> Aff (http :: HTTP | e) (Either MetaV1.Status SelfSubjectRulesReview)
createSelfSubjectRulesReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1/selfsubjectrulesreviews"
    encodedBody = encodeJSON body

-- | create a SubjectAccessReview
createSubjectAccessReview :: forall e. Config -> SubjectAccessReview -> Aff (http :: HTTP | e) (Either MetaV1.Status SubjectAccessReview)
createSubjectAccessReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1/subjectaccessreviews"
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/authorization.k8s.io/v1/"

-- | io.k8s.api.authorization.v1.LocalSubjectAccessReview
-- | LocalSubjectAccessReview checks whether or not a user or group can perform an action in a given namespace. Having a namespace scoped resource makes it much easier to grant namespace scoped policy that includes permissions checking.
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

-- | io.k8s.api.authorization.v1.NonResourceAttributes
-- | NonResourceAttributes includes the authorization attributes available for non-resource requests to the Authorizer interface
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

-- | io.k8s.api.authorization.v1.NonResourceRule
-- | NonResourceRule holds information that describes a rule for the non-resource
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

-- | io.k8s.api.authorization.v1.ResourceAttributes
-- | ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface
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

-- | io.k8s.api.authorization.v1.ResourceRule
-- | ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
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

-- | io.k8s.api.authorization.v1.SelfSubjectAccessReview
-- | SelfSubjectAccessReview checks whether or the current user can perform an action.  Not filling in a spec.namespace means "in all namespaces".  Self is a special case, because users should always be able to check whether they can perform an action
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

-- | io.k8s.api.authorization.v1.SelfSubjectAccessReviewSpec
-- | SelfSubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
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

-- | io.k8s.api.authorization.v1.SelfSubjectRulesReview
-- | SelfSubjectRulesReview enumerates the set of actions the current user can perform within a namespace. The returned list of actions may be incomplete depending on the server's authorization mode, and any errors experienced during the evaluation. SelfSubjectRulesReview should be used by UIs to show/hide actions, or to quickly let an end user reason about their permissions. It should NOT Be used by external systems to drive authorization decisions as this raises confused deputy, cache lifetime/revocation, and correctness concerns. SubjectAccessReview, and LocalAccessReview are the correct way to defer authorization decisions to the API server.
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

-- | io.k8s.api.authorization.v1.SelfSubjectRulesReviewSpec
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

-- | io.k8s.api.authorization.v1.SubjectAccessReview
-- | SubjectAccessReview checks whether or not a user or group can perform an action.
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

-- | io.k8s.api.authorization.v1.SubjectAccessReviewSpec
-- | SubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
newtype SubjectAccessReviewSpec = SubjectAccessReviewSpec
  { extra :: (NullOrUndefined (StrMap (Array String)))
  , groups :: (NullOrUndefined (Array String))
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
    , groups: NullOrUndefined Nothing
    , nonResourceAttributes: NullOrUndefined Nothing
    , resourceAttributes: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | io.k8s.api.authorization.v1.SubjectAccessReviewStatus
-- | SubjectAccessReviewStatus
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

-- | io.k8s.api.authorization.v1.SubjectRulesReviewStatus
-- | SubjectRulesReviewStatus contains the result of a rules check. This check can be incomplete depending on the set of authorizers the server is configured with and any errors experienced during evaluation. Because authorization rules are additive, if a rule appears in a list it's safe to assume the subject has that permission, even if that list is incomplete.
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