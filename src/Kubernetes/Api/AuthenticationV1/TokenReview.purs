module Kubernetes.Api.AuthenticationV1.TokenReview where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Kubernetes.Api.AuthenticationV1 as AuthenticationV1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a TokenReview
createTokenReview :: forall e. Config -> AuthenticationV1.TokenReview -> Aff (http :: HTTP | e) (Either MetaV1.Status AuthenticationV1.TokenReview)
createTokenReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authentication.k8s.io/v1/tokenreviews"
    encodedBody = encodeJSON body