module Kubernetes.Api.Lens where

import Prelude
import Data.Lens (Lens')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.Symbol (SProxy(SProxy))
import Kubernetes.Default (class Default)

_Allows :: forall s a r r'. Newtype s { _Allows :: r | r' } => Newtype r a => Lens' s a
_Allows = _Newtype <<< prop (SProxy :: SProxy "_Allows") <<< _Newtype

_JSONSchemas :: forall s a r r'. Newtype s { _JSONSchemas :: r | r' } => Newtype r a => Lens' s a
_JSONSchemas = _Newtype <<< prop (SProxy :: SProxy "_JSONSchemas") <<< _Newtype

_Port :: forall s a r r'. Newtype s { _Port :: r | r' } => Newtype r a => Lens' s a
_Port = _Newtype <<< prop (SProxy :: SProxy "_Port") <<< _Newtype

_Property :: forall s a r r'. Newtype s { _Property :: r | r' } => Newtype r a => Lens' s a
_Property = _Newtype <<< prop (SProxy :: SProxy "_Property") <<< _Newtype

_Raw :: forall s a r r'. Newtype s { _Raw :: r | r' } => Newtype r a => Lens' s a
_Raw = _Newtype <<< prop (SProxy :: SProxy "_Raw") <<< _Newtype

_Schema :: forall s a r r'. Newtype s { _Schema :: r | r' } => Newtype r a => Lens' s a
_Schema = _Newtype <<< prop (SProxy :: SProxy "_Schema") <<< _Newtype

_data :: forall s a r r'. Newtype s { _data :: r | r' } => Newtype r a => Lens' s a
_data = _Newtype <<< prop (SProxy :: SProxy "_data") <<< _Newtype

_default :: forall s a r r'. Newtype s { _default :: r | r' } => Newtype r a => Lens' s a
_default = _Newtype <<< prop (SProxy :: SProxy "_default") <<< _Newtype

_ref :: forall s a r r'. Newtype s { _ref :: r | r' } => Newtype r a => Lens' s a
_ref = _Newtype <<< prop (SProxy :: SProxy "_ref") <<< _Newtype

_schema :: forall s a r r'. Newtype s { _schema :: r | r' } => Newtype r a => Lens' s a
_schema = _Newtype <<< prop (SProxy :: SProxy "_schema") <<< _Newtype

_type :: forall s a r r'. Newtype s { _type :: r | r' } => Newtype r a => Lens' s a
_type = _Newtype <<< prop (SProxy :: SProxy "_type") <<< _Newtype

_acceptedNames :: forall s a r r'. Newtype s { acceptedNames :: r | r' } => Newtype r a => Lens' s a
_acceptedNames = _Newtype <<< prop (SProxy :: SProxy "acceptedNames") <<< _Newtype

_accessModes :: forall s a r r'. Newtype s { accessModes :: r | r' } => Newtype r a => Lens' s a
_accessModes = _Newtype <<< prop (SProxy :: SProxy "accessModes") <<< _Newtype

_action :: forall s a r r'. Newtype s { action :: r | r' } => Newtype r a => Lens' s a
_action = _Newtype <<< prop (SProxy :: SProxy "action") <<< _Newtype

_active :: forall s a r r'. Newtype s { active :: r | r' } => Newtype r a => Lens' s a
_active = _Newtype <<< prop (SProxy :: SProxy "active") <<< _Newtype

_activeDeadlineSeconds :: forall s a r r'. Newtype s { activeDeadlineSeconds :: r | r' } => Newtype r a => Lens' s a
_activeDeadlineSeconds = _Newtype <<< prop (SProxy :: SProxy "activeDeadlineSeconds") <<< _Newtype

_add :: forall s a r r'. Newtype s { add :: r | r' } => Newtype r a => Lens' s a
_add = _Newtype <<< prop (SProxy :: SProxy "add") <<< _Newtype

_additionalItems :: forall s a r r'. Newtype s { additionalItems :: r | r' } => Newtype r a => Lens' s a
_additionalItems = _Newtype <<< prop (SProxy :: SProxy "additionalItems") <<< _Newtype

_additionalProperties :: forall s a r r'. Newtype s { additionalProperties :: r | r' } => Newtype r a => Lens' s a
_additionalProperties = _Newtype <<< prop (SProxy :: SProxy "additionalProperties") <<< _Newtype

_address :: forall s a r r'. Newtype s { address :: r | r' } => Newtype r a => Lens' s a
_address = _Newtype <<< prop (SProxy :: SProxy "address") <<< _Newtype

_addresses :: forall s a r r'. Newtype s { addresses :: r | r' } => Newtype r a => Lens' s a
_addresses = _Newtype <<< prop (SProxy :: SProxy "addresses") <<< _Newtype

_affinity :: forall s a r r'. Newtype s { affinity :: r | r' } => Newtype r a => Lens' s a
_affinity = _Newtype <<< prop (SProxy :: SProxy "affinity") <<< _Newtype

_aggregationRule :: forall s a r r'. Newtype s { aggregationRule :: r | r' } => Newtype r a => Lens' s a
_aggregationRule = _Newtype <<< prop (SProxy :: SProxy "aggregationRule") <<< _Newtype

_allOf :: forall s a r r'. Newtype s { allOf :: r | r' } => Newtype r a => Lens' s a
_allOf = _Newtype <<< prop (SProxy :: SProxy "allOf") <<< _Newtype

_allocatable :: forall s a r r'. Newtype s { allocatable :: r | r' } => Newtype r a => Lens' s a
_allocatable = _Newtype <<< prop (SProxy :: SProxy "allocatable") <<< _Newtype

_allowPrivilegeEscalation :: forall s a r r'. Newtype s { allowPrivilegeEscalation :: r | r' } => Newtype r a => Lens' s a
_allowPrivilegeEscalation = _Newtype <<< prop (SProxy :: SProxy "allowPrivilegeEscalation") <<< _Newtype

_allowVolumeExpansion :: forall s a r r'. Newtype s { allowVolumeExpansion :: r | r' } => Newtype r a => Lens' s a
_allowVolumeExpansion = _Newtype <<< prop (SProxy :: SProxy "allowVolumeExpansion") <<< _Newtype

_allowed :: forall s a r r'. Newtype s { allowed :: r | r' } => Newtype r a => Lens' s a
_allowed = _Newtype <<< prop (SProxy :: SProxy "allowed") <<< _Newtype

_allowedCapabilities :: forall s a r r'. Newtype s { allowedCapabilities :: r | r' } => Newtype r a => Lens' s a
_allowedCapabilities = _Newtype <<< prop (SProxy :: SProxy "allowedCapabilities") <<< _Newtype

_allowedFlexVolumes :: forall s a r r'. Newtype s { allowedFlexVolumes :: r | r' } => Newtype r a => Lens' s a
_allowedFlexVolumes = _Newtype <<< prop (SProxy :: SProxy "allowedFlexVolumes") <<< _Newtype

_allowedHostPaths :: forall s a r r'. Newtype s { allowedHostPaths :: r | r' } => Newtype r a => Lens' s a
_allowedHostPaths = _Newtype <<< prop (SProxy :: SProxy "allowedHostPaths") <<< _Newtype

_annotations :: forall s a r r'. Newtype s { annotations :: r | r' } => Newtype r a => Lens' s a
_annotations = _Newtype <<< prop (SProxy :: SProxy "annotations") <<< _Newtype

_anyOf :: forall s a r r'. Newtype s { anyOf :: r | r' } => Newtype r a => Lens' s a
_anyOf = _Newtype <<< prop (SProxy :: SProxy "anyOf") <<< _Newtype

_apiGroup :: forall s a r r'. Newtype s { apiGroup :: r | r' } => Newtype r a => Lens' s a
_apiGroup = _Newtype <<< prop (SProxy :: SProxy "apiGroup") <<< _Newtype

_apiGroups :: forall s a r r'. Newtype s { apiGroups :: r | r' } => Newtype r a => Lens' s a
_apiGroups = _Newtype <<< prop (SProxy :: SProxy "apiGroups") <<< _Newtype

_apiVersion :: forall s a r r'. Newtype s { apiVersion :: r | r' } => Newtype r a => Lens' s a
_apiVersion = _Newtype <<< prop (SProxy :: SProxy "apiVersion") <<< _Newtype

_apiVersions :: forall s a r r'. Newtype s { apiVersions :: r | r' } => Newtype r a => Lens' s a
_apiVersions = _Newtype <<< prop (SProxy :: SProxy "apiVersions") <<< _Newtype

_architecture :: forall s a r r'. Newtype s { architecture :: r | r' } => Newtype r a => Lens' s a
_architecture = _Newtype <<< prop (SProxy :: SProxy "architecture") <<< _Newtype

_args :: forall s a r r'. Newtype s { args :: r | r' } => Newtype r a => Lens' s a
_args = _Newtype <<< prop (SProxy :: SProxy "args") <<< _Newtype

_attachError :: forall s a r r'. Newtype s { attachError :: r | r' } => Newtype r a => Lens' s a
_attachError = _Newtype <<< prop (SProxy :: SProxy "attachError") <<< _Newtype

_attached :: forall s a r r'. Newtype s { attached :: r | r' } => Newtype r a => Lens' s a
_attached = _Newtype <<< prop (SProxy :: SProxy "attached") <<< _Newtype

_attacher :: forall s a r r'. Newtype s { attacher :: r | r' } => Newtype r a => Lens' s a
_attacher = _Newtype <<< prop (SProxy :: SProxy "attacher") <<< _Newtype

_attachmentMetadata :: forall s a r r'. Newtype s { attachmentMetadata :: r | r' } => Newtype r a => Lens' s a
_attachmentMetadata = _Newtype <<< prop (SProxy :: SProxy "attachmentMetadata") <<< _Newtype

_authenticated :: forall s a r r'. Newtype s { authenticated :: r | r' } => Newtype r a => Lens' s a
_authenticated = _Newtype <<< prop (SProxy :: SProxy "authenticated") <<< _Newtype

_automountServiceAccountToken :: forall s a r r'. Newtype s { automountServiceAccountToken :: r | r' } => Newtype r a => Lens' s a
_automountServiceAccountToken = _Newtype <<< prop (SProxy :: SProxy "automountServiceAccountToken") <<< _Newtype

_availableReplicas :: forall s a r r'. Newtype s { availableReplicas :: r | r' } => Newtype r a => Lens' s a
_availableReplicas = _Newtype <<< prop (SProxy :: SProxy "availableReplicas") <<< _Newtype

_awsElasticBlockStore :: forall s a r r'. Newtype s { awsElasticBlockStore :: r | r' } => Newtype r a => Lens' s a
_awsElasticBlockStore = _Newtype <<< prop (SProxy :: SProxy "awsElasticBlockStore") <<< _Newtype

_azureDisk :: forall s a r r'. Newtype s { azureDisk :: r | r' } => Newtype r a => Lens' s a
_azureDisk = _Newtype <<< prop (SProxy :: SProxy "azureDisk") <<< _Newtype

_azureFile :: forall s a r r'. Newtype s { azureFile :: r | r' } => Newtype r a => Lens' s a
_azureFile = _Newtype <<< prop (SProxy :: SProxy "azureFile") <<< _Newtype

_backend :: forall s a r r'. Newtype s { backend :: r | r' } => Newtype r a => Lens' s a
_backend = _Newtype <<< prop (SProxy :: SProxy "backend") <<< _Newtype

_backoffLimit :: forall s a r r'. Newtype s { backoffLimit :: r | r' } => Newtype r a => Lens' s a
_backoffLimit = _Newtype <<< prop (SProxy :: SProxy "backoffLimit") <<< _Newtype

_blockOwnerDeletion :: forall s a r r'. Newtype s { blockOwnerDeletion :: r | r' } => Newtype r a => Lens' s a
_blockOwnerDeletion = _Newtype <<< prop (SProxy :: SProxy "blockOwnerDeletion") <<< _Newtype

_bootID :: forall s a r r'. Newtype s { bootID :: r | r' } => Newtype r a => Lens' s a
_bootID = _Newtype <<< prop (SProxy :: SProxy "bootID") <<< _Newtype

_buildDate :: forall s a r r'. Newtype s { buildDate :: r | r' } => Newtype r a => Lens' s a
_buildDate = _Newtype <<< prop (SProxy :: SProxy "buildDate") <<< _Newtype

_caBundle :: forall s a r r'. Newtype s { caBundle :: r | r' } => Newtype r a => Lens' s a
_caBundle = _Newtype <<< prop (SProxy :: SProxy "caBundle") <<< _Newtype

_cachingMode :: forall s a r r'. Newtype s { cachingMode :: r | r' } => Newtype r a => Lens' s a
_cachingMode = _Newtype <<< prop (SProxy :: SProxy "cachingMode") <<< _Newtype

_capabilities :: forall s a r r'. Newtype s { capabilities :: r | r' } => Newtype r a => Lens' s a
_capabilities = _Newtype <<< prop (SProxy :: SProxy "capabilities") <<< _Newtype

_capacity :: forall s a r r'. Newtype s { capacity :: r | r' } => Newtype r a => Lens' s a
_capacity = _Newtype <<< prop (SProxy :: SProxy "capacity") <<< _Newtype

_categories :: forall s a r r'. Newtype s { categories :: r | r' } => Newtype r a => Lens' s a
_categories = _Newtype <<< prop (SProxy :: SProxy "categories") <<< _Newtype

_causes :: forall s a r r'. Newtype s { causes :: r | r' } => Newtype r a => Lens' s a
_causes = _Newtype <<< prop (SProxy :: SProxy "causes") <<< _Newtype

_cephfs :: forall s a r r'. Newtype s { cephfs :: r | r' } => Newtype r a => Lens' s a
_cephfs = _Newtype <<< prop (SProxy :: SProxy "cephfs") <<< _Newtype

_certificate :: forall s a r r'. Newtype s { certificate :: r | r' } => Newtype r a => Lens' s a
_certificate = _Newtype <<< prop (SProxy :: SProxy "certificate") <<< _Newtype

_chapAuthDiscovery :: forall s a r r'. Newtype s { chapAuthDiscovery :: r | r' } => Newtype r a => Lens' s a
_chapAuthDiscovery = _Newtype <<< prop (SProxy :: SProxy "chapAuthDiscovery") <<< _Newtype

_chapAuthSession :: forall s a r r'. Newtype s { chapAuthSession :: r | r' } => Newtype r a => Lens' s a
_chapAuthSession = _Newtype <<< prop (SProxy :: SProxy "chapAuthSession") <<< _Newtype

_cidr :: forall s a r r'. Newtype s { cidr :: r | r' } => Newtype r a => Lens' s a
_cidr = _Newtype <<< prop (SProxy :: SProxy "cidr") <<< _Newtype

_cinder :: forall s a r r'. Newtype s { cinder :: r | r' } => Newtype r a => Lens' s a
_cinder = _Newtype <<< prop (SProxy :: SProxy "cinder") <<< _Newtype

_claimName :: forall s a r r'. Newtype s { claimName :: r | r' } => Newtype r a => Lens' s a
_claimName = _Newtype <<< prop (SProxy :: SProxy "claimName") <<< _Newtype

_claimRef :: forall s a r r'. Newtype s { claimRef :: r | r' } => Newtype r a => Lens' s a
_claimRef = _Newtype <<< prop (SProxy :: SProxy "claimRef") <<< _Newtype

_clientCIDR :: forall s a r r'. Newtype s { clientCIDR :: r | r' } => Newtype r a => Lens' s a
_clientCIDR = _Newtype <<< prop (SProxy :: SProxy "clientCIDR") <<< _Newtype

_clientConfig :: forall s a r r'. Newtype s { clientConfig :: r | r' } => Newtype r a => Lens' s a
_clientConfig = _Newtype <<< prop (SProxy :: SProxy "clientConfig") <<< _Newtype

_clientIP :: forall s a r r'. Newtype s { clientIP :: r | r' } => Newtype r a => Lens' s a
_clientIP = _Newtype <<< prop (SProxy :: SProxy "clientIP") <<< _Newtype

_clusterIP :: forall s a r r'. Newtype s { clusterIP :: r | r' } => Newtype r a => Lens' s a
_clusterIP = _Newtype <<< prop (SProxy :: SProxy "clusterIP") <<< _Newtype

