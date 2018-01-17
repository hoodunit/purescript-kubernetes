module Kubernetes.Config where

import Prelude

import Control.Monad.Aff (Aff)
import Data.Lens (Lens')
import Data.Lens.Record (prop)
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.Symbol (SProxy(SProxy))
import Kubernetes.Default (class Default)
import Kubernetes.Request as Req
import Node.Encoding as Encoding
import Node.FS (FS)
import Node.FS.Aff as FS

newtype Config = Config
  { basicAuth :: Maybe BasicAuth
  , bearerToken :: Maybe String
  , cluster :: ClusterConfig
  , tls :: TLSConfig }

derive instance newtypeConfig :: Newtype Config _
derive instance genericConfig :: Generic Config _
instance defaultConfig :: Default Config where
  default = Config $
    { basicAuth: Nothing
    , bearerToken: Nothing
    , cluster:
        { host: "localhost"
        , port: 8080
        , protocol: Req.ProtocolHTTP }
    , tls:
        { caCert: Nothing
        , clientCert: Nothing
        , clientKey: Nothing
        , verifyServerCert: true } }
    
-- | Basic authentication should be used for development/testing only.
type BasicAuth =
  { user :: String
  , password :: String }

type ClusterConfig =
  { host :: String
  , port :: Int
  , protocol :: Req.Protocol }

type TLSConfig =
  { caCert :: Maybe String
  , clientCert :: Maybe String
  , clientKey :: Maybe String
  , verifyServerCert :: Boolean }

loadFile :: forall e. String -> Aff (fs :: FS | e) String
loadFile = FS.readTextFile Encoding.UTF8

_basicAuth :: forall s a r. Newtype s { basicAuth :: a | r } => Lens' s a
_basicAuth = _Newtype <<< prop (SProxy :: SProxy "basicAuth")

_bearerToken :: forall s a r. Newtype s { bearerToken :: a | r } => Lens' s a
_bearerToken = _Newtype <<< prop (SProxy :: SProxy "bearerToken")

_cluster :: forall s a r. Newtype s { cluster :: a | r } => Lens' s a
_cluster = _Newtype <<< prop (SProxy :: SProxy "cluster")

_tls :: forall s a r. Newtype s { tls :: a | r } => Lens' s a
_tls = _Newtype <<< prop (SProxy :: SProxy "tls")

_host :: forall a r. Lens' { host :: a | r } a
_host = prop (SProxy :: SProxy "host")

_port :: forall a r. Lens' { port :: a | r } a
_port = prop (SProxy :: SProxy "port")

_protocol :: forall a r. Lens' { protocol :: a | r } a
_protocol = prop (SProxy :: SProxy "protocol")

_caCert :: forall a r. Lens' { caCert :: a | r } a
_caCert = prop (SProxy :: SProxy "caCert")

_clientCert :: forall a r. Lens' { clientCert :: a | r } a
_clientCert = prop (SProxy :: SProxy "clientCert")

_clientKey :: forall a r. Lens' { clientKey :: a | r } a
_clientKey = prop (SProxy :: SProxy "clientKey")

_verifyServerCert :: forall a r. Lens' { verifyServerCert :: a | r } a
_verifyServerCert = prop (SProxy :: SProxy "verifyServerCert")
