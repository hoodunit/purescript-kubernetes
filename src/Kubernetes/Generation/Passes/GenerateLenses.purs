module Kubernetes.Generation.Passes.GenerateLenses where

import Prelude

import Data.Array as Array
import Data.Lens as L
import Data.Lens.Iso.Newtype (_Newtype)
import Data.List as List
import Kubernetes.Generation.AST (AST, Declaration(..), Import(K8SImport, RawImport), Module, _NewtypeDecl, _declarations, _fields, _modules, _name)

generateLenses :: AST -> AST
generateLenses ast = L.appendOver _modules [mkLensModule ast] ast

mkLensModule :: AST -> Module
mkLensModule =
  collectLensFields
  >>> Array.sort
  >>> Array.nub
  >>> map mkLensDecl
  >>> generateLensModule

collectLensFields :: AST -> Array String
collectLensFields = L.toListOf _lensFields >>> List.toUnfoldable

_lensFields :: L.Traversal' AST String
_lensFields = _moduleDecls <<< _NewtypeDeclFieldNames

_moduleDecls :: L.Traversal' AST Declaration
_moduleDecls = _modules <<< L.traversed <<< _declarations <<< L.traversed

_NewtypeDeclFieldNames :: L.Traversal' Declaration String
_NewtypeDeclFieldNames = _NewtypeDecl <<< _Newtype <<< _fields <<< L.traversed <<< _name

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
    , RawImport "Kubernetes.Default (class Default)" ]
    , declarations }
