module Kubernetes.Generation.Passes.GenerateLenses where

import Prelude

import Data.Array as Array
import Data.List.NonEmpty as NonEmptyList
import Kubernetes.Generation.AST (AST, Declaration(..), Module, ModuleName, ObjectType(..))

generateLenses :: ModuleName -> AST -> AST
generateLenses moduleNs ast@{ modules } = ast { modules = modules <> [lensModule] } 
  where
    lensModule =
      collectLensFields ast
      # map mkLensDecl
      # generateLensModule moduleNs

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

generateLensModule :: ModuleName -> Array Declaration -> Module
generateLensModule moduleNs declarations =
  { name: NonEmptyList.snoc moduleNs "Lens"
  , imports:
    [ "Prelude"
    , "Data.Lens (Lens')"
    , "Data.Lens.Iso.Newtype (_Newtype)"
    , "Data.Lens.Record (prop)"
    , "Data.Maybe (Maybe(Just,Nothing))"
    , "Data.Newtype (class Newtype)"
    , "Data.Symbol (SProxy(SProxy))"
    , "Kubernetes.Default (class Default)" ]
    , declarations }
