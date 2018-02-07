module Kubernetes.Generation.Names where

import Prelude

import Data.Array as Array
import Data.Either (Either(..))
import Data.Foldable (any, find, fold)
import Data.List as List
import Data.List.NonEmpty (NonEmptyList(..))
import Data.List.NonEmpty as NonEmptyList
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String as Str
import Data.String as String
import Data.String.Regex as Regex
import Data.String.Regex.Flags as RegexFlags
import Kubernetes.Generation.AST (ModuleName, K8SQualifiedName(K8SQualifiedName), K8STypeName, QualifiedName)
import Kubernetes.Generation.JsonSchema (SchemaRef(..))

type ApiMapping =
  { groupVersion :: Maybe GroupVersion
  , moduleName :: ModuleName
  , prefixes :: Array String
  , tag :: Maybe String }
type GroupVersion = { group :: String, version :: String }

type FieldMapping = {json :: String, ps :: String}

apiMappings :: Array ApiMapping
apiMappings = 
  [ { groupVersion: Just { group: "admissionregistration.k8s.io", version: "" }
    , moduleName: pure "AdmissionRegistration"
    , prefixes: []
    , tag: Just "admissionregistration" }
  , { groupVersion: Just { group: "admissionregistration.k8s.io", version: "v1alpha1" }
    , moduleName: pure "AdmissionRegistration" <> pure "V1Alpha1"
    , prefixes:
      [ "io.k8s.kubernetes.pkg.apis.admissionregistration.v1alpha1"
      , "io.k8s.api.admissionregistration.v1alpha1"]
    , tag: Just "admissionregistration_v1alpha1" }
  , { groupVersion: Just { group: "admissionregistration.k8s.io", version: "v1beta1" }
    , moduleName: pure "AdmissionRegistration" <> pure "V1Beta1"
    , prefixes: ["io.k8s.api.admissionregistration.v1beta1"]
    , tag: Just "admissionregistration_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: pure "APIExtensions"
    , prefixes: []
    , tag: Just "apiextensions" }
  , { groupVersion: Just { group: "apiextensions.k8s.io", version: "v1beta1" }
    , moduleName: pure "APIExtensions" <> pure "V1Beta1"
    , prefixes:
      [ "io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1"
      , "io.k8s.api.extensions.v1beta1"]
    , tag: Just "apiextensions_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: pure "ApiRegistration"
    , prefixes: []
    , tag: Just "apiregistration" }
  , { groupVersion: Just { group: "apiregistration.k8s.io", version: "v1beta1" }
    , moduleName: pure "ApiRegistration" <> pure "V1Beta1"
    , prefixes: ["io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1"]
    , tag: Just "apiregistration_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: pure "Apis"
    , prefixes: []
    , tag: Just "apis" }
  , { groupVersion: Just { group: "apps", version: "" }
    , moduleName: pure "Apps"
    , prefixes: []
    , tag: Just "apps" }
  , { groupVersion: Just { group: "apps", version:  "v1" }
    , moduleName: pure "Apps" <> pure "V1"
    , prefixes: ["io.k8s.api.apps.v1"]
    , tag: Just "apps_v1" }
  , { groupVersion: Just { group: "apps", version: "v1beta1" }
    , moduleName: pure "Apps" <> pure "V1Beta1"
    , prefixes:["io.k8s.kubernetes.pkg.apis.apps.v1beta1", "io.k8s.api.apps.v1beta1"]
    , tag: Just "apps_v1beta1" }
  , { groupVersion: Just { group: "apps", version:  "v1beta2" }
    , moduleName: pure "Apps" <> pure "V1Beta2"
    , prefixes: ["io.k8s.api.apps.v1beta2"]
    , tag: Just "apps_v1beta2" }
  , { groupVersion: Just { group: "authentication.k8s.io", version: "" }
    , moduleName: pure "Authentication"
    , prefixes: []
    , tag: Just "authentication" }
  , { groupVersion: Just { group: "authentication.k8s.io", version: "v1" }
    , moduleName: pure "Authentication" <> pure "V1"
    , prefixes:
      [ "io.k8s.api.authentication.v1"
      , "io.k8s.kubernetes.pkg.apis.authentication.v1" ]
    , tag: Just "authentication_v1" }
  , { groupVersion: Just { group: "authentication.k8s.io", version: "v1beta1" }
    , moduleName: pure "Authentication" <> pure "V1Beta1"
    , prefixes:
      [ "io.k8s.api.authentication.v1beta1"
      , "io.k8s.kubernetes.pkg.apis.authentication.v1beta1" ]
    , tag: Just "authentication_v1beta1" }
  , { groupVersion: Just { group: "authorization.k8s.io", version: "" }
    , moduleName: pure "Authorization"
    , prefixes: []
    , tag: Just "authorization" }
  , { groupVersion: Just { group: "authorization.k8s.io", version: "v1" }
    , moduleName: pure "Authorization" <> pure "V1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.authorization.v1", "io.k8s.api.authorization.v1"]
    , tag: Just "authorization_v1" }
  , { groupVersion: Just { group: "authorization.k8s.io", version: "v1beta1" }
    , moduleName: pure "Authorization" <> pure "V1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.authorization.v1beta1", "io.k8s.api.authorization.v1beta1"]
    , tag: Just "authorization_v1beta1" }
  , { groupVersion: Just { group: "autoscaling", version: "" }
    , moduleName: pure "Autoscaling"
    , prefixes: []
    , tag: Just "autoscaling" }
  , { groupVersion: Just { group: "autoscaling", version: "v1" }
    , moduleName: pure "Autoscaling" <> pure "V1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.autoscaling.v1", "io.k8s.api.autoscaling.v1"]
    , tag: Just "autoscaling_v1" }
  , { groupVersion: Just { group: "autoscaling", version: "v2alpha1" }
    , moduleName: pure "Autoscaling" <> pure "V2Alpha1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1"]
    , tag: Just "autoscaling_v2alpha1" }
  , { groupVersion: Just { group: "autoscaling", version: "v2beta1" }
    , moduleName: pure "Autoscaling" <> pure "V2Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.autoscaling.v2beta1", "io.k8s.api.autoscaling.v2beta1"]
    , tag: Just "autoscaling_v2beta1" }
  , { groupVersion: Just { group: "batch", version: "" }
    , moduleName: pure "Batch"
    , prefixes: []
    , tag: Just "batch" }
  , { groupVersion: Just { group: "batch", version: "v1" }
    , moduleName: pure "Batch" <> pure "V1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.batch.v1", "io.k8s.api.batch.v1"]
    , tag: Just "batch_v1" }
  , { groupVersion: Just { group: "batch", version: "v1beta1" }
    , moduleName: pure "Batch" <> pure "V1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.batch.v1beta1", "io.k8s.api.batch.v1beta1"]
    , tag: Just "batch_v1beta1" }
  , { groupVersion: Just { group: "batch", version: "v2alpha1" }
    , moduleName: pure "Batch" <> pure "V2Alpha1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.batch.v2alpha1", "io.k8s.api.batch.v2alpha1"]
    , tag: Just "batch_v2alpha1" }
  , { groupVersion: Just { group: "certificates.k8s.io", version: "" }
    , moduleName: pure "Certificates"
    , prefixes: []
    , tag: Just "certificates" }
  , { groupVersion: Just { group: "certificates.k8s.io", version: "v1beta1" }
    , moduleName: pure "Certificates" <> pure "V1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.certificates.v1beta1", "io.k8s.api.certificates.v1beta1"]
    , tag: Just "certificates_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: pure "Core"
    , prefixes: []
    , tag: Just "core" }
  , { groupVersion: Just { group: "", version: "v1" }
    , moduleName: pure "Core" <> pure "V1"
    , prefixes:
      [ "io.k8s.api.core.v1"
      , "io.k8s.kubernetes.pkg.api.v1" ]
    , tag: Just "core_v1" }
  , { groupVersion: Nothing
    , moduleName: pure "Events"
    , prefixes: []
    , tag: Just "events" }
  , { groupVersion: Just { group: "events.k8s.io", version: "v1beta1" }
    , moduleName: pure "Events"
    , prefixes: ["io.k8s.api.events.v1beta1"]
    , tag: Just "events_v1beta1" }
  , { groupVersion: Just { group: "extensions", version: "" }
    , moduleName: pure "Extensions"
    , prefixes: []
    , tag: Just "extensions" }
  , { groupVersion: Just { group: "extensions", version: "v1beta1" }
    , moduleName: pure "Extensions" <> pure "V1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.extensions.v1beta1"]
    , tag: Just "extensions_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: pure "Logs"
    , prefixes: []
    , tag: Just "logs" }
  , { groupVersion: Nothing
    , moduleName: pure "Meta" <> pure "V1"
    , prefixes: ["io.k8s.apimachinery.pkg.apis.meta.v1"]
    , tag: Nothing }
  , { groupVersion: Just { group: "networking.k8s.io", version: "" }
    , moduleName: pure "Networking"
    , prefixes: []
    , tag: Just "networking" }
  , { groupVersion: Just { group: "networking.k8s.io", version: "v1" }
    , moduleName: pure "Networking" <> pure "V1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.networking.v1", "io.k8s.api.networking.v1"]
    , tag: Just "networking_v1" }
  , { groupVersion: Just { group: "policy", version: "" }
    , moduleName: pure "Policy"
    , prefixes: []
    , tag: Just "policy" }
  , { groupVersion: Just { group: "policy", version: "v1beta1" }
    , moduleName: pure "Policy" <> pure "V1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.policy.v1beta1", "io.k8s.api.policy.v1beta1"]
    , tag: Just "policy_v1beta1" }
  , { groupVersion: Just { group: "rbac.authorization.k8s.io", version: "" }
    , moduleName: pure "Rbac"
    , prefixes: []
    , tag: Just "rbacAuthorization" }
  , { groupVersion: Just { group: "rbac.authorization.k8s.io", version: "v1" }
    , moduleName: pure "Rbac" <> pure "V1"
    , prefixes: ["io.k8s.api.rbac.v1"]
    , tag: Just "rbacAuthorization_v1" }
  , { groupVersion: Just { group: "rbac.authorization.k8s.io", version: "v1alpha1" }
    , moduleName: pure "Rbac" <> pure "V1Alpha1"
    , prefixes:
      [ "io.k8s.api.rbac.v1alpha1"
      , "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1" ]
    , tag: Just "rbacAuthorization_v1alpha1" }
  , { groupVersion: Just { group: "rbac.authorization.k8s.io", version: "v1beta1" }
    , moduleName: pure "Rbac" <> pure "V1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.rbac.v1beta1", "io.k8s.api.rbac.v1beta1"]
    , tag: Just "rbacAuthorization_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: pure "Resource"
    , prefixes: ["io.k8s.apimachinery.pkg.api.resource"]
    , tag: Nothing }
  , { groupVersion: Nothing
    , moduleName: pure "Runtime"
    , prefixes: ["io.k8s.apimachinery.pkg.runtime"]
    , tag: Nothing }
  , { groupVersion: Nothing
    , moduleName: pure "Scheduling"
    , prefixes: []
    , tag: Just "scheduling" }
  , { groupVersion: Just { group: "scheduling.k8s.io", version: "v1alpha1" }
    , moduleName: pure "Scheduling" <> pure "V1Alpha1"
    , prefixes: ["io.k8s.api.scheduling.v1alpha1"]
    , tag: Just "scheduling_v1alpha1" }
  , { groupVersion: Just { group: "settings.k8s.io", version: "" }
    , moduleName: pure "Settings"
    , prefixes: []
    , tag: Just "settings" }
  , { groupVersion: Just { group: "storage.k8s.io", version: "" }
    , moduleName: pure "Storage"
    , prefixes: []
    , tag: Just "storage" }
  , { groupVersion: Just { group: "storage.k8s.io", version: "v1" }
    , moduleName: pure "Storage" <> pure "V1"
    , prefixes:
        [ "io.k8s.kubernetes.pkg.apis.storage.v1"
        , "io.k8s.api.storage.v1" ]
    , tag: Just "storage_v1" }
  , { groupVersion: Just { group: "settings.k8s.io", version: "v1alpha1" }
    , moduleName: pure "Settings" <> pure "V1Alpha1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.settings.v1alpha1", "io.k8s.api.settings.v1alpha1"]
    , tag: Just "settings_v1alpha1" }
  , { groupVersion: Just { group: "storage.k8s.io", version: "v1alpha1" }
    , moduleName: pure "Storage" <> pure "V1Alpha1"
    , prefixes:
        [ "io.k8s.kubernetes.pkg.apis.storage.v1alpha1"
        , "io.k8s.api.storage.v1alpha1" ]
    , tag: Just "storage_v1alpha1" }
  , { groupVersion: Just { group: "storage.k8s.io", version: "v1beta1" }
    , moduleName: pure "Storage" <> pure "V1Beta1"
    , prefixes:
        [ "io.k8s.kubernetes.pkg.apis.storage.v1beta1"
        , "io.k8s.api.storage.v1beta1" ]
    , tag: Just "storage_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: pure "Util"
    , prefixes:
      [ "io.k8s.apimachinery.pkg.util"
      , "io.k8s.apimachinery.pkg.util.intstr" ]
    , tag: Nothing }
  , { groupVersion: Nothing
    , moduleName: pure "Version"
    , prefixes: ["io.k8s.apimachinery.pkg.version"]
    , tag: Just "version" } ]

