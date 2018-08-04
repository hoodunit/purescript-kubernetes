module Kubernetes.Api.Authorization.V1.LocalSubjectAccessReview where

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
import Kubernetes.Api.Authorization.V1 as AuthorizationV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | create a LocalSubjectAccessReview
createNamespaced :: Config -> AuthorizationV1.LocalSubjectAccessReview -> Aff (Either MetaV1.Status AuthorizationV1.LocalSubjectAccessReview)
createNamespaced cfg body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/apis/authorization.k8s.io/v1/namespaces/{namespace}/localsubjectaccessreviews"
    encodedBody = encodeJSON body