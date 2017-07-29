module Kubernetes.Api.Core where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Generic (encodeJSON)
import Data.Maybe (Maybe(Just,Nothing))
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Api.MetaV1 as MetaV1

-- | get available API versions
getAPIVersions :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIVersions)
getAPIVersions cfg = makeRequest (get cfg url Nothing)
  where
    url = "/api/"