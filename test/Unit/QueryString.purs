module Kubernetes.Test.Unit.QueryString where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Foreign.Object as Object
import Kubernetes.QueryString (toQueryString)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

tests :: TestSuite
tests =
  suite "toQueryString" do
    suite "Primitives" do
      test "String" $ Assert.equal "1" (toQueryString "1")
      test "Int" $ Assert.equal "1" (toQueryString 1)
      test "Char" $ Assert.equal "1" (toQueryString '1')
      test "Boolean false" $ Assert.equal "false" (toQueryString false)
      test "Boolean true" $ Assert.equal "true" (toQueryString true)
    suite "Nullables" do
      test "Just a" $ Assert.equal "1" (toQueryString (Just 1))
      test "Nothing" $ Assert.equal "" (toQueryString (Nothing :: Maybe String))
    suite "Object" do
      test "Single field" $ Assert.equal
        "a=1"
        (toQueryString $ Object.fromFoldable [Tuple "a" "1"])
      test "Multiple fields" $ Assert.equal
        "a=1&b=2"
        (toQueryString $ Object.fromFoldable [Tuple "a" 1, Tuple "b" 2])
      test "Many fields" $ Assert.equal
        "a=foo&b=bar&c=goo"
        (toQueryString $ Object.fromFoldable [Tuple "a" "foo", Tuple "b" "bar", Tuple "c" "goo"])
    suite "Records" do
      test "Single field" $ Assert.equal "a=1" (toQueryString {a: "1"})
      test "Multiple fields" $ Assert.equal "a=1&b=foo" (toQueryString {a: 1, b: "foo"})
      test "Many fields" $ Assert.equal "a=1&b=foo&c=false&d=1" (toQueryString {a: 1, b: "foo", c: false, d: Just 1})
      test "Empty result for all empty fields" $ Assert.equal
        ""
        (toQueryString ({a: Nothing} :: {a :: Maybe String}))
      test "Ignores empty fields" $ Assert.equal
        "a=foo&c=baz"
        (toQueryString (
          { a: Just "foo"
          , b: Nothing
          , c: Just "baz"} ::
          { a :: Maybe String
          , b :: Maybe String
          , c :: Maybe String}))
    
