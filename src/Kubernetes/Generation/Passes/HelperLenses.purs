module Kubernetes.Generation.Passes.HelperLenses where

import Kubernetes.Generation.AST
import Prelude

import Data.Lens as L
import Data.Lens.Iso.Newtype (_Newtype)

_astDeclarations :: L.Traversal' Module Declaration
_astDeclarations = _declarations <<< L.traversed

_newtypeDeclRefs :: L.Traversal' Declaration TypeDecl
_newtypeDeclRefs = _NewtypeDecl <<< _optionalFieldRefs

_recordDeclRefs :: L.Traversal' Declaration TypeDecl
_recordDeclRefs = _RecordDecl <<< _optionalFieldRefs

_adtTypeRefs :: L.Traversal' Declaration TypeDecl
_adtTypeRefs = _AdtType <<< _constructors <<< L.traversed

_aliasTypeRefs :: L.Traversal' Declaration TypeDecl
_aliasTypeRefs = _AliasType <<< _innerType

_endpointBodyRefs :: L.Traversal' Declaration TypeDecl
_endpointBodyRefs = _Endpoint <<< _body <<< L._Just

_endpointQueryParamRefs :: L.Traversal' Declaration TypeDecl
_endpointQueryParamRefs = _Endpoint <<< _queryParams <<< L._Just <<< _optionalFieldRefs

_endpointReturnTypeRef :: L.Traversal' Declaration TypeDecl
_endpointReturnTypeRef = _Endpoint <<< _returnType

_optionalFieldRefs :: L.Traversal' ObjectType TypeDecl
_optionalFieldRefs = _Newtype <<< _fields <<< L.traversed <<< _innerType
