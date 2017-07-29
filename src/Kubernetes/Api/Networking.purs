module Kubernetes.Api.Networking where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Generic (encodeJSON)
import Data.Maybe (Maybe(Just,Nothing))
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Api.MetaV1 as MetaV1

-- | get information of a group
getAPIGroup :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIGroup)
getAPIGroup cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/"