module Kubernetes.Json where

import Data.Foreign.Generic (defaultOptions)
import Data.Foreign.Generic.Types (Options)
import Kubernetes.Generation.Names (psFieldToJsonField)

jsonOptions :: Options
jsonOptions = defaultOptions
  { unwrapSingleConstructors = true
  , fieldTransform = psFieldToJsonField }
