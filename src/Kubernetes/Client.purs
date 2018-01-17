module Kubernetes.Client where

import Prelude

import Control.Monad.Aff (Aff, throwError)
import Control.Monad.Eff.Exception (Error)
import Control.Monad.Eff.Exception as Ex
import Control.Monad.Except (runExcept)
import Data.Array as Array
import Data.Either (Either(..))
import Data.Foldable (elem)
import Data.Foreign (MultipleErrors)
import Data.Foreign.Class (class Decode)
import Data.Foreign.Generic (decodeJSON)
import Data.HTTP.Method (Method)
import Data.HTTP.Method as Method
import Data.Maybe (Maybe(Just, Nothing))
import Data.Newtype (class Newtype)
import Data.Newtype as Newtype
import Data.String as String
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Config (Config(Config))
import Kubernetes.QueryString (class ToQueryString, toQueryString)
import Kubernetes.Request as Req
import Node.HTTP (HTTP)

makeRequest :: forall e a.
  Decode a =>
  Req.Request -> Aff (http :: HTTP | e) (Either MetaV1.Status a)
makeRequest req = do
  res <- Req.request req
  if elem res.status successCodes
    then Right <$> parseResponse "a" req res
    else Left <$> parseResponse "MetaV1.Status" req res
  where
    successCodes = Req.StatusCode <$> [200, 201, 202]

delete :: Config -> String -> Maybe String -> Req.Request
delete cfg path content = (apiRequest cfg path content Method.DELETE)

get :: Config -> String -> Maybe String -> Req.Request
get cfg path _ = (apiRequest cfg path Nothing Method.GET)

head :: Config -> String -> Maybe String -> Req.Request
head cfg path _ = (apiRequest cfg path Nothing Method.HEAD)

options :: Config -> String -> Maybe String -> Req.Request
options cfg path content = (apiRequest cfg path content Method.OPTIONS)

patch :: Config -> String -> Maybe String -> Req.Request
patch cfg path content = (apiRequest cfg path content Method.PATCH)

post :: Config -> String -> Maybe String -> Req.Request
post cfg path content = (apiRequest cfg path content Method.POST)

put :: Config -> String -> Maybe String -> Req.Request
put cfg path content = (apiRequest cfg path content Method.PUT)

apiRequest :: Config -> String -> Maybe String -> Method -> Req.Request
apiRequest (Config { basicAuth
                   , bearerToken
                   , cluster: {host, port, protocol}
                   , tls: {caCert, clientCert, clientKey, verifyServerCert}})
           path body method =
  { basicAuth
  , bearerToken
  , body
  , caCert
  , clientCert
  , clientKey
  , host
  , method
  , path
  , port
  , protocol
  , rejectUnauthorized: verifyServerCert }

parseResponse :: forall a e. Decode a => String -> Req.Request -> Req.Response -> Aff (http :: HTTP | e) a
parseResponse typeName req res = do
  case runExcept (decodeJSON res.body) of
    Right val -> pure val
    Left errors -> throwError (parseError typeName req res errors)

parseError :: String -> Req.Request -> Req.Response -> MultipleErrors -> Error
parseError typeName req res errors = Ex.error $
  "Failed to parse API response as type '" <> typeName <> "'\n" <>
  "  Request: " <> show (req.method) <> " " <> req.host <> req.path <> "\n" <>
  "  Errors:\n" <> formattedErrors <> "\n" <>
  "  Response status code: " <> show (res.status) <> "\n" <>
  "  Response text\n" <> res.body
  where
    formattedErrors = "    " <> (String.joinWith "\n    " $ Array.fromFoldable $ show <$> errors)

formatQueryString :: forall a b. Newtype a b => ToQueryString b => a -> String
formatQueryString val = case toQueryString (Newtype.unwrap val) of
  "" -> ""
  formatted -> "?" <> formatted
