module Kubernetes.Api.NetworkingV1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.NullOrUndefined (NullOrUndefined(NullOrUndefined))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | IPBlock describes a particular CIDR (Ex. "192.168.1.1/24") that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The except entry describes CIDRs that should not be included within this rule.
-- |
-- | Fields:
-- | - `cidr`: CIDR is a string representing the IP Block Valid examples are "192.168.1.1/24"
-- | - `except`: Except is a slice of CIDRs that should not be included within an IP Block Valid examples are "192.168.1.1/24" Except values will be rejected if they are outside the CIDR range
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

-- | NetworkPolicy describes what network traffic is allowed for a set of Pods
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior for this NetworkPolicy.
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

-- | NetworkPolicyEgressRule describes a particular set of traffic that is allowed out of pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and to. This type is beta-level in 1.8
-- |
-- | Fields:
-- | - `ports`: List of destination ports for outgoing traffic. Each item in this list is combined using a logical OR. If this field is empty or missing, this rule matches all ports (traffic not restricted by port). If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list.
-- | - `to`: List of destinations for outgoing traffic of pods selected for this rule. Items in this list are combined using a logical OR operation. If this field is empty or missing, this rule matches all destinations (traffic not restricted by destination). If this field is present and contains at least one item, this rule allows traffic only if the traffic matches at least one item in the to list.
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

-- | NetworkPolicyIngressRule describes a particular set of traffic that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and from.
-- |
-- | Fields:
-- | - `from`: List of sources which should be able to access the pods selected for this rule. Items in this list are combined using a logical OR operation. If this field is empty or missing, this rule matches all sources (traffic not restricted by source). If this field is present and contains at least on item, this rule allows traffic only if the traffic matches at least one item in the from list.
-- | - `ports`: List of ports which should be made accessible on the pods selected for this rule. Each item in this list is combined using a logical OR. If this field is empty or missing, this rule matches all ports (traffic not restricted by port). If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list.
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

-- | NetworkPolicyList is a list of NetworkPolicy objects.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: Items is a list of schema objects.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
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

-- | NetworkPolicyPeer describes a peer to allow traffic from. Exactly one of its fields must be specified.
-- |
-- | Fields:
-- | - `ipBlock`: IPBlock defines policy on a particular IPBlock
-- | - `namespaceSelector`: Selects Namespaces using cluster scoped-labels. This matches all pods in all namespaces selected by this label selector. This field follows standard label selector semantics. If present but empty, this selector selects all namespaces.
-- | - `podSelector`: This is a label selector which selects Pods in this namespace. This field follows standard label selector semantics. If present but empty, this selector selects all pods in this namespace.
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

-- | NetworkPolicyPort describes a port to allow traffic on
-- |
-- | Fields:
-- | - `port`: The port on the given protocol. This can either be a numerical or named port on a pod. If this field is not provided, this matches all port names and numbers.
-- | - `protocol`: The protocol (TCP or UDP) which traffic must match. If not specified, this field defaults to TCP.
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

-- | NetworkPolicySpec provides the specification of a NetworkPolicy
-- |
-- | Fields:
-- | - `egress`: List of egress rules to be applied to the selected pods. Outgoing traffic is allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic matches at least one egress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it selects are isolated by default). This field is beta-level in 1.8
-- | - `ingress`: List of ingress rules to be applied to the selected pods. Traffic is allowed to a pod if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy does not allow any traffic (and serves solely to ensure that the pods it selects are isolated by default)
-- | - `podSelector`: Selects the pods to which this NetworkPolicy object applies. The array of ingress rules is applied to any pods selected by this field. Multiple network policies can select the same set of pods. In this case, the ingress rules for each are combined additively. This field is NOT optional and follows standard label selector semantics. An empty podSelector matches all pods in this namespace.
-- | - `policyTypes`: List of rule types that the NetworkPolicy relates to. Valid options are Ingress, Egress, or Ingress,Egress. If this field is not specified, it will default based on the existence of Ingress or Egress rules; policies that contain an Egress section are assumed to affect Egress, and all policies (whether or not they contain an Ingress section) are assumed to affect Ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ "Egress" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include "Egress" (since such a policy would not include an Egress section and would otherwise default to just [ "Ingress" ]). This field is beta-level in 1.8
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

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/"