_clusterName :: forall s a r r'. Newtype s { clusterName :: r | r' } => Newtype r a => Lens' s a
_clusterName = _Newtype <<< prop (SProxy :: SProxy "clusterName") <<< _Newtype

_clusterRoleSelectors :: forall s a r r'. Newtype s { clusterRoleSelectors :: r | r' } => Newtype r a => Lens' s a
_clusterRoleSelectors = _Newtype <<< prop (SProxy :: SProxy "clusterRoleSelectors") <<< _Newtype

_code :: forall s a r r'. Newtype s { code :: r | r' } => Newtype r a => Lens' s a
_code = _Newtype <<< prop (SProxy :: SProxy "code") <<< _Newtype

_collisionCount :: forall s a r r'. Newtype s { collisionCount :: r | r' } => Newtype r a => Lens' s a
_collisionCount = _Newtype <<< prop (SProxy :: SProxy "collisionCount") <<< _Newtype

_command :: forall s a r r'. Newtype s { command :: r | r' } => Newtype r a => Lens' s a
_command = _Newtype <<< prop (SProxy :: SProxy "command") <<< _Newtype

_compiler :: forall s a r r'. Newtype s { compiler :: r | r' } => Newtype r a => Lens' s a
_compiler = _Newtype <<< prop (SProxy :: SProxy "compiler") <<< _Newtype

_completionTime :: forall s a r r'. Newtype s { completionTime :: r | r' } => Newtype r a => Lens' s a
_completionTime = _Newtype <<< prop (SProxy :: SProxy "completionTime") <<< _Newtype

_completions :: forall s a r r'. Newtype s { completions :: r | r' } => Newtype r a => Lens' s a
_completions = _Newtype <<< prop (SProxy :: SProxy "completions") <<< _Newtype

_component :: forall s a r r'. Newtype s { component :: r | r' } => Newtype r a => Lens' s a
_component = _Newtype <<< prop (SProxy :: SProxy "component") <<< _Newtype

_concurrencyPolicy :: forall s a r r'. Newtype s { concurrencyPolicy :: r | r' } => Newtype r a => Lens' s a
_concurrencyPolicy = _Newtype <<< prop (SProxy :: SProxy "concurrencyPolicy") <<< _Newtype

_conditions :: forall s a r r'. Newtype s { conditions :: r | r' } => Newtype r a => Lens' s a
_conditions = _Newtype <<< prop (SProxy :: SProxy "conditions") <<< _Newtype

_configMap :: forall s a r r'. Newtype s { configMap :: r | r' } => Newtype r a => Lens' s a
_configMap = _Newtype <<< prop (SProxy :: SProxy "configMap") <<< _Newtype

_configMapKeyRef :: forall s a r r'. Newtype s { configMapKeyRef :: r | r' } => Newtype r a => Lens' s a
_configMapKeyRef = _Newtype <<< prop (SProxy :: SProxy "configMapKeyRef") <<< _Newtype

_configMapRef :: forall s a r r'. Newtype s { configMapRef :: r | r' } => Newtype r a => Lens' s a
_configMapRef = _Newtype <<< prop (SProxy :: SProxy "configMapRef") <<< _Newtype

_configSource :: forall s a r r'. Newtype s { configSource :: r | r' } => Newtype r a => Lens' s a
_configSource = _Newtype <<< prop (SProxy :: SProxy "configSource") <<< _Newtype

_containerID :: forall s a r r'. Newtype s { containerID :: r | r' } => Newtype r a => Lens' s a
_containerID = _Newtype <<< prop (SProxy :: SProxy "containerID") <<< _Newtype

_containerName :: forall s a r r'. Newtype s { containerName :: r | r' } => Newtype r a => Lens' s a
_containerName = _Newtype <<< prop (SProxy :: SProxy "containerName") <<< _Newtype

_containerPort :: forall s a r r'. Newtype s { containerPort :: r | r' } => Newtype r a => Lens' s a
_containerPort = _Newtype <<< prop (SProxy :: SProxy "containerPort") <<< _Newtype

_containerRuntimeVersion :: forall s a r r'. Newtype s { containerRuntimeVersion :: r | r' } => Newtype r a => Lens' s a
_containerRuntimeVersion = _Newtype <<< prop (SProxy :: SProxy "containerRuntimeVersion") <<< _Newtype

_containerStatuses :: forall s a r r'. Newtype s { containerStatuses :: r | r' } => Newtype r a => Lens' s a
_containerStatuses = _Newtype <<< prop (SProxy :: SProxy "containerStatuses") <<< _Newtype

_containers :: forall s a r r'. Newtype s { containers :: r | r' } => Newtype r a => Lens' s a
_containers = _Newtype <<< prop (SProxy :: SProxy "containers") <<< _Newtype

_continue :: forall s a r r'. Newtype s { continue :: r | r' } => Newtype r a => Lens' s a
_continue = _Newtype <<< prop (SProxy :: SProxy "continue") <<< _Newtype

_controller :: forall s a r r'. Newtype s { controller :: r | r' } => Newtype r a => Lens' s a
_controller = _Newtype <<< prop (SProxy :: SProxy "controller") <<< _Newtype

_count :: forall s a r r'. Newtype s { count :: r | r' } => Newtype r a => Lens' s a
_count = _Newtype <<< prop (SProxy :: SProxy "count") <<< _Newtype

_creationTimestamp :: forall s a r r'. Newtype s { creationTimestamp :: r | r' } => Newtype r a => Lens' s a
_creationTimestamp = _Newtype <<< prop (SProxy :: SProxy "creationTimestamp") <<< _Newtype

_csi :: forall s a r r'. Newtype s { csi :: r | r' } => Newtype r a => Lens' s a
_csi = _Newtype <<< prop (SProxy :: SProxy "csi") <<< _Newtype

_currentAverageUtilization :: forall s a r r'. Newtype s { currentAverageUtilization :: r | r' } => Newtype r a => Lens' s a
_currentAverageUtilization = _Newtype <<< prop (SProxy :: SProxy "currentAverageUtilization") <<< _Newtype

_currentAverageValue :: forall s a r r'. Newtype s { currentAverageValue :: r | r' } => Newtype r a => Lens' s a
_currentAverageValue = _Newtype <<< prop (SProxy :: SProxy "currentAverageValue") <<< _Newtype

_currentCPUUtilizationPercentage :: forall s a r r'. Newtype s { currentCPUUtilizationPercentage :: r | r' } => Newtype r a => Lens' s a
_currentCPUUtilizationPercentage = _Newtype <<< prop (SProxy :: SProxy "currentCPUUtilizationPercentage") <<< _Newtype

_currentHealthy :: forall s a r r'. Newtype s { currentHealthy :: r | r' } => Newtype r a => Lens' s a
_currentHealthy = _Newtype <<< prop (SProxy :: SProxy "currentHealthy") <<< _Newtype

_currentMetrics :: forall s a r r'. Newtype s { currentMetrics :: r | r' } => Newtype r a => Lens' s a
_currentMetrics = _Newtype <<< prop (SProxy :: SProxy "currentMetrics") <<< _Newtype

_currentNumberScheduled :: forall s a r r'. Newtype s { currentNumberScheduled :: r | r' } => Newtype r a => Lens' s a
_currentNumberScheduled = _Newtype <<< prop (SProxy :: SProxy "currentNumberScheduled") <<< _Newtype

_currentReplicas :: forall s a r r'. Newtype s { currentReplicas :: r | r' } => Newtype r a => Lens' s a
_currentReplicas = _Newtype <<< prop (SProxy :: SProxy "currentReplicas") <<< _Newtype

_currentRevision :: forall s a r r'. Newtype s { currentRevision :: r | r' } => Newtype r a => Lens' s a
_currentRevision = _Newtype <<< prop (SProxy :: SProxy "currentRevision") <<< _Newtype

_currentValue :: forall s a r r'. Newtype s { currentValue :: r | r' } => Newtype r a => Lens' s a
_currentValue = _Newtype <<< prop (SProxy :: SProxy "currentValue") <<< _Newtype

_daemonEndpoints :: forall s a r r'. Newtype s { daemonEndpoints :: r | r' } => Newtype r a => Lens' s a
_daemonEndpoints = _Newtype <<< prop (SProxy :: SProxy "daemonEndpoints") <<< _Newtype

_datasetName :: forall s a r r'. Newtype s { datasetName :: r | r' } => Newtype r a => Lens' s a
_datasetName = _Newtype <<< prop (SProxy :: SProxy "datasetName") <<< _Newtype

_datasetUUID :: forall s a r r'. Newtype s { datasetUUID :: r | r' } => Newtype r a => Lens' s a
_datasetUUID = _Newtype <<< prop (SProxy :: SProxy "datasetUUID") <<< _Newtype

_defaultAddCapabilities :: forall s a r r'. Newtype s { defaultAddCapabilities :: r | r' } => Newtype r a => Lens' s a
_defaultAddCapabilities = _Newtype <<< prop (SProxy :: SProxy "defaultAddCapabilities") <<< _Newtype

_defaultAllowPrivilegeEscalation :: forall s a r r'. Newtype s { defaultAllowPrivilegeEscalation :: r | r' } => Newtype r a => Lens' s a
_defaultAllowPrivilegeEscalation = _Newtype <<< prop (SProxy :: SProxy "defaultAllowPrivilegeEscalation") <<< _Newtype

_defaultMode :: forall s a r r'. Newtype s { defaultMode :: r | r' } => Newtype r a => Lens' s a
_defaultMode = _Newtype <<< prop (SProxy :: SProxy "defaultMode") <<< _Newtype

_defaultRequest :: forall s a r r'. Newtype s { defaultRequest :: r | r' } => Newtype r a => Lens' s a
_defaultRequest = _Newtype <<< prop (SProxy :: SProxy "defaultRequest") <<< _Newtype

_definitions :: forall s a r r'. Newtype s { definitions :: r | r' } => Newtype r a => Lens' s a
_definitions = _Newtype <<< prop (SProxy :: SProxy "definitions") <<< _Newtype

_deleteOptions :: forall s a r r'. Newtype s { deleteOptions :: r | r' } => Newtype r a => Lens' s a
_deleteOptions = _Newtype <<< prop (SProxy :: SProxy "deleteOptions") <<< _Newtype

_deletionGracePeriodSeconds :: forall s a r r'. Newtype s { deletionGracePeriodSeconds :: r | r' } => Newtype r a => Lens' s a
_deletionGracePeriodSeconds = _Newtype <<< prop (SProxy :: SProxy "deletionGracePeriodSeconds") <<< _Newtype

_deletionTimestamp :: forall s a r r'. Newtype s { deletionTimestamp :: r | r' } => Newtype r a => Lens' s a
_deletionTimestamp = _Newtype <<< prop (SProxy :: SProxy "deletionTimestamp") <<< _Newtype

_denied :: forall s a r r'. Newtype s { denied :: r | r' } => Newtype r a => Lens' s a
_denied = _Newtype <<< prop (SProxy :: SProxy "denied") <<< _Newtype

_dependencies :: forall s a r r'. Newtype s { dependencies :: r | r' } => Newtype r a => Lens' s a
_dependencies = _Newtype <<< prop (SProxy :: SProxy "dependencies") <<< _Newtype

_deprecatedCount :: forall s a r r'. Newtype s { deprecatedCount :: r | r' } => Newtype r a => Lens' s a
_deprecatedCount = _Newtype <<< prop (SProxy :: SProxy "deprecatedCount") <<< _Newtype

_deprecatedFirstTimestamp :: forall s a r r'. Newtype s { deprecatedFirstTimestamp :: r | r' } => Newtype r a => Lens' s a
_deprecatedFirstTimestamp = _Newtype <<< prop (SProxy :: SProxy "deprecatedFirstTimestamp") <<< _Newtype

_deprecatedLastTimestamp :: forall s a r r'. Newtype s { deprecatedLastTimestamp :: r | r' } => Newtype r a => Lens' s a
_deprecatedLastTimestamp = _Newtype <<< prop (SProxy :: SProxy "deprecatedLastTimestamp") <<< _Newtype

_deprecatedSource :: forall s a r r'. Newtype s { deprecatedSource :: r | r' } => Newtype r a => Lens' s a
_deprecatedSource = _Newtype <<< prop (SProxy :: SProxy "deprecatedSource") <<< _Newtype

_description :: forall s a r r'. Newtype s { description :: r | r' } => Newtype r a => Lens' s a
_description = _Newtype <<< prop (SProxy :: SProxy "description") <<< _Newtype

_desiredHealthy :: forall s a r r'. Newtype s { desiredHealthy :: r | r' } => Newtype r a => Lens' s a
_desiredHealthy = _Newtype <<< prop (SProxy :: SProxy "desiredHealthy") <<< _Newtype

_desiredNumberScheduled :: forall s a r r'. Newtype s { desiredNumberScheduled :: r | r' } => Newtype r a => Lens' s a
_desiredNumberScheduled = _Newtype <<< prop (SProxy :: SProxy "desiredNumberScheduled") <<< _Newtype

_desiredReplicas :: forall s a r r'. Newtype s { desiredReplicas :: r | r' } => Newtype r a => Lens' s a
_desiredReplicas = _Newtype <<< prop (SProxy :: SProxy "desiredReplicas") <<< _Newtype

_detachError :: forall s a r r'. Newtype s { detachError :: r | r' } => Newtype r a => Lens' s a
_detachError = _Newtype <<< prop (SProxy :: SProxy "detachError") <<< _Newtype

_details :: forall s a r r'. Newtype s { details :: r | r' } => Newtype r a => Lens' s a
_details = _Newtype <<< prop (SProxy :: SProxy "details") <<< _Newtype

_devicePath :: forall s a r r'. Newtype s { devicePath :: r | r' } => Newtype r a => Lens' s a
_devicePath = _Newtype <<< prop (SProxy :: SProxy "devicePath") <<< _Newtype

_directory :: forall s a r r'. Newtype s { directory :: r | r' } => Newtype r a => Lens' s a
_directory = _Newtype <<< prop (SProxy :: SProxy "directory") <<< _Newtype

_diskName :: forall s a r r'. Newtype s { diskName :: r | r' } => Newtype r a => Lens' s a
_diskName = _Newtype <<< prop (SProxy :: SProxy "diskName") <<< _Newtype

_diskURI :: forall s a r r'. Newtype s { diskURI :: r | r' } => Newtype r a => Lens' s a
_diskURI = _Newtype <<< prop (SProxy :: SProxy "diskURI") <<< _Newtype

_disruptedPods :: forall s a r r'. Newtype s { disruptedPods :: r | r' } => Newtype r a => Lens' s a
_disruptedPods = _Newtype <<< prop (SProxy :: SProxy "disruptedPods") <<< _Newtype

_disruptionsAllowed :: forall s a r r'. Newtype s { disruptionsAllowed :: r | r' } => Newtype r a => Lens' s a
_disruptionsAllowed = _Newtype <<< prop (SProxy :: SProxy "disruptionsAllowed") <<< _Newtype

_divisor :: forall s a r r'. Newtype s { divisor :: r | r' } => Newtype r a => Lens' s a
_divisor = _Newtype <<< prop (SProxy :: SProxy "divisor") <<< _Newtype

_dnsConfig :: forall s a r r'. Newtype s { dnsConfig :: r | r' } => Newtype r a => Lens' s a
_dnsConfig = _Newtype <<< prop (SProxy :: SProxy "dnsConfig") <<< _Newtype

_dnsPolicy :: forall s a r r'. Newtype s { dnsPolicy :: r | r' } => Newtype r a => Lens' s a
_dnsPolicy = _Newtype <<< prop (SProxy :: SProxy "dnsPolicy") <<< _Newtype

_downwardAPI :: forall s a r r'. Newtype s { downwardAPI :: r | r' } => Newtype r a => Lens' s a
_downwardAPI = _Newtype <<< prop (SProxy :: SProxy "downwardAPI") <<< _Newtype

_driver :: forall s a r r'. Newtype s { driver :: r | r' } => Newtype r a => Lens' s a
_driver = _Newtype <<< prop (SProxy :: SProxy "driver") <<< _Newtype

