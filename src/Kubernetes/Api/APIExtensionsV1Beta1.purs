module Kubernetes.Api.APIExtensionsV1Beta1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | create a CustomResourceDefinition
createCustomResourceDefinition :: forall e. Config -> CustomResourceDefinition -> Aff (http :: HTTP | e) (Either MetaV1.Status CustomResourceDefinition)
createCustomResourceDefinition cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions"
    encodedBody = encodeJSON body

-- | DeleteCollectionCustomResourceDefinitionOptions
newtype DeleteCollectionCustomResourceDefinitionOptions = DeleteCollectionCustomResourceDefinitionOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionCustomResourceDefinitionOptions :: Newtype DeleteCollectionCustomResourceDefinitionOptions _
derive instance genericDeleteCollectionCustomResourceDefinitionOptions :: Generic DeleteCollectionCustomResourceDefinitionOptions _
instance showDeleteCollectionCustomResourceDefinitionOptions :: Show DeleteCollectionCustomResourceDefinitionOptions where show a = genericShow a
instance decodeDeleteCollectionCustomResourceDefinitionOptions :: Decode DeleteCollectionCustomResourceDefinitionOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionCustomResourceDefinitionOptions :: Encode DeleteCollectionCustomResourceDefinitionOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionCustomResourceDefinitionOptions :: Default DeleteCollectionCustomResourceDefinitionOptions where
  default = DeleteCollectionCustomResourceDefinitionOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of CustomResourceDefinition
deleteCollectionCustomResourceDefinition :: forall e. Config -> DeleteCollectionCustomResourceDefinitionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionCustomResourceDefinition cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions" <> formatQueryString options

-- | DeleteCustomResourceDefinitionOptions
newtype DeleteCustomResourceDefinitionOptions = DeleteCustomResourceDefinitionOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteCustomResourceDefinitionOptions :: Newtype DeleteCustomResourceDefinitionOptions _
derive instance genericDeleteCustomResourceDefinitionOptions :: Generic DeleteCustomResourceDefinitionOptions _
instance showDeleteCustomResourceDefinitionOptions :: Show DeleteCustomResourceDefinitionOptions where show a = genericShow a
instance decodeDeleteCustomResourceDefinitionOptions :: Decode DeleteCustomResourceDefinitionOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCustomResourceDefinitionOptions :: Encode DeleteCustomResourceDefinitionOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCustomResourceDefinitionOptions :: Default DeleteCustomResourceDefinitionOptions where
  default = DeleteCustomResourceDefinitionOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a CustomResourceDefinition
deleteCustomResourceDefinition :: forall e. Config -> MetaV1.DeleteOptions -> DeleteCustomResourceDefinitionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCustomResourceDefinition cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/"

-- | io.k8s.api.extensions.v1beta1.AllowedFlexVolume
-- | AllowedFlexVolume represents a single Flexvolume that is allowed to be used.
newtype AllowedFlexVolume = AllowedFlexVolume
  { driver :: (NullOrUndefined String) }

derive instance newtypeAllowedFlexVolume :: Newtype AllowedFlexVolume _
derive instance genericAllowedFlexVolume :: Generic AllowedFlexVolume _
instance showAllowedFlexVolume :: Show AllowedFlexVolume where show a = genericShow a
instance decodeAllowedFlexVolume :: Decode AllowedFlexVolume where
  decode a = genericDecode jsonOptions a 
instance encodeAllowedFlexVolume :: Encode AllowedFlexVolume where
  encode a = genericEncode jsonOptions a

instance defaultAllowedFlexVolume :: Default AllowedFlexVolume where
  default = AllowedFlexVolume
    { driver: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.AllowedHostPath
-- | defines the host volume conditions that will be enabled by a policy for pods to use. It requires the path prefix to be defined.
newtype AllowedHostPath = AllowedHostPath
  { pathPrefix :: (NullOrUndefined String) }

derive instance newtypeAllowedHostPath :: Newtype AllowedHostPath _
derive instance genericAllowedHostPath :: Generic AllowedHostPath _
instance showAllowedHostPath :: Show AllowedHostPath where show a = genericShow a
instance decodeAllowedHostPath :: Decode AllowedHostPath where
  decode a = genericDecode jsonOptions a 
instance encodeAllowedHostPath :: Encode AllowedHostPath where
  encode a = genericEncode jsonOptions a

instance defaultAllowedHostPath :: Default AllowedHostPath where
  default = AllowedHostPath
    { pathPrefix: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DaemonSet
-- | DEPRECATED - This group version of DaemonSet is deprecated by apps/v1beta2/DaemonSet. See the release notes for more information. DaemonSet represents the configuration of a daemon set.
newtype DaemonSet = DaemonSet
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined DaemonSetSpec)
  , status :: (NullOrUndefined DaemonSetStatus) }

derive instance newtypeDaemonSet :: Newtype DaemonSet _
derive instance genericDaemonSet :: Generic DaemonSet _
instance showDaemonSet :: Show DaemonSet where show a = genericShow a
instance decodeDaemonSet :: Decode DaemonSet where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSet :: Encode DaemonSet where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSet :: Default DaemonSet where
  default = DaemonSet
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DaemonSetCondition
-- | DaemonSetCondition describes the state of a DaemonSet at a certain point.
newtype DaemonSetCondition = DaemonSetCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeDaemonSetCondition :: Newtype DaemonSetCondition _
derive instance genericDaemonSetCondition :: Generic DaemonSetCondition _
instance showDaemonSetCondition :: Show DaemonSetCondition where show a = genericShow a
instance decodeDaemonSetCondition :: Decode DaemonSetCondition where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetCondition :: Encode DaemonSetCondition where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetCondition :: Default DaemonSetCondition where
  default = DaemonSetCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DaemonSetList
-- | DaemonSetList is a collection of daemon sets.
newtype DaemonSetList = DaemonSetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array DaemonSet))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeDaemonSetList :: Newtype DaemonSetList _
derive instance genericDaemonSetList :: Generic DaemonSetList _
instance showDaemonSetList :: Show DaemonSetList where show a = genericShow a
instance decodeDaemonSetList :: Decode DaemonSetList where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetList :: Encode DaemonSetList where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetList :: Default DaemonSetList where
  default = DaemonSetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DaemonSetSpec
-- | DaemonSetSpec is the specification of a daemon set.
newtype DaemonSetSpec = DaemonSetSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , revisionHistoryLimit :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec)
  , templateGeneration :: (NullOrUndefined Int)
  , updateStrategy :: (NullOrUndefined DaemonSetUpdateStrategy) }

