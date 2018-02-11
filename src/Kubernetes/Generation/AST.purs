module Kubernetes.Generation.AST where

import Prelude

import Data.Lens (Lens', Prism', prism')
import Data.Lens.Record (prop)
import Data.List.NonEmpty (NonEmptyList(..))
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.Symbol (SProxy(..))
import Kubernetes.SchemaExtensions (GroupVersionKind(GroupVersionKind))

type AST =
  { modules :: Array Module }

type Module =
  { name :: ModuleName
  , imports :: Array Import
  , declarations :: Array Declaration }

type ModuleName = NonEmptyList String

data Import
  = RawImport String
  | K8SImport { parentModule :: Maybe ModuleName, k8sModule :: ModuleName }

instance eqImport :: Eq Import where
  eq (RawImport a) (RawImport b) = a == b
  eq (K8SImport {parentModule: p1, k8sModule: k1})
     (K8SImport {parentModule: p2, k8sModule: k2}) = p1 == p2 && k1 == k2
  eq _ _ = false
instance ordImport :: Ord Import where
  compare (RawImport a) (RawImport b) = a `compare` b
  compare (K8SImport {k8sModule: a}) (K8SImport {k8sModule: b}) = a `compare` b
  compare (RawImport a) (K8SImport b) = LT
  compare (K8SImport a) (RawImport b) = GT

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
  | TypeLocalRef K8STypeName

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
derive instance newtypeK8SQualifiedName :: Newtype K8SQualifiedName _

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
  
_body :: forall a r. Lens' { body :: a | r } a
_body = prop (SProxy :: SProxy "body")
_constructors :: forall a r. Lens' { constructors :: a | r } a
_constructors = prop (SProxy :: SProxy "constructors")
_declarations :: forall a r. Lens' { declarations :: a | r } a
_declarations = prop (SProxy :: SProxy "declarations")
_description :: forall a r. Lens' { description :: a | r } a
_description = prop (SProxy :: SProxy "description")
_fields :: forall a r. Lens' { fields :: a | r } a
_fields = prop (SProxy :: SProxy "fields")
_groupVersionKind :: forall a r. Lens' { groupVersionKind :: a | r } a
_groupVersionKind = prop (SProxy :: SProxy "groupVersionKind")
_imports :: forall a r. Lens' { imports :: a | r } a
_imports = prop (SProxy :: SProxy "imports")
_innerType :: forall a r. Lens' { innerType :: a | r } a
_innerType = prop (SProxy :: SProxy "innerType")
_k8sModule :: forall a r. Lens' { k8sModule :: a | r } a
_k8sModule = prop (SProxy :: SProxy "k8sModule")
_k8sTypeName :: forall a r. Lens' { k8sTypeName :: a | r } a
_k8sTypeName = prop (SProxy :: SProxy "k8sTypeName")
_method :: forall a r. Lens' { method :: a | r } a
_method = prop (SProxy :: SProxy "method")
_moduleName :: forall a r. Lens' { moduleName :: a | r } a
_moduleName = prop (SProxy :: SProxy "moduleName")
_modules :: forall a r. Lens' { modules :: a | r } a
_modules = prop (SProxy :: SProxy "modules")
_name :: forall a r. Lens' { name :: a | r } a
_name = prop (SProxy :: SProxy "name")
_parentModule :: forall a r. Lens' { parentModule :: a | r } a
_parentModule = prop (SProxy :: SProxy "parentModule")
_queryParams :: forall a r. Lens' { queryParams :: a | r } a
_queryParams = prop (SProxy :: SProxy "queryParams")
_returnType :: forall a r. Lens' { returnType :: a | r } a
_returnType = prop (SProxy :: SProxy "returnType")
_urlWithParams :: forall a r. Lens' { urlWithParams :: a | r } a
_urlWithParams = prop (SProxy :: SProxy "urlWithParams")

_RawImport :: Prism' Import String
_RawImport = prism' RawImport case _ of
  RawImport s -> Just s
  _ -> Nothing

_K8SImport :: Prism' Import { parentModule :: Maybe ModuleName, k8sModule :: ModuleName }
_K8SImport = prism' K8SImport case _ of
  K8SImport s -> Just s
  _ -> Nothing

_NewtypeDecl :: Prism' Declaration ObjectType
_NewtypeDecl = prism' NewtypeDecl case _ of
  NewtypeDecl s -> Just s
  _ -> Nothing

_RecordDecl :: Prism' Declaration ObjectType
_RecordDecl = prism' RecordDecl case _ of
  RecordDecl s -> Just s
  _ -> Nothing

_AdtType :: Prism' Declaration { description :: Maybe String , name :: String , constructors :: Array TypeDecl }
_AdtType = prism' AdtType case _ of
  AdtType s -> Just s
  _ -> Nothing

_AliasType :: Prism' Declaration { description :: Maybe String , name :: String , innerType :: TypeDecl }
_AliasType = prism' AliasType case _ of
  AliasType s -> Just s
  _ -> Nothing

_LensHelper :: Prism' Declaration { name :: String }
_LensHelper = prism' LensHelper case _ of
  LensHelper s -> Just s
  _ -> Nothing

_Endpoint :: Prism' Declaration
             { method :: HttpMethod
             , description :: Maybe String
             , name :: String
             , body :: Maybe TypeDecl
             , queryParams :: Maybe ObjectType
             , returnType :: TypeDecl
             , urlWithParams :: UrlWithParams }
_Endpoint = prism' Endpoint case _ of
  Endpoint s -> Just s
  _ -> Nothing

_TypeString :: Prism' TypeDecl Unit
_TypeString = prism' (const TypeString) case _ of
  TypeString -> Just unit
  _ -> Nothing

_TypeNumber :: Prism' TypeDecl Unit
_TypeNumber = prism' (const TypeNumber) case _ of
  TypeNumber -> Just unit
  _ -> Nothing

_TypeInt :: Prism' TypeDecl Unit
_TypeInt = prism' (const TypeInt) case _ of
  TypeInt -> Just unit
  _ -> Nothing

_TypeBoolean :: Prism' TypeDecl Unit
_TypeBoolean = prism' (const TypeBoolean) case _ of
  TypeBoolean -> Just unit
  _ -> Nothing

_TypeArray :: Prism' TypeDecl TypeDecl
_TypeArray = prism' TypeArray case _ of
  TypeArray s -> Just s
  _ -> Nothing

_TypeObject :: Prism' TypeDecl TypeDecl
_TypeObject = prism' TypeObject case _ of
  TypeObject s -> Just s
  _ -> Nothing

_TypeNullable :: Prism' TypeDecl TypeDecl
_TypeNullable = prism' TypeNullable case _ of
  TypeNullable s -> Just s
  _ -> Nothing

_TypeRef :: Prism' TypeDecl QualifiedName
_TypeRef = prism' TypeRef case _ of
  TypeRef s -> Just s
  _ -> Nothing

_TypeLocalRef :: Prism' TypeDecl K8STypeName
_TypeLocalRef = prism' TypeLocalRef case _ of
  TypeLocalRef s -> Just s
  _ -> Nothing
