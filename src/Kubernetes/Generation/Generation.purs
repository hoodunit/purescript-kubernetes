module Kubernetes.Generation.Generation where

import Prelude

import Data.Array as Array
import Data.List (List(..))
import Data.List as List
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(..))
import Kubernetes.Generation.AST as AST
import Kubernetes.Generation.GenerateApi (generateEndpointModules)
import Kubernetes.Generation.GenerateDefinitions (KubernetesSchema, generateDefinitionModules)
import Kubernetes.Generation.JsonSchema (Schema)
import Kubernetes.Generation.Passes.GenerateLenses (generateLenses)
import Kubernetes.Generation.Swagger (Swagger)
import Partial.Unsafe (unsafePartial)

generateApi :: Partial => AST.ModuleName -> Swagger -> AST.AST
generateApi moduleNs swagger =
  mergeModules endpointModules definitionModules
  # generateLenses moduleNs
  where
    endpointModules = generateEndpointModules moduleNs swagger.paths
    definitionModules = mkDefinitionsAst swagger.definitions
    
    mkDefinitionsAst :: StrMap Schema -> Array AST.Module
    mkDefinitionsAst schemas = schemas
      # parseSchemas
      # \s -> unsafePartial (generateDefinitionModules moduleNs s)

    parseSchemas :: StrMap Schema -> Array KubernetesSchema
    parseSchemas = StrMap.toUnfoldable
      >>> map (\(Tuple name schema) -> {name, schema})

mergeModules :: Array AST.Module -> Array AST.Module -> AST.AST
mergeModules endpointsModules defsModules =
  { modules: Array.fromFoldable $
      mergeAsts' (List.fromFoldable endpointsModules) (List.fromFoldable defsModules) Nil }

  where
    mergeAsts' :: List AST.Module -> List AST.Module -> List AST.Module -> List AST.Module
    mergeAsts' Nil Nil merged = merged
    mergeAsts' Nil defs merged = merged <> defs
    mergeAsts' endpoints Nil merged = merged <> endpoints
    mergeAsts' (Cons endpointMod restEndpoints) defs merged =
      case List.partition (\{name} -> name == endpointMod.name) defs of
        {yes: Cons matchingDef Nil, no: otherDefs} ->
          mergeAsts' restEndpoints otherDefs (Cons (mergeTwoModules endpointMod matchingDef) merged)
        {yes: _, no: otherDefs} -> mergeAsts' restEndpoints otherDefs (Cons endpointMod merged)

mergeTwoModules :: AST.Module -> AST.Module -> AST.Module
mergeTwoModules {name, imports: endpointsImports, declarations: endpointsDecls}
             {imports: defsImports, declarations: defsDecls} =
  {name, imports, declarations}
  where
    imports = Array.nub $ Array.sort $ endpointsImports <> defsImports
    declarations = endpointsDecls <> defsDecls
