module Kubernetes.Generation.Names where

import Prelude

import Data.Array as Array
import Data.Either (Either(..))
import Data.Foldable (find, any)
import Data.List.NonEmpty as NonEmptyList
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String as Str
import Data.String.Regex as Regex
import Data.String.Regex.Flags as RegexFlags
import Kubernetes.Generation.AST (ApiModuleName)

type ApiMapping =
  { groupVersion :: Maybe GroupVersion
  , moduleName :: String
  , prefixes :: Array String
  , tag :: Maybe String }
type GroupVersion = { group :: String, version :: String }

type FieldMapping = {json :: String, ps :: String}

apiMappings :: Array ApiMapping
apiMappings = 
  [ { groupVersion: Just { group: "admissionregistration.k8s.io", version: "" }
    , moduleName: "AdmissionRegistration"
    , prefixes: []
    , tag: Just "admissionregistration" }
  , { groupVersion: Just { group: "admissionregistration.k8s.io", version: "v1alpha1" }
    , moduleName: "AdmissionRegistrationV1Alpha1"
    , prefixes:
      [ "io.k8s.kubernetes.pkg.apis.admissionregistration.v1alpha1"
      , "io.k8s.api.admissionregistration.v1alpha1"]
    , tag: Just "admissionregistration_v1alpha1" }
  , { groupVersion: Just { group: "admissionregistration.k8s.io", version: "v1beta1" }
    , moduleName: "AdmissionRegistrationV1Beta1"
    , prefixes: ["io.k8s.api.admissionregistration.v1beta1"]
    , tag: Just "admissionregistration_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: "APIExtensions"
    , prefixes: []
    , tag: Just "apiextensions" }
  , { groupVersion: Just { group: "apiextensions.k8s.io", version: "v1beta1" }
    , moduleName: "APIExtensionsV1Beta1"
    , prefixes:
      [ "io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1"
      , "io.k8s.api.extensions.v1beta1"]
    , tag: Just "apiextensions_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: "ApiRegistration"
    , prefixes: []
    , tag: Just "apiregistration" }
  , { groupVersion: Just { group: "apiregistration.k8s.io", version: "v1beta1" }
    , moduleName: "ApiRegistrationV1Beta1"
    , prefixes: ["io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1"]
    , tag: Just "apiregistration_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: "Apis"
    , prefixes: []
    , tag: Just "apis" }
  , { groupVersion: Just { group: "apps", version: "" }
    , moduleName: "Apps"
    , prefixes: []
    , tag: Just "apps" }
  , { groupVersion: Just { group: "apps", version:  "v1" }
    , moduleName: "AppsV1"
    , prefixes: ["io.k8s.api.apps.v1"]
    , tag: Just "apps_v1" }
  , { groupVersion: Just { group: "apps", version: "v1beta1" }
    , moduleName: "AppsV1Beta1"
    , prefixes:["io.k8s.kubernetes.pkg.apis.apps.v1beta1", "io.k8s.api.apps.v1beta1"]
    , tag: Just "apps_v1beta1" }
  , { groupVersion: Just { group: "apps", version:  "v1beta2" }
    , moduleName: "AppsV1Beta2"
    , prefixes: ["io.k8s.api.apps.v1beta2"]
    , tag: Just "apps_v1beta2" }
  , { groupVersion: Just { group: "authentication.k8s.io", version: "" }
    , moduleName: "Authentication"
    , prefixes: []
    , tag: Just "authentication" }
  , { groupVersion: Just { group: "authentication.k8s.io", version: "v1" }
    , moduleName: "AuthenticationV1"
    , prefixes:
      [ "io.k8s.api.authentication.v1"
      , "io.k8s.kubernetes.pkg.apis.authentication.v1" ]
    , tag: Just "authentication_v1" }
  , { groupVersion: Just { group: "authentication.k8s.io", version: "v1beta1" }
    , moduleName: "AuthenticationV1Beta1"
    , prefixes:
      [ "io.k8s.api.authentication.v1beta1"
      , "io.k8s.kubernetes.pkg.apis.authentication.v1beta1" ]
    , tag: Just "authentication_v1beta1" }
  , { groupVersion: Just { group: "authorization.k8s.io", version: "" }
    , moduleName: "Authorization"
    , prefixes: []
    , tag: Just "authorization" }
  , { groupVersion: Just { group: "authorization.k8s.io", version: "v1" }
    , moduleName: "AuthorizationV1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.authorization.v1", "io.k8s.api.authorization.v1"]
    , tag: Just "authorization_v1" }
  , { groupVersion: Just { group: "authorization.k8s.io", version: "v1beta1" }
    , moduleName: "AuthorizationV1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.authorization.v1beta1", "io.k8s.api.authorization.v1beta1"]
    , tag: Just "authorization_v1beta1" }
  , { groupVersion: Just { group: "autoscaling", version: "" }
    , moduleName: "Autoscaling"
    , prefixes: []
    , tag: Just "autoscaling" }
  , { groupVersion: Just { group: "autoscaling", version: "v1" }
    , moduleName: "AutoscalingV1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.autoscaling.v1", "io.k8s.api.autoscaling.v1"]
    , tag: Just "autoscaling_v1" }
  , { groupVersion: Just { group: "autoscaling", version: "v2alpha1" }
    , moduleName: "AutoscalingV2Alpha1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1"]
    , tag: Just "autoscaling_v2alpha1" }
  , { groupVersion: Just { group: "autoscaling", version: "v2beta1" }
    , moduleName: "AutoscalingV2Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.autoscaling.v2beta1", "io.k8s.api.autoscaling.v2beta1"]
    , tag: Just "autoscaling_v2beta1" }
  , { groupVersion: Just { group: "batch", version: "" }
    , moduleName: "Batch"
    , prefixes: []
    , tag: Just "batch" }
  , { groupVersion: Just { group: "batch", version: "v1" }
    , moduleName: "BatchV1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.batch.v1", "io.k8s.api.batch.v1"]
    , tag: Just "batch_v1" }
  , { groupVersion: Just { group: "batch", version: "v1beta1" }
    , moduleName: "BatchV1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.batch.v1beta1", "io.k8s.api.batch.v1beta1"]
    , tag: Just "batch_v1beta1" }
  , { groupVersion: Just { group: "batch", version: "v2alpha1" }
    , moduleName: "BatchV2Alpha1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.batch.v2alpha1", "io.k8s.api.batch.v2alpha1"]
    , tag: Just "batch_v2alpha1" }
  , { groupVersion: Just { group: "certificates.k8s.io", version: "" }
    , moduleName: "Certificates"
    , prefixes: []
    , tag: Just "certificates" }
  , { groupVersion: Just { group: "certificates.k8s.io", version: "v1beta1" }
    , moduleName: "CertificatesV1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.certificates.v1beta1", "io.k8s.api.certificates.v1beta1"]
    , tag: Just "certificates_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: "Core"
    , prefixes: []
    , tag: Just "core" }
  , { groupVersion: Just { group: "", version: "v1" }
    , moduleName: "CoreV1"
    , prefixes:
      [ "io.k8s.api.core.v1"
      , "io.k8s.kubernetes.pkg.api.v1" ]
    , tag: Just "core_v1" }
  , { groupVersion: Nothing
    , moduleName: "Events"
    , prefixes: []
    , tag: Just "events" }
  , { groupVersion: Just { group: "events.k8s.io", version: "v1beta1" }
    , moduleName: "Events"
    , prefixes: ["io.k8s.api.events.v1beta1"]
    , tag: Just "events_v1beta1" }
  , { groupVersion: Just { group: "extensions", version: "" }
    , moduleName: "Extensions"
    , prefixes: []
    , tag: Just "extensions" }
  , { groupVersion: Just { group: "extensions", version: "v1beta1" }
    , moduleName: "ExtensionsV1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.extensions.v1beta1"]
    , tag: Just "extensions_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: "Logs"
    , prefixes: []
    , tag: Just "logs" }
  , { groupVersion: Nothing
    , moduleName: "MetaV1"
    , prefixes: ["io.k8s.apimachinery.pkg.apis.meta.v1"]
    , tag: Nothing }
  , { groupVersion: Just { group: "networking.k8s.io", version: "" }
    , moduleName: "Networking"
    , prefixes: []
    , tag: Just "networking" }
  , { groupVersion: Just { group: "networking.k8s.io", version: "v1" }
    , moduleName: "NetworkingV1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.networking.v1", "io.k8s.api.networking.v1"]
    , tag: Just "networking_v1" }
  , { groupVersion: Just { group: "policy", version: "" }
    , moduleName: "Policy"
    , prefixes: []
    , tag: Just "policy" }
  , { groupVersion: Just { group: "policy", version: "v1beta1" }
    , moduleName: "PolicyV1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.policy.v1beta1", "io.k8s.api.policy.v1beta1"]
    , tag: Just "policy_v1beta1" }
  , { groupVersion: Just { group: "rbac.authorization.k8s.io", version: "" }
    , moduleName: "Rbac"
    , prefixes: []
    , tag: Just "rbacAuthorization" }
  , { groupVersion: Just { group: "rbac.authorization.k8s.io", version: "v1" }
    , moduleName: "RbacV1"
    , prefixes: ["io.k8s.api.rbac.v1"]
    , tag: Just "rbacAuthorization_v1" }
  , { groupVersion: Just { group: "rbac.authorization.k8s.io", version: "v1alpha1" }
    , moduleName: "RbacV1Alpha1"
    , prefixes:
      [ "io.k8s.api.rbac.v1alpha1"
      , "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1" ]
    , tag: Just "rbacAuthorization_v1alpha1" }
  , { groupVersion: Just { group: "rbac.authorization.k8s.io", version: "v1beta1" }
    , moduleName: "RbacV1Beta1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.rbac.v1beta1", "io.k8s.api.rbac.v1beta1"]
    , tag: Just "rbacAuthorization_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: "Resource"
    , prefixes: ["io.k8s.apimachinery.pkg.api.resource"]
    , tag: Nothing }
  , { groupVersion: Nothing
    , moduleName: "Runtime"
    , prefixes: ["io.k8s.apimachinery.pkg.runtime"]
    , tag: Nothing }
  , { groupVersion: Nothing
    , moduleName: "Scheduling"
    , prefixes: []
    , tag: Just "scheduling" }
  , { groupVersion: Just { group: "scheduling.k8s.io", version: "v1alpha1" }
    , moduleName: "SchedulingV1Alpha1"
    , prefixes: ["io.k8s.api.scheduling.v1alpha1"]
    , tag: Just "scheduling_v1alpha1" }
  , { groupVersion: Just { group: "settings.k8s.io", version: "" }
    , moduleName: "Settings"
    , prefixes: []
    , tag: Just "settings" }
  , { groupVersion: Just { group: "storage.k8s.io", version: "" }
    , moduleName: "Storage"
    , prefixes: []
    , tag: Just "storage" }
  , { groupVersion: Just { group: "storage.k8s.io", version: "v1" }
    , moduleName: "StorageV1"
    , prefixes:
        [ "io.k8s.kubernetes.pkg.apis.storage.v1"
        , "io.k8s.api.storage.v1" ]
    , tag: Just "storage_v1" }
  , { groupVersion: Just { group: "settings.k8s.io", version: "v1alpha1" }
    , moduleName: "SettingsV1Alpha1"
    , prefixes: ["io.k8s.kubernetes.pkg.apis.settings.v1alpha1", "io.k8s.api.settings.v1alpha1"]
    , tag: Just "settings_v1alpha1" }
  , { groupVersion: Just { group: "storage.k8s.io", version: "v1alpha1" }
    , moduleName: "StorageV1Alpha1"
    , prefixes:
        [ "io.k8s.kubernetes.pkg.apis.storage.v1alpha1"
        , "io.k8s.api.storage.v1alpha1" ]
    , tag: Just "storage_v1alpha1" }
  , { groupVersion: Just { group: "storage.k8s.io", version: "v1beta1" }
    , moduleName: "StorageV1Beta1"
    , prefixes:
        [ "io.k8s.kubernetes.pkg.apis.storage.v1beta1"
        , "io.k8s.api.storage.v1beta1" ]
    , tag: Just "storage_v1beta1" }
  , { groupVersion: Nothing
    , moduleName: "Util"
    , prefixes:
      [ "io.k8s.apimachinery.pkg.util"
      , "io.k8s.apimachinery.pkg.util.intstr" ]
    , tag: Nothing }
  , { groupVersion: Nothing
    , moduleName: "Version"
    , prefixes: ["io.k8s.apimachinery.pkg.version"]
    , tag: Just "version" } ]

