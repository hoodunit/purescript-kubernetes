module Kubernetes.QueryString where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String as String
import Data.String.CodeUnits as CodeUnits
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Data.Tuple (Tuple(..))
import Foreign.Object (Object)
import Foreign.Object as Object
import Prim.RowList (class RowToList)
import Record (get)
import Type.Row (Cons, Nil, kind RowList, RLProxy(RLProxy))
import Type.Row as Row

class ToQueryString a where
  toQueryString :: a -> String

instance toQueryStringString :: ToQueryString String where
  toQueryString = identity

instance toQueryStringInt :: ToQueryString Int where
  toQueryString = show

instance toQueryStringChar :: ToQueryString Char where
  toQueryString = CodeUnits.singleton

instance toQueryStringBoolean :: ToQueryString Boolean where
  toQueryString = show

instance toQueryStringNumber :: ToQueryString Number where
  toQueryString = show

instance toQueryStringMaybe :: ToQueryString a => ToQueryString (Maybe a) where
  toQueryString Nothing = ""
  toQueryString (Just a) = toQueryString a

instance toQueryStringObject :: ToQueryString a => ToQueryString (Object a) where
  toQueryString s = s
    # Object.toUnfoldable
    # map (\(Tuple k v) -> k <> "=" <> toQueryString v)
    # String.joinWith "&"

instance toQueryStringRecord ::
  ( RowToList row rl
  , ToQueryStringFields rl row () to
  ) => ToQueryString (Record row) where
  toQueryString record = toQueryStringFields (RLProxy :: RLProxy rl) record

class ToQueryStringFields (rl :: RowList) row (from :: # Type) (to :: # Type)
  | rl -> row from to where
  toQueryStringFields :: forall g. g rl -> Record row -> String

instance toQueryStringFieldsCons ::
  ( IsSymbol name
  , ToQueryString ty
  , ToQueryStringFields tail row from from'
  , Row.Cons name ty whatever row
  , Row.Lacks name from'
  , Row.Cons name String from' to
  ) => ToQueryStringFields (Cons name ty tail) row from to where
  toQueryStringFields _ record = result
    where
      namep = SProxy :: SProxy name
      value = toQueryString $ get namep record
      tailp = RLProxy :: RLProxy tail
      rest = toQueryStringFields tailp record
      joinStr = if String.null rest then "" else "&" <> rest
      result = if String.null value
        then rest
        else reflectSymbol namep <> "=" <> value <> joinStr

instance toQueryStringFieldsNil :: ToQueryStringFields Nil row () () where
  toQueryStringFields _ _ = ""
