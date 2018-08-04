module Kubernetes.Test.Integration.Main where

import Data.Lens
import Kubernetes.Api.Batch.V1
import Kubernetes.Api.Core.V1
import Kubernetes.Api.Lens
import Prelude

import Control.Alt ((<|>))
import Control.Monad.Except (runExcept)
import Data.Either (Either(..), either, hush)
import Data.Function.Uncurried (Fn3, runFn3)
import Data.HTTP.Method as Method
import Data.Lens as L
import Data.List.NonEmpty (NonEmptyList(..))
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Monoid (mempty)
import Data.Time.Duration (Milliseconds(..))
import Data.Tuple (Tuple(..))
import Debug.Trace as Debug
import Effect (Effect)
import Effect.Aff (Aff, launchAff_, throwError)
import Effect.Aff as Aff
import Effect.Class (liftEffect)
import Effect.Class.Console (log, logShow)
import Effect.Exception as Exception
import Foreign (MultipleErrors)
import Foreign as Foreign
import Foreign.Object as Object
import Kubernetes.Api.APIExtensions.V1Beta1 (Deployment(Deployment))
import Kubernetes.Api.Core.V1.Namespace as NS
import Kubernetes.Api.Core.V1.Service as Service
import Kubernetes.Api.Extensions.V1Beta1.Deployment as Deploy
import Kubernetes.Api.Meta.V1 as MetaV1
import Kubernetes.Api.Util (IntOrString(..))
import Kubernetes.Client as Client
import Kubernetes.Config (Config(Config), ConfigError)
import Kubernetes.Config as Cfg
import Kubernetes.Config as Config
import Kubernetes.Default (default)
import Kubernetes.KubeConfig (KubeConfig, KubeConfigError)
import Kubernetes.ParseInt (parseInt)
import Kubernetes.Request as Request
import Kubernetes.Yaml (YamlError)
import Kubernetes.Yaml as Yaml
import Node.Encoding (Encoding(..))
import Node.Encoding as Encoding
import Node.FS.Aff (readTextFile)
import Node.FS.Aff as FS
import Node.OS as OS
import Node.Process as Process
    
echoDeployment :: Deployment
echoDeployment =
  (default :: Deployment)
    # _metadata ?~ (default
      # _labels ?~ (Object.fromFoldable
        [ Tuple "service" "echoserver" ])
      # _name ?~ "echoserver")
    # _spec ?~ (default
      # _replicas ?~ 1
      # _strategy ?~ (default
        # _type ?~ "Recreate")
      # _template ?~ (default
        # _metadata ?~ (default
          # _name ?~ "echoserver"
          # _labels ?~ Object.fromFoldable
            [ Tuple "service" "echoserver" ])
        # _spec ?~ ((default :: PodSpec)
          # _containers ?~
            [ (default :: Container)
                # _image ?~ "gcr.io/google_containers/echoserver:1.4"
                # _imagePullPolicy ?~ "Always"
                # _name ?~ "echo"
                # _ports ?~ [ default # _containerPort ?~ 8080 ]]
          # _restartPolicy ?~ "Always"
          # _terminationGracePeriodSeconds ?~ 30
          # _dnsPolicy ?~ "ClusterFirst"
          # _schedulerName ?~ "default-scheduler")))

echoService :: Service
echoService =
  default
    # _metadata ?~ (default
      # _labels ?~ (Object.fromFoldable
        [ Tuple "service" "echoserver" ])
      # _name ?~ "echoserver")
    # _spec ?~ (default
      # _type ?~ "NodePort"
      # _ports ?~ [ default
                     # _name ?~ "http"
                     # _protocol ?~ "TCP"
                     # _port ?~ 9200
                     # _targetPort ?~ (IntOrStringInt 8080) ]
      # _selector ?~ (Object.fromFoldable [ Tuple "service" "echoserver" ]))

testNamespace :: Namespace
testNamespace = default
  # _metadata ?~ (default # _name ?~ "test")

-- Example: Without lenses there is a lot of boilerplate
testNamespace2 :: Namespace
testNamespace2 = default # (\(Namespace n) -> Namespace $ n
    { metadata = Just $
        default # (\(MetaV1.ObjectMeta m) -> MetaV1.ObjectMeta $ m
          { name = Just "test" }) })