_drop :: forall s a r r'. Newtype s { drop :: r | r' } => Newtype r a => Lens' s a
_drop = _Newtype <<< prop (SProxy :: SProxy "drop") <<< _Newtype

_effect :: forall s a r r'. Newtype s { effect :: r | r' } => Newtype r a => Lens' s a
_effect = _Newtype <<< prop (SProxy :: SProxy "effect") <<< _Newtype

_egress :: forall s a r r'. Newtype s { egress :: r | r' } => Newtype r a => Lens' s a
_egress = _Newtype <<< prop (SProxy :: SProxy "egress") <<< _Newtype

_emptyDir :: forall s a r r'. Newtype s { emptyDir :: r | r' } => Newtype r a => Lens' s a
_emptyDir = _Newtype <<< prop (SProxy :: SProxy "emptyDir") <<< _Newtype

_endpoints :: forall s a r r'. Newtype s { endpoints :: r | r' } => Newtype r a => Lens' s a
_endpoints = _Newtype <<< prop (SProxy :: SProxy "endpoints") <<< _Newtype

_enum :: forall s a r r'. Newtype s { enum :: r | r' } => Newtype r a => Lens' s a
_enum = _Newtype <<< prop (SProxy :: SProxy "enum") <<< _Newtype

_env :: forall s a r r'. Newtype s { env :: r | r' } => Newtype r a => Lens' s a
_env = _Newtype <<< prop (SProxy :: SProxy "env") <<< _Newtype

_envFrom :: forall s a r r'. Newtype s { envFrom :: r | r' } => Newtype r a => Lens' s a
_envFrom = _Newtype <<< prop (SProxy :: SProxy "envFrom") <<< _Newtype

_error :: forall s a r r'. Newtype s { error :: r | r' } => Newtype r a => Lens' s a
_error = _Newtype <<< prop (SProxy :: SProxy "error") <<< _Newtype

_evaluationError :: forall s a r r'. Newtype s { evaluationError :: r | r' } => Newtype r a => Lens' s a
_evaluationError = _Newtype <<< prop (SProxy :: SProxy "evaluationError") <<< _Newtype

_eventTime :: forall s a r r'. Newtype s { eventTime :: r | r' } => Newtype r a => Lens' s a
_eventTime = _Newtype <<< prop (SProxy :: SProxy "eventTime") <<< _Newtype

_example :: forall s a r r'. Newtype s { example :: r | r' } => Newtype r a => Lens' s a
_example = _Newtype <<< prop (SProxy :: SProxy "example") <<< _Newtype

_except :: forall s a r r'. Newtype s { except :: r | r' } => Newtype r a => Lens' s a
_except = _Newtype <<< prop (SProxy :: SProxy "except") <<< _Newtype

_exclusiveMaximum :: forall s a r r'. Newtype s { exclusiveMaximum :: r | r' } => Newtype r a => Lens' s a
_exclusiveMaximum = _Newtype <<< prop (SProxy :: SProxy "exclusiveMaximum") <<< _Newtype

_exclusiveMinimum :: forall s a r r'. Newtype s { exclusiveMinimum :: r | r' } => Newtype r a => Lens' s a
_exclusiveMinimum = _Newtype <<< prop (SProxy :: SProxy "exclusiveMinimum") <<< _Newtype

_exec :: forall s a r r'. Newtype s { exec :: r | r' } => Newtype r a => Lens' s a
_exec = _Newtype <<< prop (SProxy :: SProxy "exec") <<< _Newtype

_exitCode :: forall s a r r'. Newtype s { exitCode :: r | r' } => Newtype r a => Lens' s a
_exitCode = _Newtype <<< prop (SProxy :: SProxy "exitCode") <<< _Newtype

_expectedPods :: forall s a r r'. Newtype s { expectedPods :: r | r' } => Newtype r a => Lens' s a
_expectedPods = _Newtype <<< prop (SProxy :: SProxy "expectedPods") <<< _Newtype

_externalDocs :: forall s a r r'. Newtype s { externalDocs :: r | r' } => Newtype r a => Lens' s a
_externalDocs = _Newtype <<< prop (SProxy :: SProxy "externalDocs") <<< _Newtype

_externalID :: forall s a r r'. Newtype s { externalID :: r | r' } => Newtype r a => Lens' s a
_externalID = _Newtype <<< prop (SProxy :: SProxy "externalID") <<< _Newtype

_externalIPs :: forall s a r r'. Newtype s { externalIPs :: r | r' } => Newtype r a => Lens' s a
_externalIPs = _Newtype <<< prop (SProxy :: SProxy "externalIPs") <<< _Newtype

_externalName :: forall s a r r'. Newtype s { externalName :: r | r' } => Newtype r a => Lens' s a
_externalName = _Newtype <<< prop (SProxy :: SProxy "externalName") <<< _Newtype

_externalTrafficPolicy :: forall s a r r'. Newtype s { externalTrafficPolicy :: r | r' } => Newtype r a => Lens' s a
_externalTrafficPolicy = _Newtype <<< prop (SProxy :: SProxy "externalTrafficPolicy") <<< _Newtype

_extra :: forall s a r r'. Newtype s { extra :: r | r' } => Newtype r a => Lens' s a
_extra = _Newtype <<< prop (SProxy :: SProxy "extra") <<< _Newtype

_failed :: forall s a r r'. Newtype s { failed :: r | r' } => Newtype r a => Lens' s a
_failed = _Newtype <<< prop (SProxy :: SProxy "failed") <<< _Newtype

_failedJobsHistoryLimit :: forall s a r r'. Newtype s { failedJobsHistoryLimit :: r | r' } => Newtype r a => Lens' s a
_failedJobsHistoryLimit = _Newtype <<< prop (SProxy :: SProxy "failedJobsHistoryLimit") <<< _Newtype

_failurePolicy :: forall s a r r'. Newtype s { failurePolicy :: r | r' } => Newtype r a => Lens' s a
_failurePolicy = _Newtype <<< prop (SProxy :: SProxy "failurePolicy") <<< _Newtype

_failureThreshold :: forall s a r r'. Newtype s { failureThreshold :: r | r' } => Newtype r a => Lens' s a
_failureThreshold = _Newtype <<< prop (SProxy :: SProxy "failureThreshold") <<< _Newtype

_fc :: forall s a r r'. Newtype s { fc :: r | r' } => Newtype r a => Lens' s a
_fc = _Newtype <<< prop (SProxy :: SProxy "fc") <<< _Newtype

_field :: forall s a r r'. Newtype s { field :: r | r' } => Newtype r a => Lens' s a
_field = _Newtype <<< prop (SProxy :: SProxy "field") <<< _Newtype

_fieldPath :: forall s a r r'. Newtype s { fieldPath :: r | r' } => Newtype r a => Lens' s a
_fieldPath = _Newtype <<< prop (SProxy :: SProxy "fieldPath") <<< _Newtype

_fieldRef :: forall s a r r'. Newtype s { fieldRef :: r | r' } => Newtype r a => Lens' s a
_fieldRef = _Newtype <<< prop (SProxy :: SProxy "fieldRef") <<< _Newtype

_finalizers :: forall s a r r'. Newtype s { finalizers :: r | r' } => Newtype r a => Lens' s a
_finalizers = _Newtype <<< prop (SProxy :: SProxy "finalizers") <<< _Newtype

_finishedAt :: forall s a r r'. Newtype s { finishedAt :: r | r' } => Newtype r a => Lens' s a
_finishedAt = _Newtype <<< prop (SProxy :: SProxy "finishedAt") <<< _Newtype

_firstTimestamp :: forall s a r r'. Newtype s { firstTimestamp :: r | r' } => Newtype r a => Lens' s a
_firstTimestamp = _Newtype <<< prop (SProxy :: SProxy "firstTimestamp") <<< _Newtype

_flexVolume :: forall s a r r'. Newtype s { flexVolume :: r | r' } => Newtype r a => Lens' s a
_flexVolume = _Newtype <<< prop (SProxy :: SProxy "flexVolume") <<< _Newtype

_flocker :: forall s a r r'. Newtype s { flocker :: r | r' } => Newtype r a => Lens' s a
_flocker = _Newtype <<< prop (SProxy :: SProxy "flocker") <<< _Newtype

_format :: forall s a r r'. Newtype s { format :: r | r' } => Newtype r a => Lens' s a
_format = _Newtype <<< prop (SProxy :: SProxy "format") <<< _Newtype

_from :: forall s a r r'. Newtype s { from :: r | r' } => Newtype r a => Lens' s a
_from = _Newtype <<< prop (SProxy :: SProxy "from") <<< _Newtype

_fsGroup :: forall s a r r'. Newtype s { fsGroup :: r | r' } => Newtype r a => Lens' s a
_fsGroup = _Newtype <<< prop (SProxy :: SProxy "fsGroup") <<< _Newtype

_fsType :: forall s a r r'. Newtype s { fsType :: r | r' } => Newtype r a => Lens' s a
_fsType = _Newtype <<< prop (SProxy :: SProxy "fsType") <<< _Newtype

_fullyLabeledReplicas :: forall s a r r'. Newtype s { fullyLabeledReplicas :: r | r' } => Newtype r a => Lens' s a
_fullyLabeledReplicas = _Newtype <<< prop (SProxy :: SProxy "fullyLabeledReplicas") <<< _Newtype

_gateway :: forall s a r r'. Newtype s { gateway :: r | r' } => Newtype r a => Lens' s a
_gateway = _Newtype <<< prop (SProxy :: SProxy "gateway") <<< _Newtype

_gcePersistentDisk :: forall s a r r'. Newtype s { gcePersistentDisk :: r | r' } => Newtype r a => Lens' s a
_gcePersistentDisk = _Newtype <<< prop (SProxy :: SProxy "gcePersistentDisk") <<< _Newtype

_generateName :: forall s a r r'. Newtype s { generateName :: r | r' } => Newtype r a => Lens' s a
_generateName = _Newtype <<< prop (SProxy :: SProxy "generateName") <<< _Newtype

_generation :: forall s a r r'. Newtype s { generation :: r | r' } => Newtype r a => Lens' s a
_generation = _Newtype <<< prop (SProxy :: SProxy "generation") <<< _Newtype

_gitCommit :: forall s a r r'. Newtype s { gitCommit :: r | r' } => Newtype r a => Lens' s a
_gitCommit = _Newtype <<< prop (SProxy :: SProxy "gitCommit") <<< _Newtype

_gitRepo :: forall s a r r'. Newtype s { gitRepo :: r | r' } => Newtype r a => Lens' s a
_gitRepo = _Newtype <<< prop (SProxy :: SProxy "gitRepo") <<< _Newtype

_gitTreeState :: forall s a r r'. Newtype s { gitTreeState :: r | r' } => Newtype r a => Lens' s a
_gitTreeState = _Newtype <<< prop (SProxy :: SProxy "gitTreeState") <<< _Newtype

_gitVersion :: forall s a r r'. Newtype s { gitVersion :: r | r' } => Newtype r a => Lens' s a
_gitVersion = _Newtype <<< prop (SProxy :: SProxy "gitVersion") <<< _Newtype

_globalDefault :: forall s a r r'. Newtype s { globalDefault :: r | r' } => Newtype r a => Lens' s a
_globalDefault = _Newtype <<< prop (SProxy :: SProxy "globalDefault") <<< _Newtype

_glusterfs :: forall s a r r'. Newtype s { glusterfs :: r | r' } => Newtype r a => Lens' s a
_glusterfs = _Newtype <<< prop (SProxy :: SProxy "glusterfs") <<< _Newtype

_goVersion :: forall s a r r'. Newtype s { goVersion :: r | r' } => Newtype r a => Lens' s a
_goVersion = _Newtype <<< prop (SProxy :: SProxy "goVersion") <<< _Newtype

_gracePeriodSeconds :: forall s a r r'. Newtype s { gracePeriodSeconds :: r | r' } => Newtype r a => Lens' s a
_gracePeriodSeconds = _Newtype <<< prop (SProxy :: SProxy "gracePeriodSeconds") <<< _Newtype

_group :: forall s a r r'. Newtype s { group :: r | r' } => Newtype r a => Lens' s a
_group = _Newtype <<< prop (SProxy :: SProxy "group") <<< _Newtype

_groupPriorityMinimum :: forall s a r r'. Newtype s { groupPriorityMinimum :: r | r' } => Newtype r a => Lens' s a
_groupPriorityMinimum = _Newtype <<< prop (SProxy :: SProxy "groupPriorityMinimum") <<< _Newtype

_groupVersion :: forall s a r r'. Newtype s { groupVersion :: r | r' } => Newtype r a => Lens' s a
_groupVersion = _Newtype <<< prop (SProxy :: SProxy "groupVersion") <<< _Newtype

_groups :: forall s a r r'. Newtype s { groups :: r | r' } => Newtype r a => Lens' s a
_groups = _Newtype <<< prop (SProxy :: SProxy "groups") <<< _Newtype

_hard :: forall s a r r'. Newtype s { hard :: r | r' } => Newtype r a => Lens' s a
_hard = _Newtype <<< prop (SProxy :: SProxy "hard") <<< _Newtype

_healthCheckNodePort :: forall s a r r'. Newtype s { healthCheckNodePort :: r | r' } => Newtype r a => Lens' s a
_healthCheckNodePort = _Newtype <<< prop (SProxy :: SProxy "healthCheckNodePort") <<< _Newtype

_host :: forall s a r r'. Newtype s { host :: r | r' } => Newtype r a => Lens' s a
_host = _Newtype <<< prop (SProxy :: SProxy "host") <<< _Newtype

_hostAliases :: forall s a r r'. Newtype s { hostAliases :: r | r' } => Newtype r a => Lens' s a
_hostAliases = _Newtype <<< prop (SProxy :: SProxy "hostAliases") <<< _Newtype

_hostIP :: forall s a r r'. Newtype s { hostIP :: r | r' } => Newtype r a => Lens' s a
_hostIP = _Newtype <<< prop (SProxy :: SProxy "hostIP") <<< _Newtype

_hostIPC :: forall s a r r'. Newtype s { hostIPC :: r | r' } => Newtype r a => Lens' s a
_hostIPC = _Newtype <<< prop (SProxy :: SProxy "hostIPC") <<< _Newtype

_hostNetwork :: forall s a r r'. Newtype s { hostNetwork :: r | r' } => Newtype r a => Lens' s a
_hostNetwork = _Newtype <<< prop (SProxy :: SProxy "hostNetwork") <<< _Newtype

_hostPID :: forall s a r r'. Newtype s { hostPID :: r | r' } => Newtype r a => Lens' s a
_hostPID = _Newtype <<< prop (SProxy :: SProxy "hostPID") <<< _Newtype

_hostPath :: forall s a r r'. Newtype s { hostPath :: r | r' } => Newtype r a => Lens' s a
_hostPath = _Newtype <<< prop (SProxy :: SProxy "hostPath") <<< _Newtype

_hostPort :: forall s a r r'. Newtype s { hostPort :: r | r' } => Newtype r a => Lens' s a
_hostPort = _Newtype <<< prop (SProxy :: SProxy "hostPort") <<< _Newtype

_hostPorts :: forall s a r r'. Newtype s { hostPorts :: r | r' } => Newtype r a => Lens' s a
_hostPorts = _Newtype <<< prop (SProxy :: SProxy "hostPorts") <<< _Newtype

_hostname :: forall s a r r'. Newtype s { hostname :: r | r' } => Newtype r a => Lens' s a
_hostname = _Newtype <<< prop (SProxy :: SProxy "hostname") <<< _Newtype

_hostnames :: forall s a r r'. Newtype s { hostnames :: r | r' } => Newtype r a => Lens' s a
_hostnames = _Newtype <<< prop (SProxy :: SProxy "hostnames") <<< _Newtype

_hosts :: forall s a r r'. Newtype s { hosts :: r | r' } => Newtype r a => Lens' s a
_hosts = _Newtype <<< prop (SProxy :: SProxy "hosts") <<< _Newtype

_http :: forall s a r r'. Newtype s { http :: r | r' } => Newtype r a => Lens' s a
_http = _Newtype <<< prop (SProxy :: SProxy "http") <<< _Newtype

_httpGet :: forall s a r r'. Newtype s { httpGet :: r | r' } => Newtype r a => Lens' s a
_httpGet = _Newtype <<< prop (SProxy :: SProxy "httpGet") <<< _Newtype

