module Kubernetes.Api.NetworkingV1 where

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
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Api.Util as Util
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | io.k8s.api.networking.v1.IPBlock
-- | IPBlock describes a particular CIDR (Ex. "192.168.1.1/24") that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The except entry describes CIDRs that should not be included within this rule.
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

-- | io.k8s.api.networking.v1.NetworkPolicy
-- | NetworkPolicy describes what network traffic is allowed for a set of Pods
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

-- | io.k8s.api.networking.v1.NetworkPolicyEgressRule
-- | NetworkPolicyEgressRule describes a particular set of traffic that is allowed out of pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and to. This type is beta-level in 1.8
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

-- | io.k8s.api.networking.v1.NetworkPolicyIngressRule
-- | NetworkPolicyIngressRule describes a particular set of traffic that is allowed to the pods matched by a NetworkPolicySpec's podSelector. The traffic must match both ports and from.
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

-- | io.k8s.api.networking.v1.NetworkPolicyList
-- | NetworkPolicyList is a list of NetworkPolicy objects.
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

-- | io.k8s.api.networking.v1.NetworkPolicyPeer
-- | NetworkPolicyPeer describes a peer to allow traffic from. Exactly one of its fields must be specified.
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

-- | io.k8s.api.networking.v1.NetworkPolicyPort
-- | NetworkPolicyPort describes a port to allow traffic on
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

-- | io.k8s.api.networking.v1.NetworkPolicySpec
-- | NetworkPolicySpec provides the specification of a NetworkPolicy
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

-- | create a NetworkPolicy
createNamespacedNetworkPolicy :: forall e. Config -> NetworkPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkPolicy)
createNamespacedNetworkPolicy cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies"
    encodedBody = encodeJSON body

-- | DeleteCollectionNamespacedNetworkPolicyOptions
newtype DeleteCollectionNamespacedNetworkPolicyOptions = DeleteCollectionNamespacedNetworkPolicyOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedNetworkPolicyOptions :: Newtype DeleteCollectionNamespacedNetworkPolicyOptions _
derive instance genericDeleteCollectionNamespacedNetworkPolicyOptions :: Generic DeleteCollectionNamespacedNetworkPolicyOptions _
instance showDeleteCollectionNamespacedNetworkPolicyOptions :: Show DeleteCollectionNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedNetworkPolicyOptions :: Decode DeleteCollectionNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedNetworkPolicyOptions :: Encode DeleteCollectionNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedNetworkPolicyOptions :: Default DeleteCollectionNamespacedNetworkPolicyOptions where
  default = DeleteCollectionNamespacedNetworkPolicyOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of NetworkPolicy
deleteCollectionNamespacedNetworkPolicy :: forall e. Config -> DeleteCollectionNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedNetworkPolicy cfg options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies" <> formatQueryString options

-- | DeleteNamespacedNetworkPolicyOptions
newtype DeleteNamespacedNetworkPolicyOptions = DeleteNamespacedNetworkPolicyOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedNetworkPolicyOptions :: Newtype DeleteNamespacedNetworkPolicyOptions _
derive instance genericDeleteNamespacedNetworkPolicyOptions :: Generic DeleteNamespacedNetworkPolicyOptions _
instance showDeleteNamespacedNetworkPolicyOptions :: Show DeleteNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeDeleteNamespacedNetworkPolicyOptions :: Decode DeleteNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedNetworkPolicyOptions :: Encode DeleteNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedNetworkPolicyOptions :: Default DeleteNamespacedNetworkPolicyOptions where
  default = DeleteNamespacedNetworkPolicyOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a NetworkPolicy
deleteNamespacedNetworkPolicy :: forall e. Config -> MetaV1.DeleteOptions -> DeleteNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedNetworkPolicy cfg body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies/{name}" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/"

-- | ListNamespacedNetworkPolicyOptions
newtype ListNamespacedNetworkPolicyOptions = ListNamespacedNetworkPolicyOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedNetworkPolicyOptions :: Newtype ListNamespacedNetworkPolicyOptions _
derive instance genericListNamespacedNetworkPolicyOptions :: Generic ListNamespacedNetworkPolicyOptions _
instance showListNamespacedNetworkPolicyOptions :: Show ListNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeListNamespacedNetworkPolicyOptions :: Decode ListNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedNetworkPolicyOptions :: Encode ListNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedNetworkPolicyOptions :: Default ListNamespacedNetworkPolicyOptions where
  default = ListNamespacedNetworkPolicyOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind NetworkPolicy
listNamespacedNetworkPolicy :: forall e. Config -> ListNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkPolicyList)
listNamespacedNetworkPolicy cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies" <> formatQueryString options

-- | list or watch objects of kind NetworkPolicy
listNetworkPolicyForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkPolicyList)
listNetworkPolicyForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/networkpolicies"

-- | ReadNamespacedNetworkPolicyOptions
newtype ReadNamespacedNetworkPolicyOptions = ReadNamespacedNetworkPolicyOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedNetworkPolicyOptions :: Newtype ReadNamespacedNetworkPolicyOptions _
derive instance genericReadNamespacedNetworkPolicyOptions :: Generic ReadNamespacedNetworkPolicyOptions _
instance showReadNamespacedNetworkPolicyOptions :: Show ReadNamespacedNetworkPolicyOptions where show a = genericShow a
instance decodeReadNamespacedNetworkPolicyOptions :: Decode ReadNamespacedNetworkPolicyOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedNetworkPolicyOptions :: Encode ReadNamespacedNetworkPolicyOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedNetworkPolicyOptions :: Default ReadNamespacedNetworkPolicyOptions where
  default = ReadNamespacedNetworkPolicyOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified NetworkPolicy
readNamespacedNetworkPolicy :: forall e. Config -> ReadNamespacedNetworkPolicyOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkPolicy)
readNamespacedNetworkPolicy cfg options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies/{name}" <> formatQueryString options

-- | replace the specified NetworkPolicy
replaceNamespacedNetworkPolicy :: forall e. Config -> NetworkPolicy -> Aff (http :: HTTP | e) (Either MetaV1.Status NetworkPolicy)
replaceNamespacedNetworkPolicy cfg body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/networking.k8s.io/v1/namespaces/{namespace}/networkpolicies/{name}"
    encodedBody = encodeJSON body

-- | watch changes to an object of kind NetworkPolicy
watchNamespacedNetworkPolicy :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedNetworkPolicy cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/watch/namespaces/{namespace}/networkpolicies/{name}"

-- | watch individual changes to a list of NetworkPolicy
watchNamespacedNetworkPolicyList :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedNetworkPolicyList cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/watch/namespaces/{namespace}/networkpolicies"

-- | watch individual changes to a list of NetworkPolicy
watchNetworkPolicyListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNetworkPolicyListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/networking.k8s.io/v1/watch/networkpolicies"