module Kubernetes.Api.Logs where

import Prelude
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Generic (encodeJSON)
import Data.Maybe (Maybe(Just,Nothing))
import Node.HTTP (HTTP)
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Api.MetaV1 as MetaV1

logFileHandler :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
logFileHandler cfg logpath = makeRequest (get cfg url Nothing)
  where
    url = "/logs/" <> logpath <> ""

logFileListHandler :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status String)
logFileListHandler cfg = makeRequest (get cfg url Nothing)
  where
    url = "/logs/"