_httpHeaders :: forall s a r r'. Newtype s { httpHeaders :: r | r' } => Newtype r a => Lens' s a
_httpHeaders = _Newtype <<< prop (SProxy :: SProxy "httpHeaders") <<< _Newtype

_id :: forall s a r r'. Newtype s { id :: r | r' } => Newtype r a => Lens' s a
_id = _Newtype <<< prop (SProxy :: SProxy "id") <<< _Newtype

_image :: forall s a r r'. Newtype s { image :: r | r' } => Newtype r a => Lens' s a
_image = _Newtype <<< prop (SProxy :: SProxy "image") <<< _Newtype

_imageID :: forall s a r r'. Newtype s { imageID :: r | r' } => Newtype r a => Lens' s a
_imageID = _Newtype <<< prop (SProxy :: SProxy "imageID") <<< _Newtype

_imagePullPolicy :: forall s a r r'. Newtype s { imagePullPolicy :: r | r' } => Newtype r a => Lens' s a
_imagePullPolicy = _Newtype <<< prop (SProxy :: SProxy "imagePullPolicy") <<< _Newtype

_imagePullSecrets :: forall s a r r'. Newtype s { imagePullSecrets :: r | r' } => Newtype r a => Lens' s a
_imagePullSecrets = _Newtype <<< prop (SProxy :: SProxy "imagePullSecrets") <<< _Newtype

_images :: forall s a r r'. Newtype s { images :: r | r' } => Newtype r a => Lens' s a
_images = _Newtype <<< prop (SProxy :: SProxy "images") <<< _Newtype

_incomplete :: forall s a r r'. Newtype s { incomplete :: r | r' } => Newtype r a => Lens' s a
_incomplete = _Newtype <<< prop (SProxy :: SProxy "incomplete") <<< _Newtype

_ingress :: forall s a r r'. Newtype s { ingress :: r | r' } => Newtype r a => Lens' s a
_ingress = _Newtype <<< prop (SProxy :: SProxy "ingress") <<< _Newtype

_initContainerStatuses :: forall s a r r'. Newtype s { initContainerStatuses :: r | r' } => Newtype r a => Lens' s a
_initContainerStatuses = _Newtype <<< prop (SProxy :: SProxy "initContainerStatuses") <<< _Newtype

_initContainers :: forall s a r r'. Newtype s { initContainers :: r | r' } => Newtype r a => Lens' s a
_initContainers = _Newtype <<< prop (SProxy :: SProxy "initContainers") <<< _Newtype

_initialDelaySeconds :: forall s a r r'. Newtype s { initialDelaySeconds :: r | r' } => Newtype r a => Lens' s a
_initialDelaySeconds = _Newtype <<< prop (SProxy :: SProxy "initialDelaySeconds") <<< _Newtype

_initializers :: forall s a r r'. Newtype s { initializers :: r | r' } => Newtype r a => Lens' s a
_initializers = _Newtype <<< prop (SProxy :: SProxy "initializers") <<< _Newtype

_initiatorName :: forall s a r r'. Newtype s { initiatorName :: r | r' } => Newtype r a => Lens' s a
_initiatorName = _Newtype <<< prop (SProxy :: SProxy "initiatorName") <<< _Newtype

_insecureSkipTLSVerify :: forall s a r r'. Newtype s { insecureSkipTLSVerify :: r | r' } => Newtype r a => Lens' s a
_insecureSkipTLSVerify = _Newtype <<< prop (SProxy :: SProxy "insecureSkipTLSVerify") <<< _Newtype

_involvedObject :: forall s a r r'. Newtype s { involvedObject :: r | r' } => Newtype r a => Lens' s a
_involvedObject = _Newtype <<< prop (SProxy :: SProxy "involvedObject") <<< _Newtype

_ip :: forall s a r r'. Newtype s { ip :: r | r' } => Newtype r a => Lens' s a
_ip = _Newtype <<< prop (SProxy :: SProxy "ip") <<< _Newtype

_ipBlock :: forall s a r r'. Newtype s { ipBlock :: r | r' } => Newtype r a => Lens' s a
_ipBlock = _Newtype <<< prop (SProxy :: SProxy "ipBlock") <<< _Newtype

_iqn :: forall s a r r'. Newtype s { iqn :: r | r' } => Newtype r a => Lens' s a
_iqn = _Newtype <<< prop (SProxy :: SProxy "iqn") <<< _Newtype

_iscsi :: forall s a r r'. Newtype s { iscsi :: r | r' } => Newtype r a => Lens' s a
_iscsi = _Newtype <<< prop (SProxy :: SProxy "iscsi") <<< _Newtype

_iscsiInterface :: forall s a r r'. Newtype s { iscsiInterface :: r | r' } => Newtype r a => Lens' s a
_iscsiInterface = _Newtype <<< prop (SProxy :: SProxy "iscsiInterface") <<< _Newtype

_items :: forall s a r r'. Newtype s { items :: r | r' } => Newtype r a => Lens' s a
_items = _Newtype <<< prop (SProxy :: SProxy "items") <<< _Newtype

_jobTemplate :: forall s a r r'. Newtype s { jobTemplate :: r | r' } => Newtype r a => Lens' s a
_jobTemplate = _Newtype <<< prop (SProxy :: SProxy "jobTemplate") <<< _Newtype

_kernelVersion :: forall s a r r'. Newtype s { kernelVersion :: r | r' } => Newtype r a => Lens' s a
_kernelVersion = _Newtype <<< prop (SProxy :: SProxy "kernelVersion") <<< _Newtype

_key :: forall s a r r'. Newtype s { key :: r | r' } => Newtype r a => Lens' s a
_key = _Newtype <<< prop (SProxy :: SProxy "key") <<< _Newtype

_keyring :: forall s a r r'. Newtype s { keyring :: r | r' } => Newtype r a => Lens' s a
_keyring = _Newtype <<< prop (SProxy :: SProxy "keyring") <<< _Newtype

_kind :: forall s a r r'. Newtype s { kind :: r | r' } => Newtype r a => Lens' s a
_kind = _Newtype <<< prop (SProxy :: SProxy "kind") <<< _Newtype

_kubeProxyVersion :: forall s a r r'. Newtype s { kubeProxyVersion :: r | r' } => Newtype r a => Lens' s a
_kubeProxyVersion = _Newtype <<< prop (SProxy :: SProxy "kubeProxyVersion") <<< _Newtype

_kubeletEndpoint :: forall s a r r'. Newtype s { kubeletEndpoint :: r | r' } => Newtype r a => Lens' s a
_kubeletEndpoint = _Newtype <<< prop (SProxy :: SProxy "kubeletEndpoint") <<< _Newtype

_kubeletVersion :: forall s a r r'. Newtype s { kubeletVersion :: r | r' } => Newtype r a => Lens' s a
_kubeletVersion = _Newtype <<< prop (SProxy :: SProxy "kubeletVersion") <<< _Newtype

_labelSelector :: forall s a r r'. Newtype s { labelSelector :: r | r' } => Newtype r a => Lens' s a
_labelSelector = _Newtype <<< prop (SProxy :: SProxy "labelSelector") <<< _Newtype

_labels :: forall s a r r'. Newtype s { labels :: r | r' } => Newtype r a => Lens' s a
_labels = _Newtype <<< prop (SProxy :: SProxy "labels") <<< _Newtype

_lastHeartbeatTime :: forall s a r r'. Newtype s { lastHeartbeatTime :: r | r' } => Newtype r a => Lens' s a
_lastHeartbeatTime = _Newtype <<< prop (SProxy :: SProxy "lastHeartbeatTime") <<< _Newtype

_lastObservedTime :: forall s a r r'. Newtype s { lastObservedTime :: r | r' } => Newtype r a => Lens' s a
_lastObservedTime = _Newtype <<< prop (SProxy :: SProxy "lastObservedTime") <<< _Newtype

_lastProbeTime :: forall s a r r'. Newtype s { lastProbeTime :: r | r' } => Newtype r a => Lens' s a
_lastProbeTime = _Newtype <<< prop (SProxy :: SProxy "lastProbeTime") <<< _Newtype

_lastScaleTime :: forall s a r r'. Newtype s { lastScaleTime :: r | r' } => Newtype r a => Lens' s a
_lastScaleTime = _Newtype <<< prop (SProxy :: SProxy "lastScaleTime") <<< _Newtype

_lastScheduleTime :: forall s a r r'. Newtype s { lastScheduleTime :: r | r' } => Newtype r a => Lens' s a
_lastScheduleTime = _Newtype <<< prop (SProxy :: SProxy "lastScheduleTime") <<< _Newtype

_lastState :: forall s a r r'. Newtype s { lastState :: r | r' } => Newtype r a => Lens' s a
_lastState = _Newtype <<< prop (SProxy :: SProxy "lastState") <<< _Newtype

_lastTimestamp :: forall s a r r'. Newtype s { lastTimestamp :: r | r' } => Newtype r a => Lens' s a
_lastTimestamp = _Newtype <<< prop (SProxy :: SProxy "lastTimestamp") <<< _Newtype

_lastTransitionTime :: forall s a r r'. Newtype s { lastTransitionTime :: r | r' } => Newtype r a => Lens' s a
_lastTransitionTime = _Newtype <<< prop (SProxy :: SProxy "lastTransitionTime") <<< _Newtype

_lastUpdateTime :: forall s a r r'. Newtype s { lastUpdateTime :: r | r' } => Newtype r a => Lens' s a
_lastUpdateTime = _Newtype <<< prop (SProxy :: SProxy "lastUpdateTime") <<< _Newtype

_level :: forall s a r r'. Newtype s { level :: r | r' } => Newtype r a => Lens' s a
_level = _Newtype <<< prop (SProxy :: SProxy "level") <<< _Newtype

_lifecycle :: forall s a r r'. Newtype s { lifecycle :: r | r' } => Newtype r a => Lens' s a
_lifecycle = _Newtype <<< prop (SProxy :: SProxy "lifecycle") <<< _Newtype

_limits :: forall s a r r'. Newtype s { limits :: r | r' } => Newtype r a => Lens' s a
_limits = _Newtype <<< prop (SProxy :: SProxy "limits") <<< _Newtype

_listKind :: forall s a r r'. Newtype s { listKind :: r | r' } => Newtype r a => Lens' s a
_listKind = _Newtype <<< prop (SProxy :: SProxy "listKind") <<< _Newtype

_livenessProbe :: forall s a r r'. Newtype s { livenessProbe :: r | r' } => Newtype r a => Lens' s a
_livenessProbe = _Newtype <<< prop (SProxy :: SProxy "livenessProbe") <<< _Newtype

_loadBalancer :: forall s a r r'. Newtype s { loadBalancer :: r | r' } => Newtype r a => Lens' s a
_loadBalancer = _Newtype <<< prop (SProxy :: SProxy "loadBalancer") <<< _Newtype

_loadBalancerIP :: forall s a r r'. Newtype s { loadBalancerIP :: r | r' } => Newtype r a => Lens' s a
_loadBalancerIP = _Newtype <<< prop (SProxy :: SProxy "loadBalancerIP") <<< _Newtype

_loadBalancerSourceRanges :: forall s a r r'. Newtype s { loadBalancerSourceRanges :: r | r' } => Newtype r a => Lens' s a
_loadBalancerSourceRanges = _Newtype <<< prop (SProxy :: SProxy "loadBalancerSourceRanges") <<< _Newtype

_local :: forall s a r r'. Newtype s { local :: r | r' } => Newtype r a => Lens' s a
_local = _Newtype <<< prop (SProxy :: SProxy "local") <<< _Newtype

_lun :: forall s a r r'. Newtype s { lun :: r | r' } => Newtype r a => Lens' s a
_lun = _Newtype <<< prop (SProxy :: SProxy "lun") <<< _Newtype

_machineID :: forall s a r r'. Newtype s { machineID :: r | r' } => Newtype r a => Lens' s a
_machineID = _Newtype <<< prop (SProxy :: SProxy "machineID") <<< _Newtype

_major :: forall s a r r'. Newtype s { major :: r | r' } => Newtype r a => Lens' s a
_major = _Newtype <<< prop (SProxy :: SProxy "major") <<< _Newtype

_manualSelector :: forall s a r r'. Newtype s { manualSelector :: r | r' } => Newtype r a => Lens' s a
_manualSelector = _Newtype <<< prop (SProxy :: SProxy "manualSelector") <<< _Newtype

_matchExpressions :: forall s a r r'. Newtype s { matchExpressions :: r | r' } => Newtype r a => Lens' s a
_matchExpressions = _Newtype <<< prop (SProxy :: SProxy "matchExpressions") <<< _Newtype

_matchLabels :: forall s a r r'. Newtype s { matchLabels :: r | r' } => Newtype r a => Lens' s a
_matchLabels = _Newtype <<< prop (SProxy :: SProxy "matchLabels") <<< _Newtype

_max :: forall s a r r'. Newtype s { max :: r | r' } => Newtype r a => Lens' s a
_max = _Newtype <<< prop (SProxy :: SProxy "max") <<< _Newtype

_maxItems :: forall s a r r'. Newtype s { maxItems :: r | r' } => Newtype r a => Lens' s a
_maxItems = _Newtype <<< prop (SProxy :: SProxy "maxItems") <<< _Newtype

_maxLength :: forall s a r r'. Newtype s { maxLength :: r | r' } => Newtype r a => Lens' s a
_maxLength = _Newtype <<< prop (SProxy :: SProxy "maxLength") <<< _Newtype

_maxLimitRequestRatio :: forall s a r r'. Newtype s { maxLimitRequestRatio :: r | r' } => Newtype r a => Lens' s a
_maxLimitRequestRatio = _Newtype <<< prop (SProxy :: SProxy "maxLimitRequestRatio") <<< _Newtype

_maxProperties :: forall s a r r'. Newtype s { maxProperties :: r | r' } => Newtype r a => Lens' s a
_maxProperties = _Newtype <<< prop (SProxy :: SProxy "maxProperties") <<< _Newtype

_maxReplicas :: forall s a r r'. Newtype s { maxReplicas :: r | r' } => Newtype r a => Lens' s a
_maxReplicas = _Newtype <<< prop (SProxy :: SProxy "maxReplicas") <<< _Newtype

_maxSurge :: forall s a r r'. Newtype s { maxSurge :: r | r' } => Newtype r a => Lens' s a
_maxSurge = _Newtype <<< prop (SProxy :: SProxy "maxSurge") <<< _Newtype

_maxUnavailable :: forall s a r r'. Newtype s { maxUnavailable :: r | r' } => Newtype r a => Lens' s a
_maxUnavailable = _Newtype <<< prop (SProxy :: SProxy "maxUnavailable") <<< _Newtype

_maximum :: forall s a r r'. Newtype s { maximum :: r | r' } => Newtype r a => Lens' s a
_maximum = _Newtype <<< prop (SProxy :: SProxy "maximum") <<< _Newtype

_medium :: forall s a r r'. Newtype s { medium :: r | r' } => Newtype r a => Lens' s a
_medium = _Newtype <<< prop (SProxy :: SProxy "medium") <<< _Newtype

_message :: forall s a r r'. Newtype s { message :: r | r' } => Newtype r a => Lens' s a
_message = _Newtype <<< prop (SProxy :: SProxy "message") <<< _Newtype

_metadata :: forall s a r r'. Newtype s { metadata :: r | r' } => Newtype r a => Lens' s a
_metadata = _Newtype <<< prop (SProxy :: SProxy "metadata") <<< _Newtype

_metricName :: forall s a r r'. Newtype s { metricName :: r | r' } => Newtype r a => Lens' s a
_metricName = _Newtype <<< prop (SProxy :: SProxy "metricName") <<< _Newtype

_metrics :: forall s a r r'. Newtype s { metrics :: r | r' } => Newtype r a => Lens' s a
_metrics = _Newtype <<< prop (SProxy :: SProxy "metrics") <<< _Newtype

_min :: forall s a r r'. Newtype s { min :: r | r' } => Newtype r a => Lens' s a
_min = _Newtype <<< prop (SProxy :: SProxy "min") <<< _Newtype

