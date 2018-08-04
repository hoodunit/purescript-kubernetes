module Kubernetes.Config where

import Prelude

import Control.Monad.Except (Except, ExceptT(..), except, lift, runExceptT, withExcept)
import Data.Bifunctor (lmap)
import Data.Either (Either(..), note)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Lens (Lens')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.List.NonEmpty (NonEmptyList(..))
import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype)
import Data.Nullable (toMaybe)
import Data.Symbol (SProxy(SProxy))
import Data.Tuple (Tuple(..))
import Effect.Aff (Aff)
import Foreign (ForeignError(..))
import Kubernetes.Default (class Default)
import Kubernetes.KubeConfig (KubeConfig, KubeConfigError)
import Kubernetes.KubeConfig as KubeConfig
import Kubernetes.ParseInt (parseInt)
import Kubernetes.Request as Req
import Kubernetes.Request as Request
import Kubernetes.Yaml (YamlError(..))
import Kubernetes.Yaml as Yaml
import Node.Encoding as Encoding
import Node.FS.Aff as FS
import Node.Path (FilePath)
import Node.URL as Url

newtype Config = Config
  { basicAuth :: Maybe BasicAuth
  , bearerToken :: Maybe String
  , cluster :: ClusterConfig
  , tls :: TLSConfig }

derive instance newtypeConfig :: Newtype Config _
derive instance genericConfig :: Generic Config _
instance eqConfig :: Eq Config where
  eq (Config c1) (Config c2) = eq c1 c2
instance showConfig :: Show Config where
  show = genericShow
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

loadFile :: String -> Aff String
loadFile = FS.readTextFile Encoding.UTF8

data ConfigError
  = ConfigParseError KubeConfigError
  | InvalidCurrentContext
  | InvalidContextUser
  | InvalidContextCluster
  | NoUserSelectedError
  | ClusterUrlError { url :: String, msg :: String }

instance showConfigError :: Show ConfigError where
  show (ConfigParseError e) = "ConfigError: Could not parse parsing kubeconfig - " <> show e
  show InvalidCurrentContext = "ConfigError: kubeconfig current-context was missing or invalid"
  show InvalidContextUser = "ConfigError: kubeconfig current-context contained an invalid user"
  show InvalidContextCluster = "ConfigError: kubeconfig current-context contained an invalid context"
  show NoUserSelectedError = "ConfigError: kubeconfig contained multiple users and but no current context"
  show (ClusterUrlError {url, msg}) =
    "ConfigError: kubeconfig contained invalid cluster url '" <>
    url <> "' - " <> msg
instance eqConfigError :: Eq ConfigError where
  eq (ConfigParseError e1) (ConfigParseError e2) = e1 == e2
  eq InvalidCurrentContext InvalidCurrentContext = true
  eq InvalidContextUser InvalidContextUser = true
  eq InvalidContextCluster InvalidContextCluster = true
  eq NoUserSelectedError NoUserSelectedError = true
  eq (ClusterUrlError e1) (ClusterUrlError e2) = e1 == e2
  eq _ _ = false

loadKubeConfig :: FilePath -> Aff (Either ConfigError Config)
loadKubeConfig cfgFile = do
  kubeConfigStr <- FS.readTextFile Encoding.UTF8 cfgFile
  runExceptT $ parseAndLoadKubeConfig kubeConfigStr

parseAndLoadKubeConfig :: String -> ExceptT ConfigError Aff Config
parseAndLoadKubeConfig fileStr = do
  decodedKubeConfig <- except $ lmap ConfigParseError $ KubeConfig.decode fileStr
  loadConfigFromKubeConfig decodedKubeConfig

