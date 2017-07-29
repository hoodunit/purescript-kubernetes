module Kubernetes.Request where

import Prelude

import Control.Monad.Aff (Aff)
import Control.Monad.Aff as Aff
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Either (Either(..))
import Data.Foreign (Foreign)
import Data.Generic.Rep (class Generic)
import Data.HTTP.Method (Method)
import Data.Maybe (Maybe, fromJust, isJust, maybe)
import Data.Monoid (mempty)
import Data.Options (options, (:=))
import Data.StrMap as StrMap
import Data.Tuple (Tuple(..))
import Kubernetes.RequestOptions as ReqOptions
import Node.Encoding as Encoding
import Node.HTTP (HTTP)
import Partial.Unsafe (unsafePartial)
  
type Request =
  { basicAuth :: Maybe { user :: String, password :: String }
  , bearerToken :: Maybe String
  , body :: Maybe String
  , caCert :: Maybe String
  , clientCert :: Maybe String
  , clientKey :: Maybe String
  , host :: String
  , port :: Int
  , protocol :: Protocol
  , method :: Method
  , path :: String
  , rejectUnauthorized :: Boolean }

data Protocol = ProtocolHTTP | ProtocolHTTPS

type Response =
  { body :: String
  , status :: StatusCode }

newtype StatusCode = StatusCode Int
derive instance genericStatusCode :: Generic StatusCode _
instance eqStatusCode :: Eq StatusCode where
  eq (StatusCode x) (StatusCode y) = x == y
instance showStatusCode :: Show StatusCode where
  show (StatusCode code) = "(StatusCode " <> show code <> ")"

type RequestImplConfig e =
  { left :: Error -> Either Error Response
  , right :: Response -> Either Error Response
  , isJust :: Maybe String -> Boolean
  , fromJust :: Maybe String -> String
  , options :: Foreign
  , body :: Maybe String
  , callback :: Either Error Response -> Eff (http :: HTTP | e) Unit
  , mkResponse :: Int -> String -> Response }

foreign import requestImpl :: forall e. RequestImplConfig e -> Eff (http :: HTTP | e) Unit

request :: forall e. Request -> Aff (http :: HTTP | e) Response
request req = Aff.makeAff $ \callback -> do
  let cfg =
        { left: Left
        , right: Right
        , isJust: isJust
        , fromJust: unsafePartial fromJust
        , options: makeOptions req
        , body: req.body
        , callback: callback
        , mkResponse: \status body -> { body, status: StatusCode status }}
  requestImpl cfg
  pure mempty

makeOptions :: Request -> Foreign
makeOptions {basicAuth, bearerToken, body, caCert, clientCert, clientKey, host, method, path, port, protocol, rejectUnauthorized} =
  options $
    maybe mempty (\b -> ReqOptions.auth := (formatBasicAuth b)) basicAuth <>
    maybe mempty (ReqOptions.ca := _) caCert <>
    maybe mempty (ReqOptions.cert := _) clientCert <>
    maybe mempty (ReqOptions.key := _) clientKey <>
    ReqOptions.headers := (ReqOptions.RequestHeaders $ StrMap.fromFoldable $
      [ Tuple "Content-Type" "application/json"
      , Tuple "Content-Length" (show contentLength)
      , Tuple "Accept" "application/json"] <>
      (maybe mempty (pure <<< bearerTokenHeader) bearerToken)) <> 
    ReqOptions.hostname := host <>
    ReqOptions.method := (show method) <>
    ReqOptions.path := path <>
    ReqOptions.port := port <>
    ReqOptions.protocol := (showProtocol protocol) <>
    ReqOptions.rejectUnauthorized := rejectUnauthorized
  where
    contentLength = maybe 0 (\b -> Encoding.byteLength b Encoding.UTF8) body
    showProtocol :: Protocol -> String
    showProtocol ProtocolHTTP = "http:"
    showProtocol ProtocolHTTPS = "https:"
    bearerTokenHeader t = Tuple "Authorization" ("Bearer " <> t)
    
formatBasicAuth :: {user :: String, password :: String} -> String
formatBasicAuth {user, password} = user <> ":" <> password