_minAvailable :: forall s a r r'. Newtype s { minAvailable :: r | r' } => Newtype r a => Lens' s a
_minAvailable = _Newtype <<< prop (SProxy :: SProxy "minAvailable") <<< _Newtype

_minItems :: forall s a r r'. Newtype s { minItems :: r | r' } => Newtype r a => Lens' s a
_minItems = _Newtype <<< prop (SProxy :: SProxy "minItems") <<< _Newtype

_minLength :: forall s a r r'. Newtype s { minLength :: r | r' } => Newtype r a => Lens' s a
_minLength = _Newtype <<< prop (SProxy :: SProxy "minLength") <<< _Newtype

_minProperties :: forall s a r r'. Newtype s { minProperties :: r | r' } => Newtype r a => Lens' s a
_minProperties = _Newtype <<< prop (SProxy :: SProxy "minProperties") <<< _Newtype

_minReadySeconds :: forall s a r r'. Newtype s { minReadySeconds :: r | r' } => Newtype r a => Lens' s a
_minReadySeconds = _Newtype <<< prop (SProxy :: SProxy "minReadySeconds") <<< _Newtype

_minReplicas :: forall s a r r'. Newtype s { minReplicas :: r | r' } => Newtype r a => Lens' s a
_minReplicas = _Newtype <<< prop (SProxy :: SProxy "minReplicas") <<< _Newtype

_minimum :: forall s a r r'. Newtype s { minimum :: r | r' } => Newtype r a => Lens' s a
_minimum = _Newtype <<< prop (SProxy :: SProxy "minimum") <<< _Newtype

_minor :: forall s a r r'. Newtype s { minor :: r | r' } => Newtype r a => Lens' s a
_minor = _Newtype <<< prop (SProxy :: SProxy "minor") <<< _Newtype

_mode :: forall s a r r'. Newtype s { mode :: r | r' } => Newtype r a => Lens' s a
_mode = _Newtype <<< prop (SProxy :: SProxy "mode") <<< _Newtype

_monitors :: forall s a r r'. Newtype s { monitors :: r | r' } => Newtype r a => Lens' s a
_monitors = _Newtype <<< prop (SProxy :: SProxy "monitors") <<< _Newtype

_mountOptions :: forall s a r r'. Newtype s { mountOptions :: r | r' } => Newtype r a => Lens' s a
_mountOptions = _Newtype <<< prop (SProxy :: SProxy "mountOptions") <<< _Newtype

_mountPath :: forall s a r r'. Newtype s { mountPath :: r | r' } => Newtype r a => Lens' s a
_mountPath = _Newtype <<< prop (SProxy :: SProxy "mountPath") <<< _Newtype

_mountPropagation :: forall s a r r'. Newtype s { mountPropagation :: r | r' } => Newtype r a => Lens' s a
_mountPropagation = _Newtype <<< prop (SProxy :: SProxy "mountPropagation") <<< _Newtype

_multipleOf :: forall s a r r'. Newtype s { multipleOf :: r | r' } => Newtype r a => Lens' s a
_multipleOf = _Newtype <<< prop (SProxy :: SProxy "multipleOf") <<< _Newtype

_name :: forall s a r r'. Newtype s { name :: r | r' } => Newtype r a => Lens' s a
_name = _Newtype <<< prop (SProxy :: SProxy "name") <<< _Newtype

_names :: forall s a r r'. Newtype s { names :: r | r' } => Newtype r a => Lens' s a
_names = _Newtype <<< prop (SProxy :: SProxy "names") <<< _Newtype

_nameservers :: forall s a r r'. Newtype s { nameservers :: r | r' } => Newtype r a => Lens' s a
_nameservers = _Newtype <<< prop (SProxy :: SProxy "nameservers") <<< _Newtype

_namespace :: forall s a r r'. Newtype s { namespace :: r | r' } => Newtype r a => Lens' s a
_namespace = _Newtype <<< prop (SProxy :: SProxy "namespace") <<< _Newtype

_namespaceSelector :: forall s a r r'. Newtype s { namespaceSelector :: r | r' } => Newtype r a => Lens' s a
_namespaceSelector = _Newtype <<< prop (SProxy :: SProxy "namespaceSelector") <<< _Newtype

_namespaced :: forall s a r r'. Newtype s { namespaced :: r | r' } => Newtype r a => Lens' s a
_namespaced = _Newtype <<< prop (SProxy :: SProxy "namespaced") <<< _Newtype

_namespaces :: forall s a r r'. Newtype s { namespaces :: r | r' } => Newtype r a => Lens' s a
_namespaces = _Newtype <<< prop (SProxy :: SProxy "namespaces") <<< _Newtype

_nfs :: forall s a r r'. Newtype s { nfs :: r | r' } => Newtype r a => Lens' s a
_nfs = _Newtype <<< prop (SProxy :: SProxy "nfs") <<< _Newtype

_nodeAffinity :: forall s a r r'. Newtype s { nodeAffinity :: r | r' } => Newtype r a => Lens' s a
_nodeAffinity = _Newtype <<< prop (SProxy :: SProxy "nodeAffinity") <<< _Newtype

_nodeInfo :: forall s a r r'. Newtype s { nodeInfo :: r | r' } => Newtype r a => Lens' s a
_nodeInfo = _Newtype <<< prop (SProxy :: SProxy "nodeInfo") <<< _Newtype

_nodeName :: forall s a r r'. Newtype s { nodeName :: r | r' } => Newtype r a => Lens' s a
_nodeName = _Newtype <<< prop (SProxy :: SProxy "nodeName") <<< _Newtype

_nodePort :: forall s a r r'. Newtype s { nodePort :: r | r' } => Newtype r a => Lens' s a
_nodePort = _Newtype <<< prop (SProxy :: SProxy "nodePort") <<< _Newtype

_nodeSelector :: forall s a r r'. Newtype s { nodeSelector :: r | r' } => Newtype r a => Lens' s a
_nodeSelector = _Newtype <<< prop (SProxy :: SProxy "nodeSelector") <<< _Newtype

_nodeSelectorTerms :: forall s a r r'. Newtype s { nodeSelectorTerms :: r | r' } => Newtype r a => Lens' s a
_nodeSelectorTerms = _Newtype <<< prop (SProxy :: SProxy "nodeSelectorTerms") <<< _Newtype

_nonResourceAttributes :: forall s a r r'. Newtype s { nonResourceAttributes :: r | r' } => Newtype r a => Lens' s a
_nonResourceAttributes = _Newtype <<< prop (SProxy :: SProxy "nonResourceAttributes") <<< _Newtype

_nonResourceRules :: forall s a r r'. Newtype s { nonResourceRules :: r | r' } => Newtype r a => Lens' s a
_nonResourceRules = _Newtype <<< prop (SProxy :: SProxy "nonResourceRules") <<< _Newtype

_nonResourceURLs :: forall s a r r'. Newtype s { nonResourceURLs :: r | r' } => Newtype r a => Lens' s a
_nonResourceURLs = _Newtype <<< prop (SProxy :: SProxy "nonResourceURLs") <<< _Newtype

_not :: forall s a r r'. Newtype s { not :: r | r' } => Newtype r a => Lens' s a
_not = _Newtype <<< prop (SProxy :: SProxy "not") <<< _Newtype

_notReadyAddresses :: forall s a r r'. Newtype s { notReadyAddresses :: r | r' } => Newtype r a => Lens' s a
_notReadyAddresses = _Newtype <<< prop (SProxy :: SProxy "notReadyAddresses") <<< _Newtype

_note :: forall s a r r'. Newtype s { note :: r | r' } => Newtype r a => Lens' s a
_note = _Newtype <<< prop (SProxy :: SProxy "note") <<< _Newtype

_numberAvailable :: forall s a r r'. Newtype s { numberAvailable :: r | r' } => Newtype r a => Lens' s a
_numberAvailable = _Newtype <<< prop (SProxy :: SProxy "numberAvailable") <<< _Newtype

_numberMisscheduled :: forall s a r r'. Newtype s { numberMisscheduled :: r | r' } => Newtype r a => Lens' s a
_numberMisscheduled = _Newtype <<< prop (SProxy :: SProxy "numberMisscheduled") <<< _Newtype

_numberReady :: forall s a r r'. Newtype s { numberReady :: r | r' } => Newtype r a => Lens' s a
_numberReady = _Newtype <<< prop (SProxy :: SProxy "numberReady") <<< _Newtype

_numberUnavailable :: forall s a r r'. Newtype s { numberUnavailable :: r | r' } => Newtype r a => Lens' s a
_numberUnavailable = _Newtype <<< prop (SProxy :: SProxy "numberUnavailable") <<< _Newtype

_object :: forall s a r r'. Newtype s { object :: r | r' } => Newtype r a => Lens' s a
_object = _Newtype <<< prop (SProxy :: SProxy "object") <<< _Newtype

_observedGeneration :: forall s a r r'. Newtype s { observedGeneration :: r | r' } => Newtype r a => Lens' s a
_observedGeneration = _Newtype <<< prop (SProxy :: SProxy "observedGeneration") <<< _Newtype

_oneOf :: forall s a r r'. Newtype s { oneOf :: r | r' } => Newtype r a => Lens' s a
_oneOf = _Newtype <<< prop (SProxy :: SProxy "oneOf") <<< _Newtype

_openAPIV3Schema :: forall s a r r'. Newtype s { openAPIV3Schema :: r | r' } => Newtype r a => Lens' s a
_openAPIV3Schema = _Newtype <<< prop (SProxy :: SProxy "openAPIV3Schema") <<< _Newtype

_operatingSystem :: forall s a r r'. Newtype s { operatingSystem :: r | r' } => Newtype r a => Lens' s a
_operatingSystem = _Newtype <<< prop (SProxy :: SProxy "operatingSystem") <<< _Newtype

_operations :: forall s a r r'. Newtype s { operations :: r | r' } => Newtype r a => Lens' s a
_operations = _Newtype <<< prop (SProxy :: SProxy "operations") <<< _Newtype

_operator :: forall s a r r'. Newtype s { operator :: r | r' } => Newtype r a => Lens' s a
_operator = _Newtype <<< prop (SProxy :: SProxy "operator") <<< _Newtype

_optional :: forall s a r r'. Newtype s { optional :: r | r' } => Newtype r a => Lens' s a
_optional = _Newtype <<< prop (SProxy :: SProxy "optional") <<< _Newtype

_options :: forall s a r r'. Newtype s { options :: r | r' } => Newtype r a => Lens' s a
_options = _Newtype <<< prop (SProxy :: SProxy "options") <<< _Newtype

_orphanDependents :: forall s a r r'. Newtype s { orphanDependents :: r | r' } => Newtype r a => Lens' s a
_orphanDependents = _Newtype <<< prop (SProxy :: SProxy "orphanDependents") <<< _Newtype

_osImage :: forall s a r r'. Newtype s { osImage :: r | r' } => Newtype r a => Lens' s a
_osImage = _Newtype <<< prop (SProxy :: SProxy "osImage") <<< _Newtype

_ownerReferences :: forall s a r r'. Newtype s { ownerReferences :: r | r' } => Newtype r a => Lens' s a
_ownerReferences = _Newtype <<< prop (SProxy :: SProxy "ownerReferences") <<< _Newtype

_parallelism :: forall s a r r'. Newtype s { parallelism :: r | r' } => Newtype r a => Lens' s a
_parallelism = _Newtype <<< prop (SProxy :: SProxy "parallelism") <<< _Newtype

_parameters :: forall s a r r'. Newtype s { parameters :: r | r' } => Newtype r a => Lens' s a
_parameters = _Newtype <<< prop (SProxy :: SProxy "parameters") <<< _Newtype

_partition :: forall s a r r'. Newtype s { partition :: r | r' } => Newtype r a => Lens' s a
_partition = _Newtype <<< prop (SProxy :: SProxy "partition") <<< _Newtype

_path :: forall s a r r'. Newtype s { path :: r | r' } => Newtype r a => Lens' s a
_path = _Newtype <<< prop (SProxy :: SProxy "path") <<< _Newtype

_pathPrefix :: forall s a r r'. Newtype s { pathPrefix :: r | r' } => Newtype r a => Lens' s a
_pathPrefix = _Newtype <<< prop (SProxy :: SProxy "pathPrefix") <<< _Newtype

_paths :: forall s a r r'. Newtype s { paths :: r | r' } => Newtype r a => Lens' s a
_paths = _Newtype <<< prop (SProxy :: SProxy "paths") <<< _Newtype

_pattern :: forall s a r r'. Newtype s { pattern :: r | r' } => Newtype r a => Lens' s a
_pattern = _Newtype <<< prop (SProxy :: SProxy "pattern") <<< _Newtype

_patternProperties :: forall s a r r'. Newtype s { patternProperties :: r | r' } => Newtype r a => Lens' s a
_patternProperties = _Newtype <<< prop (SProxy :: SProxy "patternProperties") <<< _Newtype

_paused :: forall s a r r'. Newtype s { paused :: r | r' } => Newtype r a => Lens' s a
_paused = _Newtype <<< prop (SProxy :: SProxy "paused") <<< _Newtype

_pdID :: forall s a r r'. Newtype s { pdID :: r | r' } => Newtype r a => Lens' s a
_pdID = _Newtype <<< prop (SProxy :: SProxy "pdID") <<< _Newtype

_pdName :: forall s a r r'. Newtype s { pdName :: r | r' } => Newtype r a => Lens' s a
_pdName = _Newtype <<< prop (SProxy :: SProxy "pdName") <<< _Newtype

_pending :: forall s a r r'. Newtype s { pending :: r | r' } => Newtype r a => Lens' s a
_pending = _Newtype <<< prop (SProxy :: SProxy "pending") <<< _Newtype

_periodSeconds :: forall s a r r'. Newtype s { periodSeconds :: r | r' } => Newtype r a => Lens' s a
_periodSeconds = _Newtype <<< prop (SProxy :: SProxy "periodSeconds") <<< _Newtype

_persistentVolumeClaim :: forall s a r r'. Newtype s { persistentVolumeClaim :: r | r' } => Newtype r a => Lens' s a
_persistentVolumeClaim = _Newtype <<< prop (SProxy :: SProxy "persistentVolumeClaim") <<< _Newtype

_persistentVolumeName :: forall s a r r'. Newtype s { persistentVolumeName :: r | r' } => Newtype r a => Lens' s a
_persistentVolumeName = _Newtype <<< prop (SProxy :: SProxy "persistentVolumeName") <<< _Newtype

_persistentVolumeReclaimPolicy :: forall s a r r'. Newtype s { persistentVolumeReclaimPolicy :: r | r' } => Newtype r a => Lens' s a
_persistentVolumeReclaimPolicy = _Newtype <<< prop (SProxy :: SProxy "persistentVolumeReclaimPolicy") <<< _Newtype

_phase :: forall s a r r'. Newtype s { phase :: r | r' } => Newtype r a => Lens' s a
_phase = _Newtype <<< prop (SProxy :: SProxy "phase") <<< _Newtype

_photonPersistentDisk :: forall s a r r'. Newtype s { photonPersistentDisk :: r | r' } => Newtype r a => Lens' s a
_photonPersistentDisk = _Newtype <<< prop (SProxy :: SProxy "photonPersistentDisk") <<< _Newtype

_platform :: forall s a r r'. Newtype s { platform :: r | r' } => Newtype r a => Lens' s a
_platform = _Newtype <<< prop (SProxy :: SProxy "platform") <<< _Newtype

_plural :: forall s a r r'. Newtype s { plural :: r | r' } => Newtype r a => Lens' s a
_plural = _Newtype <<< prop (SProxy :: SProxy "plural") <<< _Newtype

_podAffinity :: forall s a r r'. Newtype s { podAffinity :: r | r' } => Newtype r a => Lens' s a
_podAffinity = _Newtype <<< prop (SProxy :: SProxy "podAffinity") <<< _Newtype

_podAffinityTerm :: forall s a r r'. Newtype s { podAffinityTerm :: r | r' } => Newtype r a => Lens' s a
_podAffinityTerm = _Newtype <<< prop (SProxy :: SProxy "podAffinityTerm") <<< _Newtype

_podAntiAffinity :: forall s a r r'. Newtype s { podAntiAffinity :: r | r' } => Newtype r a => Lens' s a
_podAntiAffinity = _Newtype <<< prop (SProxy :: SProxy "podAntiAffinity") <<< _Newtype

