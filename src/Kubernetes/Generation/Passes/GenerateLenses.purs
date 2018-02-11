module Kubernetes.Generation.Passes.GenerateLenses where

import Prelude

import Data.Array as Array
import Data.List.NonEmpty as NonEmptyList
import Kubernetes.Generation.AST (AST, Declaration(..), Module, ObjectType(..), Import(K8SImport, RawImport))

generateLenses :: AST -> AST
generateLenses ast@{ modules } = ast { modules = modules <> [lensModule] } 
  where
    lensModule =
      collectLensFields ast
      # map mkLensDecl
      # generateLensModule

collectLensFields :: AST -> Array String
collectLensFields {modules} =
  modules
  >>= collectModuleFields
  # Array.nub
  where
    collectModuleFields :: Module -> Array String
    collectModuleFields {declarations} = declarations >>= collectDeclFields
      
    collectDeclFields :: Declaration -> Array String
    collectDeclFields (NewtypeDecl (ObjectType {fields})) = _.name <$> fields
    collectDeclFields (RecordDecl _) = []
    collectDeclFields (AdtType _) = []
    collectDeclFields (AliasType _) = []
    collectDeclFields (LensHelper _) = []
    collectDeclFields (Endpoint _) = []

mkLensDecl :: String -> Declaration
mkLensDecl name = LensHelper {name}

generateLensModule :: Array Declaration -> Module
generateLensModule declarations =
  { name: pure "Lens"
  , imports:
    [ RawImport "Prelude"
    , RawImport "Data.Lens (Lens')"
    , RawImport "Data.Lens.Iso.Newtype (_Newtype)"
    , RawImport "Data.Lens.Record (prop)"
    , RawImport "Data.Maybe (Maybe(Just,Nothing))"
    , RawImport "Data.Newtype (class Newtype)"
    , RawImport "Data.Symbol (SProxy(SProxy))"
    , RawImport "Kmubernetes.Default (class Default)" ]
    , declarations }
