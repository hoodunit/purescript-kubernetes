module Kubernetes.Generation.AST where

import Prelude

import Data.List.NonEmpty (NonEmptyList(..))
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)

type ApiAst =
  { modules :: Array ApiModule }

type ApiModule =
  { name :: ApiModuleName
  , imports :: Array String
  , declarations :: Array Declaration }

type ApiModuleName = NonEmptyList String

data Declaration
  = NewtypeDecl ObjectType
  | RecordDecl ObjectType
  | AdtType
    { description :: Maybe String
    , qualifiedName :: String
    , constructors :: Array TypeDecl }
  | AliasType
    { description :: Maybe String
    , qualifiedName :: String
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
declarationName (NewtypeDecl (ObjectType {qualifiedName})) = qualifiedName
declarationName (RecordDecl (ObjectType {qualifiedName})) = qualifiedName
declarationName (AdtType {qualifiedName}) = qualifiedName
declarationName (AliasType {qualifiedName}) = qualifiedName
declarationName (LensHelper {name}) = name
declarationName (Endpoint {name}) = name

newtype ObjectType = ObjectType
  { description :: Maybe String
  , qualifiedName :: String
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
  | TypeRef String

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
  