_podCIDR :: forall s a r r'. Newtype s { podCIDR :: r | r' } => Newtype r a => Lens' s a
_podCIDR = _Newtype <<< prop (SProxy :: SProxy "podCIDR") <<< _Newtype

_podIP :: forall s a r r'. Newtype s { podIP :: r | r' } => Newtype r a => Lens' s a
_podIP = _Newtype <<< prop (SProxy :: SProxy "podIP") <<< _Newtype

_podManagementPolicy :: forall s a r r'. Newtype s { podManagementPolicy :: r | r' } => Newtype r a => Lens' s a
_podManagementPolicy = _Newtype <<< prop (SProxy :: SProxy "podManagementPolicy") <<< _Newtype

_podSelector :: forall s a r r'. Newtype s { podSelector :: r | r' } => Newtype r a => Lens' s a
_podSelector = _Newtype <<< prop (SProxy :: SProxy "podSelector") <<< _Newtype

_pods :: forall s a r r'. Newtype s { pods :: r | r' } => Newtype r a => Lens' s a
_pods = _Newtype <<< prop (SProxy :: SProxy "pods") <<< _Newtype

_policyTypes :: forall s a r r'. Newtype s { policyTypes :: r | r' } => Newtype r a => Lens' s a
_policyTypes = _Newtype <<< prop (SProxy :: SProxy "policyTypes") <<< _Newtype

_pool :: forall s a r r'. Newtype s { pool :: r | r' } => Newtype r a => Lens' s a
_pool = _Newtype <<< prop (SProxy :: SProxy "pool") <<< _Newtype

_port :: forall s a r r'. Newtype s { port :: r | r' } => Newtype r a => Lens' s a
_port = _Newtype <<< prop (SProxy :: SProxy "port") <<< _Newtype

_portals :: forall s a r r'. Newtype s { portals :: r | r' } => Newtype r a => Lens' s a
_portals = _Newtype <<< prop (SProxy :: SProxy "portals") <<< _Newtype

_ports :: forall s a r r'. Newtype s { ports :: r | r' } => Newtype r a => Lens' s a
_ports = _Newtype <<< prop (SProxy :: SProxy "ports") <<< _Newtype

_portworxVolume :: forall s a r r'. Newtype s { portworxVolume :: r | r' } => Newtype r a => Lens' s a
_portworxVolume = _Newtype <<< prop (SProxy :: SProxy "portworxVolume") <<< _Newtype

_postStart :: forall s a r r'. Newtype s { postStart :: r | r' } => Newtype r a => Lens' s a
_postStart = _Newtype <<< prop (SProxy :: SProxy "postStart") <<< _Newtype

_preStop :: forall s a r r'. Newtype s { preStop :: r | r' } => Newtype r a => Lens' s a
_preStop = _Newtype <<< prop (SProxy :: SProxy "preStop") <<< _Newtype

_preconditions :: forall s a r r'. Newtype s { preconditions :: r | r' } => Newtype r a => Lens' s a
_preconditions = _Newtype <<< prop (SProxy :: SProxy "preconditions") <<< _Newtype

_preference :: forall s a r r'. Newtype s { preference :: r | r' } => Newtype r a => Lens' s a
_preference = _Newtype <<< prop (SProxy :: SProxy "preference") <<< _Newtype

_preferredDuringSchedulingIgnoredDuringExecution :: forall s a r r'. Newtype s { preferredDuringSchedulingIgnoredDuringExecution :: r | r' } => Newtype r a => Lens' s a
_preferredDuringSchedulingIgnoredDuringExecution = _Newtype <<< prop (SProxy :: SProxy "preferredDuringSchedulingIgnoredDuringExecution") <<< _Newtype

_preferredVersion :: forall s a r r'. Newtype s { preferredVersion :: r | r' } => Newtype r a => Lens' s a
_preferredVersion = _Newtype <<< prop (SProxy :: SProxy "preferredVersion") <<< _Newtype

_prefix :: forall s a r r'. Newtype s { prefix :: r | r' } => Newtype r a => Lens' s a
_prefix = _Newtype <<< prop (SProxy :: SProxy "prefix") <<< _Newtype

_priority :: forall s a r r'. Newtype s { priority :: r | r' } => Newtype r a => Lens' s a
_priority = _Newtype <<< prop (SProxy :: SProxy "priority") <<< _Newtype

_priorityClassName :: forall s a r r'. Newtype s { priorityClassName :: r | r' } => Newtype r a => Lens' s a
_priorityClassName = _Newtype <<< prop (SProxy :: SProxy "priorityClassName") <<< _Newtype

_privileged :: forall s a r r'. Newtype s { privileged :: r | r' } => Newtype r a => Lens' s a
_privileged = _Newtype <<< prop (SProxy :: SProxy "privileged") <<< _Newtype

_progressDeadlineSeconds :: forall s a r r'. Newtype s { progressDeadlineSeconds :: r | r' } => Newtype r a => Lens' s a
_progressDeadlineSeconds = _Newtype <<< prop (SProxy :: SProxy "progressDeadlineSeconds") <<< _Newtype

_projected :: forall s a r r'. Newtype s { projected :: r | r' } => Newtype r a => Lens' s a
_projected = _Newtype <<< prop (SProxy :: SProxy "projected") <<< _Newtype

_propagationPolicy :: forall s a r r'. Newtype s { propagationPolicy :: r | r' } => Newtype r a => Lens' s a
_propagationPolicy = _Newtype <<< prop (SProxy :: SProxy "propagationPolicy") <<< _Newtype

_properties :: forall s a r r'. Newtype s { properties :: r | r' } => Newtype r a => Lens' s a
_properties = _Newtype <<< prop (SProxy :: SProxy "properties") <<< _Newtype

_protectionDomain :: forall s a r r'. Newtype s { protectionDomain :: r | r' } => Newtype r a => Lens' s a
_protectionDomain = _Newtype <<< prop (SProxy :: SProxy "protectionDomain") <<< _Newtype

_protocol :: forall s a r r'. Newtype s { protocol :: r | r' } => Newtype r a => Lens' s a
_protocol = _Newtype <<< prop (SProxy :: SProxy "protocol") <<< _Newtype

_providerID :: forall s a r r'. Newtype s { providerID :: r | r' } => Newtype r a => Lens' s a
_providerID = _Newtype <<< prop (SProxy :: SProxy "providerID") <<< _Newtype

_provisioner :: forall s a r r'. Newtype s { provisioner :: r | r' } => Newtype r a => Lens' s a
_provisioner = _Newtype <<< prop (SProxy :: SProxy "provisioner") <<< _Newtype

_publishNotReadyAddresses :: forall s a r r'. Newtype s { publishNotReadyAddresses :: r | r' } => Newtype r a => Lens' s a
_publishNotReadyAddresses = _Newtype <<< prop (SProxy :: SProxy "publishNotReadyAddresses") <<< _Newtype

_qosClass :: forall s a r r'. Newtype s { qosClass :: r | r' } => Newtype r a => Lens' s a
_qosClass = _Newtype <<< prop (SProxy :: SProxy "qosClass") <<< _Newtype

_quobyte :: forall s a r r'. Newtype s { quobyte :: r | r' } => Newtype r a => Lens' s a
_quobyte = _Newtype <<< prop (SProxy :: SProxy "quobyte") <<< _Newtype

_ranges :: forall s a r r'. Newtype s { ranges :: r | r' } => Newtype r a => Lens' s a
_ranges = _Newtype <<< prop (SProxy :: SProxy "ranges") <<< _Newtype

_rbd :: forall s a r r'. Newtype s { rbd :: r | r' } => Newtype r a => Lens' s a
_rbd = _Newtype <<< prop (SProxy :: SProxy "rbd") <<< _Newtype

_readOnly :: forall s a r r'. Newtype s { readOnly :: r | r' } => Newtype r a => Lens' s a
_readOnly = _Newtype <<< prop (SProxy :: SProxy "readOnly") <<< _Newtype

_readOnlyRootFilesystem :: forall s a r r'. Newtype s { readOnlyRootFilesystem :: r | r' } => Newtype r a => Lens' s a
_readOnlyRootFilesystem = _Newtype <<< prop (SProxy :: SProxy "readOnlyRootFilesystem") <<< _Newtype

_readinessProbe :: forall s a r r'. Newtype s { readinessProbe :: r | r' } => Newtype r a => Lens' s a
_readinessProbe = _Newtype <<< prop (SProxy :: SProxy "readinessProbe") <<< _Newtype

_ready :: forall s a r r'. Newtype s { ready :: r | r' } => Newtype r a => Lens' s a
_ready = _Newtype <<< prop (SProxy :: SProxy "ready") <<< _Newtype

_readyReplicas :: forall s a r r'. Newtype s { readyReplicas :: r | r' } => Newtype r a => Lens' s a
_readyReplicas = _Newtype <<< prop (SProxy :: SProxy "readyReplicas") <<< _Newtype

_reason :: forall s a r r'. Newtype s { reason :: r | r' } => Newtype r a => Lens' s a
_reason = _Newtype <<< prop (SProxy :: SProxy "reason") <<< _Newtype

_reclaimPolicy :: forall s a r r'. Newtype s { reclaimPolicy :: r | r' } => Newtype r a => Lens' s a
_reclaimPolicy = _Newtype <<< prop (SProxy :: SProxy "reclaimPolicy") <<< _Newtype

_regarding :: forall s a r r'. Newtype s { regarding :: r | r' } => Newtype r a => Lens' s a
_regarding = _Newtype <<< prop (SProxy :: SProxy "regarding") <<< _Newtype

_registry :: forall s a r r'. Newtype s { registry :: r | r' } => Newtype r a => Lens' s a
_registry = _Newtype <<< prop (SProxy :: SProxy "registry") <<< _Newtype

_related :: forall s a r r'. Newtype s { related :: r | r' } => Newtype r a => Lens' s a
_related = _Newtype <<< prop (SProxy :: SProxy "related") <<< _Newtype

_replicas :: forall s a r r'. Newtype s { replicas :: r | r' } => Newtype r a => Lens' s a
_replicas = _Newtype <<< prop (SProxy :: SProxy "replicas") <<< _Newtype

_reportingComponent :: forall s a r r'. Newtype s { reportingComponent :: r | r' } => Newtype r a => Lens' s a
_reportingComponent = _Newtype <<< prop (SProxy :: SProxy "reportingComponent") <<< _Newtype

_reportingController :: forall s a r r'. Newtype s { reportingController :: r | r' } => Newtype r a => Lens' s a
_reportingController = _Newtype <<< prop (SProxy :: SProxy "reportingController") <<< _Newtype

_reportingInstance :: forall s a r r'. Newtype s { reportingInstance :: r | r' } => Newtype r a => Lens' s a
_reportingInstance = _Newtype <<< prop (SProxy :: SProxy "reportingInstance") <<< _Newtype

_repository :: forall s a r r'. Newtype s { repository :: r | r' } => Newtype r a => Lens' s a
_repository = _Newtype <<< prop (SProxy :: SProxy "repository") <<< _Newtype

_request :: forall s a r r'. Newtype s { request :: r | r' } => Newtype r a => Lens' s a
_request = _Newtype <<< prop (SProxy :: SProxy "request") <<< _Newtype

_requests :: forall s a r r'. Newtype s { requests :: r | r' } => Newtype r a => Lens' s a
_requests = _Newtype <<< prop (SProxy :: SProxy "requests") <<< _Newtype

_required :: forall s a r r'. Newtype s { required :: r | r' } => Newtype r a => Lens' s a
_required = _Newtype <<< prop (SProxy :: SProxy "required") <<< _Newtype

_requiredDropCapabilities :: forall s a r r'. Newtype s { requiredDropCapabilities :: r | r' } => Newtype r a => Lens' s a
_requiredDropCapabilities = _Newtype <<< prop (SProxy :: SProxy "requiredDropCapabilities") <<< _Newtype

_requiredDuringSchedulingIgnoredDuringExecution :: forall s a r r'. Newtype s { requiredDuringSchedulingIgnoredDuringExecution :: r | r' } => Newtype r a => Lens' s a
_requiredDuringSchedulingIgnoredDuringExecution = _Newtype <<< prop (SProxy :: SProxy "requiredDuringSchedulingIgnoredDuringExecution") <<< _Newtype

_resource :: forall s a r r'. Newtype s { resource :: r | r' } => Newtype r a => Lens' s a
_resource = _Newtype <<< prop (SProxy :: SProxy "resource") <<< _Newtype

_resourceAttributes :: forall s a r r'. Newtype s { resourceAttributes :: r | r' } => Newtype r a => Lens' s a
_resourceAttributes = _Newtype <<< prop (SProxy :: SProxy "resourceAttributes") <<< _Newtype

_resourceFieldRef :: forall s a r r'. Newtype s { resourceFieldRef :: r | r' } => Newtype r a => Lens' s a
_resourceFieldRef = _Newtype <<< prop (SProxy :: SProxy "resourceFieldRef") <<< _Newtype

_resourceNames :: forall s a r r'. Newtype s { resourceNames :: r | r' } => Newtype r a => Lens' s a
_resourceNames = _Newtype <<< prop (SProxy :: SProxy "resourceNames") <<< _Newtype

_resourceRules :: forall s a r r'. Newtype s { resourceRules :: r | r' } => Newtype r a => Lens' s a
_resourceRules = _Newtype <<< prop (SProxy :: SProxy "resourceRules") <<< _Newtype

_resourceVersion :: forall s a r r'. Newtype s { resourceVersion :: r | r' } => Newtype r a => Lens' s a
_resourceVersion = _Newtype <<< prop (SProxy :: SProxy "resourceVersion") <<< _Newtype

_resources :: forall s a r r'. Newtype s { resources :: r | r' } => Newtype r a => Lens' s a
_resources = _Newtype <<< prop (SProxy :: SProxy "resources") <<< _Newtype

_restartCount :: forall s a r r'. Newtype s { restartCount :: r | r' } => Newtype r a => Lens' s a
_restartCount = _Newtype <<< prop (SProxy :: SProxy "restartCount") <<< _Newtype

_restartPolicy :: forall s a r r'. Newtype s { restartPolicy :: r | r' } => Newtype r a => Lens' s a
_restartPolicy = _Newtype <<< prop (SProxy :: SProxy "restartPolicy") <<< _Newtype

_result :: forall s a r r'. Newtype s { result :: r | r' } => Newtype r a => Lens' s a
_result = _Newtype <<< prop (SProxy :: SProxy "result") <<< _Newtype

_retryAfterSeconds :: forall s a r r'. Newtype s { retryAfterSeconds :: r | r' } => Newtype r a => Lens' s a
_retryAfterSeconds = _Newtype <<< prop (SProxy :: SProxy "retryAfterSeconds") <<< _Newtype

_revision :: forall s a r r'. Newtype s { revision :: r | r' } => Newtype r a => Lens' s a
_revision = _Newtype <<< prop (SProxy :: SProxy "revision") <<< _Newtype

_revisionHistoryLimit :: forall s a r r'. Newtype s { revisionHistoryLimit :: r | r' } => Newtype r a => Lens' s a
_revisionHistoryLimit = _Newtype <<< prop (SProxy :: SProxy "revisionHistoryLimit") <<< _Newtype

_role :: forall s a r r'. Newtype s { role :: r | r' } => Newtype r a => Lens' s a
_role = _Newtype <<< prop (SProxy :: SProxy "role") <<< _Newtype

_roleRef :: forall s a r r'. Newtype s { roleRef :: r | r' } => Newtype r a => Lens' s a
_roleRef = _Newtype <<< prop (SProxy :: SProxy "roleRef") <<< _Newtype

_rollbackTo :: forall s a r r'. Newtype s { rollbackTo :: r | r' } => Newtype r a => Lens' s a
_rollbackTo = _Newtype <<< prop (SProxy :: SProxy "rollbackTo") <<< _Newtype

_rollingUpdate :: forall s a r r'. Newtype s { rollingUpdate :: r | r' } => Newtype r a => Lens' s a
_rollingUpdate = _Newtype <<< prop (SProxy :: SProxy "rollingUpdate") <<< _Newtype

