module Kubernetes.Api.Lens where

import Prelude
import Data.Lens (Lens')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.Symbol (SProxy(SProxy))
import Kubernetes.Default (class Default)

_Allows :: forall s a r. Newtype s { _Allows :: a | r } => Lens' s a
_Allows = _Newtype <<< prop (SProxy :: SProxy "_Allows")

_JSONSchemas :: forall s a r. Newtype s { _JSONSchemas :: a | r } => Lens' s a
_JSONSchemas = _Newtype <<< prop (SProxy :: SProxy "_JSONSchemas")

_Port :: forall s a r. Newtype s { _Port :: a | r } => Lens' s a
_Port = _Newtype <<< prop (SProxy :: SProxy "_Port")

_Property :: forall s a r. Newtype s { _Property :: a | r } => Lens' s a
_Property = _Newtype <<< prop (SProxy :: SProxy "_Property")

_Raw :: forall s a r. Newtype s { _Raw :: a | r } => Lens' s a
_Raw = _Newtype <<< prop (SProxy :: SProxy "_Raw")

_Schema :: forall s a r. Newtype s { _Schema :: a | r } => Lens' s a
_Schema = _Newtype <<< prop (SProxy :: SProxy "_Schema")

_data :: forall s a r. Newtype s { _data :: a | r } => Lens' s a
_data = _Newtype <<< prop (SProxy :: SProxy "_data")

_default :: forall s a r. Newtype s { _default :: a | r } => Lens' s a
_default = _Newtype <<< prop (SProxy :: SProxy "_default")

_ref :: forall s a r. Newtype s { _ref :: a | r } => Lens' s a
_ref = _Newtype <<< prop (SProxy :: SProxy "_ref")

_schema :: forall s a r. Newtype s { _schema :: a | r } => Lens' s a
_schema = _Newtype <<< prop (SProxy :: SProxy "_schema")

_type :: forall s a r. Newtype s { _type :: a | r } => Lens' s a
_type = _Newtype <<< prop (SProxy :: SProxy "_type")

_acceptedNames :: forall s a r. Newtype s { acceptedNames :: a | r } => Lens' s a
_acceptedNames = _Newtype <<< prop (SProxy :: SProxy "acceptedNames")

_accessModes :: forall s a r. Newtype s { accessModes :: a | r } => Lens' s a
_accessModes = _Newtype <<< prop (SProxy :: SProxy "accessModes")

_action :: forall s a r. Newtype s { action :: a | r } => Lens' s a
_action = _Newtype <<< prop (SProxy :: SProxy "action")

_active :: forall s a r. Newtype s { active :: a | r } => Lens' s a
_active = _Newtype <<< prop (SProxy :: SProxy "active")

_activeDeadlineSeconds :: forall s a r. Newtype s { activeDeadlineSeconds :: a | r } => Lens' s a
_activeDeadlineSeconds = _Newtype <<< prop (SProxy :: SProxy "activeDeadlineSeconds")

_add :: forall s a r. Newtype s { add :: a | r } => Lens' s a
_add = _Newtype <<< prop (SProxy :: SProxy "add")

_additionalItems :: forall s a r. Newtype s { additionalItems :: a | r } => Lens' s a
_additionalItems = _Newtype <<< prop (SProxy :: SProxy "additionalItems")

_additionalProperties :: forall s a r. Newtype s { additionalProperties :: a | r } => Lens' s a
_additionalProperties = _Newtype <<< prop (SProxy :: SProxy "additionalProperties")

_address :: forall s a r. Newtype s { address :: a | r } => Lens' s a
_address = _Newtype <<< prop (SProxy :: SProxy "address")

_addresses :: forall s a r. Newtype s { addresses :: a | r } => Lens' s a
_addresses = _Newtype <<< prop (SProxy :: SProxy "addresses")

_affinity :: forall s a r. Newtype s { affinity :: a | r } => Lens' s a
_affinity = _Newtype <<< prop (SProxy :: SProxy "affinity")

_aggregationRule :: forall s a r. Newtype s { aggregationRule :: a | r } => Lens' s a
_aggregationRule = _Newtype <<< prop (SProxy :: SProxy "aggregationRule")

_allOf :: forall s a r. Newtype s { allOf :: a | r } => Lens' s a
_allOf = _Newtype <<< prop (SProxy :: SProxy "allOf")

_allocatable :: forall s a r. Newtype s { allocatable :: a | r } => Lens' s a
_allocatable = _Newtype <<< prop (SProxy :: SProxy "allocatable")

_allowPrivilegeEscalation :: forall s a r. Newtype s { allowPrivilegeEscalation :: a | r } => Lens' s a
_allowPrivilegeEscalation = _Newtype <<< prop (SProxy :: SProxy "allowPrivilegeEscalation")

_allowVolumeExpansion :: forall s a r. Newtype s { allowVolumeExpansion :: a | r } => Lens' s a
_allowVolumeExpansion = _Newtype <<< prop (SProxy :: SProxy "allowVolumeExpansion")

_allowed :: forall s a r. Newtype s { allowed :: a | r } => Lens' s a
_allowed = _Newtype <<< prop (SProxy :: SProxy "allowed")

_allowedCapabilities :: forall s a r. Newtype s { allowedCapabilities :: a | r } => Lens' s a
_allowedCapabilities = _Newtype <<< prop (SProxy :: SProxy "allowedCapabilities")

_allowedFlexVolumes :: forall s a r. Newtype s { allowedFlexVolumes :: a | r } => Lens' s a
_allowedFlexVolumes = _Newtype <<< prop (SProxy :: SProxy "allowedFlexVolumes")

_allowedHostPaths :: forall s a r. Newtype s { allowedHostPaths :: a | r } => Lens' s a
_allowedHostPaths = _Newtype <<< prop (SProxy :: SProxy "allowedHostPaths")

_annotations :: forall s a r. Newtype s { annotations :: a | r } => Lens' s a
_annotations = _Newtype <<< prop (SProxy :: SProxy "annotations")

_anyOf :: forall s a r. Newtype s { anyOf :: a | r } => Lens' s a
_anyOf = _Newtype <<< prop (SProxy :: SProxy "anyOf")

_apiGroup :: forall s a r. Newtype s { apiGroup :: a | r } => Lens' s a
_apiGroup = _Newtype <<< prop (SProxy :: SProxy "apiGroup")

_apiGroups :: forall s a r. Newtype s { apiGroups :: a | r } => Lens' s a
_apiGroups = _Newtype <<< prop (SProxy :: SProxy "apiGroups")

_apiVersion :: forall s a r. Newtype s { apiVersion :: a | r } => Lens' s a
_apiVersion = _Newtype <<< prop (SProxy :: SProxy "apiVersion")

_apiVersions :: forall s a r. Newtype s { apiVersions :: a | r } => Lens' s a
_apiVersions = _Newtype <<< prop (SProxy :: SProxy "apiVersions")

_architecture :: forall s a r. Newtype s { architecture :: a | r } => Lens' s a
_architecture = _Newtype <<< prop (SProxy :: SProxy "architecture")

_args :: forall s a r. Newtype s { args :: a | r } => Lens' s a
_args = _Newtype <<< prop (SProxy :: SProxy "args")

_attachError :: forall s a r. Newtype s { attachError :: a | r } => Lens' s a
_attachError = _Newtype <<< prop (SProxy :: SProxy "attachError")

_attached :: forall s a r. Newtype s { attached :: a | r } => Lens' s a
_attached = _Newtype <<< prop (SProxy :: SProxy "attached")

_attacher :: forall s a r. Newtype s { attacher :: a | r } => Lens' s a
_attacher = _Newtype <<< prop (SProxy :: SProxy "attacher")

_attachmentMetadata :: forall s a r. Newtype s { attachmentMetadata :: a | r } => Lens' s a
_attachmentMetadata = _Newtype <<< prop (SProxy :: SProxy "attachmentMetadata")

_authenticated :: forall s a r. Newtype s { authenticated :: a | r } => Lens' s a
_authenticated = _Newtype <<< prop (SProxy :: SProxy "authenticated")

_automountServiceAccountToken :: forall s a r. Newtype s { automountServiceAccountToken :: a | r } => Lens' s a
_automountServiceAccountToken = _Newtype <<< prop (SProxy :: SProxy "automountServiceAccountToken")

_availableReplicas :: forall s a r. Newtype s { availableReplicas :: a | r } => Lens' s a
_availableReplicas = _Newtype <<< prop (SProxy :: SProxy "availableReplicas")

_awsElasticBlockStore :: forall s a r. Newtype s { awsElasticBlockStore :: a | r } => Lens' s a
_awsElasticBlockStore = _Newtype <<< prop (SProxy :: SProxy "awsElasticBlockStore")

_azureDisk :: forall s a r. Newtype s { azureDisk :: a | r } => Lens' s a
_azureDisk = _Newtype <<< prop (SProxy :: SProxy "azureDisk")

_azureFile :: forall s a r. Newtype s { azureFile :: a | r } => Lens' s a
_azureFile = _Newtype <<< prop (SProxy :: SProxy "azureFile")

_backend :: forall s a r. Newtype s { backend :: a | r } => Lens' s a
_backend = _Newtype <<< prop (SProxy :: SProxy "backend")

_backoffLimit :: forall s a r. Newtype s { backoffLimit :: a | r } => Lens' s a
_backoffLimit = _Newtype <<< prop (SProxy :: SProxy "backoffLimit")

_blockOwnerDeletion :: forall s a r. Newtype s { blockOwnerDeletion :: a | r } => Lens' s a
_blockOwnerDeletion = _Newtype <<< prop (SProxy :: SProxy "blockOwnerDeletion")

_bootID :: forall s a r. Newtype s { bootID :: a | r } => Lens' s a
_bootID = _Newtype <<< prop (SProxy :: SProxy "bootID")

_buildDate :: forall s a r. Newtype s { buildDate :: a | r } => Lens' s a
_buildDate = _Newtype <<< prop (SProxy :: SProxy "buildDate")

_caBundle :: forall s a r. Newtype s { caBundle :: a | r } => Lens' s a
_caBundle = _Newtype <<< prop (SProxy :: SProxy "caBundle")

_cachingMode :: forall s a r. Newtype s { cachingMode :: a | r } => Lens' s a
_cachingMode = _Newtype <<< prop (SProxy :: SProxy "cachingMode")

_capabilities :: forall s a r. Newtype s { capabilities :: a | r } => Lens' s a
_capabilities = _Newtype <<< prop (SProxy :: SProxy "capabilities")

_capacity :: forall s a r. Newtype s { capacity :: a | r } => Lens' s a
_capacity = _Newtype <<< prop (SProxy :: SProxy "capacity")

_categories :: forall s a r. Newtype s { categories :: a | r } => Lens' s a
_categories = _Newtype <<< prop (SProxy :: SProxy "categories")

_causes :: forall s a r. Newtype s { causes :: a | r } => Lens' s a
_causes = _Newtype <<< prop (SProxy :: SProxy "causes")

_cephfs :: forall s a r. Newtype s { cephfs :: a | r } => Lens' s a
_cephfs = _Newtype <<< prop (SProxy :: SProxy "cephfs")

_certificate :: forall s a r. Newtype s { certificate :: a | r } => Lens' s a
_certificate = _Newtype <<< prop (SProxy :: SProxy "certificate")

_chapAuthDiscovery :: forall s a r. Newtype s { chapAuthDiscovery :: a | r } => Lens' s a
_chapAuthDiscovery = _Newtype <<< prop (SProxy :: SProxy "chapAuthDiscovery")

_chapAuthSession :: forall s a r. Newtype s { chapAuthSession :: a | r } => Lens' s a
_chapAuthSession = _Newtype <<< prop (SProxy :: SProxy "chapAuthSession")

_cidr :: forall s a r. Newtype s { cidr :: a | r } => Lens' s a
_cidr = _Newtype <<< prop (SProxy :: SProxy "cidr")

_cinder :: forall s a r. Newtype s { cinder :: a | r } => Lens' s a
_cinder = _Newtype <<< prop (SProxy :: SProxy "cinder")

_claimName :: forall s a r. Newtype s { claimName :: a | r } => Lens' s a
_claimName = _Newtype <<< prop (SProxy :: SProxy "claimName")

_claimRef :: forall s a r. Newtype s { claimRef :: a | r } => Lens' s a
_claimRef = _Newtype <<< prop (SProxy :: SProxy "claimRef")

_clientCIDR :: forall s a r. Newtype s { clientCIDR :: a | r } => Lens' s a
_clientCIDR = _Newtype <<< prop (SProxy :: SProxy "clientCIDR")

_clientConfig :: forall s a r. Newtype s { clientConfig :: a | r } => Lens' s a
_clientConfig = _Newtype <<< prop (SProxy :: SProxy "clientConfig")

_clientIP :: forall s a r. Newtype s { clientIP :: a | r } => Lens' s a
_clientIP = _Newtype <<< prop (SProxy :: SProxy "clientIP")

_clusterIP :: forall s a r. Newtype s { clusterIP :: a | r } => Lens' s a
_clusterIP = _Newtype <<< prop (SProxy :: SProxy "clusterIP")

_clusterName :: forall s a r. Newtype s { clusterName :: a | r } => Lens' s a
_clusterName = _Newtype <<< prop (SProxy :: SProxy "clusterName")

_clusterRoleSelectors :: forall s a r. Newtype s { clusterRoleSelectors :: a | r } => Lens' s a
_clusterRoleSelectors = _Newtype <<< prop (SProxy :: SProxy "clusterRoleSelectors")

_code :: forall s a r. Newtype s { code :: a | r } => Lens' s a
_code = _Newtype <<< prop (SProxy :: SProxy "code")

_collisionCount :: forall s a r. Newtype s { collisionCount :: a | r } => Lens' s a
_collisionCount = _Newtype <<< prop (SProxy :: SProxy "collisionCount")

_command :: forall s a r. Newtype s { command :: a | r } => Lens' s a
_command = _Newtype <<< prop (SProxy :: SProxy "command")

_compiler :: forall s a r. Newtype s { compiler :: a | r } => Lens' s a
_compiler = _Newtype <<< prop (SProxy :: SProxy "compiler")

_completionTime :: forall s a r. Newtype s { completionTime :: a | r } => Lens' s a
_completionTime = _Newtype <<< prop (SProxy :: SProxy "completionTime")

_completions :: forall s a r. Newtype s { completions :: a | r } => Lens' s a
_completions = _Newtype <<< prop (SProxy :: SProxy "completions")

_component :: forall s a r. Newtype s { component :: a | r } => Lens' s a
_component = _Newtype <<< prop (SProxy :: SProxy "component")

_concurrencyPolicy :: forall s a r. Newtype s { concurrencyPolicy :: a | r } => Lens' s a
_concurrencyPolicy = _Newtype <<< prop (SProxy :: SProxy "concurrencyPolicy")

_conditions :: forall s a r. Newtype s { conditions :: a | r } => Lens' s a
_conditions = _Newtype <<< prop (SProxy :: SProxy "conditions")

_configMap :: forall s a r. Newtype s { configMap :: a | r } => Lens' s a
_configMap = _Newtype <<< prop (SProxy :: SProxy "configMap")

_configMapKeyRef :: forall s a r. Newtype s { configMapKeyRef :: a | r } => Lens' s a
_configMapKeyRef = _Newtype <<< prop (SProxy :: SProxy "configMapKeyRef")

_configMapRef :: forall s a r. Newtype s { configMapRef :: a | r } => Lens' s a
_configMapRef = _Newtype <<< prop (SProxy :: SProxy "configMapRef")

_configSource :: forall s a r. Newtype s { configSource :: a | r } => Lens' s a
_configSource = _Newtype <<< prop (SProxy :: SProxy "configSource")

_containerID :: forall s a r. Newtype s { containerID :: a | r } => Lens' s a
_containerID = _Newtype <<< prop (SProxy :: SProxy "containerID")

_containerName :: forall s a r. Newtype s { containerName :: a | r } => Lens' s a
_containerName = _Newtype <<< prop (SProxy :: SProxy "containerName")

_containerPort :: forall s a r. Newtype s { containerPort :: a | r } => Lens' s a
_containerPort = _Newtype <<< prop (SProxy :: SProxy "containerPort")

_containerRuntimeVersion :: forall s a r. Newtype s { containerRuntimeVersion :: a | r } => Lens' s a
_containerRuntimeVersion = _Newtype <<< prop (SProxy :: SProxy "containerRuntimeVersion")

_containerStatuses :: forall s a r. Newtype s { containerStatuses :: a | r } => Lens' s a
_containerStatuses = _Newtype <<< prop (SProxy :: SProxy "containerStatuses")

_containers :: forall s a r. Newtype s { containers :: a | r } => Lens' s a
_containers = _Newtype <<< prop (SProxy :: SProxy "containers")

_continue :: forall s a r. Newtype s { continue :: a | r } => Lens' s a
_continue = _Newtype <<< prop (SProxy :: SProxy "continue")

_controller :: forall s a r. Newtype s { controller :: a | r } => Lens' s a
_controller = _Newtype <<< prop (SProxy :: SProxy "controller")

_count :: forall s a r. Newtype s { count :: a | r } => Lens' s a
_count = _Newtype <<< prop (SProxy :: SProxy "count")

_creationTimestamp :: forall s a r. Newtype s { creationTimestamp :: a | r } => Lens' s a
_creationTimestamp = _Newtype <<< prop (SProxy :: SProxy "creationTimestamp")

_csi :: forall s a r. Newtype s { csi :: a | r } => Lens' s a
_csi = _Newtype <<< prop (SProxy :: SProxy "csi")

_currentAverageUtilization :: forall s a r. Newtype s { currentAverageUtilization :: a | r } => Lens' s a
_currentAverageUtilization = _Newtype <<< prop (SProxy :: SProxy "currentAverageUtilization")

_currentAverageValue :: forall s a r. Newtype s { currentAverageValue :: a | r } => Lens' s a
_currentAverageValue = _Newtype <<< prop (SProxy :: SProxy "currentAverageValue")

_currentCPUUtilizationPercentage :: forall s a r. Newtype s { currentCPUUtilizationPercentage :: a | r } => Lens' s a
_currentCPUUtilizationPercentage = _Newtype <<< prop (SProxy :: SProxy "currentCPUUtilizationPercentage")

_currentHealthy :: forall s a r. Newtype s { currentHealthy :: a | r } => Lens' s a
_currentHealthy = _Newtype <<< prop (SProxy :: SProxy "currentHealthy")

_currentMetrics :: forall s a r. Newtype s { currentMetrics :: a | r } => Lens' s a
_currentMetrics = _Newtype <<< prop (SProxy :: SProxy "currentMetrics")

_currentNumberScheduled :: forall s a r. Newtype s { currentNumberScheduled :: a | r } => Lens' s a
_currentNumberScheduled = _Newtype <<< prop (SProxy :: SProxy "currentNumberScheduled")

_currentReplicas :: forall s a r. Newtype s { currentReplicas :: a | r } => Lens' s a
_currentReplicas = _Newtype <<< prop (SProxy :: SProxy "currentReplicas")

_currentRevision :: forall s a r. Newtype s { currentRevision :: a | r } => Lens' s a
_currentRevision = _Newtype <<< prop (SProxy :: SProxy "currentRevision")

_currentValue :: forall s a r. Newtype s { currentValue :: a | r } => Lens' s a
_currentValue = _Newtype <<< prop (SProxy :: SProxy "currentValue")

_daemonEndpoints :: forall s a r. Newtype s { daemonEndpoints :: a | r } => Lens' s a
_daemonEndpoints = _Newtype <<< prop (SProxy :: SProxy "daemonEndpoints")

_datasetName :: forall s a r. Newtype s { datasetName :: a | r } => Lens' s a
_datasetName = _Newtype <<< prop (SProxy :: SProxy "datasetName")

_datasetUUID :: forall s a r. Newtype s { datasetUUID :: a | r } => Lens' s a
_datasetUUID = _Newtype <<< prop (SProxy :: SProxy "datasetUUID")

_defaultAddCapabilities :: forall s a r. Newtype s { defaultAddCapabilities :: a | r } => Lens' s a
_defaultAddCapabilities = _Newtype <<< prop (SProxy :: SProxy "defaultAddCapabilities")

_defaultAllowPrivilegeEscalation :: forall s a r. Newtype s { defaultAllowPrivilegeEscalation :: a | r } => Lens' s a
_defaultAllowPrivilegeEscalation = _Newtype <<< prop (SProxy :: SProxy "defaultAllowPrivilegeEscalation")

_defaultMode :: forall s a r. Newtype s { defaultMode :: a | r } => Lens' s a
_defaultMode = _Newtype <<< prop (SProxy :: SProxy "defaultMode")

_defaultRequest :: forall s a r. Newtype s { defaultRequest :: a | r } => Lens' s a
_defaultRequest = _Newtype <<< prop (SProxy :: SProxy "defaultRequest")

_definitions :: forall s a r. Newtype s { definitions :: a | r } => Lens' s a
_definitions = _Newtype <<< prop (SProxy :: SProxy "definitions")

_deleteOptions :: forall s a r. Newtype s { deleteOptions :: a | r } => Lens' s a
_deleteOptions = _Newtype <<< prop (SProxy :: SProxy "deleteOptions")

_deletionGracePeriodSeconds :: forall s a r. Newtype s { deletionGracePeriodSeconds :: a | r } => Lens' s a
_deletionGracePeriodSeconds = _Newtype <<< prop (SProxy :: SProxy "deletionGracePeriodSeconds")

_deletionTimestamp :: forall s a r. Newtype s { deletionTimestamp :: a | r } => Lens' s a
_deletionTimestamp = _Newtype <<< prop (SProxy :: SProxy "deletionTimestamp")

_denied :: forall s a r. Newtype s { denied :: a | r } => Lens' s a
_denied = _Newtype <<< prop (SProxy :: SProxy "denied")

_dependencies :: forall s a r. Newtype s { dependencies :: a | r } => Lens' s a
_dependencies = _Newtype <<< prop (SProxy :: SProxy "dependencies")

_deprecatedCount :: forall s a r. Newtype s { deprecatedCount :: a | r } => Lens' s a
_deprecatedCount = _Newtype <<< prop (SProxy :: SProxy "deprecatedCount")

_deprecatedFirstTimestamp :: forall s a r. Newtype s { deprecatedFirstTimestamp :: a | r } => Lens' s a
_deprecatedFirstTimestamp = _Newtype <<< prop (SProxy :: SProxy "deprecatedFirstTimestamp")

_deprecatedLastTimestamp :: forall s a r. Newtype s { deprecatedLastTimestamp :: a | r } => Lens' s a
_deprecatedLastTimestamp = _Newtype <<< prop (SProxy :: SProxy "deprecatedLastTimestamp")

_deprecatedSource :: forall s a r. Newtype s { deprecatedSource :: a | r } => Lens' s a
_deprecatedSource = _Newtype <<< prop (SProxy :: SProxy "deprecatedSource")

_description :: forall s a r. Newtype s { description :: a | r } => Lens' s a
_description = _Newtype <<< prop (SProxy :: SProxy "description")

_desiredHealthy :: forall s a r. Newtype s { desiredHealthy :: a | r } => Lens' s a
_desiredHealthy = _Newtype <<< prop (SProxy :: SProxy "desiredHealthy")

_desiredNumberScheduled :: forall s a r. Newtype s { desiredNumberScheduled :: a | r } => Lens' s a
_desiredNumberScheduled = _Newtype <<< prop (SProxy :: SProxy "desiredNumberScheduled")

_desiredReplicas :: forall s a r. Newtype s { desiredReplicas :: a | r } => Lens' s a
_desiredReplicas = _Newtype <<< prop (SProxy :: SProxy "desiredReplicas")

_detachError :: forall s a r. Newtype s { detachError :: a | r } => Lens' s a
_detachError = _Newtype <<< prop (SProxy :: SProxy "detachError")

_details :: forall s a r. Newtype s { details :: a | r } => Lens' s a
_details = _Newtype <<< prop (SProxy :: SProxy "details")

_devicePath :: forall s a r. Newtype s { devicePath :: a | r } => Lens' s a
_devicePath = _Newtype <<< prop (SProxy :: SProxy "devicePath")

_directory :: forall s a r. Newtype s { directory :: a | r } => Lens' s a
_directory = _Newtype <<< prop (SProxy :: SProxy "directory")

_diskName :: forall s a r. Newtype s { diskName :: a | r } => Lens' s a
_diskName = _Newtype <<< prop (SProxy :: SProxy "diskName")

_diskURI :: forall s a r. Newtype s { diskURI :: a | r } => Lens' s a
_diskURI = _Newtype <<< prop (SProxy :: SProxy "diskURI")

_disruptedPods :: forall s a r. Newtype s { disruptedPods :: a | r } => Lens' s a
_disruptedPods = _Newtype <<< prop (SProxy :: SProxy "disruptedPods")

_disruptionsAllowed :: forall s a r. Newtype s { disruptionsAllowed :: a | r } => Lens' s a
_disruptionsAllowed = _Newtype <<< prop (SProxy :: SProxy "disruptionsAllowed")

_divisor :: forall s a r. Newtype s { divisor :: a | r } => Lens' s a
_divisor = _Newtype <<< prop (SProxy :: SProxy "divisor")

_dnsConfig :: forall s a r. Newtype s { dnsConfig :: a | r } => Lens' s a
_dnsConfig = _Newtype <<< prop (SProxy :: SProxy "dnsConfig")

_dnsPolicy :: forall s a r. Newtype s { dnsPolicy :: a | r } => Lens' s a
_dnsPolicy = _Newtype <<< prop (SProxy :: SProxy "dnsPolicy")

_downwardAPI :: forall s a r. Newtype s { downwardAPI :: a | r } => Lens' s a
_downwardAPI = _Newtype <<< prop (SProxy :: SProxy "downwardAPI")

_driver :: forall s a r. Newtype s { driver :: a | r } => Lens' s a
_driver = _Newtype <<< prop (SProxy :: SProxy "driver")

_drop :: forall s a r. Newtype s { drop :: a | r } => Lens' s a
_drop = _Newtype <<< prop (SProxy :: SProxy "drop")

_effect :: forall s a r. Newtype s { effect :: a | r } => Lens' s a
_effect = _Newtype <<< prop (SProxy :: SProxy "effect")

_egress :: forall s a r. Newtype s { egress :: a | r } => Lens' s a
_egress = _Newtype <<< prop (SProxy :: SProxy "egress")

_emptyDir :: forall s a r. Newtype s { emptyDir :: a | r } => Lens' s a
_emptyDir = _Newtype <<< prop (SProxy :: SProxy "emptyDir")

_endpoints :: forall s a r. Newtype s { endpoints :: a | r } => Lens' s a
_endpoints = _Newtype <<< prop (SProxy :: SProxy "endpoints")

_enum :: forall s a r. Newtype s { enum :: a | r } => Lens' s a
_enum = _Newtype <<< prop (SProxy :: SProxy "enum")

_env :: forall s a r. Newtype s { env :: a | r } => Lens' s a
_env = _Newtype <<< prop (SProxy :: SProxy "env")

_envFrom :: forall s a r. Newtype s { envFrom :: a | r } => Lens' s a
_envFrom = _Newtype <<< prop (SProxy :: SProxy "envFrom")

_error :: forall s a r. Newtype s { error :: a | r } => Lens' s a
_error = _Newtype <<< prop (SProxy :: SProxy "error")

_evaluationError :: forall s a r. Newtype s { evaluationError :: a | r } => Lens' s a
_evaluationError = _Newtype <<< prop (SProxy :: SProxy "evaluationError")

_eventTime :: forall s a r. Newtype s { eventTime :: a | r } => Lens' s a
_eventTime = _Newtype <<< prop (SProxy :: SProxy "eventTime")

_example :: forall s a r. Newtype s { example :: a | r } => Lens' s a
_example = _Newtype <<< prop (SProxy :: SProxy "example")

_except :: forall s a r. Newtype s { except :: a | r } => Lens' s a
_except = _Newtype <<< prop (SProxy :: SProxy "except")

_exclusiveMaximum :: forall s a r. Newtype s { exclusiveMaximum :: a | r } => Lens' s a
_exclusiveMaximum = _Newtype <<< prop (SProxy :: SProxy "exclusiveMaximum")

_exclusiveMinimum :: forall s a r. Newtype s { exclusiveMinimum :: a | r } => Lens' s a
_exclusiveMinimum = _Newtype <<< prop (SProxy :: SProxy "exclusiveMinimum")

_exec :: forall s a r. Newtype s { exec :: a | r } => Lens' s a
_exec = _Newtype <<< prop (SProxy :: SProxy "exec")

_exitCode :: forall s a r. Newtype s { exitCode :: a | r } => Lens' s a
_exitCode = _Newtype <<< prop (SProxy :: SProxy "exitCode")

_expectedPods :: forall s a r. Newtype s { expectedPods :: a | r } => Lens' s a
_expectedPods = _Newtype <<< prop (SProxy :: SProxy "expectedPods")

_externalDocs :: forall s a r. Newtype s { externalDocs :: a | r } => Lens' s a
_externalDocs = _Newtype <<< prop (SProxy :: SProxy "externalDocs")

_externalID :: forall s a r. Newtype s { externalID :: a | r } => Lens' s a
_externalID = _Newtype <<< prop (SProxy :: SProxy "externalID")

_externalIPs :: forall s a r. Newtype s { externalIPs :: a | r } => Lens' s a
_externalIPs = _Newtype <<< prop (SProxy :: SProxy "externalIPs")

_externalName :: forall s a r. Newtype s { externalName :: a | r } => Lens' s a
_externalName = _Newtype <<< prop (SProxy :: SProxy "externalName")

_externalTrafficPolicy :: forall s a r. Newtype s { externalTrafficPolicy :: a | r } => Lens' s a
_externalTrafficPolicy = _Newtype <<< prop (SProxy :: SProxy "externalTrafficPolicy")

_extra :: forall s a r. Newtype s { extra :: a | r } => Lens' s a
_extra = _Newtype <<< prop (SProxy :: SProxy "extra")

_failed :: forall s a r. Newtype s { failed :: a | r } => Lens' s a
_failed = _Newtype <<< prop (SProxy :: SProxy "failed")

_failedJobsHistoryLimit :: forall s a r. Newtype s { failedJobsHistoryLimit :: a | r } => Lens' s a
_failedJobsHistoryLimit = _Newtype <<< prop (SProxy :: SProxy "failedJobsHistoryLimit")

_failurePolicy :: forall s a r. Newtype s { failurePolicy :: a | r } => Lens' s a
_failurePolicy = _Newtype <<< prop (SProxy :: SProxy "failurePolicy")

_failureThreshold :: forall s a r. Newtype s { failureThreshold :: a | r } => Lens' s a
_failureThreshold = _Newtype <<< prop (SProxy :: SProxy "failureThreshold")

_fc :: forall s a r. Newtype s { fc :: a | r } => Lens' s a
_fc = _Newtype <<< prop (SProxy :: SProxy "fc")

_field :: forall s a r. Newtype s { field :: a | r } => Lens' s a
_field = _Newtype <<< prop (SProxy :: SProxy "field")

_fieldPath :: forall s a r. Newtype s { fieldPath :: a | r } => Lens' s a
_fieldPath = _Newtype <<< prop (SProxy :: SProxy "fieldPath")

_fieldRef :: forall s a r. Newtype s { fieldRef :: a | r } => Lens' s a
_fieldRef = _Newtype <<< prop (SProxy :: SProxy "fieldRef")

_finalizers :: forall s a r. Newtype s { finalizers :: a | r } => Lens' s a
_finalizers = _Newtype <<< prop (SProxy :: SProxy "finalizers")

_finishedAt :: forall s a r. Newtype s { finishedAt :: a | r } => Lens' s a
_finishedAt = _Newtype <<< prop (SProxy :: SProxy "finishedAt")

_firstTimestamp :: forall s a r. Newtype s { firstTimestamp :: a | r } => Lens' s a
_firstTimestamp = _Newtype <<< prop (SProxy :: SProxy "firstTimestamp")

_flexVolume :: forall s a r. Newtype s { flexVolume :: a | r } => Lens' s a
_flexVolume = _Newtype <<< prop (SProxy :: SProxy "flexVolume")

_flocker :: forall s a r. Newtype s { flocker :: a | r } => Lens' s a
_flocker = _Newtype <<< prop (SProxy :: SProxy "flocker")

_format :: forall s a r. Newtype s { format :: a | r } => Lens' s a
_format = _Newtype <<< prop (SProxy :: SProxy "format")

_from :: forall s a r. Newtype s { from :: a | r } => Lens' s a
_from = _Newtype <<< prop (SProxy :: SProxy "from")

_fsGroup :: forall s a r. Newtype s { fsGroup :: a | r } => Lens' s a
_fsGroup = _Newtype <<< prop (SProxy :: SProxy "fsGroup")

_fsType :: forall s a r. Newtype s { fsType :: a | r } => Lens' s a
_fsType = _Newtype <<< prop (SProxy :: SProxy "fsType")

_fullyLabeledReplicas :: forall s a r. Newtype s { fullyLabeledReplicas :: a | r } => Lens' s a
_fullyLabeledReplicas = _Newtype <<< prop (SProxy :: SProxy "fullyLabeledReplicas")

_gateway :: forall s a r. Newtype s { gateway :: a | r } => Lens' s a
_gateway = _Newtype <<< prop (SProxy :: SProxy "gateway")

_gcePersistentDisk :: forall s a r. Newtype s { gcePersistentDisk :: a | r } => Lens' s a
_gcePersistentDisk = _Newtype <<< prop (SProxy :: SProxy "gcePersistentDisk")

_generateName :: forall s a r. Newtype s { generateName :: a | r } => Lens' s a
_generateName = _Newtype <<< prop (SProxy :: SProxy "generateName")

_generation :: forall s a r. Newtype s { generation :: a | r } => Lens' s a
_generation = _Newtype <<< prop (SProxy :: SProxy "generation")

_gitCommit :: forall s a r. Newtype s { gitCommit :: a | r } => Lens' s a
_gitCommit = _Newtype <<< prop (SProxy :: SProxy "gitCommit")

_gitRepo :: forall s a r. Newtype s { gitRepo :: a | r } => Lens' s a
_gitRepo = _Newtype <<< prop (SProxy :: SProxy "gitRepo")

_gitTreeState :: forall s a r. Newtype s { gitTreeState :: a | r } => Lens' s a
_gitTreeState = _Newtype <<< prop (SProxy :: SProxy "gitTreeState")

_gitVersion :: forall s a r. Newtype s { gitVersion :: a | r } => Lens' s a
_gitVersion = _Newtype <<< prop (SProxy :: SProxy "gitVersion")

_globalDefault :: forall s a r. Newtype s { globalDefault :: a | r } => Lens' s a
_globalDefault = _Newtype <<< prop (SProxy :: SProxy "globalDefault")

_glusterfs :: forall s a r. Newtype s { glusterfs :: a | r } => Lens' s a
_glusterfs = _Newtype <<< prop (SProxy :: SProxy "glusterfs")

_goVersion :: forall s a r. Newtype s { goVersion :: a | r } => Lens' s a
_goVersion = _Newtype <<< prop (SProxy :: SProxy "goVersion")

_gracePeriodSeconds :: forall s a r. Newtype s { gracePeriodSeconds :: a | r } => Lens' s a
_gracePeriodSeconds = _Newtype <<< prop (SProxy :: SProxy "gracePeriodSeconds")

_group :: forall s a r. Newtype s { group :: a | r } => Lens' s a
_group = _Newtype <<< prop (SProxy :: SProxy "group")

_groupPriorityMinimum :: forall s a r. Newtype s { groupPriorityMinimum :: a | r } => Lens' s a
_groupPriorityMinimum = _Newtype <<< prop (SProxy :: SProxy "groupPriorityMinimum")

_groupVersion :: forall s a r. Newtype s { groupVersion :: a | r } => Lens' s a
_groupVersion = _Newtype <<< prop (SProxy :: SProxy "groupVersion")

_groups :: forall s a r. Newtype s { groups :: a | r } => Lens' s a
_groups = _Newtype <<< prop (SProxy :: SProxy "groups")

_hard :: forall s a r. Newtype s { hard :: a | r } => Lens' s a
_hard = _Newtype <<< prop (SProxy :: SProxy "hard")

_healthCheckNodePort :: forall s a r. Newtype s { healthCheckNodePort :: a | r } => Lens' s a
_healthCheckNodePort = _Newtype <<< prop (SProxy :: SProxy "healthCheckNodePort")

_host :: forall s a r. Newtype s { host :: a | r } => Lens' s a
_host = _Newtype <<< prop (SProxy :: SProxy "host")

_hostAliases :: forall s a r. Newtype s { hostAliases :: a | r } => Lens' s a
_hostAliases = _Newtype <<< prop (SProxy :: SProxy "hostAliases")

_hostIP :: forall s a r. Newtype s { hostIP :: a | r } => Lens' s a
_hostIP = _Newtype <<< prop (SProxy :: SProxy "hostIP")

_hostIPC :: forall s a r. Newtype s { hostIPC :: a | r } => Lens' s a
_hostIPC = _Newtype <<< prop (SProxy :: SProxy "hostIPC")

_hostNetwork :: forall s a r. Newtype s { hostNetwork :: a | r } => Lens' s a
_hostNetwork = _Newtype <<< prop (SProxy :: SProxy "hostNetwork")

_hostPID :: forall s a r. Newtype s { hostPID :: a | r } => Lens' s a
_hostPID = _Newtype <<< prop (SProxy :: SProxy "hostPID")

_hostPath :: forall s a r. Newtype s { hostPath :: a | r } => Lens' s a
_hostPath = _Newtype <<< prop (SProxy :: SProxy "hostPath")

_hostPort :: forall s a r. Newtype s { hostPort :: a | r } => Lens' s a
_hostPort = _Newtype <<< prop (SProxy :: SProxy "hostPort")

_hostPorts :: forall s a r. Newtype s { hostPorts :: a | r } => Lens' s a
_hostPorts = _Newtype <<< prop (SProxy :: SProxy "hostPorts")

_hostname :: forall s a r. Newtype s { hostname :: a | r } => Lens' s a
_hostname = _Newtype <<< prop (SProxy :: SProxy "hostname")

_hostnames :: forall s a r. Newtype s { hostnames :: a | r } => Lens' s a
_hostnames = _Newtype <<< prop (SProxy :: SProxy "hostnames")

_hosts :: forall s a r. Newtype s { hosts :: a | r } => Lens' s a
_hosts = _Newtype <<< prop (SProxy :: SProxy "hosts")

_http :: forall s a r. Newtype s { http :: a | r } => Lens' s a
_http = _Newtype <<< prop (SProxy :: SProxy "http")

_httpGet :: forall s a r. Newtype s { httpGet :: a | r } => Lens' s a
_httpGet = _Newtype <<< prop (SProxy :: SProxy "httpGet")

_httpHeaders :: forall s a r. Newtype s { httpHeaders :: a | r } => Lens' s a
_httpHeaders = _Newtype <<< prop (SProxy :: SProxy "httpHeaders")

_id :: forall s a r. Newtype s { id :: a | r } => Lens' s a
_id = _Newtype <<< prop (SProxy :: SProxy "id")

_image :: forall s a r. Newtype s { image :: a | r } => Lens' s a
_image = _Newtype <<< prop (SProxy :: SProxy "image")

_imageID :: forall s a r. Newtype s { imageID :: a | r } => Lens' s a
_imageID = _Newtype <<< prop (SProxy :: SProxy "imageID")

_imagePullPolicy :: forall s a r. Newtype s { imagePullPolicy :: a | r } => Lens' s a
_imagePullPolicy = _Newtype <<< prop (SProxy :: SProxy "imagePullPolicy")

_imagePullSecrets :: forall s a r. Newtype s { imagePullSecrets :: a | r } => Lens' s a
_imagePullSecrets = _Newtype <<< prop (SProxy :: SProxy "imagePullSecrets")

_images :: forall s a r. Newtype s { images :: a | r } => Lens' s a
_images = _Newtype <<< prop (SProxy :: SProxy "images")

_incomplete :: forall s a r. Newtype s { incomplete :: a | r } => Lens' s a
_incomplete = _Newtype <<< prop (SProxy :: SProxy "incomplete")

_ingress :: forall s a r. Newtype s { ingress :: a | r } => Lens' s a
_ingress = _Newtype <<< prop (SProxy :: SProxy "ingress")

_initContainerStatuses :: forall s a r. Newtype s { initContainerStatuses :: a | r } => Lens' s a
_initContainerStatuses = _Newtype <<< prop (SProxy :: SProxy "initContainerStatuses")

_initContainers :: forall s a r. Newtype s { initContainers :: a | r } => Lens' s a
_initContainers = _Newtype <<< prop (SProxy :: SProxy "initContainers")

_initialDelaySeconds :: forall s a r. Newtype s { initialDelaySeconds :: a | r } => Lens' s a
_initialDelaySeconds = _Newtype <<< prop (SProxy :: SProxy "initialDelaySeconds")

_initializers :: forall s a r. Newtype s { initializers :: a | r } => Lens' s a
_initializers = _Newtype <<< prop (SProxy :: SProxy "initializers")

_initiatorName :: forall s a r. Newtype s { initiatorName :: a | r } => Lens' s a
_initiatorName = _Newtype <<< prop (SProxy :: SProxy "initiatorName")

_insecureSkipTLSVerify :: forall s a r. Newtype s { insecureSkipTLSVerify :: a | r } => Lens' s a
_insecureSkipTLSVerify = _Newtype <<< prop (SProxy :: SProxy "insecureSkipTLSVerify")

_involvedObject :: forall s a r. Newtype s { involvedObject :: a | r } => Lens' s a
_involvedObject = _Newtype <<< prop (SProxy :: SProxy "involvedObject")

_ip :: forall s a r. Newtype s { ip :: a | r } => Lens' s a
_ip = _Newtype <<< prop (SProxy :: SProxy "ip")

_ipBlock :: forall s a r. Newtype s { ipBlock :: a | r } => Lens' s a
_ipBlock = _Newtype <<< prop (SProxy :: SProxy "ipBlock")

_iqn :: forall s a r. Newtype s { iqn :: a | r } => Lens' s a
_iqn = _Newtype <<< prop (SProxy :: SProxy "iqn")

_iscsi :: forall s a r. Newtype s { iscsi :: a | r } => Lens' s a
_iscsi = _Newtype <<< prop (SProxy :: SProxy "iscsi")

_iscsiInterface :: forall s a r. Newtype s { iscsiInterface :: a | r } => Lens' s a
_iscsiInterface = _Newtype <<< prop (SProxy :: SProxy "iscsiInterface")

_items :: forall s a r. Newtype s { items :: a | r } => Lens' s a
_items = _Newtype <<< prop (SProxy :: SProxy "items")

_jobTemplate :: forall s a r. Newtype s { jobTemplate :: a | r } => Lens' s a
_jobTemplate = _Newtype <<< prop (SProxy :: SProxy "jobTemplate")

_kernelVersion :: forall s a r. Newtype s { kernelVersion :: a | r } => Lens' s a
_kernelVersion = _Newtype <<< prop (SProxy :: SProxy "kernelVersion")

_key :: forall s a r. Newtype s { key :: a | r } => Lens' s a
_key = _Newtype <<< prop (SProxy :: SProxy "key")

_keyring :: forall s a r. Newtype s { keyring :: a | r } => Lens' s a
_keyring = _Newtype <<< prop (SProxy :: SProxy "keyring")

_kind :: forall s a r. Newtype s { kind :: a | r } => Lens' s a
_kind = _Newtype <<< prop (SProxy :: SProxy "kind")

_kubeProxyVersion :: forall s a r. Newtype s { kubeProxyVersion :: a | r } => Lens' s a
_kubeProxyVersion = _Newtype <<< prop (SProxy :: SProxy "kubeProxyVersion")

_kubeletEndpoint :: forall s a r. Newtype s { kubeletEndpoint :: a | r } => Lens' s a
_kubeletEndpoint = _Newtype <<< prop (SProxy :: SProxy "kubeletEndpoint")

_kubeletVersion :: forall s a r. Newtype s { kubeletVersion :: a | r } => Lens' s a
_kubeletVersion = _Newtype <<< prop (SProxy :: SProxy "kubeletVersion")

_labelSelector :: forall s a r. Newtype s { labelSelector :: a | r } => Lens' s a
_labelSelector = _Newtype <<< prop (SProxy :: SProxy "labelSelector")

_labels :: forall s a r. Newtype s { labels :: a | r } => Lens' s a
_labels = _Newtype <<< prop (SProxy :: SProxy "labels")

_lastHeartbeatTime :: forall s a r. Newtype s { lastHeartbeatTime :: a | r } => Lens' s a
_lastHeartbeatTime = _Newtype <<< prop (SProxy :: SProxy "lastHeartbeatTime")

_lastObservedTime :: forall s a r. Newtype s { lastObservedTime :: a | r } => Lens' s a
_lastObservedTime = _Newtype <<< prop (SProxy :: SProxy "lastObservedTime")

_lastProbeTime :: forall s a r. Newtype s { lastProbeTime :: a | r } => Lens' s a
_lastProbeTime = _Newtype <<< prop (SProxy :: SProxy "lastProbeTime")

_lastScaleTime :: forall s a r. Newtype s { lastScaleTime :: a | r } => Lens' s a
_lastScaleTime = _Newtype <<< prop (SProxy :: SProxy "lastScaleTime")

_lastScheduleTime :: forall s a r. Newtype s { lastScheduleTime :: a | r } => Lens' s a
_lastScheduleTime = _Newtype <<< prop (SProxy :: SProxy "lastScheduleTime")

_lastState :: forall s a r. Newtype s { lastState :: a | r } => Lens' s a
_lastState = _Newtype <<< prop (SProxy :: SProxy "lastState")

_lastTimestamp :: forall s a r. Newtype s { lastTimestamp :: a | r } => Lens' s a
_lastTimestamp = _Newtype <<< prop (SProxy :: SProxy "lastTimestamp")

_lastTransitionTime :: forall s a r. Newtype s { lastTransitionTime :: a | r } => Lens' s a
_lastTransitionTime = _Newtype <<< prop (SProxy :: SProxy "lastTransitionTime")

_lastUpdateTime :: forall s a r. Newtype s { lastUpdateTime :: a | r } => Lens' s a
_lastUpdateTime = _Newtype <<< prop (SProxy :: SProxy "lastUpdateTime")

_level :: forall s a r. Newtype s { level :: a | r } => Lens' s a
_level = _Newtype <<< prop (SProxy :: SProxy "level")

_lifecycle :: forall s a r. Newtype s { lifecycle :: a | r } => Lens' s a
_lifecycle = _Newtype <<< prop (SProxy :: SProxy "lifecycle")

_limits :: forall s a r. Newtype s { limits :: a | r } => Lens' s a
_limits = _Newtype <<< prop (SProxy :: SProxy "limits")

_listKind :: forall s a r. Newtype s { listKind :: a | r } => Lens' s a
_listKind = _Newtype <<< prop (SProxy :: SProxy "listKind")

_livenessProbe :: forall s a r. Newtype s { livenessProbe :: a | r } => Lens' s a
_livenessProbe = _Newtype <<< prop (SProxy :: SProxy "livenessProbe")

_loadBalancer :: forall s a r. Newtype s { loadBalancer :: a | r } => Lens' s a
_loadBalancer = _Newtype <<< prop (SProxy :: SProxy "loadBalancer")

_loadBalancerIP :: forall s a r. Newtype s { loadBalancerIP :: a | r } => Lens' s a
_loadBalancerIP = _Newtype <<< prop (SProxy :: SProxy "loadBalancerIP")

_loadBalancerSourceRanges :: forall s a r. Newtype s { loadBalancerSourceRanges :: a | r } => Lens' s a
_loadBalancerSourceRanges = _Newtype <<< prop (SProxy :: SProxy "loadBalancerSourceRanges")

_local :: forall s a r. Newtype s { local :: a | r } => Lens' s a
_local = _Newtype <<< prop (SProxy :: SProxy "local")

_lun :: forall s a r. Newtype s { lun :: a | r } => Lens' s a
_lun = _Newtype <<< prop (SProxy :: SProxy "lun")

_machineID :: forall s a r. Newtype s { machineID :: a | r } => Lens' s a
_machineID = _Newtype <<< prop (SProxy :: SProxy "machineID")

_major :: forall s a r. Newtype s { major :: a | r } => Lens' s a
_major = _Newtype <<< prop (SProxy :: SProxy "major")

_manualSelector :: forall s a r. Newtype s { manualSelector :: a | r } => Lens' s a
_manualSelector = _Newtype <<< prop (SProxy :: SProxy "manualSelector")

_matchExpressions :: forall s a r. Newtype s { matchExpressions :: a | r } => Lens' s a
_matchExpressions = _Newtype <<< prop (SProxy :: SProxy "matchExpressions")

_matchLabels :: forall s a r. Newtype s { matchLabels :: a | r } => Lens' s a
_matchLabels = _Newtype <<< prop (SProxy :: SProxy "matchLabels")

_max :: forall s a r. Newtype s { max :: a | r } => Lens' s a
_max = _Newtype <<< prop (SProxy :: SProxy "max")

_maxItems :: forall s a r. Newtype s { maxItems :: a | r } => Lens' s a
_maxItems = _Newtype <<< prop (SProxy :: SProxy "maxItems")

_maxLength :: forall s a r. Newtype s { maxLength :: a | r } => Lens' s a
_maxLength = _Newtype <<< prop (SProxy :: SProxy "maxLength")

_maxLimitRequestRatio :: forall s a r. Newtype s { maxLimitRequestRatio :: a | r } => Lens' s a
_maxLimitRequestRatio = _Newtype <<< prop (SProxy :: SProxy "maxLimitRequestRatio")

_maxProperties :: forall s a r. Newtype s { maxProperties :: a | r } => Lens' s a
_maxProperties = _Newtype <<< prop (SProxy :: SProxy "maxProperties")

_maxReplicas :: forall s a r. Newtype s { maxReplicas :: a | r } => Lens' s a
_maxReplicas = _Newtype <<< prop (SProxy :: SProxy "maxReplicas")

_maxSurge :: forall s a r. Newtype s { maxSurge :: a | r } => Lens' s a
_maxSurge = _Newtype <<< prop (SProxy :: SProxy "maxSurge")

_maxUnavailable :: forall s a r. Newtype s { maxUnavailable :: a | r } => Lens' s a
_maxUnavailable = _Newtype <<< prop (SProxy :: SProxy "maxUnavailable")

_maximum :: forall s a r. Newtype s { maximum :: a | r } => Lens' s a
_maximum = _Newtype <<< prop (SProxy :: SProxy "maximum")

_medium :: forall s a r. Newtype s { medium :: a | r } => Lens' s a
_medium = _Newtype <<< prop (SProxy :: SProxy "medium")

_message :: forall s a r. Newtype s { message :: a | r } => Lens' s a
_message = _Newtype <<< prop (SProxy :: SProxy "message")

_metadata :: forall s a r. Newtype s { metadata :: a | r } => Lens' s a
_metadata = _Newtype <<< prop (SProxy :: SProxy "metadata")

_metricName :: forall s a r. Newtype s { metricName :: a | r } => Lens' s a
_metricName = _Newtype <<< prop (SProxy :: SProxy "metricName")

_metrics :: forall s a r. Newtype s { metrics :: a | r } => Lens' s a
_metrics = _Newtype <<< prop (SProxy :: SProxy "metrics")

_min :: forall s a r. Newtype s { min :: a | r } => Lens' s a
_min = _Newtype <<< prop (SProxy :: SProxy "min")

_minAvailable :: forall s a r. Newtype s { minAvailable :: a | r } => Lens' s a
_minAvailable = _Newtype <<< prop (SProxy :: SProxy "minAvailable")

_minItems :: forall s a r. Newtype s { minItems :: a | r } => Lens' s a
_minItems = _Newtype <<< prop (SProxy :: SProxy "minItems")

_minLength :: forall s a r. Newtype s { minLength :: a | r } => Lens' s a
_minLength = _Newtype <<< prop (SProxy :: SProxy "minLength")

_minProperties :: forall s a r. Newtype s { minProperties :: a | r } => Lens' s a
_minProperties = _Newtype <<< prop (SProxy :: SProxy "minProperties")

_minReadySeconds :: forall s a r. Newtype s { minReadySeconds :: a | r } => Lens' s a
_minReadySeconds = _Newtype <<< prop (SProxy :: SProxy "minReadySeconds")

_minReplicas :: forall s a r. Newtype s { minReplicas :: a | r } => Lens' s a
_minReplicas = _Newtype <<< prop (SProxy :: SProxy "minReplicas")

_minimum :: forall s a r. Newtype s { minimum :: a | r } => Lens' s a
_minimum = _Newtype <<< prop (SProxy :: SProxy "minimum")

_minor :: forall s a r. Newtype s { minor :: a | r } => Lens' s a
_minor = _Newtype <<< prop (SProxy :: SProxy "minor")

_mode :: forall s a r. Newtype s { mode :: a | r } => Lens' s a
_mode = _Newtype <<< prop (SProxy :: SProxy "mode")

_monitors :: forall s a r. Newtype s { monitors :: a | r } => Lens' s a
_monitors = _Newtype <<< prop (SProxy :: SProxy "monitors")

_mountOptions :: forall s a r. Newtype s { mountOptions :: a | r } => Lens' s a
_mountOptions = _Newtype <<< prop (SProxy :: SProxy "mountOptions")

_mountPath :: forall s a r. Newtype s { mountPath :: a | r } => Lens' s a
_mountPath = _Newtype <<< prop (SProxy :: SProxy "mountPath")

_mountPropagation :: forall s a r. Newtype s { mountPropagation :: a | r } => Lens' s a
_mountPropagation = _Newtype <<< prop (SProxy :: SProxy "mountPropagation")

_multipleOf :: forall s a r. Newtype s { multipleOf :: a | r } => Lens' s a
_multipleOf = _Newtype <<< prop (SProxy :: SProxy "multipleOf")

_name :: forall s a r. Newtype s { name :: a | r } => Lens' s a
_name = _Newtype <<< prop (SProxy :: SProxy "name")

_names :: forall s a r. Newtype s { names :: a | r } => Lens' s a
_names = _Newtype <<< prop (SProxy :: SProxy "names")

_nameservers :: forall s a r. Newtype s { nameservers :: a | r } => Lens' s a
_nameservers = _Newtype <<< prop (SProxy :: SProxy "nameservers")

_namespace :: forall s a r. Newtype s { namespace :: a | r } => Lens' s a
_namespace = _Newtype <<< prop (SProxy :: SProxy "namespace")

_namespaceSelector :: forall s a r. Newtype s { namespaceSelector :: a | r } => Lens' s a
_namespaceSelector = _Newtype <<< prop (SProxy :: SProxy "namespaceSelector")

_namespaced :: forall s a r. Newtype s { namespaced :: a | r } => Lens' s a
_namespaced = _Newtype <<< prop (SProxy :: SProxy "namespaced")

_namespaces :: forall s a r. Newtype s { namespaces :: a | r } => Lens' s a
_namespaces = _Newtype <<< prop (SProxy :: SProxy "namespaces")

_nfs :: forall s a r. Newtype s { nfs :: a | r } => Lens' s a
_nfs = _Newtype <<< prop (SProxy :: SProxy "nfs")

_nodeAffinity :: forall s a r. Newtype s { nodeAffinity :: a | r } => Lens' s a
_nodeAffinity = _Newtype <<< prop (SProxy :: SProxy "nodeAffinity")

_nodeInfo :: forall s a r. Newtype s { nodeInfo :: a | r } => Lens' s a
_nodeInfo = _Newtype <<< prop (SProxy :: SProxy "nodeInfo")

_nodeName :: forall s a r. Newtype s { nodeName :: a | r } => Lens' s a
_nodeName = _Newtype <<< prop (SProxy :: SProxy "nodeName")

_nodePort :: forall s a r. Newtype s { nodePort :: a | r } => Lens' s a
_nodePort = _Newtype <<< prop (SProxy :: SProxy "nodePort")

_nodeSelector :: forall s a r. Newtype s { nodeSelector :: a | r } => Lens' s a
_nodeSelector = _Newtype <<< prop (SProxy :: SProxy "nodeSelector")

_nodeSelectorTerms :: forall s a r. Newtype s { nodeSelectorTerms :: a | r } => Lens' s a
_nodeSelectorTerms = _Newtype <<< prop (SProxy :: SProxy "nodeSelectorTerms")

_nonResourceAttributes :: forall s a r. Newtype s { nonResourceAttributes :: a | r } => Lens' s a
_nonResourceAttributes = _Newtype <<< prop (SProxy :: SProxy "nonResourceAttributes")

_nonResourceRules :: forall s a r. Newtype s { nonResourceRules :: a | r } => Lens' s a
_nonResourceRules = _Newtype <<< prop (SProxy :: SProxy "nonResourceRules")

_nonResourceURLs :: forall s a r. Newtype s { nonResourceURLs :: a | r } => Lens' s a
_nonResourceURLs = _Newtype <<< prop (SProxy :: SProxy "nonResourceURLs")

_not :: forall s a r. Newtype s { not :: a | r } => Lens' s a
_not = _Newtype <<< prop (SProxy :: SProxy "not")

_notReadyAddresses :: forall s a r. Newtype s { notReadyAddresses :: a | r } => Lens' s a
_notReadyAddresses = _Newtype <<< prop (SProxy :: SProxy "notReadyAddresses")

_note :: forall s a r. Newtype s { note :: a | r } => Lens' s a
_note = _Newtype <<< prop (SProxy :: SProxy "note")

_numberAvailable :: forall s a r. Newtype s { numberAvailable :: a | r } => Lens' s a
_numberAvailable = _Newtype <<< prop (SProxy :: SProxy "numberAvailable")

_numberMisscheduled :: forall s a r. Newtype s { numberMisscheduled :: a | r } => Lens' s a
_numberMisscheduled = _Newtype <<< prop (SProxy :: SProxy "numberMisscheduled")

_numberReady :: forall s a r. Newtype s { numberReady :: a | r } => Lens' s a
_numberReady = _Newtype <<< prop (SProxy :: SProxy "numberReady")

_numberUnavailable :: forall s a r. Newtype s { numberUnavailable :: a | r } => Lens' s a
_numberUnavailable = _Newtype <<< prop (SProxy :: SProxy "numberUnavailable")

_object :: forall s a r. Newtype s { object :: a | r } => Lens' s a
_object = _Newtype <<< prop (SProxy :: SProxy "object")

_observedGeneration :: forall s a r. Newtype s { observedGeneration :: a | r } => Lens' s a
_observedGeneration = _Newtype <<< prop (SProxy :: SProxy "observedGeneration")

_oneOf :: forall s a r. Newtype s { oneOf :: a | r } => Lens' s a
_oneOf = _Newtype <<< prop (SProxy :: SProxy "oneOf")

_openAPIV3Schema :: forall s a r. Newtype s { openAPIV3Schema :: a | r } => Lens' s a
_openAPIV3Schema = _Newtype <<< prop (SProxy :: SProxy "openAPIV3Schema")

_operatingSystem :: forall s a r. Newtype s { operatingSystem :: a | r } => Lens' s a
_operatingSystem = _Newtype <<< prop (SProxy :: SProxy "operatingSystem")

_operations :: forall s a r. Newtype s { operations :: a | r } => Lens' s a
_operations = _Newtype <<< prop (SProxy :: SProxy "operations")

_operator :: forall s a r. Newtype s { operator :: a | r } => Lens' s a
_operator = _Newtype <<< prop (SProxy :: SProxy "operator")

_optional :: forall s a r. Newtype s { optional :: a | r } => Lens' s a
_optional = _Newtype <<< prop (SProxy :: SProxy "optional")

_options :: forall s a r. Newtype s { options :: a | r } => Lens' s a
_options = _Newtype <<< prop (SProxy :: SProxy "options")

_orphanDependents :: forall s a r. Newtype s { orphanDependents :: a | r } => Lens' s a
_orphanDependents = _Newtype <<< prop (SProxy :: SProxy "orphanDependents")

_osImage :: forall s a r. Newtype s { osImage :: a | r } => Lens' s a
_osImage = _Newtype <<< prop (SProxy :: SProxy "osImage")

_ownerReferences :: forall s a r. Newtype s { ownerReferences :: a | r } => Lens' s a
_ownerReferences = _Newtype <<< prop (SProxy :: SProxy "ownerReferences")

_parallelism :: forall s a r. Newtype s { parallelism :: a | r } => Lens' s a
_parallelism = _Newtype <<< prop (SProxy :: SProxy "parallelism")

_parameters :: forall s a r. Newtype s { parameters :: a | r } => Lens' s a
_parameters = _Newtype <<< prop (SProxy :: SProxy "parameters")

_partition :: forall s a r. Newtype s { partition :: a | r } => Lens' s a
_partition = _Newtype <<< prop (SProxy :: SProxy "partition")

_path :: forall s a r. Newtype s { path :: a | r } => Lens' s a
_path = _Newtype <<< prop (SProxy :: SProxy "path")

_pathPrefix :: forall s a r. Newtype s { pathPrefix :: a | r } => Lens' s a
_pathPrefix = _Newtype <<< prop (SProxy :: SProxy "pathPrefix")

_paths :: forall s a r. Newtype s { paths :: a | r } => Lens' s a
_paths = _Newtype <<< prop (SProxy :: SProxy "paths")

_pattern :: forall s a r. Newtype s { pattern :: a | r } => Lens' s a
_pattern = _Newtype <<< prop (SProxy :: SProxy "pattern")

_patternProperties :: forall s a r. Newtype s { patternProperties :: a | r } => Lens' s a
_patternProperties = _Newtype <<< prop (SProxy :: SProxy "patternProperties")

_paused :: forall s a r. Newtype s { paused :: a | r } => Lens' s a
_paused = _Newtype <<< prop (SProxy :: SProxy "paused")

_pdID :: forall s a r. Newtype s { pdID :: a | r } => Lens' s a
_pdID = _Newtype <<< prop (SProxy :: SProxy "pdID")

_pdName :: forall s a r. Newtype s { pdName :: a | r } => Lens' s a
_pdName = _Newtype <<< prop (SProxy :: SProxy "pdName")

_pending :: forall s a r. Newtype s { pending :: a | r } => Lens' s a
_pending = _Newtype <<< prop (SProxy :: SProxy "pending")

_periodSeconds :: forall s a r. Newtype s { periodSeconds :: a | r } => Lens' s a
_periodSeconds = _Newtype <<< prop (SProxy :: SProxy "periodSeconds")

_persistentVolumeClaim :: forall s a r. Newtype s { persistentVolumeClaim :: a | r } => Lens' s a
_persistentVolumeClaim = _Newtype <<< prop (SProxy :: SProxy "persistentVolumeClaim")

_persistentVolumeName :: forall s a r. Newtype s { persistentVolumeName :: a | r } => Lens' s a
_persistentVolumeName = _Newtype <<< prop (SProxy :: SProxy "persistentVolumeName")

_persistentVolumeReclaimPolicy :: forall s a r. Newtype s { persistentVolumeReclaimPolicy :: a | r } => Lens' s a
_persistentVolumeReclaimPolicy = _Newtype <<< prop (SProxy :: SProxy "persistentVolumeReclaimPolicy")

_phase :: forall s a r. Newtype s { phase :: a | r } => Lens' s a
_phase = _Newtype <<< prop (SProxy :: SProxy "phase")

_photonPersistentDisk :: forall s a r. Newtype s { photonPersistentDisk :: a | r } => Lens' s a
_photonPersistentDisk = _Newtype <<< prop (SProxy :: SProxy "photonPersistentDisk")

_platform :: forall s a r. Newtype s { platform :: a | r } => Lens' s a
_platform = _Newtype <<< prop (SProxy :: SProxy "platform")

_plural :: forall s a r. Newtype s { plural :: a | r } => Lens' s a
_plural = _Newtype <<< prop (SProxy :: SProxy "plural")

_podAffinity :: forall s a r. Newtype s { podAffinity :: a | r } => Lens' s a
_podAffinity = _Newtype <<< prop (SProxy :: SProxy "podAffinity")

_podAffinityTerm :: forall s a r. Newtype s { podAffinityTerm :: a | r } => Lens' s a
_podAffinityTerm = _Newtype <<< prop (SProxy :: SProxy "podAffinityTerm")

_podAntiAffinity :: forall s a r. Newtype s { podAntiAffinity :: a | r } => Lens' s a
_podAntiAffinity = _Newtype <<< prop (SProxy :: SProxy "podAntiAffinity")

_podCIDR :: forall s a r. Newtype s { podCIDR :: a | r } => Lens' s a
_podCIDR = _Newtype <<< prop (SProxy :: SProxy "podCIDR")

_podIP :: forall s a r. Newtype s { podIP :: a | r } => Lens' s a
_podIP = _Newtype <<< prop (SProxy :: SProxy "podIP")

_podManagementPolicy :: forall s a r. Newtype s { podManagementPolicy :: a | r } => Lens' s a
_podManagementPolicy = _Newtype <<< prop (SProxy :: SProxy "podManagementPolicy")

_podSelector :: forall s a r. Newtype s { podSelector :: a | r } => Lens' s a
_podSelector = _Newtype <<< prop (SProxy :: SProxy "podSelector")

_pods :: forall s a r. Newtype s { pods :: a | r } => Lens' s a
_pods = _Newtype <<< prop (SProxy :: SProxy "pods")

_policyTypes :: forall s a r. Newtype s { policyTypes :: a | r } => Lens' s a
_policyTypes = _Newtype <<< prop (SProxy :: SProxy "policyTypes")

_pool :: forall s a r. Newtype s { pool :: a | r } => Lens' s a
_pool = _Newtype <<< prop (SProxy :: SProxy "pool")

_port :: forall s a r. Newtype s { port :: a | r } => Lens' s a
_port = _Newtype <<< prop (SProxy :: SProxy "port")

_portals :: forall s a r. Newtype s { portals :: a | r } => Lens' s a
_portals = _Newtype <<< prop (SProxy :: SProxy "portals")

_ports :: forall s a r. Newtype s { ports :: a | r } => Lens' s a
_ports = _Newtype <<< prop (SProxy :: SProxy "ports")

_portworxVolume :: forall s a r. Newtype s { portworxVolume :: a | r } => Lens' s a
_portworxVolume = _Newtype <<< prop (SProxy :: SProxy "portworxVolume")

_postStart :: forall s a r. Newtype s { postStart :: a | r } => Lens' s a
_postStart = _Newtype <<< prop (SProxy :: SProxy "postStart")

_preStop :: forall s a r. Newtype s { preStop :: a | r } => Lens' s a
_preStop = _Newtype <<< prop (SProxy :: SProxy "preStop")

_preconditions :: forall s a r. Newtype s { preconditions :: a | r } => Lens' s a
_preconditions = _Newtype <<< prop (SProxy :: SProxy "preconditions")

_preference :: forall s a r. Newtype s { preference :: a | r } => Lens' s a
_preference = _Newtype <<< prop (SProxy :: SProxy "preference")

_preferredDuringSchedulingIgnoredDuringExecution :: forall s a r. Newtype s { preferredDuringSchedulingIgnoredDuringExecution :: a | r } => Lens' s a
_preferredDuringSchedulingIgnoredDuringExecution = _Newtype <<< prop (SProxy :: SProxy "preferredDuringSchedulingIgnoredDuringExecution")

_preferredVersion :: forall s a r. Newtype s { preferredVersion :: a | r } => Lens' s a
_preferredVersion = _Newtype <<< prop (SProxy :: SProxy "preferredVersion")

_prefix :: forall s a r. Newtype s { prefix :: a | r } => Lens' s a
_prefix = _Newtype <<< prop (SProxy :: SProxy "prefix")

_priority :: forall s a r. Newtype s { priority :: a | r } => Lens' s a
_priority = _Newtype <<< prop (SProxy :: SProxy "priority")

_priorityClassName :: forall s a r. Newtype s { priorityClassName :: a | r } => Lens' s a
_priorityClassName = _Newtype <<< prop (SProxy :: SProxy "priorityClassName")

_privileged :: forall s a r. Newtype s { privileged :: a | r } => Lens' s a
_privileged = _Newtype <<< prop (SProxy :: SProxy "privileged")

_progressDeadlineSeconds :: forall s a r. Newtype s { progressDeadlineSeconds :: a | r } => Lens' s a
_progressDeadlineSeconds = _Newtype <<< prop (SProxy :: SProxy "progressDeadlineSeconds")

_projected :: forall s a r. Newtype s { projected :: a | r } => Lens' s a
_projected = _Newtype <<< prop (SProxy :: SProxy "projected")

_propagationPolicy :: forall s a r. Newtype s { propagationPolicy :: a | r } => Lens' s a
_propagationPolicy = _Newtype <<< prop (SProxy :: SProxy "propagationPolicy")

_properties :: forall s a r. Newtype s { properties :: a | r } => Lens' s a
_properties = _Newtype <<< prop (SProxy :: SProxy "properties")

_protectionDomain :: forall s a r. Newtype s { protectionDomain :: a | r } => Lens' s a
_protectionDomain = _Newtype <<< prop (SProxy :: SProxy "protectionDomain")

_protocol :: forall s a r. Newtype s { protocol :: a | r } => Lens' s a
_protocol = _Newtype <<< prop (SProxy :: SProxy "protocol")

_providerID :: forall s a r. Newtype s { providerID :: a | r } => Lens' s a
_providerID = _Newtype <<< prop (SProxy :: SProxy "providerID")

_provisioner :: forall s a r. Newtype s { provisioner :: a | r } => Lens' s a
_provisioner = _Newtype <<< prop (SProxy :: SProxy "provisioner")

_publishNotReadyAddresses :: forall s a r. Newtype s { publishNotReadyAddresses :: a | r } => Lens' s a
_publishNotReadyAddresses = _Newtype <<< prop (SProxy :: SProxy "publishNotReadyAddresses")

_qosClass :: forall s a r. Newtype s { qosClass :: a | r } => Lens' s a
_qosClass = _Newtype <<< prop (SProxy :: SProxy "qosClass")

_quobyte :: forall s a r. Newtype s { quobyte :: a | r } => Lens' s a
_quobyte = _Newtype <<< prop (SProxy :: SProxy "quobyte")

_ranges :: forall s a r. Newtype s { ranges :: a | r } => Lens' s a
_ranges = _Newtype <<< prop (SProxy :: SProxy "ranges")

_rbd :: forall s a r. Newtype s { rbd :: a | r } => Lens' s a
_rbd = _Newtype <<< prop (SProxy :: SProxy "rbd")

_readOnly :: forall s a r. Newtype s { readOnly :: a | r } => Lens' s a
_readOnly = _Newtype <<< prop (SProxy :: SProxy "readOnly")

_readOnlyRootFilesystem :: forall s a r. Newtype s { readOnlyRootFilesystem :: a | r } => Lens' s a
_readOnlyRootFilesystem = _Newtype <<< prop (SProxy :: SProxy "readOnlyRootFilesystem")

_readinessProbe :: forall s a r. Newtype s { readinessProbe :: a | r } => Lens' s a
_readinessProbe = _Newtype <<< prop (SProxy :: SProxy "readinessProbe")

_ready :: forall s a r. Newtype s { ready :: a | r } => Lens' s a
_ready = _Newtype <<< prop (SProxy :: SProxy "ready")

_readyReplicas :: forall s a r. Newtype s { readyReplicas :: a | r } => Lens' s a
_readyReplicas = _Newtype <<< prop (SProxy :: SProxy "readyReplicas")

_reason :: forall s a r. Newtype s { reason :: a | r } => Lens' s a
_reason = _Newtype <<< prop (SProxy :: SProxy "reason")

_reclaimPolicy :: forall s a r. Newtype s { reclaimPolicy :: a | r } => Lens' s a
_reclaimPolicy = _Newtype <<< prop (SProxy :: SProxy "reclaimPolicy")

_regarding :: forall s a r. Newtype s { regarding :: a | r } => Lens' s a
_regarding = _Newtype <<< prop (SProxy :: SProxy "regarding")

_registry :: forall s a r. Newtype s { registry :: a | r } => Lens' s a
_registry = _Newtype <<< prop (SProxy :: SProxy "registry")

_related :: forall s a r. Newtype s { related :: a | r } => Lens' s a
_related = _Newtype <<< prop (SProxy :: SProxy "related")

_replicas :: forall s a r. Newtype s { replicas :: a | r } => Lens' s a
_replicas = _Newtype <<< prop (SProxy :: SProxy "replicas")

_reportingComponent :: forall s a r. Newtype s { reportingComponent :: a | r } => Lens' s a
_reportingComponent = _Newtype <<< prop (SProxy :: SProxy "reportingComponent")

_reportingController :: forall s a r. Newtype s { reportingController :: a | r } => Lens' s a
_reportingController = _Newtype <<< prop (SProxy :: SProxy "reportingController")

_reportingInstance :: forall s a r. Newtype s { reportingInstance :: a | r } => Lens' s a
_reportingInstance = _Newtype <<< prop (SProxy :: SProxy "reportingInstance")

_repository :: forall s a r. Newtype s { repository :: a | r } => Lens' s a
_repository = _Newtype <<< prop (SProxy :: SProxy "repository")

_request :: forall s a r. Newtype s { request :: a | r } => Lens' s a
_request = _Newtype <<< prop (SProxy :: SProxy "request")

_requests :: forall s a r. Newtype s { requests :: a | r } => Lens' s a
_requests = _Newtype <<< prop (SProxy :: SProxy "requests")

_required :: forall s a r. Newtype s { required :: a | r } => Lens' s a
_required = _Newtype <<< prop (SProxy :: SProxy "required")

_requiredDropCapabilities :: forall s a r. Newtype s { requiredDropCapabilities :: a | r } => Lens' s a
_requiredDropCapabilities = _Newtype <<< prop (SProxy :: SProxy "requiredDropCapabilities")

_requiredDuringSchedulingIgnoredDuringExecution :: forall s a r. Newtype s { requiredDuringSchedulingIgnoredDuringExecution :: a | r } => Lens' s a
_requiredDuringSchedulingIgnoredDuringExecution = _Newtype <<< prop (SProxy :: SProxy "requiredDuringSchedulingIgnoredDuringExecution")

_resource :: forall s a r. Newtype s { resource :: a | r } => Lens' s a
_resource = _Newtype <<< prop (SProxy :: SProxy "resource")

_resourceAttributes :: forall s a r. Newtype s { resourceAttributes :: a | r } => Lens' s a
_resourceAttributes = _Newtype <<< prop (SProxy :: SProxy "resourceAttributes")

_resourceFieldRef :: forall s a r. Newtype s { resourceFieldRef :: a | r } => Lens' s a
_resourceFieldRef = _Newtype <<< prop (SProxy :: SProxy "resourceFieldRef")

_resourceNames :: forall s a r. Newtype s { resourceNames :: a | r } => Lens' s a
_resourceNames = _Newtype <<< prop (SProxy :: SProxy "resourceNames")

_resourceRules :: forall s a r. Newtype s { resourceRules :: a | r } => Lens' s a
_resourceRules = _Newtype <<< prop (SProxy :: SProxy "resourceRules")

_resourceVersion :: forall s a r. Newtype s { resourceVersion :: a | r } => Lens' s a
_resourceVersion = _Newtype <<< prop (SProxy :: SProxy "resourceVersion")

_resources :: forall s a r. Newtype s { resources :: a | r } => Lens' s a
_resources = _Newtype <<< prop (SProxy :: SProxy "resources")

_restartCount :: forall s a r. Newtype s { restartCount :: a | r } => Lens' s a
_restartCount = _Newtype <<< prop (SProxy :: SProxy "restartCount")

_restartPolicy :: forall s a r. Newtype s { restartPolicy :: a | r } => Lens' s a
_restartPolicy = _Newtype <<< prop (SProxy :: SProxy "restartPolicy")

_result :: forall s a r. Newtype s { result :: a | r } => Lens' s a
_result = _Newtype <<< prop (SProxy :: SProxy "result")

_retryAfterSeconds :: forall s a r. Newtype s { retryAfterSeconds :: a | r } => Lens' s a
_retryAfterSeconds = _Newtype <<< prop (SProxy :: SProxy "retryAfterSeconds")

_revision :: forall s a r. Newtype s { revision :: a | r } => Lens' s a
_revision = _Newtype <<< prop (SProxy :: SProxy "revision")

_revisionHistoryLimit :: forall s a r. Newtype s { revisionHistoryLimit :: a | r } => Lens' s a
_revisionHistoryLimit = _Newtype <<< prop (SProxy :: SProxy "revisionHistoryLimit")

_role :: forall s a r. Newtype s { role :: a | r } => Lens' s a
_role = _Newtype <<< prop (SProxy :: SProxy "role")

_roleRef :: forall s a r. Newtype s { roleRef :: a | r } => Lens' s a
_roleRef = _Newtype <<< prop (SProxy :: SProxy "roleRef")

_rollbackTo :: forall s a r. Newtype s { rollbackTo :: a | r } => Lens' s a
_rollbackTo = _Newtype <<< prop (SProxy :: SProxy "rollbackTo")

_rollingUpdate :: forall s a r. Newtype s { rollingUpdate :: a | r } => Lens' s a
_rollingUpdate = _Newtype <<< prop (SProxy :: SProxy "rollingUpdate")

_rule :: forall s a r. Newtype s { rule :: a | r } => Lens' s a
_rule = _Newtype <<< prop (SProxy :: SProxy "rule")

_rules :: forall s a r. Newtype s { rules :: a | r } => Lens' s a
_rules = _Newtype <<< prop (SProxy :: SProxy "rules")

_runAsNonRoot :: forall s a r. Newtype s { runAsNonRoot :: a | r } => Lens' s a
_runAsNonRoot = _Newtype <<< prop (SProxy :: SProxy "runAsNonRoot")

_runAsUser :: forall s a r. Newtype s { runAsUser :: a | r } => Lens' s a
_runAsUser = _Newtype <<< prop (SProxy :: SProxy "runAsUser")

_running :: forall s a r. Newtype s { running :: a | r } => Lens' s a
_running = _Newtype <<< prop (SProxy :: SProxy "running")

_scaleIO :: forall s a r. Newtype s { scaleIO :: a | r } => Lens' s a
_scaleIO = _Newtype <<< prop (SProxy :: SProxy "scaleIO")

_scaleTargetRef :: forall s a r. Newtype s { scaleTargetRef :: a | r } => Lens' s a
_scaleTargetRef = _Newtype <<< prop (SProxy :: SProxy "scaleTargetRef")

_schedule :: forall s a r. Newtype s { schedule :: a | r } => Lens' s a
_schedule = _Newtype <<< prop (SProxy :: SProxy "schedule")

_schedulerName :: forall s a r. Newtype s { schedulerName :: a | r } => Lens' s a
_schedulerName = _Newtype <<< prop (SProxy :: SProxy "schedulerName")

_scheme :: forall s a r. Newtype s { scheme :: a | r } => Lens' s a
_scheme = _Newtype <<< prop (SProxy :: SProxy "scheme")

_scope :: forall s a r. Newtype s { scope :: a | r } => Lens' s a
_scope = _Newtype <<< prop (SProxy :: SProxy "scope")

_scopes :: forall s a r. Newtype s { scopes :: a | r } => Lens' s a
_scopes = _Newtype <<< prop (SProxy :: SProxy "scopes")

_seLinux :: forall s a r. Newtype s { seLinux :: a | r } => Lens' s a
_seLinux = _Newtype <<< prop (SProxy :: SProxy "seLinux")

_seLinuxOptions :: forall s a r. Newtype s { seLinuxOptions :: a | r } => Lens' s a
_seLinuxOptions = _Newtype <<< prop (SProxy :: SProxy "seLinuxOptions")

_searches :: forall s a r. Newtype s { searches :: a | r } => Lens' s a
_searches = _Newtype <<< prop (SProxy :: SProxy "searches")

_secret :: forall s a r. Newtype s { secret :: a | r } => Lens' s a
_secret = _Newtype <<< prop (SProxy :: SProxy "secret")

_secretFile :: forall s a r. Newtype s { secretFile :: a | r } => Lens' s a
_secretFile = _Newtype <<< prop (SProxy :: SProxy "secretFile")

_secretKeyRef :: forall s a r. Newtype s { secretKeyRef :: a | r } => Lens' s a
_secretKeyRef = _Newtype <<< prop (SProxy :: SProxy "secretKeyRef")

_secretName :: forall s a r. Newtype s { secretName :: a | r } => Lens' s a
_secretName = _Newtype <<< prop (SProxy :: SProxy "secretName")

_secretNamespace :: forall s a r. Newtype s { secretNamespace :: a | r } => Lens' s a
_secretNamespace = _Newtype <<< prop (SProxy :: SProxy "secretNamespace")

_secretRef :: forall s a r. Newtype s { secretRef :: a | r } => Lens' s a
_secretRef = _Newtype <<< prop (SProxy :: SProxy "secretRef")

_secrets :: forall s a r. Newtype s { secrets :: a | r } => Lens' s a
_secrets = _Newtype <<< prop (SProxy :: SProxy "secrets")

_securityContext :: forall s a r. Newtype s { securityContext :: a | r } => Lens' s a
_securityContext = _Newtype <<< prop (SProxy :: SProxy "securityContext")

_selector :: forall s a r. Newtype s { selector :: a | r } => Lens' s a
_selector = _Newtype <<< prop (SProxy :: SProxy "selector")

_selfLink :: forall s a r. Newtype s { selfLink :: a | r } => Lens' s a
_selfLink = _Newtype <<< prop (SProxy :: SProxy "selfLink")

_series :: forall s a r. Newtype s { series :: a | r } => Lens' s a
_series = _Newtype <<< prop (SProxy :: SProxy "series")

_server :: forall s a r. Newtype s { server :: a | r } => Lens' s a
_server = _Newtype <<< prop (SProxy :: SProxy "server")

_serverAddress :: forall s a r. Newtype s { serverAddress :: a | r } => Lens' s a
_serverAddress = _Newtype <<< prop (SProxy :: SProxy "serverAddress")

_serverAddressByClientCIDRs :: forall s a r. Newtype s { serverAddressByClientCIDRs :: a | r } => Lens' s a
_serverAddressByClientCIDRs = _Newtype <<< prop (SProxy :: SProxy "serverAddressByClientCIDRs")

_service :: forall s a r. Newtype s { service :: a | r } => Lens' s a
_service = _Newtype <<< prop (SProxy :: SProxy "service")

_serviceAccount :: forall s a r. Newtype s { serviceAccount :: a | r } => Lens' s a
_serviceAccount = _Newtype <<< prop (SProxy :: SProxy "serviceAccount")

_serviceAccountName :: forall s a r. Newtype s { serviceAccountName :: a | r } => Lens' s a
_serviceAccountName = _Newtype <<< prop (SProxy :: SProxy "serviceAccountName")

_serviceName :: forall s a r. Newtype s { serviceName :: a | r } => Lens' s a
_serviceName = _Newtype <<< prop (SProxy :: SProxy "serviceName")

_servicePort :: forall s a r. Newtype s { servicePort :: a | r } => Lens' s a
_servicePort = _Newtype <<< prop (SProxy :: SProxy "servicePort")

_sessionAffinity :: forall s a r. Newtype s { sessionAffinity :: a | r } => Lens' s a
_sessionAffinity = _Newtype <<< prop (SProxy :: SProxy "sessionAffinity")

_sessionAffinityConfig :: forall s a r. Newtype s { sessionAffinityConfig :: a | r } => Lens' s a
_sessionAffinityConfig = _Newtype <<< prop (SProxy :: SProxy "sessionAffinityConfig")

_shareName :: forall s a r. Newtype s { shareName :: a | r } => Lens' s a
_shareName = _Newtype <<< prop (SProxy :: SProxy "shareName")

_shortNames :: forall s a r. Newtype s { shortNames :: a | r } => Lens' s a
_shortNames = _Newtype <<< prop (SProxy :: SProxy "shortNames")

_signal :: forall s a r. Newtype s { signal :: a | r } => Lens' s a
_signal = _Newtype <<< prop (SProxy :: SProxy "signal")

_singular :: forall s a r. Newtype s { singular :: a | r } => Lens' s a
_singular = _Newtype <<< prop (SProxy :: SProxy "singular")

_singularName :: forall s a r. Newtype s { singularName :: a | r } => Lens' s a
_singularName = _Newtype <<< prop (SProxy :: SProxy "singularName")

_sizeBytes :: forall s a r. Newtype s { sizeBytes :: a | r } => Lens' s a
_sizeBytes = _Newtype <<< prop (SProxy :: SProxy "sizeBytes")

_sizeLimit :: forall s a r. Newtype s { sizeLimit :: a | r } => Lens' s a
_sizeLimit = _Newtype <<< prop (SProxy :: SProxy "sizeLimit")

_source :: forall s a r. Newtype s { source :: a | r } => Lens' s a
_source = _Newtype <<< prop (SProxy :: SProxy "source")

_sources :: forall s a r. Newtype s { sources :: a | r } => Lens' s a
_sources = _Newtype <<< prop (SProxy :: SProxy "sources")

_spec :: forall s a r. Newtype s { spec :: a | r } => Lens' s a
_spec = _Newtype <<< prop (SProxy :: SProxy "spec")

_sslEnabled :: forall s a r. Newtype s { sslEnabled :: a | r } => Lens' s a
_sslEnabled = _Newtype <<< prop (SProxy :: SProxy "sslEnabled")

_startTime :: forall s a r. Newtype s { startTime :: a | r } => Lens' s a
_startTime = _Newtype <<< prop (SProxy :: SProxy "startTime")

_startedAt :: forall s a r. Newtype s { startedAt :: a | r } => Lens' s a
_startedAt = _Newtype <<< prop (SProxy :: SProxy "startedAt")

_startingDeadlineSeconds :: forall s a r. Newtype s { startingDeadlineSeconds :: a | r } => Lens' s a
_startingDeadlineSeconds = _Newtype <<< prop (SProxy :: SProxy "startingDeadlineSeconds")

_state :: forall s a r. Newtype s { state :: a | r } => Lens' s a
_state = _Newtype <<< prop (SProxy :: SProxy "state")

_status :: forall s a r. Newtype s { status :: a | r } => Lens' s a
_status = _Newtype <<< prop (SProxy :: SProxy "status")

_stdin :: forall s a r. Newtype s { stdin :: a | r } => Lens' s a
_stdin = _Newtype <<< prop (SProxy :: SProxy "stdin")

_stdinOnce :: forall s a r. Newtype s { stdinOnce :: a | r } => Lens' s a
_stdinOnce = _Newtype <<< prop (SProxy :: SProxy "stdinOnce")

_storageClassName :: forall s a r. Newtype s { storageClassName :: a | r } => Lens' s a
_storageClassName = _Newtype <<< prop (SProxy :: SProxy "storageClassName")

_storageMode :: forall s a r. Newtype s { storageMode :: a | r } => Lens' s a
_storageMode = _Newtype <<< prop (SProxy :: SProxy "storageMode")

_storagePolicyID :: forall s a r. Newtype s { storagePolicyID :: a | r } => Lens' s a
_storagePolicyID = _Newtype <<< prop (SProxy :: SProxy "storagePolicyID")

_storagePolicyName :: forall s a r. Newtype s { storagePolicyName :: a | r } => Lens' s a
_storagePolicyName = _Newtype <<< prop (SProxy :: SProxy "storagePolicyName")

_storagePool :: forall s a r. Newtype s { storagePool :: a | r } => Lens' s a
_storagePool = _Newtype <<< prop (SProxy :: SProxy "storagePool")

_storageos :: forall s a r. Newtype s { storageos :: a | r } => Lens' s a
_storageos = _Newtype <<< prop (SProxy :: SProxy "storageos")

_strategy :: forall s a r. Newtype s { strategy :: a | r } => Lens' s a
_strategy = _Newtype <<< prop (SProxy :: SProxy "strategy")

_stringData :: forall s a r. Newtype s { stringData :: a | r } => Lens' s a
_stringData = _Newtype <<< prop (SProxy :: SProxy "stringData")

_subPath :: forall s a r. Newtype s { subPath :: a | r } => Lens' s a
_subPath = _Newtype <<< prop (SProxy :: SProxy "subPath")

_subdomain :: forall s a r. Newtype s { subdomain :: a | r } => Lens' s a
_subdomain = _Newtype <<< prop (SProxy :: SProxy "subdomain")

_subjects :: forall s a r. Newtype s { subjects :: a | r } => Lens' s a
_subjects = _Newtype <<< prop (SProxy :: SProxy "subjects")

_subresource :: forall s a r. Newtype s { subresource :: a | r } => Lens' s a
_subresource = _Newtype <<< prop (SProxy :: SProxy "subresource")

_subsets :: forall s a r. Newtype s { subsets :: a | r } => Lens' s a
_subsets = _Newtype <<< prop (SProxy :: SProxy "subsets")

_succeeded :: forall s a r. Newtype s { succeeded :: a | r } => Lens' s a
_succeeded = _Newtype <<< prop (SProxy :: SProxy "succeeded")

_successThreshold :: forall s a r. Newtype s { successThreshold :: a | r } => Lens' s a
_successThreshold = _Newtype <<< prop (SProxy :: SProxy "successThreshold")

_successfulJobsHistoryLimit :: forall s a r. Newtype s { successfulJobsHistoryLimit :: a | r } => Lens' s a
_successfulJobsHistoryLimit = _Newtype <<< prop (SProxy :: SProxy "successfulJobsHistoryLimit")

_supplementalGroups :: forall s a r. Newtype s { supplementalGroups :: a | r } => Lens' s a
_supplementalGroups = _Newtype <<< prop (SProxy :: SProxy "supplementalGroups")

_suspend :: forall s a r. Newtype s { suspend :: a | r } => Lens' s a
_suspend = _Newtype <<< prop (SProxy :: SProxy "suspend")

_system :: forall s a r. Newtype s { system :: a | r } => Lens' s a
_system = _Newtype <<< prop (SProxy :: SProxy "system")

_systemUUID :: forall s a r. Newtype s { systemUUID :: a | r } => Lens' s a
_systemUUID = _Newtype <<< prop (SProxy :: SProxy "systemUUID")

_taints :: forall s a r. Newtype s { taints :: a | r } => Lens' s a
_taints = _Newtype <<< prop (SProxy :: SProxy "taints")

_target :: forall s a r. Newtype s { target :: a | r } => Lens' s a
_target = _Newtype <<< prop (SProxy :: SProxy "target")

_targetAverageUtilization :: forall s a r. Newtype s { targetAverageUtilization :: a | r } => Lens' s a
_targetAverageUtilization = _Newtype <<< prop (SProxy :: SProxy "targetAverageUtilization")

_targetAverageValue :: forall s a r. Newtype s { targetAverageValue :: a | r } => Lens' s a
_targetAverageValue = _Newtype <<< prop (SProxy :: SProxy "targetAverageValue")

_targetCPUUtilizationPercentage :: forall s a r. Newtype s { targetCPUUtilizationPercentage :: a | r } => Lens' s a
_targetCPUUtilizationPercentage = _Newtype <<< prop (SProxy :: SProxy "targetCPUUtilizationPercentage")

_targetPort :: forall s a r. Newtype s { targetPort :: a | r } => Lens' s a
_targetPort = _Newtype <<< prop (SProxy :: SProxy "targetPort")

_targetPortal :: forall s a r. Newtype s { targetPortal :: a | r } => Lens' s a
_targetPortal = _Newtype <<< prop (SProxy :: SProxy "targetPortal")

_targetRef :: forall s a r. Newtype s { targetRef :: a | r } => Lens' s a
_targetRef = _Newtype <<< prop (SProxy :: SProxy "targetRef")

_targetSelector :: forall s a r. Newtype s { targetSelector :: a | r } => Lens' s a
_targetSelector = _Newtype <<< prop (SProxy :: SProxy "targetSelector")

_targetValue :: forall s a r. Newtype s { targetValue :: a | r } => Lens' s a
_targetValue = _Newtype <<< prop (SProxy :: SProxy "targetValue")

_targetWWNs :: forall s a r. Newtype s { targetWWNs :: a | r } => Lens' s a
_targetWWNs = _Newtype <<< prop (SProxy :: SProxy "targetWWNs")

_tcpSocket :: forall s a r. Newtype s { tcpSocket :: a | r } => Lens' s a
_tcpSocket = _Newtype <<< prop (SProxy :: SProxy "tcpSocket")

_template :: forall s a r. Newtype s { template :: a | r } => Lens' s a
_template = _Newtype <<< prop (SProxy :: SProxy "template")

_templateGeneration :: forall s a r. Newtype s { templateGeneration :: a | r } => Lens' s a
_templateGeneration = _Newtype <<< prop (SProxy :: SProxy "templateGeneration")

_terminated :: forall s a r. Newtype s { terminated :: a | r } => Lens' s a
_terminated = _Newtype <<< prop (SProxy :: SProxy "terminated")

_terminationGracePeriodSeconds :: forall s a r. Newtype s { terminationGracePeriodSeconds :: a | r } => Lens' s a
_terminationGracePeriodSeconds = _Newtype <<< prop (SProxy :: SProxy "terminationGracePeriodSeconds")

_terminationMessagePath :: forall s a r. Newtype s { terminationMessagePath :: a | r } => Lens' s a
_terminationMessagePath = _Newtype <<< prop (SProxy :: SProxy "terminationMessagePath")

_terminationMessagePolicy :: forall s a r. Newtype s { terminationMessagePolicy :: a | r } => Lens' s a
_terminationMessagePolicy = _Newtype <<< prop (SProxy :: SProxy "terminationMessagePolicy")

_time :: forall s a r. Newtype s { time :: a | r } => Lens' s a
_time = _Newtype <<< prop (SProxy :: SProxy "time")

_timeAdded :: forall s a r. Newtype s { timeAdded :: a | r } => Lens' s a
_timeAdded = _Newtype <<< prop (SProxy :: SProxy "timeAdded")

_timeoutSeconds :: forall s a r. Newtype s { timeoutSeconds :: a | r } => Lens' s a
_timeoutSeconds = _Newtype <<< prop (SProxy :: SProxy "timeoutSeconds")

_title :: forall s a r. Newtype s { title :: a | r } => Lens' s a
_title = _Newtype <<< prop (SProxy :: SProxy "title")

_tls :: forall s a r. Newtype s { tls :: a | r } => Lens' s a
_tls = _Newtype <<< prop (SProxy :: SProxy "tls")

_to :: forall s a r. Newtype s { to :: a | r } => Lens' s a
_to = _Newtype <<< prop (SProxy :: SProxy "to")

_token :: forall s a r. Newtype s { token :: a | r } => Lens' s a
_token = _Newtype <<< prop (SProxy :: SProxy "token")

_tolerationSeconds :: forall s a r. Newtype s { tolerationSeconds :: a | r } => Lens' s a
_tolerationSeconds = _Newtype <<< prop (SProxy :: SProxy "tolerationSeconds")

_tolerations :: forall s a r. Newtype s { tolerations :: a | r } => Lens' s a
_tolerations = _Newtype <<< prop (SProxy :: SProxy "tolerations")

_topologyKey :: forall s a r. Newtype s { topologyKey :: a | r } => Lens' s a
_topologyKey = _Newtype <<< prop (SProxy :: SProxy "topologyKey")

_tty :: forall s a r. Newtype s { tty :: a | r } => Lens' s a
_tty = _Newtype <<< prop (SProxy :: SProxy "tty")

_uid :: forall s a r. Newtype s { uid :: a | r } => Lens' s a
_uid = _Newtype <<< prop (SProxy :: SProxy "uid")

_unavailableReplicas :: forall s a r. Newtype s { unavailableReplicas :: a | r } => Lens' s a
_unavailableReplicas = _Newtype <<< prop (SProxy :: SProxy "unavailableReplicas")

_uniqueItems :: forall s a r. Newtype s { uniqueItems :: a | r } => Lens' s a
_uniqueItems = _Newtype <<< prop (SProxy :: SProxy "uniqueItems")

_unschedulable :: forall s a r. Newtype s { unschedulable :: a | r } => Lens' s a
_unschedulable = _Newtype <<< prop (SProxy :: SProxy "unschedulable")

_updateRevision :: forall s a r. Newtype s { updateRevision :: a | r } => Lens' s a
_updateRevision = _Newtype <<< prop (SProxy :: SProxy "updateRevision")

_updateStrategy :: forall s a r. Newtype s { updateStrategy :: a | r } => Lens' s a
_updateStrategy = _Newtype <<< prop (SProxy :: SProxy "updateStrategy")

_updatedAnnotations :: forall s a r. Newtype s { updatedAnnotations :: a | r } => Lens' s a
_updatedAnnotations = _Newtype <<< prop (SProxy :: SProxy "updatedAnnotations")

_updatedNumberScheduled :: forall s a r. Newtype s { updatedNumberScheduled :: a | r } => Lens' s a
_updatedNumberScheduled = _Newtype <<< prop (SProxy :: SProxy "updatedNumberScheduled")

_updatedReplicas :: forall s a r. Newtype s { updatedReplicas :: a | r } => Lens' s a
_updatedReplicas = _Newtype <<< prop (SProxy :: SProxy "updatedReplicas")

_url :: forall s a r. Newtype s { url :: a | r } => Lens' s a
_url = _Newtype <<< prop (SProxy :: SProxy "url")

_usages :: forall s a r. Newtype s { usages :: a | r } => Lens' s a
_usages = _Newtype <<< prop (SProxy :: SProxy "usages")

_used :: forall s a r. Newtype s { used :: a | r } => Lens' s a
_used = _Newtype <<< prop (SProxy :: SProxy "used")

_user :: forall s a r. Newtype s { user :: a | r } => Lens' s a
_user = _Newtype <<< prop (SProxy :: SProxy "user")

_username :: forall s a r. Newtype s { username :: a | r } => Lens' s a
_username = _Newtype <<< prop (SProxy :: SProxy "username")

_validation :: forall s a r. Newtype s { validation :: a | r } => Lens' s a
_validation = _Newtype <<< prop (SProxy :: SProxy "validation")

_value :: forall s a r. Newtype s { value :: a | r } => Lens' s a
_value = _Newtype <<< prop (SProxy :: SProxy "value")

_valueFrom :: forall s a r. Newtype s { valueFrom :: a | r } => Lens' s a
_valueFrom = _Newtype <<< prop (SProxy :: SProxy "valueFrom")

_values :: forall s a r. Newtype s { values :: a | r } => Lens' s a
_values = _Newtype <<< prop (SProxy :: SProxy "values")

_verb :: forall s a r. Newtype s { verb :: a | r } => Lens' s a
_verb = _Newtype <<< prop (SProxy :: SProxy "verb")

_verbs :: forall s a r. Newtype s { verbs :: a | r } => Lens' s a
_verbs = _Newtype <<< prop (SProxy :: SProxy "verbs")

_version :: forall s a r. Newtype s { version :: a | r } => Lens' s a
_version = _Newtype <<< prop (SProxy :: SProxy "version")

_versionPriority :: forall s a r. Newtype s { versionPriority :: a | r } => Lens' s a
_versionPriority = _Newtype <<< prop (SProxy :: SProxy "versionPriority")

_versions :: forall s a r. Newtype s { versions :: a | r } => Lens' s a
_versions = _Newtype <<< prop (SProxy :: SProxy "versions")

_volume :: forall s a r. Newtype s { volume :: a | r } => Lens' s a
_volume = _Newtype <<< prop (SProxy :: SProxy "volume")

_volumeBindingMode :: forall s a r. Newtype s { volumeBindingMode :: a | r } => Lens' s a
_volumeBindingMode = _Newtype <<< prop (SProxy :: SProxy "volumeBindingMode")

_volumeClaimTemplates :: forall s a r. Newtype s { volumeClaimTemplates :: a | r } => Lens' s a
_volumeClaimTemplates = _Newtype <<< prop (SProxy :: SProxy "volumeClaimTemplates")

_volumeDevices :: forall s a r. Newtype s { volumeDevices :: a | r } => Lens' s a
_volumeDevices = _Newtype <<< prop (SProxy :: SProxy "volumeDevices")

_volumeHandle :: forall s a r. Newtype s { volumeHandle :: a | r } => Lens' s a
_volumeHandle = _Newtype <<< prop (SProxy :: SProxy "volumeHandle")

_volumeID :: forall s a r. Newtype s { volumeID :: a | r } => Lens' s a
_volumeID = _Newtype <<< prop (SProxy :: SProxy "volumeID")

_volumeMode :: forall s a r. Newtype s { volumeMode :: a | r } => Lens' s a
_volumeMode = _Newtype <<< prop (SProxy :: SProxy "volumeMode")

_volumeMounts :: forall s a r. Newtype s { volumeMounts :: a | r } => Lens' s a
_volumeMounts = _Newtype <<< prop (SProxy :: SProxy "volumeMounts")

_volumeName :: forall s a r. Newtype s { volumeName :: a | r } => Lens' s a
_volumeName = _Newtype <<< prop (SProxy :: SProxy "volumeName")

_volumeNamespace :: forall s a r. Newtype s { volumeNamespace :: a | r } => Lens' s a
_volumeNamespace = _Newtype <<< prop (SProxy :: SProxy "volumeNamespace")

_volumePath :: forall s a r. Newtype s { volumePath :: a | r } => Lens' s a
_volumePath = _Newtype <<< prop (SProxy :: SProxy "volumePath")

_volumes :: forall s a r. Newtype s { volumes :: a | r } => Lens' s a
_volumes = _Newtype <<< prop (SProxy :: SProxy "volumes")

_volumesAttached :: forall s a r. Newtype s { volumesAttached :: a | r } => Lens' s a
_volumesAttached = _Newtype <<< prop (SProxy :: SProxy "volumesAttached")

_volumesInUse :: forall s a r. Newtype s { volumesInUse :: a | r } => Lens' s a
_volumesInUse = _Newtype <<< prop (SProxy :: SProxy "volumesInUse")

_vsphereVolume :: forall s a r. Newtype s { vsphereVolume :: a | r } => Lens' s a
_vsphereVolume = _Newtype <<< prop (SProxy :: SProxy "vsphereVolume")

_waiting :: forall s a r. Newtype s { waiting :: a | r } => Lens' s a
_waiting = _Newtype <<< prop (SProxy :: SProxy "waiting")

_webhooks :: forall s a r. Newtype s { webhooks :: a | r } => Lens' s a
_webhooks = _Newtype <<< prop (SProxy :: SProxy "webhooks")

_weight :: forall s a r. Newtype s { weight :: a | r } => Lens' s a
_weight = _Newtype <<< prop (SProxy :: SProxy "weight")

_workingDir :: forall s a r. Newtype s { workingDir :: a | r } => Lens' s a
_workingDir = _Newtype <<< prop (SProxy :: SProxy "workingDir")

_wwids :: forall s a r. Newtype s { wwids :: a | r } => Lens' s a
_wwids = _Newtype <<< prop (SProxy :: SProxy "wwids")