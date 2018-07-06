module Kubernetes.Generation.Main where

import Prelude

import Data.Array as Array
import Data.Either (Either(..))
import Data.List as List
import Data.List.NonEmpty (NonEmptyList(..))
import Data.List.NonEmpty as NonEmptyList
import Data.NonEmpty ((:|))
import Data.String as String
import Data.Traversable (sequence)
import Effect.Aff (Aff, launchAff_, throwError, try)
import Effect (Effect)
import Effect.Class.Console (log)
import Effect.Exception as Exception
import Kubernetes.Generation.AST (Module, ModuleName)
import Kubernetes.Generation.Generation as Gen
import Kubernetes.Generation.Emitter as Emit
import Kubernetes.Generation.Swagger (Swagger)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (mkdir, readTextFile, writeTextFile)
import Partial.Unsafe (unsafePartial)
import Simple.JSON (class ReadForeign, readJSON)

generationConfig :: Config
generationConfig =
  { moduleNs: NonEmptyList ("Kubernetes" :| pure "Api")
  , outputDir: "src"
  , swaggerFile: "./definitions/swagger_v1.10.0.json" }

type Config =
  { moduleNs :: ModuleName
  , outputDir :: String
  , swaggerFile :: String }

generateAndEmitApi :: Config -> Aff Unit
generateAndEmitApi {moduleNs, outputDir, swaggerFile} = do
  (swagger :: Swagger) <- loadSimpleJsonFile swaggerFile
  let apiAst = (unsafePartial $ Gen.generateApi moduleNs swagger)
  ensureDirsOnPathExist (NonEmptyList.cons outputDir moduleNs)
  _ <- unsafePartial $ sequence $ writeModuleFile outputDir <$> apiAst.modules
  log $ "Generated " <> show (Array.length apiAst.modules) <> " modules"
  pure unit

loadSimpleJsonFile :: forall a. ReadForeign a => String -> Aff a
loadSimpleJsonFile path = do
  fileStr <- readTextFile UTF8 path
  unwrapEitherIntoAff $ readJSON fileStr

unwrapEitherIntoAff :: forall a b. Show a => Either a b -> Aff b
unwrapEitherIntoAff (Left error) = throwError (Exception.error $ show error)
unwrapEitherIntoAff (Right val) = pure val

ensureDirsOnPathExist :: NonEmptyList String -> Aff Unit
ensureDirsOnPathExist modulePath = do
  _ <- sequence $ ensureDirExists <$> outputDirs
  pure unit
  where
    outputDirs = mkOutputDir <$> (Array.range 1 $ NonEmptyList.length modulePath)
    mkOutputDir i = String.joinWith "/" $ List.toUnfoldable $ NonEmptyList.take i modulePath

ensureDirExists :: String -> Aff Unit
ensureDirExists outputDir = do
  dirResult <- try (mkdir outputDir)
  case dirResult of
    Left error -> pure unit
    Right ok -> log $ "Created output directory '" <> outputDir <> "'"

writeModuleFile :: Partial => String -> Module -> Aff Unit
writeModuleFile dir mod@{name} = do
  let dropLast = NonEmptyList.init >>> NonEmptyList.fromList
  _ <- sequence $ ensureDirsOnPathExist <$> (dropLast (NonEmptyList.cons dir name))
  writeTextFile UTF8 fileName contents
  where
    fileName = dir <> "/" <> mkPath name <> ".purs"
    contents = Emit.emitModule mod
    mkPath = String.joinWith "/" <<< NonEmptyList.toUnfoldable
  
main :: Effect Unit
main = launchAff_ $ generateAndEmitApi generationConfig
