module Kubernetes.Api.BatchV1 where

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
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Job represents the configuration of a single job.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of a job. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Current status of a job. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Job = Job
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined JobSpec)
  , status :: (NullOrUndefined JobStatus) }

derive instance newtypeJob :: Newtype Job _
derive instance genericJob :: Generic Job _
instance showJob :: Show Job where show a = genericShow a
instance decodeJob :: Decode Job where
  decode a = genericDecode jsonOptions a 
instance encodeJob :: Encode Job where
  encode a = genericEncode jsonOptions a

instance defaultJob :: Default Job where
  default = Job
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | JobCondition describes current state of a job.
-- |
-- | Fields:
-- | - `lastProbeTime`: Last time the condition was checked.
-- | - `lastTransitionTime`: Last time the condition transit from one status to another.
-- | - `message`: Human readable message indicating details about last transition.
-- | - `reason`: (brief) reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
-- | - `_type`: Type of job condition, Complete or Failed.
newtype JobCondition = JobCondition
  { _type :: (NullOrUndefined String)
  , lastProbeTime :: (NullOrUndefined MetaV1.Time)
  , lastTransitionTime :: (NullOrUndefined MetaV1.Time)
  , message :: (NullOrUndefined String)
  , reason :: (NullOrUndefined String)
  , status :: (NullOrUndefined String) }

derive instance newtypeJobCondition :: Newtype JobCondition _
derive instance genericJobCondition :: Generic JobCondition _
instance showJobCondition :: Show JobCondition where show a = genericShow a
instance decodeJobCondition :: Decode JobCondition where
  decode a = genericDecode jsonOptions a 
instance encodeJobCondition :: Encode JobCondition where
  encode a = genericEncode jsonOptions a

instance defaultJobCondition :: Default JobCondition where
  default = JobCondition
    { _type: NullOrUndefined Nothing
    , lastProbeTime: NullOrUndefined Nothing
    , lastTransitionTime: NullOrUndefined Nothing
    , message: NullOrUndefined Nothing
    , reason: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | JobList is a collection of jobs.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: items is the list of Jobs.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype JobList = JobList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array Job))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeJobList :: Newtype JobList _
derive instance genericJobList :: Generic JobList _
instance showJobList :: Show JobList where show a = genericShow a
instance decodeJobList :: Decode JobList where
  decode a = genericDecode jsonOptions a 
instance encodeJobList :: Encode JobList where
  encode a = genericEncode jsonOptions a

instance defaultJobList :: Default JobList where
  default = JobList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | JobSpec describes how the job execution will look like.
-- |
-- | Fields:
-- | - `activeDeadlineSeconds`: Specifies the duration in seconds relative to the startTime that the job may be active before the system tries to terminate it; value must be positive integer
-- | - `backoffLimit`: Specifies the number of retries before marking this job failed. Defaults to 6
-- | - `completions`: Specifies the desired number of successfully finished pods the job should be run with.  Setting to nil means that the success of any pod signals the success of all pods, and allows parallelism to have any positive value.  Setting to 1 means that parallelism is limited to 1 and the success of that pod signals the success of the job. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
-- | - `manualSelector`: manualSelector controls generation of pod labels and pod selectors. Leave `manualSelector` unset unless you are certain what you are doing. When false or unset, the system pick labels unique to this job and appends those labels to the pod template.  When true, the user is responsible for picking unique labels and specifying the selector.  Failure to pick a unique label may cause this and other jobs to not function correctly.  However, You may see `manualSelector=true` in jobs that were created with the old `extensions/v1beta1` API. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/#specifying-your-own-pod-selector
-- | - `parallelism`: Specifies the maximum desired number of pods the job should run at any given time. The actual number of pods running in steady state will be less than this number when ((.spec.completions - .status.successful) < .spec.parallelism), i.e. when the work left to do is less than max parallelism. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
-- | - `selector`: A label query over pods that should match the pod count. Normally, the system sets this field for you. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
-- | - `template`: Describes the pod that will be created when executing a job. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
newtype JobSpec = JobSpec
  { activeDeadlineSeconds :: (NullOrUndefined Int)
  , backoffLimit :: (NullOrUndefined Int)
  , completions :: (NullOrUndefined Int)
  , manualSelector :: (NullOrUndefined Boolean)
  , parallelism :: (NullOrUndefined Int)
  , selector :: (NullOrUndefined MetaV1.LabelSelector)
  , template :: (NullOrUndefined CoreV1.PodTemplateSpec) }

derive instance newtypeJobSpec :: Newtype JobSpec _
derive instance genericJobSpec :: Generic JobSpec _
instance showJobSpec :: Show JobSpec where show a = genericShow a
instance decodeJobSpec :: Decode JobSpec where
  decode a = genericDecode jsonOptions a 
instance encodeJobSpec :: Encode JobSpec where
  encode a = genericEncode jsonOptions a

instance defaultJobSpec :: Default JobSpec where
  default = JobSpec
    { activeDeadlineSeconds: NullOrUndefined Nothing
    , backoffLimit: NullOrUndefined Nothing
    , completions: NullOrUndefined Nothing
    , manualSelector: NullOrUndefined Nothing
    , parallelism: NullOrUndefined Nothing
    , selector: NullOrUndefined Nothing
    , template: NullOrUndefined Nothing }

-- | JobStatus represents the current state of a Job.
-- |
-- | Fields:
-- | - `active`: The number of actively running pods.
-- | - `completionTime`: Represents time when the job was completed. It is not guaranteed to be set in happens-before order across separate operations. It is represented in RFC3339 form and is in UTC.
-- | - `conditions`: The latest available observations of an object's current state. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
-- | - `failed`: The number of pods which reached phase Failed.
-- | - `startTime`: Represents time when the job was acknowledged by the job controller. It is not guaranteed to be set in happens-before order across separate operations. It is represented in RFC3339 form and is in UTC.
-- | - `succeeded`: The number of pods which reached phase Succeeded.
newtype JobStatus = JobStatus
  { active :: (NullOrUndefined Int)
  , completionTime :: (NullOrUndefined MetaV1.Time)
  , conditions :: (NullOrUndefined (Array JobCondition))
  , failed :: (NullOrUndefined Int)
  , startTime :: (NullOrUndefined MetaV1.Time)
  , succeeded :: (NullOrUndefined Int) }

derive instance newtypeJobStatus :: Newtype JobStatus _
derive instance genericJobStatus :: Generic JobStatus _
instance showJobStatus :: Show JobStatus where show a = genericShow a
instance decodeJobStatus :: Decode JobStatus where
  decode a = genericDecode jsonOptions a 
instance encodeJobStatus :: Encode JobStatus where
  encode a = genericEncode jsonOptions a

instance defaultJobStatus :: Default JobStatus where
  default = JobStatus
    { active: NullOrUndefined Nothing
    , completionTime: NullOrUndefined Nothing
    , conditions: NullOrUndefined Nothing
    , failed: NullOrUndefined Nothing
    , startTime: NullOrUndefined Nothing
    , succeeded: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/"