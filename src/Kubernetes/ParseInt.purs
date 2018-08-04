module Kubernetes.ParseInt where

import Data.Function.Uncurried (Fn3, runFn3)
import Data.Maybe (Maybe(Just,Nothing))
    
foreign import parseIntImpl :: Fn3 (Int -> Maybe Int) (Maybe Int) String (Maybe Int)

parseInt :: String -> Maybe Int
parseInt = runFn3 parseIntImpl Just Nothing
