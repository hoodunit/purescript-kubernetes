module Kubernetes.Test.Integration.Main where

import Kubernetes.Api.BatchV1
import Kubernetes.Api.CoreV1
import Kubernetes.Api.Lens
import Prelude

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff, launchAff_, throwError)
import Control.Monad.Aff as Aff
import Control.Monad.Aff.Console (log, logShow)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception as Exception
import Control.Monad.Except (runExcept)
import Control.Monad.Loops (iterateUntil)
import Data.Either (Either(..), either, hush)
import Data.Foreign (MultipleErrors)
import Data.Foreign as Foreign
import Data.Function.Uncurried (Fn3, runFn3)
import Data.HTTP.Method as Method
import Data.Lens
import Data.Lens as L
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Monoid (mempty)
import Data.StrMap as StrMap
import Data.Time.Duration (Milliseconds(..))
import Data.Tuple (Tuple(..))
import Debug.Trace as Debug
import Kubernetes.Api.CoreV1.Namespace as NS
import Kubernetes.Api.CoreV1.Service as Service
import Kubernetes.Api.ExtensionsV1Beta1.Deployment as Deploy
import Kubernetes.Api.APIExtensionsV1Beta1 (Deployment(Deployment))
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.Util (IntOrString(..))
import Kubernetes.Client as Client
import Kubernetes.Config (Config(Config))
import Kubernetes.Config as Cfg
import Kubernetes.Default (default)
import Kubernetes.Request as Request
import Node.Encoding (Encoding(..))
import Node.FS (FS)
import Node.FS.Aff (readTextFile)
import Node.HTTP (HTTP)
import Node.Process (PROCESS)
import Node.Process as Process
    
echoDeployment :: Deployment
echoDeployment =
  (default :: Deployment)
    # _apiVersion ?~ "extensions/v1beta1"
    # _kind ?~ "Deployment"
    # _metadata ?~ (default
      # _labels ?~ (StrMap.fromFoldable
        [ Tuple "service" "echoserver" ])
      # _name ?~ "echoserver")
    # _spec ?~ (default
      # _replicas ?~ 1
      # _strategy ?~ (default
        # _type ?~ "Recreate")
      # _template ?~ (default
        # _metadata ?~ (default
          # _name ?~ "echoserver"
          # _labels ?~ StrMap.fromFoldable
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
    # _apiVersion ?~ "v1"
    # _kind ?~ "Service"
    # _metadata ?~ (default
      # _labels ?~ (StrMap.fromFoldable
        [ Tuple "service" "echoserver" ])
      # _name ?~ "echoserver")
    # _spec ?~ (default
      # _type ?~ "NodePort"
      # _ports ?~ [ default
                     # _name ?~ "http"
                     # _protocol ?~ "TCP"
                     # _port ?~ 9200
                     # _targetPort ?~ (IntOrStringInt 8080) ]
      # _selector ?~ (StrMap.fromFoldable [ Tuple "service" "echoserver" ]))

testNamespace :: Namespace
testNamespace = default
  # _apiVersion ?~ "v1"
  # _kind ?~ "Namespace"
  # _metadata ?~ (default # _name ?~ "test")

-- Example: Without lenses there is a lot of boilerplate
testNamespace2 :: Namespace
testNamespace2 = default # (\(Namespace n) -> Namespace $ n
    { apiVersion = Just "v1"
    , kind = Just "v1"
    , metadata = Just $
        default # (\(MetaV1.ObjectMeta m) -> MetaV1.ObjectMeta $ m
          { name = Just "test" }) })
 
readDeploy :: Config -> String -> String -> Aff _ (Either MetaV1.Status Deployment)
readDeploy cfg ns name = Deploy.readNamespacedDeployment cfg ns name default

isReadyDeploy :: (Either MetaV1.Status Deployment) -> Boolean
isReadyDeploy = L.preview (L._Right <<< readyReplicas)
                >>> maybe false (_ > 0)

hasReadyReplica :: Deployment -> Boolean
hasReadyReplica = L.preview readyReplicas
                  >>> maybe false (_ > 0)
    
readyReplicas :: L.Traversal' Deployment Int
readyReplicas = _status <<< L._Just <<< _readyReplicas <<< L._Just

pingEndpoint :: String -> Int -> Aff _ Unit
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

unwrapEither :: forall a b. Show a => Either a b -> Aff _ b
unwrapEither (Left error) = throwError (Exception.error $ show error)
unwrapEither (Right val) = pure val

loadConfig :: Aff _ Config
loadConfig = do
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
    envVar v = liftEff (Process.lookupEnv v)
    loadFile = maybe (pure mempty) (map Just <<< Cfg.loadFile)
    parseProtocol p = if p == "https"
                    then Request.ProtocolHTTPS
                    else Request.ProtocolHTTP

foreign import parseIntImpl :: Fn3 (Int -> Maybe Int) (Maybe Int) String (Maybe Int)

parseInt :: String -> Maybe Int
parseInt = runFn3 parseIntImpl Just Nothing
  
podHelloWorld :: Config -> Aff _ Unit
podHelloWorld cfg = Aff.finally cleanup do
  _ <- deleteNs testNs
  
  log "Creating test namespace"
  ns <- NS.createNamespace cfg testNamespace >>= unwrapEither
  
  log "Creating new deployment"
  deployment <- Deploy.createNamespacedDeployment cfg testNs echoDeployment >>= unwrapEither
  log "Waiting for deployment to be ready"
  result <- iterateUntil isReadyDeploy $ shortDelay *> readDeploy cfg testNs "echoserver" 
  log $ "Deployment ready with status: " <> show (result ^? (L._Right <<< _status))
  log "Creating new service"
  service <- Service.createNamespacedService cfg testNs echoService >>= unwrapEither
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
      deleteRes <- NS.deleteNamespace cfg "test" default default
      _ <- iterateUntil notFound $ shortDelay *> log "Check: does namespace exist?" *> readNs cfg "test"
      log $ "Deleted test namespace with result: " <> show deleteRes
    shortDelay = Aff.delay (Milliseconds 500.0)
    
readNs :: Config -> String -> Aff _ (Either MetaV1.Status Namespace)
readNs cfg name = NS.readNamespace cfg name default
      
notFound :: (Either MetaV1.Status Namespace) -> Boolean
notFound = L.preview (L._Left <<< _code <<< L._Just)
           >>> maybe false (eq 404)

main :: Eff _ Unit
main = launchAff_ do
  cfg <- loadConfig
  podHelloWorld cfg
