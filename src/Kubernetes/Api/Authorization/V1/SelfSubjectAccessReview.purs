module Kubernetes.Api.Authorization.V1.SelfSubjectAccessReview where

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
import Kubernetes.Api.Authorization.V1 as AuthorizationV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | create a SelfSubjectAccessReview
create :: forall e. Config -> AuthorizationV1.SelfSubjectAccessReview -> Aff (http :: HTTP | e) (Either MetaV1.Status AuthorizationV1.SelfSubjectAccessReview)
create cfg body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1/selfsubjectaccessreviews"
    encodedBody = encodeJSON body