_rule :: forall s a r r'. Newtype s { rule :: r | r' } => Newtype r a => Lens' s a
_rule = _Newtype <<< prop (SProxy :: SProxy "rule") <<< _Newtype

_rules :: forall s a r r'. Newtype s { rules :: r | r' } => Newtype r a => Lens' s a
_rules = _Newtype <<< prop (SProxy :: SProxy "rules") <<< _Newtype

_runAsNonRoot :: forall s a r r'. Newtype s { runAsNonRoot :: r | r' } => Newtype r a => Lens' s a
_runAsNonRoot = _Newtype <<< prop (SProxy :: SProxy "runAsNonRoot") <<< _Newtype

_runAsUser :: forall s a r r'. Newtype s { runAsUser :: r | r' } => Newtype r a => Lens' s a
_runAsUser = _Newtype <<< prop (SProxy :: SProxy "runAsUser") <<< _Newtype

_running :: forall s a r r'. Newtype s { running :: r | r' } => Newtype r a => Lens' s a
_running = _Newtype <<< prop (SProxy :: SProxy "running") <<< _Newtype

_scaleIO :: forall s a r r'. Newtype s { scaleIO :: r | r' } => Newtype r a => Lens' s a
_scaleIO = _Newtype <<< prop (SProxy :: SProxy "scaleIO") <<< _Newtype

_scaleTargetRef :: forall s a r r'. Newtype s { scaleTargetRef :: r | r' } => Newtype r a => Lens' s a
_scaleTargetRef = _Newtype <<< prop (SProxy :: SProxy "scaleTargetRef") <<< _Newtype

_schedule :: forall s a r r'. Newtype s { schedule :: r | r' } => Newtype r a => Lens' s a
_schedule = _Newtype <<< prop (SProxy :: SProxy "schedule") <<< _Newtype

_schedulerName :: forall s a r r'. Newtype s { schedulerName :: r | r' } => Newtype r a => Lens' s a
_schedulerName = _Newtype <<< prop (SProxy :: SProxy "schedulerName") <<< _Newtype

_scheme :: forall s a r r'. Newtype s { scheme :: r | r' } => Newtype r a => Lens' s a
_scheme = _Newtype <<< prop (SProxy :: SProxy "scheme") <<< _Newtype

_scope :: forall s a r r'. Newtype s { scope :: r | r' } => Newtype r a => Lens' s a
_scope = _Newtype <<< prop (SProxy :: SProxy "scope") <<< _Newtype

_scopes :: forall s a r r'. Newtype s { scopes :: r | r' } => Newtype r a => Lens' s a
_scopes = _Newtype <<< prop (SProxy :: SProxy "scopes") <<< _Newtype

_seLinux :: forall s a r r'. Newtype s { seLinux :: r | r' } => Newtype r a => Lens' s a
_seLinux = _Newtype <<< prop (SProxy :: SProxy "seLinux") <<< _Newtype

_seLinuxOptions :: forall s a r r'. Newtype s { seLinuxOptions :: r | r' } => Newtype r a => Lens' s a
_seLinuxOptions = _Newtype <<< prop (SProxy :: SProxy "seLinuxOptions") <<< _Newtype

_searches :: forall s a r r'. Newtype s { searches :: r | r' } => Newtype r a => Lens' s a
_searches = _Newtype <<< prop (SProxy :: SProxy "searches") <<< _Newtype

_secret :: forall s a r r'. Newtype s { secret :: r | r' } => Newtype r a => Lens' s a
_secret = _Newtype <<< prop (SProxy :: SProxy "secret") <<< _Newtype

_secretFile :: forall s a r r'. Newtype s { secretFile :: r | r' } => Newtype r a => Lens' s a
_secretFile = _Newtype <<< prop (SProxy :: SProxy "secretFile") <<< _Newtype

_secretKeyRef :: forall s a r r'. Newtype s { secretKeyRef :: r | r' } => Newtype r a => Lens' s a
_secretKeyRef = _Newtype <<< prop (SProxy :: SProxy "secretKeyRef") <<< _Newtype

_secretName :: forall s a r r'. Newtype s { secretName :: r | r' } => Newtype r a => Lens' s a
_secretName = _Newtype <<< prop (SProxy :: SProxy "secretName") <<< _Newtype

_secretNamespace :: forall s a r r'. Newtype s { secretNamespace :: r | r' } => Newtype r a => Lens' s a
_secretNamespace = _Newtype <<< prop (SProxy :: SProxy "secretNamespace") <<< _Newtype

_secretRef :: forall s a r r'. Newtype s { secretRef :: r | r' } => Newtype r a => Lens' s a
_secretRef = _Newtype <<< prop (SProxy :: SProxy "secretRef") <<< _Newtype

_secrets :: forall s a r r'. Newtype s { secrets :: r | r' } => Newtype r a => Lens' s a
_secrets = _Newtype <<< prop (SProxy :: SProxy "secrets") <<< _Newtype

_securityContext :: forall s a r r'. Newtype s { securityContext :: r | r' } => Newtype r a => Lens' s a
_securityContext = _Newtype <<< prop (SProxy :: SProxy "securityContext") <<< _Newtype

_selector :: forall s a r r'. Newtype s { selector :: r | r' } => Newtype r a => Lens' s a
_selector = _Newtype <<< prop (SProxy :: SProxy "selector") <<< _Newtype

_selfLink :: forall s a r r'. Newtype s { selfLink :: r | r' } => Newtype r a => Lens' s a
_selfLink = _Newtype <<< prop (SProxy :: SProxy "selfLink") <<< _Newtype

_series :: forall s a r r'. Newtype s { series :: r | r' } => Newtype r a => Lens' s a
_series = _Newtype <<< prop (SProxy :: SProxy "series") <<< _Newtype

_server :: forall s a r r'. Newtype s { server :: r | r' } => Newtype r a => Lens' s a
_server = _Newtype <<< prop (SProxy :: SProxy "server") <<< _Newtype

_serverAddress :: forall s a r r'. Newtype s { serverAddress :: r | r' } => Newtype r a => Lens' s a
_serverAddress = _Newtype <<< prop (SProxy :: SProxy "serverAddress") <<< _Newtype

_serverAddressByClientCIDRs :: forall s a r r'. Newtype s { serverAddressByClientCIDRs :: r | r' } => Newtype r a => Lens' s a
_serverAddressByClientCIDRs = _Newtype <<< prop (SProxy :: SProxy "serverAddressByClientCIDRs") <<< _Newtype

_service :: forall s a r r'. Newtype s { service :: r | r' } => Newtype r a => Lens' s a
_service = _Newtype <<< prop (SProxy :: SProxy "service") <<< _Newtype

_serviceAccount :: forall s a r r'. Newtype s { serviceAccount :: r | r' } => Newtype r a => Lens' s a
_serviceAccount = _Newtype <<< prop (SProxy :: SProxy "serviceAccount") <<< _Newtype

_serviceAccountName :: forall s a r r'. Newtype s { serviceAccountName :: r | r' } => Newtype r a => Lens' s a
_serviceAccountName = _Newtype <<< prop (SProxy :: SProxy "serviceAccountName") <<< _Newtype

_serviceName :: forall s a r r'. Newtype s { serviceName :: r | r' } => Newtype r a => Lens' s a
_serviceName = _Newtype <<< prop (SProxy :: SProxy "serviceName") <<< _Newtype

_servicePort :: forall s a r r'. Newtype s { servicePort :: r | r' } => Newtype r a => Lens' s a
_servicePort = _Newtype <<< prop (SProxy :: SProxy "servicePort") <<< _Newtype

_sessionAffinity :: forall s a r r'. Newtype s { sessionAffinity :: r | r' } => Newtype r a => Lens' s a
_sessionAffinity = _Newtype <<< prop (SProxy :: SProxy "sessionAffinity") <<< _Newtype

_sessionAffinityConfig :: forall s a r r'. Newtype s { sessionAffinityConfig :: r | r' } => Newtype r a => Lens' s a
_sessionAffinityConfig = _Newtype <<< prop (SProxy :: SProxy "sessionAffinityConfig") <<< _Newtype

_shareName :: forall s a r r'. Newtype s { shareName :: r | r' } => Newtype r a => Lens' s a
_shareName = _Newtype <<< prop (SProxy :: SProxy "shareName") <<< _Newtype

_shortNames :: forall s a r r'. Newtype s { shortNames :: r | r' } => Newtype r a => Lens' s a
_shortNames = _Newtype <<< prop (SProxy :: SProxy "shortNames") <<< _Newtype

_signal :: forall s a r r'. Newtype s { signal :: r | r' } => Newtype r a => Lens' s a
_signal = _Newtype <<< prop (SProxy :: SProxy "signal") <<< _Newtype

_singular :: forall s a r r'. Newtype s { singular :: r | r' } => Newtype r a => Lens' s a
_singular = _Newtype <<< prop (SProxy :: SProxy "singular") <<< _Newtype

_singularName :: forall s a r r'. Newtype s { singularName :: r | r' } => Newtype r a => Lens' s a
_singularName = _Newtype <<< prop (SProxy :: SProxy "singularName") <<< _Newtype

_sizeBytes :: forall s a r r'. Newtype s { sizeBytes :: r | r' } => Newtype r a => Lens' s a
_sizeBytes = _Newtype <<< prop (SProxy :: SProxy "sizeBytes") <<< _Newtype

_sizeLimit :: forall s a r r'. Newtype s { sizeLimit :: r | r' } => Newtype r a => Lens' s a
_sizeLimit = _Newtype <<< prop (SProxy :: SProxy "sizeLimit") <<< _Newtype

_source :: forall s a r r'. Newtype s { source :: r | r' } => Newtype r a => Lens' s a
_source = _Newtype <<< prop (SProxy :: SProxy "source") <<< _Newtype

_sources :: forall s a r r'. Newtype s { sources :: r | r' } => Newtype r a => Lens' s a
_sources = _Newtype <<< prop (SProxy :: SProxy "sources") <<< _Newtype

_spec :: forall s a r r'. Newtype s { spec :: r | r' } => Newtype r a => Lens' s a
_spec = _Newtype <<< prop (SProxy :: SProxy "spec") <<< _Newtype

_sslEnabled :: forall s a r r'. Newtype s { sslEnabled :: r | r' } => Newtype r a => Lens' s a
_sslEnabled = _Newtype <<< prop (SProxy :: SProxy "sslEnabled") <<< _Newtype

_startTime :: forall s a r r'. Newtype s { startTime :: r | r' } => Newtype r a => Lens' s a
_startTime = _Newtype <<< prop (SProxy :: SProxy "startTime") <<< _Newtype

_startedAt :: forall s a r r'. Newtype s { startedAt :: r | r' } => Newtype r a => Lens' s a
_startedAt = _Newtype <<< prop (SProxy :: SProxy "startedAt") <<< _Newtype

_startingDeadlineSeconds :: forall s a r r'. Newtype s { startingDeadlineSeconds :: r | r' } => Newtype r a => Lens' s a
_startingDeadlineSeconds = _Newtype <<< prop (SProxy :: SProxy "startingDeadlineSeconds") <<< _Newtype

_state :: forall s a r r'. Newtype s { state :: r | r' } => Newtype r a => Lens' s a
_state = _Newtype <<< prop (SProxy :: SProxy "state") <<< _Newtype

_status :: forall s a r r'. Newtype s { status :: r | r' } => Newtype r a => Lens' s a
_status = _Newtype <<< prop (SProxy :: SProxy "status") <<< _Newtype

_stdin :: forall s a r r'. Newtype s { stdin :: r | r' } => Newtype r a => Lens' s a
_stdin = _Newtype <<< prop (SProxy :: SProxy "stdin") <<< _Newtype

_stdinOnce :: forall s a r r'. Newtype s { stdinOnce :: r | r' } => Newtype r a => Lens' s a
_stdinOnce = _Newtype <<< prop (SProxy :: SProxy "stdinOnce") <<< _Newtype

_storageClassName :: forall s a r r'. Newtype s { storageClassName :: r | r' } => Newtype r a => Lens' s a
_storageClassName = _Newtype <<< prop (SProxy :: SProxy "storageClassName") <<< _Newtype

_storageMode :: forall s a r r'. Newtype s { storageMode :: r | r' } => Newtype r a => Lens' s a
_storageMode = _Newtype <<< prop (SProxy :: SProxy "storageMode") <<< _Newtype

_storagePolicyID :: forall s a r r'. Newtype s { storagePolicyID :: r | r' } => Newtype r a => Lens' s a
_storagePolicyID = _Newtype <<< prop (SProxy :: SProxy "storagePolicyID") <<< _Newtype

_storagePolicyName :: forall s a r r'. Newtype s { storagePolicyName :: r | r' } => Newtype r a => Lens' s a
_storagePolicyName = _Newtype <<< prop (SProxy :: SProxy "storagePolicyName") <<< _Newtype

_storagePool :: forall s a r r'. Newtype s { storagePool :: r | r' } => Newtype r a => Lens' s a
_storagePool = _Newtype <<< prop (SProxy :: SProxy "storagePool") <<< _Newtype

_storageos :: forall s a r r'. Newtype s { storageos :: r | r' } => Newtype r a => Lens' s a
_storageos = _Newtype <<< prop (SProxy :: SProxy "storageos") <<< _Newtype

_strategy :: forall s a r r'. Newtype s { strategy :: r | r' } => Newtype r a => Lens' s a
_strategy = _Newtype <<< prop (SProxy :: SProxy "strategy") <<< _Newtype

_stringData :: forall s a r r'. Newtype s { stringData :: r | r' } => Newtype r a => Lens' s a
_stringData = _Newtype <<< prop (SProxy :: SProxy "stringData") <<< _Newtype

_subPath :: forall s a r r'. Newtype s { subPath :: r | r' } => Newtype r a => Lens' s a
_subPath = _Newtype <<< prop (SProxy :: SProxy "subPath") <<< _Newtype

_subdomain :: forall s a r r'. Newtype s { subdomain :: r | r' } => Newtype r a => Lens' s a
_subdomain = _Newtype <<< prop (SProxy :: SProxy "subdomain") <<< _Newtype

_subjects :: forall s a r r'. Newtype s { subjects :: r | r' } => Newtype r a => Lens' s a
_subjects = _Newtype <<< prop (SProxy :: SProxy "subjects") <<< _Newtype

_subresource :: forall s a r r'. Newtype s { subresource :: r | r' } => Newtype r a => Lens' s a
_subresource = _Newtype <<< prop (SProxy :: SProxy "subresource") <<< _Newtype

_subsets :: forall s a r r'. Newtype s { subsets :: r | r' } => Newtype r a => Lens' s a
_subsets = _Newtype <<< prop (SProxy :: SProxy "subsets") <<< _Newtype

_succeeded :: forall s a r r'. Newtype s { succeeded :: r | r' } => Newtype r a => Lens' s a
_succeeded = _Newtype <<< prop (SProxy :: SProxy "succeeded") <<< _Newtype

_successThreshold :: forall s a r r'. Newtype s { successThreshold :: r | r' } => Newtype r a => Lens' s a
_successThreshold = _Newtype <<< prop (SProxy :: SProxy "successThreshold") <<< _Newtype

_successfulJobsHistoryLimit :: forall s a r r'. Newtype s { successfulJobsHistoryLimit :: r | r' } => Newtype r a => Lens' s a
_successfulJobsHistoryLimit = _Newtype <<< prop (SProxy :: SProxy "successfulJobsHistoryLimit") <<< _Newtype

_supplementalGroups :: forall s a r r'. Newtype s { supplementalGroups :: r | r' } => Newtype r a => Lens' s a
_supplementalGroups = _Newtype <<< prop (SProxy :: SProxy "supplementalGroups") <<< _Newtype

_suspend :: forall s a r r'. Newtype s { suspend :: r | r' } => Newtype r a => Lens' s a
_suspend = _Newtype <<< prop (SProxy :: SProxy "suspend") <<< _Newtype

_system :: forall s a r r'. Newtype s { system :: r | r' } => Newtype r a => Lens' s a
_system = _Newtype <<< prop (SProxy :: SProxy "system") <<< _Newtype

_systemUUID :: forall s a r r'. Newtype s { systemUUID :: r | r' } => Newtype r a => Lens' s a
_systemUUID = _Newtype <<< prop (SProxy :: SProxy "systemUUID") <<< _Newtype

