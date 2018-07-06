module Kubernetes.Generation.Swagger where

import Prelude

import Data.Lens as L
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe)
import Data.Symbol (SProxy(..))
import Foreign.Object (Object)
import Kubernetes.Generation.JsonSchema (Schema)
import Kubernetes.SchemaExtensions (GroupVersionKind(GroupVersionKind))

type Swagger =
  { paths :: Object PathItem
  , definitions :: Object Schema }
    
_paths :: L.Lens' Swagger (Object PathItem)
_paths = prop (SProxy :: SProxy "paths")
    
_definitions :: L.Lens' Swagger (Object Schema)
_definitions = prop (SProxy :: SProxy "definitions")

type PathItem =
  { get :: Maybe Operation
  , put :: Maybe Operation
  , post :: Maybe Operation
  , delete :: Maybe Operation
  , options :: Maybe Operation
  , head :: Maybe Operation
  , patch :: Maybe Operation }
    
_get :: L.Lens' PathItem (Maybe Operation)
_get = prop (SProxy :: SProxy "get")
    
_put :: L.Lens' PathItem (Maybe Operation)
_put = prop (SProxy :: SProxy "put")
    
_post :: L.Lens' PathItem (Maybe Operation)
_post = prop (SProxy :: SProxy "post")
    
_delete :: L.Lens' PathItem (Maybe Operation)
_delete = prop (SProxy :: SProxy "delete")
    
_options :: L.Lens' PathItem (Maybe Operation)
_options = prop (SProxy :: SProxy "options")
    
_head :: L.Lens' PathItem (Maybe Operation)
_head = prop (SProxy :: SProxy "head")
    
_patch :: L.Lens' PathItem (Maybe Operation)
_patch = prop (SProxy :: SProxy "patch")

type Operation =
  { consumes :: Maybe (Array String)
  , description :: Maybe String
  , operationId :: Maybe String
  , produces :: Maybe (Array String)
  , parameters :: Maybe (Array Param)
  , responses :: Maybe (Object Response)
  , schemes :: Maybe (Array String)
  , tags :: Maybe (Array String)
  , "x-kubernetes-action" :: Maybe String
  , "x-kubernetes-group-version-kind" :: Maybe GroupVersionKind }
    
_consumes :: L.Lens' Operation (Maybe (Array String))
_consumes = prop (SProxy :: SProxy "consumes")
    
_description :: L.Lens' Operation (Maybe String)
_description = prop (SProxy :: SProxy "description")
    
_operationId :: L.Lens' Operation (Maybe String)
_operationId = prop (SProxy :: SProxy "operationId")
    
_produces :: L.Lens' Operation (Maybe (Array String))
_produces = prop (SProxy :: SProxy "produces")
    
_responses :: L.Lens' Operation (Maybe (Object Response))
_responses = prop (SProxy :: SProxy "responses")
    
_schemes :: L.Lens' Operation (Maybe (Array String))
_schemes = prop (SProxy :: SProxy "schemes")
    
_tags :: L.Lens' Operation (Maybe (Array String))
_tags = prop (SProxy :: SProxy "tags")

type Response = 
  { description :: String
  , schema :: Maybe SwaggerSchema }
    
_resDescription :: L.Lens' Response String
_resDescription = prop (SProxy :: SProxy "description")
    
_schema :: L.Lens' Response (Maybe SwaggerSchema)
_schema = prop (SProxy :: SProxy "schema")
        
type SwaggerSchema =
  { "$ref" :: Maybe String
  , "type" :: Maybe String }

_ref :: L.Lens' SwaggerSchema (Maybe String)
_ref = prop (SProxy :: SProxy "$ref")

_type :: L.Lens' SwaggerSchema (Maybe String)
_type = prop (SProxy :: SProxy "type")

type Param = 
  { "in" :: String
  , "type" :: Maybe String
  , description :: Maybe String
  , name :: String
  , required :: Maybe Boolean
  , schema :: Maybe SwaggerSchema
  , uniqueItems :: Maybe Boolean }
