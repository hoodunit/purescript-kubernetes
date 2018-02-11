module Kubernetes.Generation.Passes.PrefixNamespace where

import Prelude

import Data.Maybe (Maybe(..))
import Kubernetes.Generation.AST (AST, Import(..), Module, ModuleName)

prefixNamespace :: ModuleName -> AST -> AST
prefixNamespace ns ast = ast { modules = prefixModuleNamespace ns <$> ast.modules }
    
prefixModuleNamespace :: ModuleName -> Module -> Module
prefixModuleNamespace name mod = mod
  { name = name <> mod.name
  , imports = prefixNs name <$> mod.imports }
  where
    prefixNs :: ModuleName -> Import -> Import
    prefixNs n (K8SImport k) = K8SImport $ k {parentModule = Just n}
    prefixNs _ i = i
