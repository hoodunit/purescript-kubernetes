module Kubernetes.Api.AuthenticationV1.TokenReview where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Index (readProp)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Node.HTTP (HTTP)
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.AuthenticationV1 as AuthenticationV1
import Kubernetes.Api.MetaV1 as MetaV1

-- | create a TokenReview
create :: forall e. Config -> AuthenticationV1.TokenReview -> Aff (http :: HTTP | e) (Either MetaV1.Status AuthenticationV1.TokenReview)
create cfg body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/apis/authentication.k8s.io/v1/tokenreviews"
    encodedBody = encodeJSON body