_taints :: forall s a r r'. Newtype s { taints :: r | r' } => Newtype r a => Lens' s a
_taints = _Newtype <<< prop (SProxy :: SProxy "taints") <<< _Newtype

_target :: forall s a r r'. Newtype s { target :: r | r' } => Newtype r a => Lens' s a
_target = _Newtype <<< prop (SProxy :: SProxy "target") <<< _Newtype

_targetAverageUtilization :: forall s a r r'. Newtype s { targetAverageUtilization :: r | r' } => Newtype r a => Lens' s a
_targetAverageUtilization = _Newtype <<< prop (SProxy :: SProxy "targetAverageUtilization") <<< _Newtype

_targetAverageValue :: forall s a r r'. Newtype s { targetAverageValue :: r | r' } => Newtype r a => Lens' s a
_targetAverageValue = _Newtype <<< prop (SProxy :: SProxy "targetAverageValue") <<< _Newtype

_targetCPUUtilizationPercentage :: forall s a r r'. Newtype s { targetCPUUtilizationPercentage :: r | r' } => Newtype r a => Lens' s a
_targetCPUUtilizationPercentage = _Newtype <<< prop (SProxy :: SProxy "targetCPUUtilizationPercentage") <<< _Newtype

_targetPort :: forall s a r r'. Newtype s { targetPort :: r | r' } => Newtype r a => Lens' s a
_targetPort = _Newtype <<< prop (SProxy :: SProxy "targetPort") <<< _Newtype

_targetPortal :: forall s a r r'. Newtype s { targetPortal :: r | r' } => Newtype r a => Lens' s a
_targetPortal = _Newtype <<< prop (SProxy :: SProxy "targetPortal") <<< _Newtype

_targetRef :: forall s a r r'. Newtype s { targetRef :: r | r' } => Newtype r a => Lens' s a
_targetRef = _Newtype <<< prop (SProxy :: SProxy "targetRef") <<< _Newtype

_targetSelector :: forall s a r r'. Newtype s { targetSelector :: r | r' } => Newtype r a => Lens' s a
_targetSelector = _Newtype <<< prop (SProxy :: SProxy "targetSelector") <<< _Newtype

_targetValue :: forall s a r r'. Newtype s { targetValue :: r | r' } => Newtype r a => Lens' s a
_targetValue = _Newtype <<< prop (SProxy :: SProxy "targetValue") <<< _Newtype

_targetWWNs :: forall s a r r'. Newtype s { targetWWNs :: r | r' } => Newtype r a => Lens' s a
_targetWWNs = _Newtype <<< prop (SProxy :: SProxy "targetWWNs") <<< _Newtype

_tcpSocket :: forall s a r r'. Newtype s { tcpSocket :: r | r' } => Newtype r a => Lens' s a
_tcpSocket = _Newtype <<< prop (SProxy :: SProxy "tcpSocket") <<< _Newtype

_template :: forall s a r r'. Newtype s { template :: r | r' } => Newtype r a => Lens' s a
_template = _Newtype <<< prop (SProxy :: SProxy "template") <<< _Newtype

_templateGeneration :: forall s a r r'. Newtype s { templateGeneration :: r | r' } => Newtype r a => Lens' s a
_templateGeneration = _Newtype <<< prop (SProxy :: SProxy "templateGeneration") <<< _Newtype

_terminated :: forall s a r r'. Newtype s { terminated :: r | r' } => Newtype r a => Lens' s a
_terminated = _Newtype <<< prop (SProxy :: SProxy "terminated") <<< _Newtype

_terminationGracePeriodSeconds :: forall s a r r'. Newtype s { terminationGracePeriodSeconds :: r | r' } => Newtype r a => Lens' s a
_terminationGracePeriodSeconds = _Newtype <<< prop (SProxy :: SProxy "terminationGracePeriodSeconds") <<< _Newtype

_terminationMessagePath :: forall s a r r'. Newtype s { terminationMessagePath :: r | r' } => Newtype r a => Lens' s a
_terminationMessagePath = _Newtype <<< prop (SProxy :: SProxy "terminationMessagePath") <<< _Newtype

_terminationMessagePolicy :: forall s a r r'. Newtype s { terminationMessagePolicy :: r | r' } => Newtype r a => Lens' s a
_terminationMessagePolicy = _Newtype <<< prop (SProxy :: SProxy "terminationMessagePolicy") <<< _Newtype

_time :: forall s a r r'. Newtype s { time :: r | r' } => Newtype r a => Lens' s a
_time = _Newtype <<< prop (SProxy :: SProxy "time") <<< _Newtype

_timeAdded :: forall s a r r'. Newtype s { timeAdded :: r | r' } => Newtype r a => Lens' s a
_timeAdded = _Newtype <<< prop (SProxy :: SProxy "timeAdded") <<< _Newtype

_timeoutSeconds :: forall s a r r'. Newtype s { timeoutSeconds :: r | r' } => Newtype r a => Lens' s a
_timeoutSeconds = _Newtype <<< prop (SProxy :: SProxy "timeoutSeconds") <<< _Newtype

_title :: forall s a r r'. Newtype s { title :: r | r' } => Newtype r a => Lens' s a
_title = _Newtype <<< prop (SProxy :: SProxy "title") <<< _Newtype

_tls :: forall s a r r'. Newtype s { tls :: r | r' } => Newtype r a => Lens' s a
_tls = _Newtype <<< prop (SProxy :: SProxy "tls") <<< _Newtype

_to :: forall s a r r'. Newtype s { to :: r | r' } => Newtype r a => Lens' s a
_to = _Newtype <<< prop (SProxy :: SProxy "to") <<< _Newtype

_token :: forall s a r r'. Newtype s { token :: r | r' } => Newtype r a => Lens' s a
_token = _Newtype <<< prop (SProxy :: SProxy "token") <<< _Newtype

_tolerationSeconds :: forall s a r r'. Newtype s { tolerationSeconds :: r | r' } => Newtype r a => Lens' s a
_tolerationSeconds = _Newtype <<< prop (SProxy :: SProxy "tolerationSeconds") <<< _Newtype

_tolerations :: forall s a r r'. Newtype s { tolerations :: r | r' } => Newtype r a => Lens' s a
_tolerations = _Newtype <<< prop (SProxy :: SProxy "tolerations") <<< _Newtype

_topologyKey :: forall s a r r'. Newtype s { topologyKey :: r | r' } => Newtype r a => Lens' s a
_topologyKey = _Newtype <<< prop (SProxy :: SProxy "topologyKey") <<< _Newtype

_tty :: forall s a r r'. Newtype s { tty :: r | r' } => Newtype r a => Lens' s a
_tty = _Newtype <<< prop (SProxy :: SProxy "tty") <<< _Newtype

_uid :: forall s a r r'. Newtype s { uid :: r | r' } => Newtype r a => Lens' s a
_uid = _Newtype <<< prop (SProxy :: SProxy "uid") <<< _Newtype

_unavailableReplicas :: forall s a r r'. Newtype s { unavailableReplicas :: r | r' } => Newtype r a => Lens' s a
_unavailableReplicas = _Newtype <<< prop (SProxy :: SProxy "unavailableReplicas") <<< _Newtype

_uniqueItems :: forall s a r r'. Newtype s { uniqueItems :: r | r' } => Newtype r a => Lens' s a
_uniqueItems = _Newtype <<< prop (SProxy :: SProxy "uniqueItems") <<< _Newtype

_unschedulable :: forall s a r r'. Newtype s { unschedulable :: r | r' } => Newtype r a => Lens' s a
_unschedulable = _Newtype <<< prop (SProxy :: SProxy "unschedulable") <<< _Newtype

_updateRevision :: forall s a r r'. Newtype s { updateRevision :: r | r' } => Newtype r a => Lens' s a
_updateRevision = _Newtype <<< prop (SProxy :: SProxy "updateRevision") <<< _Newtype

_updateStrategy :: forall s a r r'. Newtype s { updateStrategy :: r | r' } => Newtype r a => Lens' s a
_updateStrategy = _Newtype <<< prop (SProxy :: SProxy "updateStrategy") <<< _Newtype

_updatedAnnotations :: forall s a r r'. Newtype s { updatedAnnotations :: r | r' } => Newtype r a => Lens' s a
_updatedAnnotations = _Newtype <<< prop (SProxy :: SProxy "updatedAnnotations") <<< _Newtype

_updatedNumberScheduled :: forall s a r r'. Newtype s { updatedNumberScheduled :: r | r' } => Newtype r a => Lens' s a
_updatedNumberScheduled = _Newtype <<< prop (SProxy :: SProxy "updatedNumberScheduled") <<< _Newtype

_updatedReplicas :: forall s a r r'. Newtype s { updatedReplicas :: r | r' } => Newtype r a => Lens' s a
_updatedReplicas = _Newtype <<< prop (SProxy :: SProxy "updatedReplicas") <<< _Newtype

_url :: forall s a r r'. Newtype s { url :: r | r' } => Newtype r a => Lens' s a
_url = _Newtype <<< prop (SProxy :: SProxy "url") <<< _Newtype

_usages :: forall s a r r'. Newtype s { usages :: r | r' } => Newtype r a => Lens' s a
_usages = _Newtype <<< prop (SProxy :: SProxy "usages") <<< _Newtype

_used :: forall s a r r'. Newtype s { used :: r | r' } => Newtype r a => Lens' s a
_used = _Newtype <<< prop (SProxy :: SProxy "used") <<< _Newtype

_user :: forall s a r r'. Newtype s { user :: r | r' } => Newtype r a => Lens' s a
_user = _Newtype <<< prop (SProxy :: SProxy "user") <<< _Newtype

_username :: forall s a r r'. Newtype s { username :: r | r' } => Newtype r a => Lens' s a
_username = _Newtype <<< prop (SProxy :: SProxy "username") <<< _Newtype

_validation :: forall s a r r'. Newtype s { validation :: r | r' } => Newtype r a => Lens' s a
_validation = _Newtype <<< prop (SProxy :: SProxy "validation") <<< _Newtype

_value :: forall s a r r'. Newtype s { value :: r | r' } => Newtype r a => Lens' s a
_value = _Newtype <<< prop (SProxy :: SProxy "value") <<< _Newtype

_valueFrom :: forall s a r r'. Newtype s { valueFrom :: r | r' } => Newtype r a => Lens' s a
_valueFrom = _Newtype <<< prop (SProxy :: SProxy "valueFrom") <<< _Newtype

_values :: forall s a r r'. Newtype s { values :: r | r' } => Newtype r a => Lens' s a
_values = _Newtype <<< prop (SProxy :: SProxy "values") <<< _Newtype

_verb :: forall s a r r'. Newtype s { verb :: r | r' } => Newtype r a => Lens' s a
_verb = _Newtype <<< prop (SProxy :: SProxy "verb") <<< _Newtype

_verbs :: forall s a r r'. Newtype s { verbs :: r | r' } => Newtype r a => Lens' s a
_verbs = _Newtype <<< prop (SProxy :: SProxy "verbs") <<< _Newtype

_version :: forall s a r r'. Newtype s { version :: r | r' } => Newtype r a => Lens' s a
_version = _Newtype <<< prop (SProxy :: SProxy "version") <<< _Newtype

_versionPriority :: forall s a r r'. Newtype s { versionPriority :: r | r' } => Newtype r a => Lens' s a
_versionPriority = _Newtype <<< prop (SProxy :: SProxy "versionPriority") <<< _Newtype

_versions :: forall s a r r'. Newtype s { versions :: r | r' } => Newtype r a => Lens' s a
_versions = _Newtype <<< prop (SProxy :: SProxy "versions") <<< _Newtype

_volume :: forall s a r r'. Newtype s { volume :: r | r' } => Newtype r a => Lens' s a
_volume = _Newtype <<< prop (SProxy :: SProxy "volume") <<< _Newtype

_volumeBindingMode :: forall s a r r'. Newtype s { volumeBindingMode :: r | r' } => Newtype r a => Lens' s a
_volumeBindingMode = _Newtype <<< prop (SProxy :: SProxy "volumeBindingMode") <<< _Newtype

_volumeClaimTemplates :: forall s a r r'. Newtype s { volumeClaimTemplates :: r | r' } => Newtype r a => Lens' s a
_volumeClaimTemplates = _Newtype <<< prop (SProxy :: SProxy "volumeClaimTemplates") <<< _Newtype

_volumeDevices :: forall s a r r'. Newtype s { volumeDevices :: r | r' } => Newtype r a => Lens' s a
_volumeDevices = _Newtype <<< prop (SProxy :: SProxy "volumeDevices") <<< _Newtype

_volumeHandle :: forall s a r r'. Newtype s { volumeHandle :: r | r' } => Newtype r a => Lens' s a
_volumeHandle = _Newtype <<< prop (SProxy :: SProxy "volumeHandle") <<< _Newtype

_volumeID :: forall s a r r'. Newtype s { volumeID :: r | r' } => Newtype r a => Lens' s a
_volumeID = _Newtype <<< prop (SProxy :: SProxy "volumeID") <<< _Newtype

_volumeMode :: forall s a r r'. Newtype s { volumeMode :: r | r' } => Newtype r a => Lens' s a
_volumeMode = _Newtype <<< prop (SProxy :: SProxy "volumeMode") <<< _Newtype

_volumeMounts :: forall s a r r'. Newtype s { volumeMounts :: r | r' } => Newtype r a => Lens' s a
_volumeMounts = _Newtype <<< prop (SProxy :: SProxy "volumeMounts") <<< _Newtype

_volumeName :: forall s a r r'. Newtype s { volumeName :: r | r' } => Newtype r a => Lens' s a
_volumeName = _Newtype <<< prop (SProxy :: SProxy "volumeName") <<< _Newtype

_volumeNamespace :: forall s a r r'. Newtype s { volumeNamespace :: r | r' } => Newtype r a => Lens' s a
_volumeNamespace = _Newtype <<< prop (SProxy :: SProxy "volumeNamespace") <<< _Newtype

_volumePath :: forall s a r r'. Newtype s { volumePath :: r | r' } => Newtype r a => Lens' s a
_volumePath = _Newtype <<< prop (SProxy :: SProxy "volumePath") <<< _Newtype

_volumes :: forall s a r r'. Newtype s { volumes :: r | r' } => Newtype r a => Lens' s a
_volumes = _Newtype <<< prop (SProxy :: SProxy "volumes") <<< _Newtype

_volumesAttached :: forall s a r r'. Newtype s { volumesAttached :: r | r' } => Newtype r a => Lens' s a
_volumesAttached = _Newtype <<< prop (SProxy :: SProxy "volumesAttached") <<< _Newtype

_volumesInUse :: forall s a r r'. Newtype s { volumesInUse :: r | r' } => Newtype r a => Lens' s a
_volumesInUse = _Newtype <<< prop (SProxy :: SProxy "volumesInUse") <<< _Newtype

_vsphereVolume :: forall s a r r'. Newtype s { vsphereVolume :: r | r' } => Newtype r a => Lens' s a
_vsphereVolume = _Newtype <<< prop (SProxy :: SProxy "vsphereVolume") <<< _Newtype

_waiting :: forall s a r r'. Newtype s { waiting :: r | r' } => Newtype r a => Lens' s a
_waiting = _Newtype <<< prop (SProxy :: SProxy "waiting") <<< _Newtype

_webhooks :: forall s a r r'. Newtype s { webhooks :: r | r' } => Newtype r a => Lens' s a
_webhooks = _Newtype <<< prop (SProxy :: SProxy "webhooks") <<< _Newtype

_weight :: forall s a r r'. Newtype s { weight :: r | r' } => Newtype r a => Lens' s a
_weight = _Newtype <<< prop (SProxy :: SProxy "weight") <<< _Newtype

_workingDir :: forall s a r r'. Newtype s { workingDir :: r | r' } => Newtype r a => Lens' s a
_workingDir = _Newtype <<< prop (SProxy :: SProxy "workingDir") <<< _Newtype

_wwids :: forall s a r r'. Newtype s { wwids :: r | r' } => Newtype r a => Lens' s a
_wwids = _Newtype <<< prop (SProxy :: SProxy "wwids") <<< _Newtype