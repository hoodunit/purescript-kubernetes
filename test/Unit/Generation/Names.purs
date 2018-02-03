module Kubernetes.Test.Unit.Generation.Names where

import Prelude

import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Random (RANDOM)
import Kubernetes.Generation.Names (jsonFieldToPsField, psFieldToJsonField, snakeCaseToPascalCase, stripTagFromId)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.QuickCheck (quickCheck)

tests :: forall e. TestSuite (avar :: AVAR, console :: CONSOLE, random :: RANDOM, testOutput :: TESTOUTPUT | e)
tests = do
  suite "stripTagFromId" do
    test "removes tag, in camel case, from operation ID" do
      Assert.equal "listNamespacedPod" (stripTagFromId "core_v1" "listCoreV1NamespacedPod")
    test "does not strip version tag" do
      Assert.equal "getCodeVersion" (stripTagFromId "version" "getCodeVersion")
    test "works for short core tag" do
      Assert.equal "getAPIVersions" (stripTagFromId "core" "getCoreAPIVersions")
    test "removes tag, in camel case, from operation ID" do
      Assert.equal "watchStorageClass" (stripTagFromId "storage_v1beta1" "watchStorageV1beta1StorageClass")
    test "removes tag, in camel case, from operation ID" do
      Assert.equal "watchRoleBindingListForAllNamespaces"
        (stripTagFromId
         "rbacAuthorization_v1beta1"
         "watchRbacAuthorizationV1beta1RoleBindingListForAllNamespaces")
  suite "snakeCaseToPascalCase" do
    test "converts to Pascal case" do
      Assert.equal "CoreV1" (snakeCaseToPascalCase "core_v1")
    test "converts longer underscore items" do
      Assert.equal "SomeLongCamelCase" (snakeCaseToPascalCase "some_long_camel_case")
    test "uppercases word with no underscores" do
      Assert.equal "Apis" (snakeCaseToPascalCase "apis")
  suite "field name sanitization" do
    test "_type --> type" do
      Assert.equal "type" (psFieldToJsonField "_type")
    test "type --> _type" do
      Assert.equal "_type" (jsonFieldToPsField "type")
    test "'_type' transformation is reversible" do
      Assert.equal "_type" (jsonFieldToPsField (psFieldToJsonField "_type"))
    test "'type' transformation is reversible" do
      Assert.equal "type" (psFieldToJsonField (jsonFieldToPsField "type"))
    test "Capitalized names are given underscore prefix" do
      Assert.equal "_Kind" (jsonFieldToPsField "Kind")
    test "Names with underscore prefix have underscore stripped" do
      Assert.equal "Kind" (psFieldToJsonField "_Kind")
    test "JSON -> PS -> JSON returns same name" do
      quickCheck \s -> psFieldToJsonField (jsonFieldToPsField s) == s
    test "PS -> JSON -> PS returns same name" do
      quickCheck \s -> jsonFieldToPsField (psFieldToJsonField s) == s
        
