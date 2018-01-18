module Kubernetes.Api.AuthorizationV1Beta1.SelfSubjectRulesReview where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Index (readProp)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Kubernetes.Api.AuthorizationV1Beta1 as AuthorizationV1Beta1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a SelfSubjectRulesReview
createSelfSubjectRulesReview :: forall e. Config -> AuthorizationV1Beta1.SelfSubjectRulesReview -> Aff (http :: HTTP | e) (Either MetaV1.Status AuthorizationV1Beta1.SelfSubjectRulesReview)
createSelfSubjectRulesReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1beta1/selfsubjectrulesreviews"
    encodedBody = encodeJSON body