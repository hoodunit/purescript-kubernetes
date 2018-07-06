module Kubernetes.Test.Unit.Main where

import Prelude

import Effect (Effect)
import Kubernetes.Test.Unit.Generation.Names as Names
import Kubernetes.Test.Unit.Generation.PathParsing as PathParsing
import Kubernetes.Test.Unit.Json as Json
import Kubernetes.Test.Unit.QueryString as QueryString
import Test.Unit.Main (runTest)

main :: Effect Unit
main = do
  runTest Json.tests
  runTest Names.tests
  runTest PathParsing.tests
  runTest QueryString.tests
