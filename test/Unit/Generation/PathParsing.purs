module Kubernetes.Test.Unit.Generation.PathParsing where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Kubernetes.Generation.AST (UrlWithParams(..))
import Kubernetes.Generation.PathParsing (parse)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

tests :: forall e. TestSuite (avar :: AVAR, console :: CONSOLE, testOutput :: TESTOUTPUT | e)
tests = suite "Parsing API paths" do
  test "No params" do
    Assert.equal
      (EndUrl "/api/")
      (parse "/api/")
  test "No params, deeper path" do
    Assert.equal
      (EndUrl "/api/v1/componentstatuses")
      (parse "/api/v1/componentstatuses")
  test "Single end param" do
    Assert.equal
      (UrlChunk "/api/v1/componentstatuses/" "name" (EndUrl ""))
      (parse "/api/v1/componentstatuses/{name}")
  test "Single param" do
    Assert.equal
      (UrlChunk "/api/v1/namespaces/" "namespace" (EndUrl "/pods"))
      (parse "/api/v1/namespaces/{namespace}/pods")
  test "Two params" do
    Assert.equal
      (UrlChunk "/api/v1/namespaces/" "namespace" (UrlChunk "/pods/" "name" (EndUrl "")))
      (parse "/api/v1/namespaces/{namespace}/pods/{name}")
  test "Three params" do
    Assert.equal
      (UrlChunk "/api/v1/namespaces/" "namespace"
        (UrlChunk "/pods/" "name"
          (UrlChunk "/proxy/" "path" (EndUrl ""))))
      (parse "/api/v1/namespaces/{namespace}/pods/{name}/proxy/{path}")
      
        
