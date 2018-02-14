module Kubernetes.Generation.Passes.PrefixNamespace where

import Prelude
import Data.Lens ((%~), (?~))
import Data.Lens as L
import Kubernetes.Generation.AST

prefixNamespace :: ModuleName -> AST -> AST
prefixNamespace ns = (_modules <<< L.traversed) %~ fixModule
  where
    fixModule = prefixNamespaceMod >>> setImportParentMod
    prefixNamespaceMod = _name %~ (ns <> _)
    setImportParentMod = (_imports <<< L.traversed <<< _K8SImport <<< _parentModule) ?~ ns