typeUnqualifiedName :: String -> String
typeUnqualifiedName full = fromMaybe full finalName
  where
    finalName = Array.last $ Str.split (Str.Pattern ".") full

typeQualifiedName :: String -> String
typeQualifiedName full = fromMaybe full (mkName <$> typeModule full <*> finalName)
  where
    mkName mod name = mod <> "." <> name
    finalName = Array.last $ Str.split (Str.Pattern ".") full

refName :: String -> String -> String
refName moduleName fullRefName | (Just moduleName) == typeModule fullRefName = typeUnqualifiedName fullRefName
refName _ fullRefName = typeQualifiedName fullRefName

refName' :: String -> String -> String
refName' moduleName qualifiedRefName | (Just moduleName) == typeModule' qualifiedRefName = typeUnqualifiedName qualifiedRefName
refName' _ qualifiedRefName = qualifiedRefName

typeModule :: String -> Maybe String
typeModule fullyQualifiedName = stripPrefixes fullyQualifiedName >>= apiModule
  where
    stripPrefixes s = Array.last $ Str.split (Str.Pattern "/") s

typeModule' :: String -> Maybe String
typeModule' qualifiedName = case Str.split (Str.Pattern ".") qualifiedName of
  [moduleName, typeName] -> Just moduleName
  _ -> Nothing

