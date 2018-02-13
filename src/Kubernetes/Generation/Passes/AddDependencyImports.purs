module Kubernetes.Generation.Passes.AddDependencyImports where

import Prelude
import Data.Array as Array
import Data.Lens as L
import Data.Lens ((^..))
import Data.List (List)
import Data.List as List
import Data.Maybe (Maybe(..))
import Kubernetes.Generation.AST
import Kubernetes.Generation.Passes.HelperLenses (_adtTypeRefs, _aliasTypeRefs, _astDeclarations, _endpointBodyRefs, _endpointQueryParamRefs, _endpointReturnTypeRef, _newtypeDeclRefs, _recordDeclRefs)

addDependencyImports :: AST -> AST
addDependencyImports =
  L.over
    (_modules <<< L.traversed)
    (\m -> L.over _imports (appendImports (moduleDepImports m)) m)
  where
    appendImports :: Array Import -> Array Import -> Array Import
    appendImports depImports imports = (imports <> depImports)
      # Array.sort
      # Array.nub
  
moduleDepImports :: Module -> Array Import
moduleDepImports = moduleDeps
  >>> List.sort
  >>> List.nub
  >>> map (\i -> K8SImport {parentModule: Nothing, k8sModule: i})
  >>> List.toUnfoldable

moduleDeps :: Module -> List ModuleName
moduleDeps mod = refNames # List.filter ((/=) mod.name)
  where
    refNames = 
      refs _newtypeDeclRefs <>
      refs _recordDeclRefs <>
      refs _adtTypeRefs <>
      refs _aliasTypeRefs <>
      refs _endpointBodyRefs <>
      refs _endpointQueryParamRefs <>
      refs _endpointReturnTypeRef
    refs :: L.Traversal' Declaration TypeDecl -> List ModuleName
    refs lens =
      mod ^.. (_astDeclarations <<< lens <<< _refModName) <>
      mod ^.. (_astDeclarations <<< lens <<< _TypeArray <<< _refModName) <>
      mod ^.. (_astDeclarations <<< lens <<< _TypeObject <<< _refModName) <>
      mod ^.. (_astDeclarations <<< lens <<< _TypeNullable <<< _refModName)

_refModName :: L.Traversal' TypeDecl ModuleName
_refModName = _TypeRef <<< _moduleName