-- E.g. io.k8s.kubernetes.pkg.apis.storage.v1.StorageClass -> StorageClass
-- TODO: Remove this as it hides problems
typeUnqualifiedName :: K8SQualifiedName -> K8STypeName
typeUnqualifiedName qualified@(K8SQualifiedName name) = fromMaybe name $ k8sTypeName qualified

typeQualifiedName :: K8SQualifiedName -> Maybe QualifiedName
typeQualifiedName name =
  { moduleName: _, k8sTypeName: _ } <$> apiModule name <*> k8sTypeName name

k8sTypeName :: K8SQualifiedName -> Maybe K8STypeName
k8sTypeName (K8SQualifiedName name) = name
  # Str.split (Str.Pattern ".")
  # Array.last

schemaRefToQualifiedName :: SchemaRef -> Maybe QualifiedName
schemaRefToQualifiedName (SchemaRef ref) = do
  qualifiedName <- stripSwaggerPrefixes ref # map K8SQualifiedName
  { moduleName: _, k8sTypeName: _ } <$> apiModule qualifiedName <*> k8sTypeName qualifiedName
  where
    stripSwaggerPrefixes :: String -> Maybe String
    stripSwaggerPrefixes = Str.split (Str.Pattern "/") >>> Array.last

apiModule :: K8SQualifiedName -> Maybe ModuleName
apiModule name = _.moduleName <$> find hasPrefix apiMappings
  where
    hasPrefix {prefixes: []} = false
    hasPrefix {prefixes} = any (_ == modulePrefix name) prefixes