apiModule :: String -> Maybe String
apiModule qualifiedName = _.moduleName <$> find hasPrefix apiMappings
  where
    hasPrefix {prefixes: []} = false
    hasPrefix {prefixes} = any (_ == modulePrefix qualifiedName) prefixes

modulePrefix :: String -> String
modulePrefix = Str.split (Str.Pattern ".") >>> Array.dropEnd 1 >>> Str.joinWith "."

apiModuleFromGroupVersion :: forall f. {group :: String, version :: String, kind :: String | f} -> Maybe ApiModuleName
apiModuleFromGroupVersion {group, version, kind} =
  ((\m -> NonEmptyList.snoc m kind) <<< pure <<< _.moduleName) <$> find hasGroupVersion apiMappings
  where
    hasGroupVersion {groupVersion: Just {group: g, version: v}} = g == group && v == version
    hasGroupVersion {groupVersion: Nothing} = false

apiModuleFromTag :: String -> Maybe ApiModuleName
apiModuleFromTag tag =
  (pure <<< _.moduleName) <$> find hasTag apiMappings
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

stripModuleFromId :: ApiModuleName -> String -> String
stripModuleFromId modName opId =
  Str.replace (Str.Pattern $ NonEmptyList.last modName) (Str.Replacement "") opId
stripModuleFromId _ opId = opId

snakeCaseToPascalCase :: String -> String
snakeCaseToPascalCase =
  Str.split (Str.Pattern "_")
  >>> map uppercaseFirstChar
  >>> Str.joinWith ""
