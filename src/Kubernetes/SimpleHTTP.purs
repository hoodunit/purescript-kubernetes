module Kubernetes.SimpleHTTP where

import Prelude

import Control.Monad.Aff (Aff)
import Control.Monad.Aff as Aff
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, Error, catchException, error, try)
import Control.Monad.ST (ST)
import Control.Monad.ST as ST
import Data.Either (Either(..))
import Data.Generic.Rep (class Generic)
import Data.HTTP.Method (Method)
import Data.Maybe (Maybe(..), maybe)
import Data.Monoid (mempty)
import Data.Options (Option, Options(..), opt, (:=))
import Data.StrMap as StrMap
import Data.Tuple (Tuple(..))
import Debug.Trace as Debug
import Node.Encoding (Encoding(..))
import Node.Encoding as Encoding
import Node.HTTP (HTTP)
import Node.HTTP.Client as HTTP
import Node.Stream as Stream
import Unsafe.Coerce (unsafeCoerce)
  
type Request =
  { basicAuth :: Maybe { user :: String, password :: String }
  , body :: Maybe String
  , caCert :: Maybe String
  , clientCert :: Maybe String
  , clientKey :: Maybe String
  , host :: String
  , port :: Int
  , protocol :: Protocol
  , method :: Method
  , path :: String }

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

ca :: Option HTTP.RequestOptions String
ca = opt "ca"
  
httpRequest :: forall e. Request -> Aff (http :: HTTP | e) Response
httpRequest req = removeUnnecessaryEffects (httpRequest' req)
  where
    removeUnnecessaryEffects :: forall e' h. Aff (exception :: EXCEPTION, st :: ST h, http :: HTTP | e') Response -> Aff (http :: HTTP | e) Response
    removeUnnecessaryEffects = unsafeCoerce

httpRequest' :: forall e h. Request -> Aff (exception :: EXCEPTION, st :: ST h, http :: HTTP | e) Response
httpRequest' req = Aff.makeAff \callback -> do
  let successFn r = readBody r (wrapResponse r >>> callback)
  reqRes <- try $ unsafeCoerce $ HTTP.request (makeOptions req) successFn
  case reqRes of
    Right reqObj -> do
      HTTP.setTimeout reqObj 30000 (callback (Left $ error "Timeout"))
      let stream = HTTP.requestAsStream reqObj
      case req.body of
        Just body -> void $ Stream.writeString stream UTF8 body (pure unit)
        Nothing -> pure unit
      Stream.end stream (pure unit)
      pure mempty
    Left error -> callback (Left error) *> pure mempty
  where
    wrapResponse :: HTTP.Response -> Either Error String -> Either Error Response
    wrapResponse res (Right body) = Right {body, status: StatusCode (HTTP.statusCode res)}
    wrapResponse _ (Left e) = Left e
    
readBody :: forall h e
  . HTTP.Response
  -> (Either Error String -> Eff (http :: HTTP, exception :: EXCEPTION, st :: ST h | e) Unit)
  -> Eff (http :: HTTP, exception :: EXCEPTION, st :: ST h | e) Unit
readBody res callback = do
  let stream = HTTP.responseAsStream res
  body <- ST.newSTRef ""
  Stream.onDataString stream UTF8 (\s -> void $ ST.modifySTRef body (_ <> s))
  Stream.onError stream (callback <<< Left)
  Stream.onEnd stream (ST.readSTRef body >>= (callback <<< Right))
  pure unit

makeOptions :: Request -> Options HTTP.RequestOptions
makeOptions {basicAuth, body, caCert, clientCert, clientKey, host, method, path, port, protocol} =
  maybe mempty (\b -> HTTP.auth := (formatBasicAuth b)) basicAuth <>
  maybe mempty (ca := _) caCert <>
  maybe mempty (HTTP.cert := _) clientCert <>
  maybe mempty (HTTP.key := _) clientKey <>
  HTTP.headers := (HTTP.RequestHeaders $ StrMap.fromFoldable
   [ Tuple "Content-Type" "application/json"
   , Tuple "Content-Length" (show contentLength)
   , Tuple "Accept" "application/json"]) <>
  HTTP.hostname := host <>
  HTTP.method := (show method) <>
  HTTP.path := path <>
  HTTP.port := port <>
  HTTP.protocol := (showProtocol protocol)
  where
    contentLength = maybe 0 (\b -> Encoding.byteLength b UTF8) body
    showProtocol :: Protocol -> String
    showProtocol ProtocolHTTP = "http:"
    showProtocol ProtocolHTTPS = "https:"
    
formatBasicAuth :: {user :: String, password :: String} -> String
formatBasicAuth {user, password} = user <> ":" <> password
