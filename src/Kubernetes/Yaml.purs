module Kubernetes.Yaml where

import Prelude

import Data.Bifunctor (lmap)
import Data.Either (Either(Left, Right))
import Effect.Exception (Error)
import Foreign (Foreign)

foreign import safeLoadImpl ::
  (Error -> Either Error Foreign) ->
  (Foreign -> Either Error Foreign) ->
  String ->
  Either Error Foreign

data YamlError = YamlError Error
instance eqYamlError :: Eq YamlError where
  eq (YamlError e1) (YamlError e2) = false
instance showYamlError :: Show YamlError where
  show (YamlError e) = show e

safeLoad :: String -> Either YamlError Foreign
safeLoad = safeLoadImpl Left Right >>> lmap YamlError
