module Kubernetes.Generation.PathParsing where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.String.Regex as Regex
import Data.String.Regex.Flags as Flags
import Kubernetes.Generation.AST as AST

parse :: String -> AST.UrlWithParams
parse "" = AST.EndUrl ""
parse s =
  case (\r -> Regex.match r s) <$> urlRegex of
    Right (Just [_, Just pathChunk, Just param, Just rest]) ->
      AST.UrlChunk pathChunk param (parse rest)
    Right (Just j) ->
      AST.EndUrl ("[Parse failure, unmatched array: " <> show j)
    Right Nothing -> AST.EndUrl s
    a -> AST.EndUrl ("[Parse failure: " <> show a <> "]")
  where
    urlRegex = Regex.regex "^([a-z0-9/]*){([a-z]+)}(.*)$" Flags.noFlags
