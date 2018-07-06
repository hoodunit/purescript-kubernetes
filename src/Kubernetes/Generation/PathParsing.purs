module Kubernetes.Generation.PathParsing where

import Prelude

import Data.Array.NonEmpty (toArray)
import Data.Maybe (Maybe(..))
import Data.String.Regex as Regex
import Data.String.Regex.Unsafe (unsafeRegex)
import Data.String.Regex.Flags as Flags
import Kubernetes.Generation.AST as AST

urlRegex :: Regex.Regex
urlRegex = unsafeRegex "^([a-z0-9/]*){([a-z]+)}(.*)$" Flags.noFlags

parse :: String -> AST.UrlWithParams
parse "" = AST.EndUrl ""
parse s =
  case toArray <$> (Regex.match urlRegex s) of
    Just [_, Just pathChunk, Just param, Just rest] ->
      AST.UrlChunk pathChunk param (parse rest)
    Just j ->
      AST.EndUrl ("[Parse failure, unmatched array: " <> show j)
    Nothing -> AST.EndUrl s