modulePrefix :: K8SQualifiedName -> String
modulePrefix (K8SQualifiedName name) = name
  # Str.split (Str.Pattern ".")
  # Array.dropEnd 1
  # Str.joinWith "."

apiModuleFromGroupVersion :: forall f. {group :: String, version :: String, kind :: String | f} -> Maybe ModuleName
apiModuleFromGroupVersion {group, version, kind} =
  ((\m -> NonEmptyList.snoc m kind) <<< _.moduleName) <$> find hasGroupVersion apiMappings
  where
    hasGroupVersion {groupVersion: Just {group: g, version: v}} = g == group && v == version
    hasGroupVersion {groupVersion: Nothing} = false

apiModuleFromTag :: String -> Maybe ModuleName
apiModuleFromTag tag =
  _.moduleName <$> find hasTag apiMappings
  where
    hasTag {tag: Just t} = t == tag
    hasTag {tag: Nothing} = false

startsWith :: String -> String -> Boolean
startsWith prefix str = case Regex.regex ("^" <> prefix) RegexFlags.noFlags of
  Left _ -> false
  Right matcher -> Regex.test matcher str

endsWith :: String -> String -> Boolean
endsWith suffix str = case Regex.regex (suffix <> "$") RegexFlags.noFlags of
  Left _ -> false
  Right matcher -> Regex.test matcher str

