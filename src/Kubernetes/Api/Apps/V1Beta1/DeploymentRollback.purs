module Kubernetes.Api.Apps.V1Beta1.DeploymentRollback where

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
import Kubernetes.Api.Apps.V1Beta1 as AppsV1Beta1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | create rollback of a Deployment
createNamespaced :: forall e. Config -> String -> String -> AppsV1Beta1.DeploymentRollback -> Aff (http :: HTTP | e) (Either MetaV1.Status AppsV1Beta1.DeploymentRollback)
createNamespaced cfg namespace name body = Client.makeRequest (Client.post cfg url (Just encodedBody))
  where
    url = "/apis/apps/v1beta1/namespaces/" <> namespace <> "/deployments/" <> name <> "/rollback"
    encodedBody = encodeJSON body