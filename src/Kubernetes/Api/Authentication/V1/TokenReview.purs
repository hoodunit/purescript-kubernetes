module Kubernetes.Api.Authentication.V1.TokenReview where

import Prelude
import Prelude
import Data.Either (Either(Left,Right))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(Tuple))
import Effect.Aff (Aff)
import Foreign.Class (class Decode, class Encode, encode, decode)
import Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Authentication.V1 as AuthenticationV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | create a TokenReview
create :: Config -> AuthenticationV1.TokenReview -> Aff (Either MetaV1.Status AuthenticationV1.TokenReview)
create cfg body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/apis/authentication.k8s.io/v1/tokenreviews"
    encodedBody = encodeJSON body