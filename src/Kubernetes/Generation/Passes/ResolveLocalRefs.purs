module Kubernetes.Generation.Passes.ResolveLocalRefs where

import Prelude
import Data.Lens ((%~))
import Data.Lens as L
import Kubernetes.Generation.AST
import Kubernetes.Generation.Passes.HelperLenses (_adtTypeRefs, _aliasTypeRefs, _astDeclarations, _endpointBodyRefs, _endpointQueryParamRefs, _endpointReturnTypeRef, _newtypeDeclRefs, _recordDeclRefs)

resolveLocalRefs :: AST -> AST
resolveLocalRefs = L.over (_modules <<< L.traversed) resolveDeclRefs

resolveDeclRefs :: Module -> Module
resolveDeclRefs mod = mod # L.over _astDeclarations (
  (_newtypeDeclRefs %~ resolveRefs)
  >>> (_recordDeclRefs %~ resolveRefs)
  >>> (_adtTypeRefs %~ resolveRefs)
  >>> (_aliasTypeRefs %~ resolveRefs)
  >>> (_endpointBodyRefs %~ resolveRefs)
  >>> (_endpointQueryParamRefs %~ resolveRefs)
  >>> (_endpointReturnTypeRef %~ resolveRefs))
  where
    resolveRefs =
      resolveRef
      >>> (_TypeArray %~ resolveRef)
      >>> (_TypeObject %~ resolveRef)
      >>> (_TypeNullable %~ resolveRef)
    resolveRef = resolveLocalRef mod.name

resolveLocalRef :: ModuleName -> TypeDecl -> TypeDecl
resolveLocalRef fileModName (TypeRef {moduleName, k8sTypeName}) | fileModName == moduleName =
  TypeLocalRef k8sTypeName
resolveLocalRef _ d = d