derive instance newtypeDaemonSetSpec :: Newtype DaemonSetSpec _
derive instance genericDaemonSetSpec :: Generic DaemonSetSpec _
instance showDaemonSetSpec :: Show DaemonSetSpec where show a = genericShow a
instance decodeDaemonSetSpec :: Decode DaemonSetSpec where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetSpec :: Encode DaemonSetSpec where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetSpec :: Default DaemonSetSpec where
  default = DaemonSetSpec
    { minReadySeconds: NullOrUndefined Nothing
    , revisionHistoryLimit: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing
    , templateGeneration: NullOrUndefined Nothing
    , updateStrategy: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DaemonSetStatus
-- | DaemonSetStatus represents the current status of a daemon set.
newtype DaemonSetStatus = DaemonSetStatus
  { collisionCount :: (NullOrUndefined Int)
  , conditions :: (NullOrUndefined (Array DaemonSetCondition))
  , currentNumberScheduled :: (NullOrUndefined Int)
  , desiredNumberScheduled :: (NullOrUndefined Int)
  , numberAvailable :: (NullOrUndefined Int)
  , numberMisscheduled :: (NullOrUndefined Int)
  , numberReady :: (NullOrUndefined Int)
  , numberUnavailable :: (NullOrUndefined Int)
  , observedGeneration :: (NullOrUndefined Int)
  , updatedNumberScheduled :: (NullOrUndefined Int) }

derive instance newtypeDaemonSetStatus :: Newtype DaemonSetStatus _
derive instance genericDaemonSetStatus :: Generic DaemonSetStatus _
instance showDaemonSetStatus :: Show DaemonSetStatus where show a = genericShow a
instance decodeDaemonSetStatus :: Decode DaemonSetStatus where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetStatus :: Encode DaemonSetStatus where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetStatus :: Default DaemonSetStatus where
  default = DaemonSetStatus
    { collisionCount: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , currentNumberScheduled: NullOrUndefined Nothing
    , desiredNumberScheduled: NullOrUndefined Nothing
    , numberAvailable: NullOrUndefined Nothing
    , numberMisscheduled: NullOrUndefined Nothing
    , numberReady: NullOrUndefined Nothing
    , numberUnavailable: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , updatedNumberScheduled: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DaemonSetUpdateStrategy
newtype DaemonSetUpdateStrategy = DaemonSetUpdateStrategy
  { _type :: (NullOrUndefined String)
  , rollingUpdate :: (NullOrUndefined RollingUpdateDaemonSet) }

derive instance newtypeDaemonSetUpdateStrategy :: Newtype DaemonSetUpdateStrategy _
derive instance genericDaemonSetUpdateStrategy :: Generic DaemonSetUpdateStrategy _
instance showDaemonSetUpdateStrategy :: Show DaemonSetUpdateStrategy where show a = genericShow a
instance decodeDaemonSetUpdateStrategy :: Decode DaemonSetUpdateStrategy where
  decode a = genericDecode jsonOptions a 
instance encodeDaemonSetUpdateStrategy :: Encode DaemonSetUpdateStrategy where
  encode a = genericEncode jsonOptions a

instance defaultDaemonSetUpdateStrategy :: Default DaemonSetUpdateStrategy where
  default = DaemonSetUpdateStrategy
    { _type: NullOrUndefined Nothing
    , rollingUpdate: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.Deployment
-- | DEPRECATED - This group version of Deployment is deprecated by apps/v1beta2/Deployment. See the release notes for more information. Deployment enables declarative updates for Pods and ReplicaSets.
newtype Deployment = Deployment
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined DeploymentSpec)
  , status :: (NullOrUndefined DeploymentStatus) }

derive instance newtypeDeployment :: Newtype Deployment _
derive instance genericDeployment :: Generic Deployment _
instance showDeployment :: Show Deployment where show a = genericShow a
instance decodeDeployment :: Decode Deployment where
  decode a = genericDecode jsonOptions a 
instance encodeDeployment :: Encode Deployment where
  encode a = genericEncode jsonOptions a

instance defaultDeployment :: Default Deployment where
  default = Deployment
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DeploymentCondition
-- | DeploymentCondition describes the state of a deployment at a certain point.
newtype DeploymentCondition = DeploymentCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , lastUpdateTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeDeploymentCondition :: Newtype DeploymentCondition _
derive instance genericDeploymentCondition :: Generic DeploymentCondition _
instance showDeploymentCondition :: Show DeploymentCondition where show a = genericShow a
instance decodeDeploymentCondition :: Decode DeploymentCondition where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentCondition :: Encode DeploymentCondition where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentCondition :: Default DeploymentCondition where
  default = DeploymentCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , lastUpdateTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DeploymentList
-- | DeploymentList is a list of Deployments.
newtype DeploymentList = DeploymentList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Deployment))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeDeploymentList :: Newtype DeploymentList _
derive instance genericDeploymentList :: Generic DeploymentList _
instance showDeploymentList :: Show DeploymentList where show a = genericShow a
instance decodeDeploymentList :: Decode DeploymentList where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentList :: Encode DeploymentList where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentList :: Default DeploymentList where
  default = DeploymentList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DeploymentRollback
-- | DEPRECATED. DeploymentRollback stores the information required to rollback a deployment.
newtype DeploymentRollback = DeploymentRollback
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , name :: (NullOrUndefined String)
  , rollbackTo :: (NullOrUndefined RollbackConfig)
  , updatedAnnotations :: (NullOrUndefined (StrMap String)) }

derive instance newtypeDeploymentRollback :: Newtype DeploymentRollback _
derive instance genericDeploymentRollback :: Generic DeploymentRollback _
instance showDeploymentRollback :: Show DeploymentRollback where show a = genericShow a
instance decodeDeploymentRollback :: Decode DeploymentRollback where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentRollback :: Encode DeploymentRollback where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentRollback :: Default DeploymentRollback where
  default = DeploymentRollback
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , name: NullOrUndefined Nothing
    , rollbackTo: NullOrUndefined Nothing
    , updatedAnnotations: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DeploymentSpec
-- | DeploymentSpec is the specification of the desired behavior of the Deployment.
newtype DeploymentSpec = DeploymentSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , paused :: (NullOrUndefined Boolean)
  , progressDeadlineSeconds :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , revisionHistoryLimit :: (NullOrUndefined Int)
  , rollbackTo :: (NullOrUndefined RollbackConfig)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , strategy :: (NullOrUndefined DeploymentStrategy)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec) }