loadConfigFromEnv :: Aff Config
loadConfigFromEnv = do
  host <- envVar "K8S_HOST"
  portStr <- envVar "K8S_PORT"
  let port = fromMaybe 80 (portStr >>= parseInt)
  protocolStr <- envVar "K8S_PROTOCOL"
  let protocol = maybe Request.ProtocolHTTP parseProtocol protocolStr
  let cluster = { host: fromMaybe "localhost" host, protocol, port }
  caCert <- envVar "CA_CERT" >>= loadFile
  clientCert <- envVar "CLIENT_CERT" >>= loadFile
  clientKey <- envVar "CLIENT_KEY" >>= loadFile
  user <- envVar "BASIC_AUTH_USER"
  pass <- envVar "BASIC_AUTH_PASS"
  let basicAuth = {user: _, password: _} <$> user <*> pass
  bearerTokenFromFile <- envVar "BEARER_TOKEN_FILE" >>= loadFile
  bearerTokenInline <- envVar "BEARER_TOKEN"
  let bearerToken = bearerTokenFromFile <|> bearerTokenInline
  pure $ Config $
    { basicAuth
    , bearerToken
    , cluster
    , tls: {caCert, clientCert, clientKey, verifyServerCert: true} }
  where
    envVar v = liftEffect (Process.lookupEnv v)
    loadFile = maybe (pure mempty) (map Just <<< Cfg.loadFile)
    parseProtocol p = if p == "https"
                    then Request.ProtocolHTTPS
                    else Request.ProtocolHTTP
  
helloServiceTest :: Config -> Aff Unit
helloServiceTest cfg = Aff.finally cleanup do
  _ <- deleteNs testNs
  log "Creating test namespace"
  ns <- NS.create cfg testNamespace >>= unwrapEither
  log "Creating new deployment"
  deployment <- Deploy.createNamespaced cfg testNs echoDeployment >>= unwrapEither
  log "Waiting for deployment to be ready"
  result <- iterateUntil isReadyDeploy $ shortDelay *> readDeploy cfg testNs "echoserver" 
  log $ "Deployment ready with status: " <> show (result ^? (L._Right <<< _status))
  log "Creating new service"
  service <- Service.createNamespaced cfg testNs echoService >>= unwrapEither
  case service ^. _spec <<< L._Just <<< _clusterIP of
    Just ip -> pingEndpoint ip 9200
    Nothing -> throwError $ Exception.error "Failure: No cluster IP on service"
  where
    cleanup = do
      log "Cleaning up"
      deleteNs testNs
    testNs = "test"
    deleteNs ns = do
      log $ "Deleting namespace '" <> ns <> "'"
      deleteRes <- NS.delete cfg "test" default default
      _ <- iterateUntil notFound $ shortDelay *> log "Check: does namespace exist?" *> readNs cfg "test"
      log $ "Deleted test namespace with result: " <> show deleteRes
    shortDelay = Aff.delay (Milliseconds 500.0)

iterateUntil :: forall a m. Monad m => (a -> Boolean) -> m a -> m a
iterateUntil p x = x >>= iterateUntilM p (const x)

iterateUntilM :: forall m a. Monad m => (a -> Boolean) -> (a -> m a) -> a -> m a
iterateUntilM p f v = if p v then pure v else f v >>= iterateUntilM p f
    
readNs :: Config -> String -> Aff (Either MetaV1.Status Namespace)
readNs cfg name = NS.read cfg name default
      
notFound :: (Either MetaV1.Status Namespace) -> Boolean
notFound = L.preview (L._Left <<< _code <<< L._Just)
           >>> maybe false (eq 404)
 
readDeploy :: Config -> String -> String -> Aff (Either MetaV1.Status Deployment)
readDeploy cfg ns name = Deploy.readNamespaced cfg ns name default

isReadyDeploy :: (Either MetaV1.Status Deployment) -> Boolean
isReadyDeploy = L.preview (L._Right <<< readyReplicas)
                >>> maybe false (_ > 0)

hasReadyReplica :: Deployment -> Boolean
hasReadyReplica = L.preview readyReplicas
                  >>> maybe false (_ > 0)
    
readyReplicas :: L.Traversal' Deployment Int
readyReplicas = _status <<< L._Just <<< _readyReplicas <<< L._Just

pingEndpoint :: String -> Int -> Aff Unit
pingEndpoint ip port = do
  log $ "Ping " <> ip <> ":" <> show port
  let req =
        { basicAuth: Nothing
        , bearerToken: Nothing
        , body: Nothing
        , caCert: Nothing
        , clientCert: Nothing
        , clientKey: Nothing
        , host: ip
        , port
        , protocol: Request.ProtocolHTTP
        , method: Method.GET
        , path: "/"
        , rejectUnauthorized: true }
  attempt <- Aff.attempt $ Request.request req
  case attempt of
    Right res -> do
      log "Received valid response from endpoint:"
      log res.body
    Left e -> do
      Aff.delay (Milliseconds 1000.0)
      pingEndpoint ip port

unwrapEither :: forall a b. Show a => Either a b -> Aff b
unwrapEither (Left error) = throwError (Exception.error $ show error)
unwrapEither (Right val) = pure val

loadKubeConfig :: Aff (Either ConfigError Config)
loadKubeConfig = do
  homeDir <- liftEffect OS.homedir
  let path = homeDir <> "/.kube/config"
  Config.loadKubeConfig path

main :: Effect Unit
main = launchAff_ do
  -- loadConfigFromEnv >>= helloServiceTest
  config <- loadKubeConfig
  liftEffect $ log (show config)
