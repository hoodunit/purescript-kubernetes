module Kubernetes.QueryString where

import Prelude

import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Maybe (Maybe(..))
import Data.Record (get)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.String as String
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Data.Tuple (Tuple(..))
import Type.Prelude (class RowLacks, class RowToList, RLProxy(..))
import Type.Row (Cons, Nil, kind RowList)

class ToQueryString a where
  toQueryString :: a -> String

instance toQueryStringString :: ToQueryString String where
  toQueryString = id

instance toQueryStringInt :: ToQueryString Int where
  toQueryString = show

instance toQueryStringChar :: ToQueryString Char where
  toQueryString = String.singleton

instance toQueryStringBoolean :: ToQueryString Boolean where
  toQueryString = show

instance toQueryStringNumber :: ToQueryString Number where
  toQueryString = show

instance toQueryStringMaybe :: ToQueryString a => ToQueryString (Maybe a) where
  toQueryString Nothing = ""
  toQueryString (Just a) = toQueryString a

instance toQueryStringNullOrUndefined :: ToQueryString a => ToQueryString (NullOrUndefined a) where
  toQueryString (NullOrUndefined Nothing) = ""
  toQueryString (NullOrUndefined (Just a)) = toQueryString a

instance toQueryStringStrMap :: ToQueryString a => ToQueryString (StrMap a) where
  toQueryString s = s
    # StrMap.toUnfoldable
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
  , RowCons name ty whatever row
  , RowLacks name from'
  , RowCons name String from' to
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
