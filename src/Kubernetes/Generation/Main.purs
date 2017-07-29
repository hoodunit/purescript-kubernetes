module Kubernetes.Generation.Main where

import Prelude

import Control.Monad.Aff (Aff, launchAff_, throwError, try)
import Control.Monad.Aff.Console (log)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception as Exception
import Data.Array as Array
import Data.Either (Either(..))
import Data.String as String
import Data.Traversable (sequence)
import Kubernetes.Generation.AST (ApiModule)
import Kubernetes.Generation.ApiGeneration as Gen
import Kubernetes.Generation.Emitter as Emit
import Kubernetes.Generation.Swagger (Swagger)
import Node.Encoding (Encoding(..))
import Node.FS (FS)
import Node.FS.Aff (mkdir, readTextFile, writeTextFile)
import Partial.Unsafe (unsafePartial)
import Simple.JSON (class ReadForeign, readJSON)

generationConfig :: Config
generationConfig =
  { moduleNs: "Kubernetes.Api"
  , outputDir: "src"
  , swaggerFile: "./definitions/swagger_v1.10.0.json" }

type Config =
  { moduleNs :: String
  , outputDir :: String
  , swaggerFile :: String }

generateAndEmitApi :: forall e. Config -> Aff (console :: CONSOLE, fs :: FS | e) Unit
generateAndEmitApi {moduleNs, outputDir, swaggerFile} = do
  (swagger :: Swagger) <- loadSimpleJsonFile swaggerFile
  let apiAst = (unsafePartial $ Gen.generateApi moduleNs swagger)
  ensureModuleDirsExist outputDir moduleNs
  _ <- unsafePartial $ sequence $ writeModuleFile outputDir <$> apiAst.modules
  log $ "Generated " <> show (Array.length apiAst.modules) <> " modules"
  pure unit

loadSimpleJsonFile :: forall a e. ReadForeign a => String -> Aff (fs :: FS | e) a
loadSimpleJsonFile path = do
  fileStr <- readTextFile UTF8 path
  unwrapEitherIntoAff $ readJSON fileStr

unwrapEitherIntoAff :: forall a b e. Show a => Either a b -> Aff e b
unwrapEitherIntoAff (Left error) = throwError (Exception.error $ show error)
unwrapEitherIntoAff (Right val) = pure val

ensureModuleDirsExist :: forall e. String -> String -> Aff (console :: CONSOLE, fs :: FS | e) Unit
ensureModuleDirsExist outputDir moduleNs = do
  _ <- sequence $ ensureDirExists <$> outputDirs
  pure unit
  where
    modulePath = [outputDir] <> String.split (String.Pattern ".") moduleNs
    outputDirs = mkOutputDir <$> (Array.range 1 $ Array.length modulePath)
    mkOutputDir i = String.joinWith "/" $ Array.take i modulePath

ensureDirExists :: forall e. String -> Aff (console :: CONSOLE, fs :: FS | e) Unit
ensureDirExists outputDir = do
  dirResult <- try (mkdir outputDir)
  case dirResult of
    Left error -> log $ "Ignoring error creating output directory '" <> outputDir <> "': " <>
                  "\n  " <> show error
    Right ok -> log $ "Created output directory '" <> outputDir <> "'"

writeModuleFile :: forall e. Partial => String -> ApiModule -> Aff (fs :: FS | e) Unit
writeModuleFile dir mod@{name} = writeTextFile UTF8 fileName contents
  where
    fileName = dir <> "/" <> mkPath name <> ".purs"
    contents = Emit.emitApiModule mod
    mkPath n = String.joinWith "/" $ String.split (String.Pattern ".") n
  
main :: forall e. Eff (console :: CONSOLE, fs :: FS | e) Unit
main = launchAff_ $ generateAndEmitApi generationConfig