reservedKeywords :: Array FieldMapping
reservedKeywords =
  [ {json: "$ref", ps: "_ref"}
  , {json: "$schema", ps: "_schema"}
  , {json: "type", ps: "_type"}
  , {json: "data", ps: "_data"}
  , {json: "default", ps: "_default"} ]

jsonFieldToPsField :: String -> String
jsonFieldToPsField f =
  case find ((==) f <<< _.json) reservedKeywords of
    Just {ps} -> ps
    Nothing -> if startsWithUpperCase f then "_" <> f else f

psFieldToJsonField :: String -> String
psFieldToJsonField f =
  case find ((==) f <<< _.ps) reservedKeywords of
    Just {json} -> json
    Nothing -> if startsWith "_" f then Str.drop 1 f else f
    
lowercaseFirstChar :: String -> String
lowercaseFirstChar str = case Str.splitAt 1 str of
  Just {before, after} -> Str.toLower before <> after
  Nothing -> Str.toLower str
    
uppercaseFirstChar :: String -> String
uppercaseFirstChar str = case Str.splitAt 1 str of
  Just {before, after} -> Str.toUpper before <> after
  Nothing -> Str.toLower str

startsWithUpperCase :: String -> Boolean
startsWithUpperCase s = case Regex.regex "^[A-Z]" RegexFlags.noFlags of
  Left _ -> false
  Right matcher -> Regex.test matcher s

stripTagFromId :: String -> String -> String
stripTagFromId "version" opId = opId
stripTagFromId tag opId =
  Str.replace (Str.Pattern $ snakeCaseToPascalCase tag) (Str.Replacement "") opId

stripModuleFromId :: ModuleName -> String -> String
stripModuleFromId modName opId =
  Str.replace (Str.Pattern $ NonEmptyList.last modName) (Str.Replacement "") opId
stripModuleFromId _ opId = opId

snakeCaseToPascalCase :: String -> String
snakeCaseToPascalCase =
  Str.split (Str.Pattern "_")
  >>> map uppercaseFirstChar
  >>> Str.joinWith ""

modNameAsQualifiedStr :: ModuleName -> String
modNameAsQualifiedStr = String.joinWith "." <<< NonEmptyList.toUnfoldable

modNameAsStr :: ModuleName -> String
modNameAsStr = fold