loadConfigFromKubeConfig :: KubeConfig -> ExceptT ConfigError Aff Config
loadConfigFromKubeConfig cfg = do
  cfgContext <- except $ note InvalidCurrentContext $ Map.lookup cfg.currentContext cfg.contexts
  cfgUser <- except $ chooseUser cfgContext cfg.users
  let basicAuth = { user: _, password: _ } <$> cfgUser.username <*> cfgUser.password
  let bearerToken = parseUserToken cfgUser
  cfgCluster <- except $ chooseCluster cfgContext cfg.clusters
  cluster <- except $ parseClusterServer cfgCluster.server
  caCert <- loadClusterCaCert cfgCluster
  clientCert <- loadUserClientCert cfgUser
  clientKey <- loadUserClientKey cfgUser
  let verifyServerCert = maybe true not cfgCluster.insecureSkipTlsVerify
  let tls = { caCert, clientCert, clientKey, verifyServerCert }
  pure $ Config { basicAuth, bearerToken, cluster, tls }

parseUserToken :: KubeConfig.User -> Maybe String
parseUserToken { token: Just token } = Just token
parseUserToken { tokenFile: Just _ } = Nothing
parseUserToken { token: Nothing
               , tokenFile: Nothing } = Nothing

loadUserClientCert :: KubeConfig.User -> ExceptT ConfigError Aff (Maybe String)
loadUserClientCert { clientCertificateData: Just cert } = pure $ Just cert
loadUserClientCert { clientCertificate: Just certPath } =
  (lift <<< map Just) $ loadFile certPath
loadUserClientCert { clientCertificate: Nothing
                    , clientCertificateData: Nothing } = pure Nothing
                                                         
loadUserClientKey :: KubeConfig.User -> ExceptT ConfigError Aff (Maybe String)
loadUserClientKey { clientKeyData: Just cert } = pure $ Just cert
loadUserClientKey { clientKey: Just keyPath } =
  (lift <<< map Just) $ loadFile keyPath
loadUserClientKey { clientKey: Nothing
                   , clientKeyData: Nothing } = pure Nothing

loadClusterCaCert :: KubeConfig.Cluster -> ExceptT ConfigError Aff (Maybe String)
loadClusterCaCert { certificateAuthorityData: Just caCert } = pure $ Just caCert
loadClusterCaCert { certificateAuthority: Just caCertPath } =
  (lift <<< map Just) $ loadFile caCertPath
loadClusterCaCert { certificateAuthority: Nothing
                  , certificateAuthorityData: Nothing } = pure Nothing

parseClusterServer :: Maybe String -> Either ConfigError ClusterConfig
parseClusterServer Nothing =
  Left $ ClusterUrlError { url: "", msg: "No cluster URL was given in config"}
parseClusterServer (Just url) = do
  let parsed = Url.parse url
  host <- toMaybe parsed.host
    # asUrlError "Could not parse cluster host from URL"
  protocol <- toMaybe parsed.protocol
    # asUrlError "Could not parse protocol from URL"
    >>= parseProtocolStr
  port <- case Tuple (toMaybe parsed.port) protocol of
    Tuple Nothing Request.ProtocolHTTP -> Right 80
    Tuple Nothing Request.ProtocolHTTPS -> Right 443
    Tuple (Just portStr) _ ->
      asUrlError "Could not parse cluster URL port as integer" (parseInt portStr)
  pure { host, port, protocol }
  where
    asUrlError :: forall a. String -> Maybe a -> Either ConfigError a
    asUrlError msg = note (ClusterUrlError { url, msg })
    
    parseProtocolStr "https:" = Right Request.ProtocolHTTPS
    parseProtocolStr "http:" = Right Request.ProtocolHTTP
    parseProtocolStr p = Left (ClusterUrlError { url, msg: "Invalid cluster URL protocol '" <> p <> "'"})

chooseUser :: KubeConfig.Context -> Map String KubeConfig.User -> Either ConfigError KubeConfig.User
chooseUser {user} users = case Map.lookup user users of
  Nothing -> Left InvalidContextUser
  Just value -> Right value
  
chooseCluster :: KubeConfig.Context -> Map String KubeConfig.Cluster -> Either ConfigError KubeConfig.Cluster
chooseCluster {cluster} clusters = case Map.lookup cluster clusters of
  Nothing -> Left InvalidContextCluster
  Just value -> Right value

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
