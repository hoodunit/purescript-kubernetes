module Kubernetes.Generation.AST where

import Prelude

import Data.List.NonEmpty (NonEmptyList(..))
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Kubernetes.SchemaExtensions (GroupVersionKind(GroupVersionKind))

type AST =
  { modules :: Array ApiModule }

type ApiModule =
  { name :: ModuleName
  , imports :: Array String
  , declarations :: Array Declaration }

type ModuleName = NonEmptyList String

data Declaration
  = NewtypeDecl ObjectType
  | RecordDecl ObjectType
  | AdtType
    { description :: Maybe String
    , name :: String
    , constructors :: Array TypeDecl }
  | AliasType
    { description :: Maybe String
    , name :: String
    , innerType :: TypeDecl }
  | LensHelper
    { name :: String }
  | Endpoint
    { method :: HttpMethod
    , description :: Maybe String
    , name :: String
    , body :: Maybe TypeDecl
    , queryParams :: Maybe ObjectType
    , returnType :: TypeDecl
    , urlWithParams :: UrlWithParams }

instance eqDeclaration :: Eq Declaration where
  eq a b = declarationName a == declarationName b
instance ordDeclaration :: Ord Declaration where
  compare a b = case a of
    _ | priority a == priority b -> (declarationName a `compare` declarationName b)
    _ | priority a > priority b -> GT
    _ -> LT
    where
      priority (NewtypeDecl _) = 1
      priority (RecordDecl _) = 1
      priority (AdtType _) = 1
      priority (AliasType _) = 1
      priority (Endpoint _) = 2
      priority (LensHelper _) = 3
      
declarationName :: Declaration -> String
declarationName (NewtypeDecl (ObjectType {name})) = name
declarationName (RecordDecl (ObjectType {name})) = name
declarationName (AdtType {name}) = name
declarationName (AliasType {name}) = name
declarationName (LensHelper {name}) = name
declarationName (Endpoint {name}) = name

newtype ObjectType = ObjectType
  { description :: Maybe String
  , groupVersionKind :: Array GroupVersionKind
  , name :: String
  , fields :: Array OptionalField }
derive instance newtypeObjectType :: Newtype ObjectType _

data UrlWithParams = 
  UrlChunk String String UrlWithParams |
  EndUrl String
instance showUrlWithParams :: Show UrlWithParams where
  show (UrlChunk path param rest) = path <> " {" <> param <> "} " <> show rest
  show (EndUrl s) = s
instance eqUrlWithParams :: Eq UrlWithParams where
  eq (UrlChunk a1 a2 a3) (UrlChunk b1 b2 b3) = a1 == b1 && a2 == b2 && a3 == b3
  eq (EndUrl a) (EndUrl b) = a == b
  eq _ _  = false
  
type OptionalField =
  { description :: Maybe String
  , name :: String
  , innerType :: TypeDecl }

data TypeDecl
  = TypeString
  | TypeNumber
  | TypeInt
  | TypeBoolean
  | TypeArray TypeDecl
  | TypeObject TypeDecl
  | TypeNullable TypeDecl
  | TypeRef QualifiedName

-- Generated module + name
-- E.g. Storage.V1 StorageClass
type QualifiedName =
  { moduleName :: ModuleName
  , k8sTypeName :: K8STypeName }

-- Kubernetes definition name
-- E.g. StorageClass
type K8STypeName = String

-- Kubernetes fully-qualified reference
-- E.g. io.k8s.kubernetes.pkg.apis.storage.v1.StorageClass
newtype K8SQualifiedName = K8SQualifiedName String

data HttpMethod 
  = GET
  | DELETE
  | HEAD
  | OPTIONS
  | PATCH
  | POST
  | PUT
instance showHttpMethod :: Show HttpMethod where
  show GET = "GET"
  show DELETE = "DELETE"
  show HEAD = "HEAD"
  show OPTIONS = "OPTIONS"
  show PATCH = "PATCH"
  show POST = "POST"
  show PUT = "PUT"
  
