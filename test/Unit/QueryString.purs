module Kubernetes.Test.Unit.QueryString where

import Prelude

import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Maybe (Maybe(..))
import Data.StrMap as StrMap
import Data.Tuple (Tuple(..))
import Kubernetes.QueryString (toQueryString)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)

tests :: forall e. TestSuite (avar :: AVAR, console :: CONSOLE, testOutput :: TESTOUTPUT | e)
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
      test "NullOrUndefined a" $ Assert.equal "1" (toQueryString (NullOrUndefined (Just 1)))
      test "NullOrUndefined Nothing" $ Assert.equal "" (toQueryString (NullOrUndefined (Nothing :: Maybe String)))
    suite "StrMap" do
      test "Single field" $ Assert.equal
        "a=1"
        (toQueryString $ StrMap.fromFoldable [Tuple "a" "1"])
      test "Multiple fields" $ Assert.equal
        "a=1&b=2"
        (toQueryString $ StrMap.fromFoldable [Tuple "a" 1, Tuple "b" 2])
      test "Many fields" $ Assert.equal
        "a=foo&b=bar&c=goo"
        (toQueryString $ StrMap.fromFoldable [Tuple "a" "foo", Tuple "b" "bar", Tuple "c" "goo"])
    suite "Records" do
      test "Single field" $ Assert.equal "a=1" (toQueryString {a: "1"})
      test "Multiple fields" $ Assert.equal "a=1&b=foo" (toQueryString {a: 1, b: "foo"})
      test "Many fields" $ Assert.equal "a=1&b=foo&c=false&d=1" (toQueryString {a: 1, b: "foo", c: false, d: Just 1})
      test "Empty result for all empty fields" $ Assert.equal
        ""
        (toQueryString ({a: NullOrUndefined Nothing} :: {a :: NullOrUndefined String}))
      test "Ignores empty fields" $ Assert.equal
        "a=foo&c=baz"
        (toQueryString (
          { a: NullOrUndefined (Just "foo")
          , b: NullOrUndefined Nothing
          , c: NullOrUndefined (Just "baz")} ::
          { a :: NullOrUndefined String
          , b :: NullOrUndefined String
          , c :: NullOrUndefined String}))
    
