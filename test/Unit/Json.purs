module Kubernetes.Test.Unit.Json where

import Prelude

import Control.Monad.Eff.AVar (AVAR)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Random (RANDOM)
import Control.Monad.Except (runExcept)
import Data.Either (Either(..))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (decodeJSON, encodeJSON, genericDecode, genericEncode)
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Kubernetes.Json (jsonOptions)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)

newtype Object = Object
  { _type :: (NullOrUndefined String) }

derive instance newtypeObject :: Newtype Object _
derive instance genericObject :: Generic Object _
instance showObject :: Show Object where show = genericShow
instance decodeObject :: Decode Object
  where decode = genericDecode jsonOptions 
instance encodeObject :: Encode Object
  where encode = genericEncode jsonOptions
instance eqObject :: Eq Object where
  eq (Object {_type: type1}) (Object {_type: type2}) = type1 == type2

tests :: forall e. TestSuite (avar :: AVAR, console :: CONSOLE, random :: RANDOM, testOutput :: TESTOUTPUT | e)
tests = do
  suite "Encoding transforms field names" do
    test "_type --> type" do
      Assert.equal "{\"type\":\"foo\"}" (encodeJSON (Object {_type: NullOrUndefined (Just "foo")}))
  suite "Decoding transforms field names" do
    test "type --> _type" do
      Assert.equal
        (Right (Object {_type: NullOrUndefined (Just "foo")}))
        (runExcept $ decodeJSON "{\"type\":\"foo\"}")
