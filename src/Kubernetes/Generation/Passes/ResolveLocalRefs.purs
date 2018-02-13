module Kubernetes.Generation.Passes.ResolveLocalRefs where

import Prelude

import Data.Lens as L
import Data.Lens.Iso.Newtype (_Newtype)
import Kubernetes.Generation.AST (AST, Declaration, Module, ModuleName, ObjectType(..), TypeDecl(..), _AdtType, _AliasType, _Endpoint, _NewtypeDecl, _RecordDecl, _TypeArray, _TypeNullable, _TypeObject, _body, _constructors, _declarations, _fields, _innerType, _modules, _queryParams, _returnType)
import Kubernetes.Generation.Passes.HelperLenses (_adtTypeRefs, _aliasTypeRefs, _astDeclarations, _endpointBodyRefs, _endpointQueryParamRefs, _endpointReturnTypeRef, _newtypeDeclRefs, _recordDeclRefs)

resolveLocalRefs :: AST -> AST
resolveLocalRefs = L.over (_modules <<< L.traversed) resolveModuleLocalRefs

resolveModuleLocalRefs :: Module -> Module
resolveModuleLocalRefs mod = mod
  # L.over (_astDeclarations <<< _newtypeDeclRefs) resolveRefs
  # L.over (_astDeclarations <<< _newtypeDeclRefs <<< _TypeArray) resolveRefs
  # L.over (_astDeclarations <<< _newtypeDeclRefs <<< _TypeObject) resolveRefs
  # L.over (_astDeclarations <<< _newtypeDeclRefs <<< _TypeNullable) resolveRefs
  # L.over (_astDeclarations <<< _recordDeclRefs) resolveRefs
  # L.over (_astDeclarations <<< _recordDeclRefs <<< _TypeArray) resolveRefs
  # L.over (_astDeclarations <<< _recordDeclRefs <<< _TypeObject) resolveRefs
  # L.over (_astDeclarations <<< _recordDeclRefs <<< _TypeNullable) resolveRefs
  # L.over (_astDeclarations <<< _adtTypeRefs) resolveRefs
  # L.over (_astDeclarations <<< _adtTypeRefs <<< _TypeArray) resolveRefs
  # L.over (_astDeclarations <<< _adtTypeRefs <<< _TypeObject) resolveRefs
  # L.over (_astDeclarations <<< _adtTypeRefs <<< _TypeNullable) resolveRefs
  # L.over (_astDeclarations <<< _aliasTypeRefs) resolveRefs
  # L.over (_astDeclarations <<< _aliasTypeRefs <<< _TypeArray) resolveRefs
  # L.over (_astDeclarations <<< _aliasTypeRefs <<< _TypeObject) resolveRefs
  # L.over (_astDeclarations <<< _aliasTypeRefs <<< _TypeNullable) resolveRefs
  # L.over (_astDeclarations <<< _endpointBodyRefs) resolveRefs
  # L.over (_astDeclarations <<< _endpointBodyRefs <<< _TypeArray) resolveRefs
  # L.over (_astDeclarations <<< _endpointBodyRefs <<< _TypeObject) resolveRefs
  # L.over (_astDeclarations <<< _endpointBodyRefs <<< _TypeNullable) resolveRefs
  # L.over (_astDeclarations <<< _endpointQueryParamRefs) resolveRefs
  # L.over (_astDeclarations <<< _endpointQueryParamRefs <<< _TypeArray) resolveRefs
  # L.over (_astDeclarations <<< _endpointQueryParamRefs <<< _TypeObject) resolveRefs
  # L.over (_astDeclarations <<< _endpointQueryParamRefs <<< _TypeNullable) resolveRefs
  # L.over (_astDeclarations <<< _endpointReturnTypeRef) resolveRefs
  # L.over (_astDeclarations <<< _endpointReturnTypeRef <<< _TypeArray) resolveRefs
  # L.over (_astDeclarations <<< _endpointReturnTypeRef <<< _TypeObject) resolveRefs
  # L.over (_astDeclarations <<< _endpointReturnTypeRef <<< _TypeNullable) resolveRefs
  where
    resolveRefs = resolveLocalRef mod.name

resolveLocalRef :: ModuleName -> TypeDecl -> TypeDecl
resolveLocalRef fileModName (TypeRef {moduleName, k8sTypeName}) | fileModName == moduleName =
  TypeLocalRef k8sTypeName
resolveLocalRef _ d = d
