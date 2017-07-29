module Kubernetes.Test.Unit.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Random (RANDOM)
import Kubernetes.Test.Unit.Generation.Names as Names
import Kubernetes.Test.Unit.Generation.PathParsing as PathParsing
import Kubernetes.Test.Unit.Json as Json
import Kubernetes.Test.Unit.QueryString as QueryString
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

main :: forall e. Eff (avar :: AVAR, console :: CONSOLE, random :: RANDOM, testOutput :: TESTOUTPUT | e) Unit
main = do
  runTest Json.tests
  runTest Names.tests
  runTest PathParsing.tests
  runTest QueryString.tests