derive instance newtypeDeploymentSpec :: Newtype DeploymentSpec _
derive instance genericDeploymentSpec :: Generic DeploymentSpec _
instance showDeploymentSpec :: Show DeploymentSpec where show a = genericShow a
instance decodeDeploymentSpec :: Decode DeploymentSpec where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentSpec :: Encode DeploymentSpec where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentSpec :: Default DeploymentSpec where
  default = DeploymentSpec
    { minReadySeconds: NullOrUndefined Nothing
    , paused: NullOrUndefined Nothing
    , progressDeadlineSeconds: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , revisionHistoryLimit: NullOrUndefined Nothing
    , rollbackTo: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , strategy: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DeploymentStatus
-- | DeploymentStatus is the most recently observed status of the Deployment.
newtype DeploymentStatus = DeploymentStatus
  { availableReplicas :: (NullOrUndefined Int)
  , collisionCount :: (NullOrUndefined Int)
  , conditions :: (NullOrUndefined (Array DeploymentCondition))
  , observedGeneration :: (NullOrUndefined Int)
  , readyReplicas :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , unavailableReplicas :: (NullOrUndefined Int)
  , updatedReplicas :: (NullOrUndefined Int) }

derive instance newtypeDeploymentStatus :: Newtype DeploymentStatus _
derive instance genericDeploymentStatus :: Generic DeploymentStatus _
instance showDeploymentStatus :: Show DeploymentStatus where show a = genericShow a
instance decodeDeploymentStatus :: Decode DeploymentStatus where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentStatus :: Encode DeploymentStatus where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentStatus :: Default DeploymentStatus where
  default = DeploymentStatus
    { availableReplicas: NullOrUndefined Nothing
    , collisionCount: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , readyReplicas: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , unavailableReplicas: NullOrUndefined Nothing
    , updatedReplicas: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.DeploymentStrategy
-- | DeploymentStrategy describes how to replace existing pods with new ones.
newtype DeploymentStrategy = DeploymentStrategy
  { _type :: (NullOrUndefined String)
  , rollingUpdate :: (NullOrUndefined RollingUpdateDeployment) }

derive instance newtypeDeploymentStrategy :: Newtype DeploymentStrategy _
derive instance genericDeploymentStrategy :: Generic DeploymentStrategy _
instance showDeploymentStrategy :: Show DeploymentStrategy where show a = genericShow a
instance decodeDeploymentStrategy :: Decode DeploymentStrategy where
  decode a = genericDecode jsonOptions a 
instance encodeDeploymentStrategy :: Encode DeploymentStrategy where
  encode a = genericEncode jsonOptions a

instance defaultDeploymentStrategy :: Default DeploymentStrategy where
  default = DeploymentStrategy
    { _type: NullOrUndefined Nothing
    , rollingUpdate: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.FSGroupStrategyOptions
-- | FSGroupStrategyOptions defines the strategy type and options used to create the strategy.
newtype FSGroupStrategyOptions = FSGroupStrategyOptions
  { ranges :: (NullOrUndefined (Array IDRange))
  , rule :: (NullOrUndefined String) }

derive instance newtypeFSGroupStrategyOptions :: Newtype FSGroupStrategyOptions _
derive instance genericFSGroupStrategyOptions :: Generic FSGroupStrategyOptions _
instance showFSGroupStrategyOptions :: Show FSGroupStrategyOptions where show a = genericShow a
instance decodeFSGroupStrategyOptions :: Decode FSGroupStrategyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeFSGroupStrategyOptions :: Encode FSGroupStrategyOptions where
  encode a = genericEncode jsonOptions a

instance defaultFSGroupStrategyOptions :: Default FSGroupStrategyOptions where
  default = FSGroupStrategyOptions
    { ranges: NullOrUndefined Nothing
    , rule: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.HTTPIngressPath
-- | HTTPIngressPath associates a path regex with a backend. Incoming urls matching the path are forwarded to the backend.
newtype HTTPIngressPath = HTTPIngressPath
  { backend :: (NullOrUndefined IngressBackend)
  , path :: (NullOrUndefined String) }

derive instance newtypeHTTPIngressPath :: Newtype HTTPIngressPath _
derive instance genericHTTPIngressPath :: Generic HTTPIngressPath _
instance showHTTPIngressPath :: Show HTTPIngressPath where show a = genericShow a
instance decodeHTTPIngressPath :: Decode HTTPIngressPath where
  decode a = genericDecode jsonOptions a 
instance encodeHTTPIngressPath :: Encode HTTPIngressPath where
  encode a = genericEncode jsonOptions a

instance defaultHTTPIngressPath :: Default HTTPIngressPath where
  default = HTTPIngressPath
    { backend: NullOrUndefined Nothing
    , path: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.HTTPIngressRuleValue
-- | HTTPIngressRuleValue is a list of http selectors pointing to backends. In the example: http://<host>/<path>?<searchpart> -> backend where where parts of the url correspond to RFC 3986, this resource will be used to match against everything after the last '/' and before the first '?' or '#'.
newtype HTTPIngressRuleValue = HTTPIngressRuleValue
  { paths :: (NullOrUndefined (Array HTTPIngressPath)) }

derive instance newtypeHTTPIngressRuleValue :: Newtype HTTPIngressRuleValue _
derive instance genericHTTPIngressRuleValue :: Generic HTTPIngressRuleValue _
instance showHTTPIngressRuleValue :: Show HTTPIngressRuleValue where show a = genericShow a
instance decodeHTTPIngressRuleValue :: Decode HTTPIngressRuleValue where
  decode a = genericDecode jsonOptions a 
instance encodeHTTPIngressRuleValue :: Encode HTTPIngressRuleValue where
  encode a = genericEncode jsonOptions a

instance defaultHTTPIngressRuleValue :: Default HTTPIngressRuleValue where
  default = HTTPIngressRuleValue
    { paths: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.HostPortRange
-- | Host Port Range defines a range of host ports that will be enabled by a policy for pods to use.  It requires both the start and end to be defined.
newtype HostPortRange = HostPortRange
  { max :: (NullOrUndefined Int)
  , min :: (NullOrUndefined Int) }

derive instance newtypeHostPortRange :: Newtype HostPortRange _
derive instance genericHostPortRange :: Generic HostPortRange _
instance showHostPortRange :: Show HostPortRange where show a = genericShow a
instance decodeHostPortRange :: Decode HostPortRange where
  decode a = genericDecode jsonOptions a 
instance encodeHostPortRange :: Encode HostPortRange where
  encode a = genericEncode jsonOptions a

instance defaultHostPortRange :: Default HostPortRange where
  default = HostPortRange
    { max: NullOrUndefined Nothing
    , min: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.IDRange
-- | ID Range provides a min/max of an allowed range of IDs.
newtype IDRange = IDRange
  { max :: (NullOrUndefined Int)
  , min :: (NullOrUndefined Int) }

derive instance newtypeIDRange :: Newtype IDRange _
derive instance genericIDRange :: Generic IDRange _
instance showIDRange :: Show IDRange where show a = genericShow a
instance decodeIDRange :: Decode IDRange where
  decode a = genericDecode jsonOptions a 
instance encodeIDRange :: Encode IDRange where
  encode a = genericEncode jsonOptions a

instance defaultIDRange :: Default IDRange where
  default = IDRange
    { max: NullOrUndefined Nothing
    , min: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.IPBlock
-- | DEPRECATED 1.9 - This group version of IPBlock is deprecated by networking/v1/IPBlock. IPBlock describes a particular CIDR (Ex. "192.168.1.1/24") that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The except entry describes CIDRs that should not be included within this rule.
newtype IPBlock = IPBlock
  { cidr :: (NullOrUndefined String)
  , except :: (NullOrUndefined (Array String)) }

derive instance newtypeIPBlock :: Newtype IPBlock _
derive instance genericIPBlock :: Generic IPBlock _
instance showIPBlock :: Show IPBlock where show a = genericShow a
instance decodeIPBlock :: Decode IPBlock where
  decode a = genericDecode jsonOptions a 
instance encodeIPBlock :: Encode IPBlock where
  encode a = genericEncode jsonOptions a

instance defaultIPBlock :: Default IPBlock where
  default = IPBlock
    { cidr: NullOrUndefined Nothing
    , except: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.Ingress
-- | Ingress is a collection of rules that allow inbound connections to reach the endpoints defined by a backend. An Ingress can be configured to give services externally-reachable urls, load balance traffic, terminate SSL, offer name based virtual hosting etc.
newtype Ingress = Ingress
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined IngressSpec)
  , status :: (NullOrUndefined IngressStatus) }

derive instance newtypeIngress :: Newtype Ingress _
derive instance genericIngress :: Generic Ingress _
instance showIngress :: Show Ingress where show a = genericShow a
instance decodeIngress :: Decode Ingress where
  decode a = genericDecode jsonOptions a 
instance encodeIngress :: Encode Ingress where
  encode a = genericEncode jsonOptions a

instance defaultIngress :: Default Ingress where
  default = Ingress
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.IngressBackend
-- | IngressBackend describes all endpoints for a given service and port.
newtype IngressBackend = IngressBackend
  { serviceName :: (NullOrUndefined String)
  , servicePort :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeIngressBackend :: Newtype IngressBackend _
derive instance genericIngressBackend :: Generic IngressBackend _
instance showIngressBackend :: Show IngressBackend where show a = genericShow a
instance decodeIngressBackend :: Decode IngressBackend where
  decode a = genericDecode jsonOptions a 
instance encodeIngressBackend :: Encode IngressBackend where
  encode a = genericEncode jsonOptions a

instance defaultIngressBackend :: Default IngressBackend where
  default = IngressBackend
    { serviceName: NullOrUndefined Nothing
    , servicePort: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.IngressList
-- | IngressList is a collection of Ingress.
newtype IngressList = IngressList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Ingress))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeIngressList :: Newtype IngressList _
derive instance genericIngressList :: Generic IngressList _
instance showIngressList :: Show IngressList where show a = genericShow a
instance decodeIngressList :: Decode IngressList where
  decode a = genericDecode jsonOptions a 
instance encodeIngressList :: Encode IngressList where
  encode a = genericEncode jsonOptions a

instance defaultIngressList :: Default IngressList where
  default = IngressList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.IngressRule
-- | IngressRule represents the rules mapping the paths under a specified host to the related backend services. Incoming requests are first evaluated for a host match, then routed to the backend associated with the matching IngressRuleValue.
newtype IngressRule = IngressRule
  { host :: (NullOrUndefined String)
  , http :: (NullOrUndefined HTTPIngressRuleValue) }

derive instance newtypeIngressRule :: Newtype IngressRule _
derive instance genericIngressRule :: Generic IngressRule _
instance showIngressRule :: Show IngressRule where show a = genericShow a
instance decodeIngressRule :: Decode IngressRule where
  decode a = genericDecode jsonOptions a 
instance encodeIngressRule :: Encode IngressRule where
  encode a = genericEncode jsonOptions a

instance defaultIngressRule :: Default IngressRule where
  default = IngressRule
    { host: NullOrUndefined Nothing
    , http: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.IngressSpec
-- | IngressSpec describes the Ingress the user wishes to exist.
newtype IngressSpec = IngressSpec
  { backend :: (NullOrUndefined IngressBackend)
  , rules :: (NullOrUndefined (Array IngressRule))
  , tls :: (NullOrUndefined (Array IngressTLS)) }

derive instance newtypeIngressSpec :: Newtype IngressSpec _
derive instance genericIngressSpec :: Generic IngressSpec _
instance showIngressSpec :: Show IngressSpec where show a = genericShow a
instance decodeIngressSpec :: Decode IngressSpec where
  decode a = genericDecode jsonOptions a 
instance encodeIngressSpec :: Encode IngressSpec where
  encode a = genericEncode jsonOptions a

instance defaultIngressSpec :: Default IngressSpec where
  default = IngressSpec
    { backend: NullOrUndefined Nothing
    , rules: NullOrUndefined Nothing
    , tls: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.IngressStatus
-- | IngressStatus describe the current state of the Ingress.
newtype IngressStatus = IngressStatus
  { loadBalancer :: (NullOrUndefined CoreV1.LoadBalancerStatus) }

derive instance newtypeIngressStatus :: Newtype IngressStatus _
derive instance genericIngressStatus :: Generic IngressStatus _
instance showIngressStatus :: Show IngressStatus where show a = genericShow a
instance decodeIngressStatus :: Decode IngressStatus where
  decode a = genericDecode jsonOptions a 
instance encodeIngressStatus :: Encode IngressStatus where
  encode a = genericEncode jsonOptions a

instance defaultIngressStatus :: Default IngressStatus where
  default = IngressStatus
    { loadBalancer: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.IngressTLS
-- | IngressTLS describes the transport layer security associated with an Ingress.
newtype IngressTLS = IngressTLS
  { hosts :: (NullOrUndefined (Array String))
  , secretName :: (NullOrUndefined String) }

derive instance newtypeIngressTLS :: Newtype IngressTLS _
derive instance genericIngressTLS :: Generic IngressTLS _
instance showIngressTLS :: Show IngressTLS where show a = genericShow a
instance decodeIngressTLS :: Decode IngressTLS where
  decode a = genericDecode jsonOptions a 
instance encodeIngressTLS :: Encode IngressTLS where
  encode a = genericEncode jsonOptions a

instance defaultIngressTLS :: Default IngressTLS where
  default = IngressTLS
    { hosts: NullOrUndefined Nothing
    , secretName: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.NetworkPolicy
-- | DEPRECATED 1.9 - This group version of NetworkPolicy is deprecated by networking/v1/NetworkPolicy. NetworkPolicy describes what network traffic is allowed for a set of Pods
newtype NetworkPolicy = NetworkPolicy
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined NetworkPolicySpec) }

derive instance newtypeNetworkPolicy :: Newtype NetworkPolicy _
derive instance genericNetworkPolicy :: Generic NetworkPolicy _
instance showNetworkPolicy :: Show NetworkPolicy where show a = genericShow a
instance decodeNetworkPolicy :: Decode NetworkPolicy where
  decode a = genericDecode jsonOptions a 
instance encodeNetworkPolicy :: Encode NetworkPolicy where
  encode a = genericEncode jsonOptions a

instance defaultNetworkPolicy :: Default NetworkPolicy where
  default = NetworkPolicy
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.NetworkPolicyEgressRule
-- | DEPRECATED 1.9 - This group version of NetworkPolicyEgressRule is deprecated by networking/v1/NetworkPolicyEgressRule. NetworkPolicyEgressRule describes a particular set of traffic that is allowed out of pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and to. This type is beta-level in 1.8
newtype NetworkPolicyEgressRule = NetworkPolicyEgressRule
  { ports :: (NullOrUndefined (Array NetworkPolicyPort))
  , to :: (NullOrUndefined (Array NetworkPolicyPeer)) }

derive instance newtypeNetworkPolicyEgressRule :: Newtype NetworkPolicyEgressRule _
derive instance genericNetworkPolicyEgressRule :: Generic NetworkPolicyEgressRule _
instance showNetworkPolicyEgressRule :: Show NetworkPolicyEgressRule where show a = genericShow a
instance decodeNetworkPolicyEgressRule :: Decode NetworkPolicyEgressRule where
  decode a = genericDecode jsonOptions a 
instance encodeNetworkPolicyEgressRule :: Encode NetworkPolicyEgressRule where
  encode a = genericEncode jsonOptions a

instance defaultNetworkPolicyEgressRule :: Default NetworkPolicyEgressRule where
  default = NetworkPolicyEgressRule
    { ports: NullOrUndefined Nothing
    , to: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.NetworkPolicyIngressRule
-- | DEPRECATED 1.9 - This group version of NetworkPolicyIngressRule is deprecated by networking/v1/NetworkPolicyIngressRule. This NetworkPolicyIngressRule matches traffic if and only if the traffic matches both ports AND from.
newtype NetworkPolicyIngressRule = NetworkPolicyIngressRule
  { from :: (NullOrUndefined (Array NetworkPolicyPeer))
  , ports :: (NullOrUndefined (Array NetworkPolicyPort)) }

derive instance newtypeNetworkPolicyIngressRule :: Newtype NetworkPolicyIngressRule _
derive instance genericNetworkPolicyIngressRule :: Generic NetworkPolicyIngressRule _
instance showNetworkPolicyIngressRule :: Show NetworkPolicyIngressRule where show a = genericShow a
instance decodeNetworkPolicyIngressRule :: Decode NetworkPolicyIngressRule where
  decode a = genericDecode jsonOptions a 
instance encodeNetworkPolicyIngressRule :: Encode NetworkPolicyIngressRule where
  encode a = genericEncode jsonOptions a

instance defaultNetworkPolicyIngressRule :: Default NetworkPolicyIngressRule where
  default = NetworkPolicyIngressRule
    { from: NullOrUndefined Nothing
    , ports: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.NetworkPolicyList
-- | DEPRECATED 1.9 - This group version of NetworkPolicyList is deprecated by networking/v1/NetworkPolicyList. Network Policy List is a list of NetworkPolicy objects.
newtype NetworkPolicyList = NetworkPolicyList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array NetworkPolicy))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeNetworkPolicyList :: Newtype NetworkPolicyList _
derive instance genericNetworkPolicyList :: Generic NetworkPolicyList _
instance showNetworkPolicyList :: Show NetworkPolicyList where show a = genericShow a
instance decodeNetworkPolicyList :: Decode NetworkPolicyList where
  decode a = genericDecode jsonOptions a 
instance encodeNetworkPolicyList :: Encode NetworkPolicyList where
  encode a = genericEncode jsonOptions a

instance defaultNetworkPolicyList :: Default NetworkPolicyList where
  default = NetworkPolicyList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.NetworkPolicyPeer
-- | DEPRECATED 1.9 - This group version of NetworkPolicyPeer is deprecated by networking/v1/NetworkPolicyPeer.
newtype NetworkPolicyPeer = NetworkPolicyPeer
  { ipBlock :: (NullOrUndefined IPBlock)
  , namespaceSelector :: (NullOrUndefined MetaV1.LabelSelector)
  , podSelector :: (NullOrUndefined MetaV1.LabelSelector) }

derive instance newtypeNetworkPolicyPeer :: Newtype NetworkPolicyPeer _
derive instance genericNetworkPolicyPeer :: Generic NetworkPolicyPeer _
instance showNetworkPolicyPeer :: Show NetworkPolicyPeer where show a = genericShow a
instance decodeNetworkPolicyPeer :: Decode NetworkPolicyPeer where
  decode a = genericDecode jsonOptions a 
instance encodeNetworkPolicyPeer :: Encode NetworkPolicyPeer where
  encode a = genericEncode jsonOptions a

instance defaultNetworkPolicyPeer :: Default NetworkPolicyPeer where
  default = NetworkPolicyPeer
    { ipBlock: NullOrUndefined Nothing
    , namespaceSelector: NullOrUndefined Nothing
    , podSelector: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.NetworkPolicyPort
-- | DEPRECATED 1.9 - This group version of NetworkPolicyPort is deprecated by networking/v1/NetworkPolicyPort.
newtype NetworkPolicyPort = NetworkPolicyPort
  { port :: (NullOrUndefined Util.IntOrString)
  , protocol :: (NullOrUndefined String) }

derive instance newtypeNetworkPolicyPort :: Newtype NetworkPolicyPort _
derive instance genericNetworkPolicyPort :: Generic NetworkPolicyPort _
instance showNetworkPolicyPort :: Show NetworkPolicyPort where show a = genericShow a
instance decodeNetworkPolicyPort :: Decode NetworkPolicyPort where
  decode a = genericDecode jsonOptions a 
instance encodeNetworkPolicyPort :: Encode NetworkPolicyPort where
  encode a = genericEncode jsonOptions a

instance defaultNetworkPolicyPort :: Default NetworkPolicyPort where
  default = NetworkPolicyPort
    { port: NullOrUndefined Nothing
    , protocol: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.NetworkPolicySpec
-- | DEPRECATED 1.9 - This group version of NetworkPolicySpec is deprecated by networking/v1/NetworkPolicySpec.
newtype NetworkPolicySpec = NetworkPolicySpec
  { egress :: (NullOrUndefined (Array NetworkPolicyEgressRule))
  , ingress :: (NullOrUndefined (Array NetworkPolicyIngressRule))
  , podSelector :: (NullOrUndefined MetaV1.LabelSelector)
  , policyTypes :: (NullOrUndefined (Array String)) }

derive instance newtypeNetworkPolicySpec :: Newtype NetworkPolicySpec _
derive instance genericNetworkPolicySpec :: Generic NetworkPolicySpec _
instance showNetworkPolicySpec :: Show NetworkPolicySpec where show a = genericShow a
instance decodeNetworkPolicySpec :: Decode NetworkPolicySpec where
  decode a = genericDecode jsonOptions a 
instance encodeNetworkPolicySpec :: Encode NetworkPolicySpec where
  encode a = genericEncode jsonOptions a

instance defaultNetworkPolicySpec :: Default NetworkPolicySpec where
  default = NetworkPolicySpec
    { egress: NullOrUndefined Nothing
    , ingress: NullOrUndefined Nothing
    , podSelector: NullOrUndefined Nothing
    , policyTypes: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.PodSecurityPolicy
-- | Pod Security Policy governs the ability to make requests that affect the Security Context that will be applied to a pod and container.
newtype PodSecurityPolicy = PodSecurityPolicy
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined PodSecurityPolicySpec) }

derive instance newtypePodSecurityPolicy :: Newtype PodSecurityPolicy _
derive instance genericPodSecurityPolicy :: Generic PodSecurityPolicy _
instance showPodSecurityPolicy :: Show PodSecurityPolicy where show a = genericShow a
instance decodePodSecurityPolicy :: Decode PodSecurityPolicy where
  decode a = genericDecode jsonOptions a 
instance encodePodSecurityPolicy :: Encode PodSecurityPolicy where
  encode a = genericEncode jsonOptions a

instance defaultPodSecurityPolicy :: Default PodSecurityPolicy where
  default = PodSecurityPolicy
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.PodSecurityPolicyList
-- | Pod Security Policy List is a list of PodSecurityPolicy objects.
newtype PodSecurityPolicyList = PodSecurityPolicyList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array PodSecurityPolicy))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypePodSecurityPolicyList :: Newtype PodSecurityPolicyList _
derive instance genericPodSecurityPolicyList :: Generic PodSecurityPolicyList _
instance showPodSecurityPolicyList :: Show PodSecurityPolicyList where show a = genericShow a
instance decodePodSecurityPolicyList :: Decode PodSecurityPolicyList where
  decode a = genericDecode jsonOptions a 
instance encodePodSecurityPolicyList :: Encode PodSecurityPolicyList where
  encode a = genericEncode jsonOptions a

instance defaultPodSecurityPolicyList :: Default PodSecurityPolicyList where
  default = PodSecurityPolicyList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.PodSecurityPolicySpec
-- | Pod Security Policy Spec defines the policy enforced.
newtype PodSecurityPolicySpec = PodSecurityPolicySpec
  { allowPrivilegeEscalation :: (NullOrUndefined Boolean)
  , allowedCapabilities :: (NullOrUndefined (Array String))
  , allowedFlexVolumes :: (NullOrUndefined (Array AllowedFlexVolume))
  , allowedHostPaths :: (NullOrUndefined (Array AllowedHostPath))
  , defaultAddCapabilities :: (NullOrUndefined (Array String))
  , defaultAllowPrivilegeEscalation :: (NullOrUndefined Boolean)
  , fsGroup :: (NullOrUndefined FSGroupStrategyOptions)
  , hostIPC :: (NullOrUndefined Boolean)
  , hostNetwork :: (NullOrUndefined Boolean)
  , hostPID :: (NullOrUndefined Boolean)
  , hostPorts :: (NullOrUndefined (Array HostPortRange))
  , privileged :: (NullOrUndefined Boolean)
  , readOnlyRootFilesystem :: (NullOrUndefined Boolean)
  , requiredDropCapabilities :: (NullOrUndefined (Array String))
  , runAsUser :: (NullOrUndefined RunAsUserStrategyOptions)
  , seLinux :: (NullOrUndefined SELinuxStrategyOptions)
  , supplementalGroups :: (NullOrUndefined SupplementalGroupsStrategyOptions)
  , volumes :: (NullOrUndefined (Array String)) }

derive instance newtypePodSecurityPolicySpec :: Newtype PodSecurityPolicySpec _
derive instance genericPodSecurityPolicySpec :: Generic PodSecurityPolicySpec _
instance showPodSecurityPolicySpec :: Show PodSecurityPolicySpec where show a = genericShow a
instance decodePodSecurityPolicySpec :: Decode PodSecurityPolicySpec where
  decode a = genericDecode jsonOptions a 
instance encodePodSecurityPolicySpec :: Encode PodSecurityPolicySpec where
  encode a = genericEncode jsonOptions a

instance defaultPodSecurityPolicySpec :: Default PodSecurityPolicySpec where
  default = PodSecurityPolicySpec
    { allowPrivilegeEscalation: NullOrUndefined Nothing
    , allowedCapabilities: NullOrUndefined Nothing
    , allowedFlexVolumes: NullOrUndefined Nothing
    , allowedHostPaths: NullOrUndefined Nothing
    , defaultAddCapabilities: NullOrUndefined Nothing
    , defaultAllowPrivilegeEscalation: NullOrUndefined Nothing
    , fsGroup: NullOrUndefined Nothing
    , hostIPC: NullOrUndefined Nothing
    , hostNetwork: NullOrUndefined Nothing
    , hostPID: NullOrUndefined Nothing
    , hostPorts: NullOrUndefined Nothing
    , privileged: NullOrUndefined Nothing
    , readOnlyRootFilesystem: NullOrUndefined Nothing
    , requiredDropCapabilities: NullOrUndefined Nothing
    , runAsUser: NullOrUndefined Nothing
    , seLinux: NullOrUndefined Nothing
    , supplementalGroups: NullOrUndefined Nothing
    , volumes: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.ReplicaSet
-- | DEPRECATED - This group version of ReplicaSet is deprecated by apps/v1beta2/ReplicaSet. See the release notes for more information. ReplicaSet ensures that a specified number of pod replicas are running at any given time.
newtype ReplicaSet = ReplicaSet
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined ReplicaSetSpec)
  , status :: (NullOrUndefined ReplicaSetStatus) }

derive instance newtypeReplicaSet :: Newtype ReplicaSet _
derive instance genericReplicaSet :: Generic ReplicaSet _
instance showReplicaSet :: Show ReplicaSet where show a = genericShow a
instance decodeReplicaSet :: Decode ReplicaSet where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSet :: Encode ReplicaSet where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSet :: Default ReplicaSet where
  default = ReplicaSet
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.ReplicaSetCondition
-- | ReplicaSetCondition describes the state of a replica set at a certain point.
newtype ReplicaSetCondition = ReplicaSetCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeReplicaSetCondition :: Newtype ReplicaSetCondition _
derive instance genericReplicaSetCondition :: Generic ReplicaSetCondition _
instance showReplicaSetCondition :: Show ReplicaSetCondition where show a = genericShow a
instance decodeReplicaSetCondition :: Decode ReplicaSetCondition where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSetCondition :: Encode ReplicaSetCondition where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSetCondition :: Default ReplicaSetCondition where
  default = ReplicaSetCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.ReplicaSetList
-- | ReplicaSetList is a collection of ReplicaSets.
newtype ReplicaSetList = ReplicaSetList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array ReplicaSet))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeReplicaSetList :: Newtype ReplicaSetList _
derive instance genericReplicaSetList :: Generic ReplicaSetList _
instance showReplicaSetList :: Show ReplicaSetList where show a = genericShow a
instance decodeReplicaSetList :: Decode ReplicaSetList where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSetList :: Encode ReplicaSetList where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSetList :: Default ReplicaSetList where
  default = ReplicaSetList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.ReplicaSetSpec
-- | ReplicaSetSpec is the specification of a ReplicaSet.
newtype ReplicaSetSpec = ReplicaSetSpec
  { minReadySeconds :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec) }

derive instance newtypeReplicaSetSpec :: Newtype ReplicaSetSpec _
derive instance genericReplicaSetSpec :: Generic ReplicaSetSpec _
instance showReplicaSetSpec :: Show ReplicaSetSpec where show a = genericShow a
instance decodeReplicaSetSpec :: Decode ReplicaSetSpec where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSetSpec :: Encode ReplicaSetSpec where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSetSpec :: Default ReplicaSetSpec where
  default = ReplicaSetSpec
    { minReadySeconds: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.ReplicaSetStatus
-- | ReplicaSetStatus represents the current status of a ReplicaSet.
newtype ReplicaSetStatus = ReplicaSetStatus
  { availableReplicas :: (NullOrUndefined Int)
  , conditions :: (NullOrUndefined (Array ReplicaSetCondition))
  , fullyLabeledReplicas :: (NullOrUndefined Int)
  , observedGeneration :: (NullOrUndefined Int)
  , readyReplicas :: (NullOrUndefined Int)
  , replicas :: (NullOrUndefined Int) }

derive instance newtypeReplicaSetStatus :: Newtype ReplicaSetStatus _
derive instance genericReplicaSetStatus :: Generic ReplicaSetStatus _
instance showReplicaSetStatus :: Show ReplicaSetStatus where show a = genericShow a
instance decodeReplicaSetStatus :: Decode ReplicaSetStatus where
  decode a = genericDecode jsonOptions a 
instance encodeReplicaSetStatus :: Encode ReplicaSetStatus where
  encode a = genericEncode jsonOptions a

instance defaultReplicaSetStatus :: Default ReplicaSetStatus where
  default = ReplicaSetStatus
    { availableReplicas: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , fullyLabeledReplicas: NullOrUndefined Nothing
    , observedGeneration: NullOrUndefined Nothing
    , readyReplicas: NullOrUndefined Nothing
    , replicas: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.RollbackConfig
-- | DEPRECATED.
newtype RollbackConfig = RollbackConfig
  { revision :: (NullOrUndefined Int) }

derive instance newtypeRollbackConfig :: Newtype RollbackConfig _
derive instance genericRollbackConfig :: Generic RollbackConfig _
instance showRollbackConfig :: Show RollbackConfig where show a = genericShow a
instance decodeRollbackConfig :: Decode RollbackConfig where
  decode a = genericDecode jsonOptions a 
instance encodeRollbackConfig :: Encode RollbackConfig where
  encode a = genericEncode jsonOptions a

instance defaultRollbackConfig :: Default RollbackConfig where
  default = RollbackConfig
    { revision: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.RollingUpdateDaemonSet
-- | Spec to control the desired behavior of daemon set rolling update.
newtype RollingUpdateDaemonSet = RollingUpdateDaemonSet
  { maxUnavailable :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeRollingUpdateDaemonSet :: Newtype RollingUpdateDaemonSet _
derive instance genericRollingUpdateDaemonSet :: Generic RollingUpdateDaemonSet _
instance showRollingUpdateDaemonSet :: Show RollingUpdateDaemonSet where show a = genericShow a
instance decodeRollingUpdateDaemonSet :: Decode RollingUpdateDaemonSet where
  decode a = genericDecode jsonOptions a 
instance encodeRollingUpdateDaemonSet :: Encode RollingUpdateDaemonSet where
  encode a = genericEncode jsonOptions a

instance defaultRollingUpdateDaemonSet :: Default RollingUpdateDaemonSet where
  default = RollingUpdateDaemonSet
    { maxUnavailable: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.RollingUpdateDeployment
-- | Spec to control the desired behavior of rolling update.
newtype RollingUpdateDeployment = RollingUpdateDeployment
  { maxSurge :: (NullOrUndefined Util.IntOrString)
  , maxUnavailable :: (NullOrUndefined Util.IntOrString) }

derive instance newtypeRollingUpdateDeployment :: Newtype RollingUpdateDeployment _
derive instance genericRollingUpdateDeployment :: Generic RollingUpdateDeployment _
instance showRollingUpdateDeployment :: Show RollingUpdateDeployment where show a = genericShow a
instance decodeRollingUpdateDeployment :: Decode RollingUpdateDeployment where
  decode a = genericDecode jsonOptions a 
instance encodeRollingUpdateDeployment :: Encode RollingUpdateDeployment where
  encode a = genericEncode jsonOptions a

instance defaultRollingUpdateDeployment :: Default RollingUpdateDeployment where
  default = RollingUpdateDeployment
    { maxSurge: NullOrUndefined Nothing
    , maxUnavailable: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.RunAsUserStrategyOptions
-- | Run A sUser Strategy Options defines the strategy type and any options used to create the strategy.
newtype RunAsUserStrategyOptions = RunAsUserStrategyOptions
  { ranges :: (NullOrUndefined (Array IDRange))
  , rule :: (NullOrUndefined String) }

derive instance newtypeRunAsUserStrategyOptions :: Newtype RunAsUserStrategyOptions _
derive instance genericRunAsUserStrategyOptions :: Generic RunAsUserStrategyOptions _
instance showRunAsUserStrategyOptions :: Show RunAsUserStrategyOptions where show a = genericShow a
instance decodeRunAsUserStrategyOptions :: Decode RunAsUserStrategyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeRunAsUserStrategyOptions :: Encode RunAsUserStrategyOptions where
  encode a = genericEncode jsonOptions a

instance defaultRunAsUserStrategyOptions :: Default RunAsUserStrategyOptions where
  default = RunAsUserStrategyOptions
    { ranges: NullOrUndefined Nothing
    , rule: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.SELinuxStrategyOptions
-- | SELinux  Strategy Options defines the strategy type and any options used to create the strategy.
newtype SELinuxStrategyOptions = SELinuxStrategyOptions
  { rule :: (NullOrUndefined String)
  , seLinuxOptions :: (NullOrUndefined CoreV1.SELinuxOptions) }

derive instance newtypeSELinuxStrategyOptions :: Newtype SELinuxStrategyOptions _
derive instance genericSELinuxStrategyOptions :: Generic SELinuxStrategyOptions _
instance showSELinuxStrategyOptions :: Show SELinuxStrategyOptions where show a = genericShow a
instance decodeSELinuxStrategyOptions :: Decode SELinuxStrategyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeSELinuxStrategyOptions :: Encode SELinuxStrategyOptions where
  encode a = genericEncode jsonOptions a

instance defaultSELinuxStrategyOptions :: Default SELinuxStrategyOptions where
  default = SELinuxStrategyOptions
    { rule: NullOrUndefined Nothing
    , seLinuxOptions: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.Scale
-- | represents a scaling request for a resource.
newtype Scale = Scale
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined ScaleSpec)
  , status :: (NullOrUndefined ScaleStatus) }

derive instance newtypeScale :: Newtype Scale _
derive instance genericScale :: Generic Scale _
instance showScale :: Show Scale where show a = genericShow a
instance decodeScale :: Decode Scale where
  decode a = genericDecode jsonOptions a 
instance encodeScale :: Encode Scale where
  encode a = genericEncode jsonOptions a

instance defaultScale :: Default Scale where
  default = Scale
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.ScaleSpec
-- | describes the attributes of a scale subresource
newtype ScaleSpec = ScaleSpec
  { replicas :: (NullOrUndefined Int) }

derive instance newtypeScaleSpec :: Newtype ScaleSpec _
derive instance genericScaleSpec :: Generic ScaleSpec _
instance showScaleSpec :: Show ScaleSpec where show a = genericShow a
instance decodeScaleSpec :: Decode ScaleSpec where
  decode a = genericDecode jsonOptions a 
instance encodeScaleSpec :: Encode ScaleSpec where
  encode a = genericEncode jsonOptions a

instance defaultScaleSpec :: Default ScaleSpec where
  default = ScaleSpec
    { replicas: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.ScaleStatus
-- | represents the current status of a scale subresource.
newtype ScaleStatus = ScaleStatus
  { replicas :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined (StrMap String))
  , targetSelector :: (NullOrUndefined String) }

derive instance newtypeScaleStatus :: Newtype ScaleStatus _
derive instance genericScaleStatus :: Generic ScaleStatus _
instance showScaleStatus :: Show ScaleStatus where show a = genericShow a
instance decodeScaleStatus :: Decode ScaleStatus where
  decode a = genericDecode jsonOptions a 
instance encodeScaleStatus :: Encode ScaleStatus where
  encode a = genericEncode jsonOptions a

instance defaultScaleStatus :: Default ScaleStatus where
  default = ScaleStatus
    { replicas: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , targetSelector: NullOrUndefined Nothing }

-- | io.k8s.api.extensions.v1beta1.SupplementalGroupsStrategyOptions
-- | SupplementalGroupsStrategyOptions defines the strategy type and options used to create the strategy.
newtype SupplementalGroupsStrategyOptions = SupplementalGroupsStrategyOptions
  { ranges :: (NullOrUndefined (Array IDRange))
  , rule :: (NullOrUndefined String) }

derive instance newtypeSupplementalGroupsStrategyOptions :: Newtype SupplementalGroupsStrategyOptions _
derive instance genericSupplementalGroupsStrategyOptions :: Generic SupplementalGroupsStrategyOptions _
instance showSupplementalGroupsStrategyOptions :: Show SupplementalGroupsStrategyOptions where show a = genericShow a
instance decodeSupplementalGroupsStrategyOptions :: Decode SupplementalGroupsStrategyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeSupplementalGroupsStrategyOptions :: Encode SupplementalGroupsStrategyOptions where
  encode a = genericEncode jsonOptions a

instance defaultSupplementalGroupsStrategyOptions :: Default SupplementalGroupsStrategyOptions where
  default = SupplementalGroupsStrategyOptions
    { ranges: NullOrUndefined Nothing
    , rule: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.CustomResourceDefinition
-- | CustomResourceDefinition represents a resource that should be exposed on the API server.  Its name MUST be in the format <.spec.name>.<.spec.group>.
newtype CustomResourceDefinition = CustomResourceDefinition
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined CustomResourceDefinitionSpec)
  , status :: (NullOrUndefined CustomResourceDefinitionStatus) }

derive instance newtypeCustomResourceDefinition :: Newtype CustomResourceDefinition _
derive instance genericCustomResourceDefinition :: Generic CustomResourceDefinition _
instance showCustomResourceDefinition :: Show CustomResourceDefinition where show a = genericShow a
instance decodeCustomResourceDefinition :: Decode CustomResourceDefinition where
  decode a = genericDecode jsonOptions a 
instance encodeCustomResourceDefinition :: Encode CustomResourceDefinition where
  encode a = genericEncode jsonOptions a

instance defaultCustomResourceDefinition :: Default CustomResourceDefinition where
  default = CustomResourceDefinition
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.CustomResourceDefinitionCondition
-- | CustomResourceDefinitionCondition contains details for the current condition of this pod.
newtype CustomResourceDefinitionCondition = CustomResourceDefinitionCondition
  { _type :: (NullOrUndefined String)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeCustomResourceDefinitionCondition :: Newtype CustomResourceDefinitionCondition _
derive instance genericCustomResourceDefinitionCondition :: Generic CustomResourceDefinitionCondition _
instance showCustomResourceDefinitionCondition :: Show CustomResourceDefinitionCondition where show a = genericShow a
instance decodeCustomResourceDefinitionCondition :: Decode CustomResourceDefinitionCondition where
  decode a = genericDecode jsonOptions a 
instance encodeCustomResourceDefinitionCondition :: Encode CustomResourceDefinitionCondition where
  encode a = genericEncode jsonOptions a

instance defaultCustomResourceDefinitionCondition :: Default CustomResourceDefinitionCondition where
  default = CustomResourceDefinitionCondition
    { _type: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.CustomResourceDefinitionList
-- | CustomResourceDefinitionList is a list of CustomResourceDefinition objects.
newtype CustomResourceDefinitionList = CustomResourceDefinitionList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array CustomResourceDefinition))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeCustomResourceDefinitionList :: Newtype CustomResourceDefinitionList _
derive instance genericCustomResourceDefinitionList :: Generic CustomResourceDefinitionList _
instance showCustomResourceDefinitionList :: Show CustomResourceDefinitionList where show a = genericShow a
instance decodeCustomResourceDefinitionList :: Decode CustomResourceDefinitionList where
  decode a = genericDecode jsonOptions a 
instance encodeCustomResourceDefinitionList :: Encode CustomResourceDefinitionList where
  encode a = genericEncode jsonOptions a

instance defaultCustomResourceDefinitionList :: Default CustomResourceDefinitionList where
  default = CustomResourceDefinitionList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.CustomResourceDefinitionNames
-- | CustomResourceDefinitionNames indicates the names to serve this CustomResourceDefinition
newtype CustomResourceDefinitionNames = CustomResourceDefinitionNames
  { kind :: (NullOrUndefined String)
  , listKind :: (NullOrUndefined String)
  , plural :: (NullOrUndefined String)
  , shortNames :: (NullOrUndefined (Array String))
  , singular :: (NullOrUndefined String) }

derive instance newtypeCustomResourceDefinitionNames :: Newtype CustomResourceDefinitionNames _
derive instance genericCustomResourceDefinitionNames :: Generic CustomResourceDefinitionNames _
instance showCustomResourceDefinitionNames :: Show CustomResourceDefinitionNames where show a = genericShow a
instance decodeCustomResourceDefinitionNames :: Decode CustomResourceDefinitionNames where
  decode a = genericDecode jsonOptions a 
instance encodeCustomResourceDefinitionNames :: Encode CustomResourceDefinitionNames where
  encode a = genericEncode jsonOptions a

instance defaultCustomResourceDefinitionNames :: Default CustomResourceDefinitionNames where
  default = CustomResourceDefinitionNames
    { kind: NullOrUndefined Nothing
    , listKind: NullOrUndefined Nothing
    , plural: NullOrUndefined Nothing
    , shortNames: NullOrUndefined Nothing
    , singular: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.CustomResourceDefinitionSpec
-- | CustomResourceDefinitionSpec describes how a user wants their resource to appear
newtype CustomResourceDefinitionSpec = CustomResourceDefinitionSpec
  { group :: (NullOrUndefined String)
  , names :: (NullOrUndefined CustomResourceDefinitionNames)
  , scope :: (NullOrUndefined String)
  , validation :: (NullOrUndefined CustomResourceValidation)
  , version :: (NullOrUndefined String) }

derive instance newtypeCustomResourceDefinitionSpec :: Newtype CustomResourceDefinitionSpec _
derive instance genericCustomResourceDefinitionSpec :: Generic CustomResourceDefinitionSpec _
instance showCustomResourceDefinitionSpec :: Show CustomResourceDefinitionSpec where show a = genericShow a
instance decodeCustomResourceDefinitionSpec :: Decode CustomResourceDefinitionSpec where
  decode a = genericDecode jsonOptions a 
instance encodeCustomResourceDefinitionSpec :: Encode CustomResourceDefinitionSpec where
  encode a = genericEncode jsonOptions a

instance defaultCustomResourceDefinitionSpec :: Default CustomResourceDefinitionSpec where
  default = CustomResourceDefinitionSpec
    { group: NullOrUndefined Nothing
    , names: NullOrUndefined Nothing
    , scope: NullOrUndefined Nothing
    , validation: NullOrUndefined Nothing
    , version: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.CustomResourceDefinitionStatus
-- | CustomResourceDefinitionStatus indicates the state of the CustomResourceDefinition
newtype CustomResourceDefinitionStatus = CustomResourceDefinitionStatus
  { acceptedNames :: (NullOrUndefined CustomResourceDefinitionNames)
  , conditions :: (NullOrUndefined (Array CustomResourceDefinitionCondition)) }

derive instance newtypeCustomResourceDefinitionStatus :: Newtype CustomResourceDefinitionStatus _
derive instance genericCustomResourceDefinitionStatus :: Generic CustomResourceDefinitionStatus _
instance showCustomResourceDefinitionStatus :: Show CustomResourceDefinitionStatus where show a = genericShow a
instance decodeCustomResourceDefinitionStatus :: Decode CustomResourceDefinitionStatus where
  decode a = genericDecode jsonOptions a 
instance encodeCustomResourceDefinitionStatus :: Encode CustomResourceDefinitionStatus where
  encode a = genericEncode jsonOptions a

instance defaultCustomResourceDefinitionStatus :: Default CustomResourceDefinitionStatus where
  default = CustomResourceDefinitionStatus
    { acceptedNames: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.CustomResourceValidation
-- | CustomResourceValidation is a list of validation methods for CustomResources.
newtype CustomResourceValidation = CustomResourceValidation
  { openAPIV3Schema :: (NullOrUndefined JSONSchemaProps) }

derive instance newtypeCustomResourceValidation :: Newtype CustomResourceValidation _
derive instance genericCustomResourceValidation :: Generic CustomResourceValidation _
instance showCustomResourceValidation :: Show CustomResourceValidation where show a = genericShow a
instance decodeCustomResourceValidation :: Decode CustomResourceValidation where
  decode a = genericDecode jsonOptions a 
instance encodeCustomResourceValidation :: Encode CustomResourceValidation where
  encode a = genericEncode jsonOptions a

instance defaultCustomResourceValidation :: Default CustomResourceValidation where
  default = CustomResourceValidation
    { openAPIV3Schema: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.ExternalDocumentation
-- | ExternalDocumentation allows referencing an external resource for extended documentation.
newtype ExternalDocumentation = ExternalDocumentation
  { description :: (NullOrUndefined String)
  , url :: (NullOrUndefined String) }

derive instance newtypeExternalDocumentation :: Newtype ExternalDocumentation _
derive instance genericExternalDocumentation :: Generic ExternalDocumentation _
instance showExternalDocumentation :: Show ExternalDocumentation where show a = genericShow a
instance decodeExternalDocumentation :: Decode ExternalDocumentation where
  decode a = genericDecode jsonOptions a 
instance encodeExternalDocumentation :: Encode ExternalDocumentation where
  encode a = genericEncode jsonOptions a

instance defaultExternalDocumentation :: Default ExternalDocumentation where
  default = ExternalDocumentation
    { description: NullOrUndefined Nothing
    , url: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSON
-- | JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil.
newtype JSON = JSON
  { _Raw :: (NullOrUndefined String) }

derive instance newtypeJSON :: Newtype JSON _
derive instance genericJSON :: Generic JSON _
instance showJSON :: Show JSON where show a = genericShow a
instance decodeJSON :: Decode JSON where
  decode a = genericDecode jsonOptions a 
instance encodeJSON :: Encode JSON where
  encode a = genericEncode jsonOptions a

instance defaultJSON :: Default JSON where
  default = JSON
    { _Raw: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaProps
-- | JSONSchemaProps is a JSON-Schema following Specification Draft 4 (http://json-schema.org/).
newtype JSONSchemaProps = JSONSchemaProps
  { _default :: (NullOrUndefined JSON)
  , _ref :: (NullOrUndefined String)
  , _schema :: (NullOrUndefined String)
  , _type :: (NullOrUndefined String)
  , additionalItems :: (NullOrUndefined JSONSchemaPropsOrBool)
  , additionalProperties :: (NullOrUndefined JSONSchemaPropsOrBool)
  , allOf :: (NullOrUndefined (Array JSONSchemaProps))
  , anyOf :: (NullOrUndefined (Array JSONSchemaProps))
  , definitions :: (NullOrUndefined (StrMap JSONSchemaProps))
  , dependencies :: (NullOrUndefined (StrMap JSONSchemaPropsOrStringArray))
  , description :: (NullOrUndefined String)
  , enum :: (NullOrUndefined (Array JSON))
  , example :: (NullOrUndefined JSON)
  , exclusiveMaximum :: (NullOrUndefined Boolean)
  , exclusiveMinimum :: (NullOrUndefined Boolean)
  , externalDocs :: (NullOrUndefined ExternalDocumentation)
  , format :: (NullOrUndefined String)
  , id :: (NullOrUndefined String)
  , items :: (NullOrUndefined JSONSchemaPropsOrArray)
  , maxItems :: (NullOrUndefined Int)
  , maxLength :: (NullOrUndefined Int)
  , maxProperties :: (NullOrUndefined Int)
  , maximum :: (NullOrUndefined Number)
  , minItems :: (NullOrUndefined Int)
  , minLength :: (NullOrUndefined Int)
  , minProperties :: (NullOrUndefined Int)
  , minimum :: (NullOrUndefined Number)
  , multipleOf :: (NullOrUndefined Number)
  , not :: (NullOrUndefined JSONSchemaProps)
  , oneOf :: (NullOrUndefined (Array JSONSchemaProps))
  , pattern :: (NullOrUndefined String)
  , patternProperties :: (NullOrUndefined (StrMap JSONSchemaProps))
  , properties :: (NullOrUndefined (StrMap JSONSchemaProps))
  , required :: (NullOrUndefined (Array String))
  , title :: (NullOrUndefined String)
  , uniqueItems :: (NullOrUndefined Boolean) }

derive instance newtypeJSONSchemaProps :: Newtype JSONSchemaProps _
derive instance genericJSONSchemaProps :: Generic JSONSchemaProps _
instance showJSONSchemaProps :: Show JSONSchemaProps where show a = genericShow a
instance decodeJSONSchemaProps :: Decode JSONSchemaProps where
  decode a = genericDecode jsonOptions a 
instance encodeJSONSchemaProps :: Encode JSONSchemaProps where
  encode a = genericEncode jsonOptions a

instance defaultJSONSchemaProps :: Default JSONSchemaProps where
  default = JSONSchemaProps
    { _default: NullOrUndefined Nothing
    , _ref: NullOrUndefined Nothing
    , _schema: NullOrUndefined Nothing
    , _type: NullOrUndefined Nothing
    , additionalItems: NullOrUndefined Nothing
    , additionalProperties: NullOrUndefined Nothing
    , allOf: NullOrUndefined Nothing
    , anyOf: NullOrUndefined Nothing
    , definitions: NullOrUndefined Nothing
    , dependencies: NullOrUndefined Nothing
    , description: NullOrUndefined Nothing
    , enum: NullOrUndefined Nothing
    , example: NullOrUndefined Nothing
    , exclusiveMaximum: NullOrUndefined Nothing
    , exclusiveMinimum: NullOrUndefined Nothing
    , externalDocs: NullOrUndefined Nothing
    , format: NullOrUndefined Nothing
    , id: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , maxItems: NullOrUndefined Nothing
    , maxLength: NullOrUndefined Nothing
    , maxProperties: NullOrUndefined Nothing
    , maximum: NullOrUndefined Nothing
    , minItems: NullOrUndefined Nothing
    , minLength: NullOrUndefined Nothing
    , minProperties: NullOrUndefined Nothing
    , minimum: NullOrUndefined Nothing
    , multipleOf: NullOrUndefined Nothing
    , not: NullOrUndefined Nothing
    , oneOf: NullOrUndefined Nothing
    , pattern: NullOrUndefined Nothing
    , patternProperties: NullOrUndefined Nothing
    , properties: NullOrUndefined Nothing
    , required: NullOrUndefined Nothing
    , title: NullOrUndefined Nothing
    , uniqueItems: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaPropsOrArray
-- | JSONSchemaPropsOrArray represents a value that can either be a JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization purposes.
newtype JSONSchemaPropsOrArray = JSONSchemaPropsOrArray
  { _JSONSchemas :: (NullOrUndefined (Array JSONSchemaProps))
  , _Schema :: (NullOrUndefined JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrArray :: Newtype JSONSchemaPropsOrArray _
derive instance genericJSONSchemaPropsOrArray :: Generic JSONSchemaPropsOrArray _
instance showJSONSchemaPropsOrArray :: Show JSONSchemaPropsOrArray where show a = genericShow a
instance decodeJSONSchemaPropsOrArray :: Decode JSONSchemaPropsOrArray where
  decode a = genericDecode jsonOptions a 
instance encodeJSONSchemaPropsOrArray :: Encode JSONSchemaPropsOrArray where
  encode a = genericEncode jsonOptions a

instance defaultJSONSchemaPropsOrArray :: Default JSONSchemaPropsOrArray where
  default = JSONSchemaPropsOrArray
    { _JSONSchemas: NullOrUndefined Nothing
    , _Schema: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaPropsOrBool
-- | JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property.
newtype JSONSchemaPropsOrBool = JSONSchemaPropsOrBool
  { _Allows :: (NullOrUndefined Boolean)
  , _Schema :: (NullOrUndefined JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrBool :: Newtype JSONSchemaPropsOrBool _
derive instance genericJSONSchemaPropsOrBool :: Generic JSONSchemaPropsOrBool _
instance showJSONSchemaPropsOrBool :: Show JSONSchemaPropsOrBool where show a = genericShow a
instance decodeJSONSchemaPropsOrBool :: Decode JSONSchemaPropsOrBool where
  decode a = genericDecode jsonOptions a 
instance encodeJSONSchemaPropsOrBool :: Encode JSONSchemaPropsOrBool where
  encode a = genericEncode jsonOptions a

instance defaultJSONSchemaPropsOrBool :: Default JSONSchemaPropsOrBool where
  default = JSONSchemaPropsOrBool
    { _Allows: NullOrUndefined Nothing
    , _Schema: NullOrUndefined Nothing }

-- | io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaPropsOrStringArray
-- | JSONSchemaPropsOrStringArray represents a JSONSchemaProps or a string array.
newtype JSONSchemaPropsOrStringArray = JSONSchemaPropsOrStringArray
  { _Property :: (NullOrUndefined (Array String))
  , _Schema :: (NullOrUndefined JSONSchemaProps) }

derive instance newtypeJSONSchemaPropsOrStringArray :: Newtype JSONSchemaPropsOrStringArray _
derive instance genericJSONSchemaPropsOrStringArray :: Generic JSONSchemaPropsOrStringArray _
instance showJSONSchemaPropsOrStringArray :: Show JSONSchemaPropsOrStringArray where show a = genericShow a
instance decodeJSONSchemaPropsOrStringArray :: Decode JSONSchemaPropsOrStringArray where
  decode a = genericDecode jsonOptions a 
instance encodeJSONSchemaPropsOrStringArray :: Encode JSONSchemaPropsOrStringArray where
  encode a = genericEncode jsonOptions a

instance defaultJSONSchemaPropsOrStringArray :: Default JSONSchemaPropsOrStringArray where
  default = JSONSchemaPropsOrStringArray
    { _Property: NullOrUndefined Nothing
    , _Schema: NullOrUndefined Nothing }

-- | ListCustomResourceDefinitionOptions
newtype ListCustomResourceDefinitionOptions = ListCustomResourceDefinitionOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListCustomResourceDefinitionOptions :: Newtype ListCustomResourceDefinitionOptions _
derive instance genericListCustomResourceDefinitionOptions :: Generic ListCustomResourceDefinitionOptions _
instance showListCustomResourceDefinitionOptions :: Show ListCustomResourceDefinitionOptions where show a = genericShow a
instance decodeListCustomResourceDefinitionOptions :: Decode ListCustomResourceDefinitionOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListCustomResourceDefinitionOptions :: Encode ListCustomResourceDefinitionOptions where
  encode a = genericEncode jsonOptions a

instance defaultListCustomResourceDefinitionOptions :: Default ListCustomResourceDefinitionOptions where
  default = ListCustomResourceDefinitionOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind CustomResourceDefinition
listCustomResourceDefinition :: forall e. Config -> ListCustomResourceDefinitionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CustomResourceDefinitionList)
listCustomResourceDefinition cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions" <> formatQueryString options

-- | ReadCustomResourceDefinitionOptions
newtype ReadCustomResourceDefinitionOptions = ReadCustomResourceDefinitionOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadCustomResourceDefinitionOptions :: Newtype ReadCustomResourceDefinitionOptions _
derive instance genericReadCustomResourceDefinitionOptions :: Generic ReadCustomResourceDefinitionOptions _
instance showReadCustomResourceDefinitionOptions :: Show ReadCustomResourceDefinitionOptions where show a = genericShow a
instance decodeReadCustomResourceDefinitionOptions :: Decode ReadCustomResourceDefinitionOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadCustomResourceDefinitionOptions :: Encode ReadCustomResourceDefinitionOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadCustomResourceDefinitionOptions :: Default ReadCustomResourceDefinitionOptions where
  default = ReadCustomResourceDefinitionOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified CustomResourceDefinition
readCustomResourceDefinition :: forall e. Config -> ReadCustomResourceDefinitionOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CustomResourceDefinition)
readCustomResourceDefinition cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/{name}" <> formatQueryString options

-- | replace the specified CustomResourceDefinition
replaceCustomResourceDefinition :: forall e. Config -> CustomResourceDefinition -> Aff (http :: HTTP | e) (Either MetaV1.Status CustomResourceDefinition)
replaceCustomResourceDefinition cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/{name}"
    encodedBody = encodeJSON body

-- | replace status of the specified CustomResourceDefinition
replaceCustomResourceDefinitionStatus :: forall e. Config -> CustomResourceDefinition -> Aff (http :: HTTP | e) (Either MetaV1.Status CustomResourceDefinition)
replaceCustomResourceDefinitionStatus cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions/{name}/status"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind CustomResourceDefinition
watchCustomResourceDefinition :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchCustomResourceDefinition cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/watch/customresourcedefinitions/{name}"

-- | watch individual changes to a list of CustomResourceDefinition
watchCustomResourceDefinitionList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchCustomResourceDefinitionList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/apiextensions.k8s.io/v1beta1/watch/customresourcedefinitions"