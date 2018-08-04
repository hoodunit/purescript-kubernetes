module Kubernetes.KubeConfig where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Bifunctor (lmap)
import Data.Either (Either)
import Data.List.NonEmpty (NonEmptyList)
import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe)
import Data.Traversable (sequence)
import Data.Tuple (Tuple(..))
import Foreign (Foreign, ForeignError(..), readArray)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Kubernetes.Yaml as Yaml
import Simple.JSON (class ReadForeign)
import Simple.JSON as SimpleJson

type KubeConfig =
  { apiVersion :: Maybe String
  , clusters :: Map String Cluster
  , contexts :: Map String Context
  , currentContext :: String
  , preferences :: Preferences
  , users :: Map String User }
-- omitted: extensions

type Cluster =
  { certificateAuthority :: Maybe String
  , certificateAuthorityData :: Maybe String
  , insecureSkipTlsVerify :: Maybe Boolean
  , server :: Maybe String }
-- omitted: extensions

type Context =
  { cluster :: String
  , namespace :: Maybe String
  , user :: String }
-- omitted: extensions

type Preferences =
  { colors :: Maybe Boolean
  }
-- omitted: extensions

type User =
  { clientCertificate :: Maybe String
  , clientCertificateData :: Maybe String
  , clientKey :: Maybe String
  , clientKeyData :: Maybe String
  , token :: Maybe String
  , tokenFile :: Maybe String
  , actAs :: Maybe String
  , actAsGroups :: Maybe (Array String)
  , actAsUserExtra :: Maybe (Object (Array String))
  , username :: Maybe String
  , password :: Maybe String
  , authProvider :: Maybe AuthProvider
  , exec :: Maybe ExecConfig }
  -- omitted: extensions
  
type AuthProvider =
  { config :: Maybe (Object String)
  , name :: String }

type ExecConfig =
  { command :: String
  , args :: Maybe (Array String)
  , env :: Maybe (Array ExecEnvVar)
  , apiVersion :: Maybe String }

type ExecEnvVar =
  { name :: String
  , value :: String }

data KubeConfigError
  = KubeConfigYamlError Yaml.YamlError
  | KubeConfigDecodeError (NonEmptyList ForeignError)

instance showKubeConfigError :: Show KubeConfigError where
  show (KubeConfigYamlError e) = "KubeConfigError: Could not parse yaml - " <> show e
  show (KubeConfigDecodeError e) = "KubeConfigError: Could not decode yaml as kubeconfig: " <> show e
instance eqKubeConfigError :: Eq KubeConfigError where
  eq (KubeConfigYamlError e1) (KubeConfigYamlError e2) = eq e1 e2
  eq (KubeConfigDecodeError e1) (KubeConfigDecodeError e2) = eq e1 e2
  eq _ _ = false
  
decode :: String -> Either KubeConfigError KubeConfig
decode fileStr = do
  parsed <- lmap KubeConfigYamlError $ Yaml.safeLoad fileStr
  lmap KubeConfigDecodeError (decodeKubeConfig parsed)

decodeKubeConfig :: Foreign -> Either (NonEmptyList ForeignError) KubeConfig
decodeKubeConfig f = do
  apiVersion <- prop f "apiVersion"
  clusters <- (runExcept $ readProp "clusters" f) >>= decodeClusters
  contexts <- (runExcept $ readProp "contexts" f) >>= decodeContexts
  currentContext <- prop f "current-context"
  preferences <- prop f "preferences"
  users <- (runExcept $ readProp "users" f) >>= decodeUsers
  pure { apiVersion, clusters, contexts, currentContext, preferences, users }

decodeClusters :: Foreign -> Either (NonEmptyList ForeignError) (Map String Cluster)
decodeClusters f = do
  clusters <- (runExcept $ readArray f) >>= (map decodeCluster >>> sequence)
  pure $ Map.fromFoldable $ clusters
  
decodeCluster :: Foreign -> Either (NonEmptyList ForeignError) (Tuple String Cluster)
decodeCluster f = do
  name <- prop f "name"
  cluster <- runExcept $ readProp "cluster" f
  certificateAuthority <- prop cluster "certificate-authority"
  certificateAuthorityData <- prop cluster "certificate-authority-data"
  insecureSkipTlsVerify <- prop cluster "insecure-skip-tls-verify"
  server <- prop cluster "server"
  pure $ Tuple name { certificateAuthority, certificateAuthorityData, insecureSkipTlsVerify, server }
  
decodeContexts :: Foreign -> Either (NonEmptyList ForeignError) (Map String Context)
decodeContexts f = do
  contexts <- (runExcept $ readArray f) >>= (map decodeContext >>> sequence)
  pure $ Map.fromFoldable $ contexts
  
decodeContext :: Foreign -> Either (NonEmptyList ForeignError) (Tuple String Context)
decodeContext f = do
  name <- prop f "name"
  context <- runExcept $ readProp "context" f
  cluster <- prop context "cluster"
  namespace <- prop context "namespace"
  user <- prop context "user"
  pure $ Tuple name { cluster, namespace, user }
  
decodeUsers :: Foreign -> Either (NonEmptyList ForeignError) (Map String User)
decodeUsers f = do
  users <- (runExcept $ readArray f) >>= (map decodeUser >>> sequence)
  pure $ Map.fromFoldable $ users
  
decodeUser :: Foreign -> Either (NonEmptyList ForeignError) (Tuple String User)
decodeUser f = do
  name <- prop f "name"
  user <- runExcept $ readProp "user" f
  clientCertificate <- prop user "client-certificate"
  clientCertificateData <- prop user "client-certificate-data"
  clientKey <- prop user "client-key"
  clientKeyData <- prop user "client-key-data"
  token <- prop user "token"
  tokenFile <- prop user "token-file"
  actAs <- prop user "act-as"
  actAsGroups <- prop user "act-as-groups"
  actAsUserExtra <- prop user "act-as-user-extra"
  username <- prop user "username"
  password <- prop user "password"
  authProvider <- prop user "auth-provider"
  exec <- prop user "exec"
  pure $ Tuple name
    { clientCertificate
    , clientCertificateData
    , clientKey
    , clientKeyData
    , token
    , tokenFile
    , actAs
    , actAsGroups
    , actAsUserExtra
    , username
    , password
    , authProvider
    , exec }
  
prop :: forall a. ReadForeign a => Foreign -> String -> Either (NonEmptyList ForeignError) a
prop f name =
  readProp name f
  # runExcept
  # lmap (map $ ErrorAtProperty name)
  >>= SimpleJson.read
