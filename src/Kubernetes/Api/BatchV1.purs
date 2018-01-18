module Kubernetes.Api.BatchV1 where

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff)
import Data.Either (Either(Left,Right))
import Data.Foreign.Class (class Decode, class Encode, decode, encode)
import Data.Foreign.Class (class Decode, class Encode, encode, decode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Data.Foreign.Generic.Types (Options)
import Data.Foreign.Index (readProp)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(Just,Nothing))
import Data.Newtype (class Newtype)
import Data.StrMap (StrMap)
import Data.StrMap as StrMap
import Data.Tuple (Tuple(Tuple))
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | Job represents the configuration of a single job.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of a job. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Current status of a job. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype Job = Job
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe JobSpec)
  , status :: (Maybe JobStatus) }

derive instance newtypeJob :: Newtype Job _
derive instance genericJob :: Generic Job _
instance showJob :: Show Job where show a = genericShow a
instance decodeJob :: Decode Job where
  decode a = do
               assertPropEq "apiVersion" "batch/v1" a
               assertPropEq "kind" "Job" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ Job { metadata, spec, status }
instance encodeJob :: Encode Job where
  encode (Job a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "batch/v1")
               , Tuple "kind" (encode "Job")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultJob :: Default Job where
  default = Job
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | JobCondition describes current state of a job.
-- |
-- | Fields:
-- | - `_type`: Type of job condition, Complete or Failed.
-- | - `lastProbeTime`: Last time the condition was checked.
-- | - `lastTransitionTime`: Last time the condition transit from one status to another.
-- | - `message`: Human readable message indicating details about last transition.
-- | - `reason`: (brief) reason for the condition's last transition.
-- | - `status`: Status of the condition, one of True, False, Unknown.
newtype JobCondition = JobCondition
  { _type :: (Maybe String)
  , lastProbeTime :: (Maybe MetaV1.Time)
  , lastTransitionTime :: (Maybe MetaV1.Time)
  , message :: (Maybe String)
  , reason :: (Maybe String)
  , status :: (Maybe String) }

derive instance newtypeJobCondition :: Newtype JobCondition _
derive instance genericJobCondition :: Generic JobCondition _
instance showJobCondition :: Show JobCondition where show a = genericShow a
instance decodeJobCondition :: Decode JobCondition where
  decode a = do
               _type <- decodeMaybe "_type" a
               lastProbeTime <- decodeMaybe "lastProbeTime" a
               lastTransitionTime <- decodeMaybe "lastTransitionTime" a
               message <- decodeMaybe "message" a
               reason <- decodeMaybe "reason" a
               status <- decodeMaybe "status" a
               pure $ JobCondition { _type, lastProbeTime, lastTransitionTime, message, reason, status }
instance encodeJobCondition :: Encode JobCondition where
  encode (JobCondition a) = encode $ StrMap.fromFoldable $
               [ Tuple "_type" (encodeMaybe a._type)
               , Tuple "lastProbeTime" (encodeMaybe a.lastProbeTime)
               , Tuple "lastTransitionTime" (encodeMaybe a.lastTransitionTime)
               , Tuple "message" (encodeMaybe a.message)
               , Tuple "reason" (encodeMaybe a.reason)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultJobCondition :: Default JobCondition where
  default = JobCondition
    { _type: Nothing
    , lastProbeTime: Nothing
    , lastTransitionTime: Nothing
    , message: Nothing
    , reason: Nothing
    , status: Nothing }

-- | JobList is a collection of jobs.
-- |
-- | Fields:
-- | - `items`: items is the list of Jobs.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype JobList = JobList
  { items :: (Maybe (Array Job))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeJobList :: Newtype JobList _
derive instance genericJobList :: Generic JobList _
instance showJobList :: Show JobList where show a = genericShow a
instance decodeJobList :: Decode JobList where
  decode a = do
               assertPropEq "apiVersion" "batch/v1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "JobList" a
               metadata <- decodeMaybe "metadata" a
               pure $ JobList { items, metadata }
instance encodeJobList :: Encode JobList where
  encode (JobList a) = encode $ StrMap.fromFoldable $
               [ Tuple "apiVersion" (encode "batch/v1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "JobList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultJobList :: Default JobList where
  default = JobList
    { items: Nothing
    , metadata: Nothing }

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
  { activeDeadlineSeconds :: (Maybe Int)
  , backoffLimit :: (Maybe Int)
  , completions :: (Maybe Int)
  , manualSelector :: (Maybe Boolean)
  , parallelism :: (Maybe Int)
  , selector :: (Maybe MetaV1.LabelSelector)
  , template :: (Maybe CoreV1.PodTemplateSpec) }

derive instance newtypeJobSpec :: Newtype JobSpec _
derive instance genericJobSpec :: Generic JobSpec _
instance showJobSpec :: Show JobSpec where show a = genericShow a
instance decodeJobSpec :: Decode JobSpec where
  decode a = do
               activeDeadlineSeconds <- decodeMaybe "activeDeadlineSeconds" a
               backoffLimit <- decodeMaybe "backoffLimit" a
               completions <- decodeMaybe "completions" a
               manualSelector <- decodeMaybe "manualSelector" a
               parallelism <- decodeMaybe "parallelism" a
               selector <- decodeMaybe "selector" a
               template <- decodeMaybe "template" a
               pure $ JobSpec { activeDeadlineSeconds, backoffLimit, completions, manualSelector, parallelism, selector, template }
instance encodeJobSpec :: Encode JobSpec where
  encode (JobSpec a) = encode $ StrMap.fromFoldable $
               [ Tuple "activeDeadlineSeconds" (encodeMaybe a.activeDeadlineSeconds)
               , Tuple "backoffLimit" (encodeMaybe a.backoffLimit)
               , Tuple "completions" (encodeMaybe a.completions)
               , Tuple "manualSelector" (encodeMaybe a.manualSelector)
               , Tuple "parallelism" (encodeMaybe a.parallelism)
               , Tuple "selector" (encodeMaybe a.selector)
               , Tuple "template" (encodeMaybe a.template) ]


instance defaultJobSpec :: Default JobSpec where
  default = JobSpec
    { activeDeadlineSeconds: Nothing
    , backoffLimit: Nothing
    , completions: Nothing
    , manualSelector: Nothing
    , parallelism: Nothing
    , selector: Nothing
    , template: Nothing }

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
  { active :: (Maybe Int)
  , completionTime :: (Maybe MetaV1.Time)
  , conditions :: (Maybe (Array JobCondition))
  , failed :: (Maybe Int)
  , startTime :: (Maybe MetaV1.Time)
  , succeeded :: (Maybe Int) }

derive instance newtypeJobStatus :: Newtype JobStatus _
derive instance genericJobStatus :: Generic JobStatus _
instance showJobStatus :: Show JobStatus where show a = genericShow a
instance decodeJobStatus :: Decode JobStatus where
  decode a = do
               active <- decodeMaybe "active" a
               completionTime <- decodeMaybe "completionTime" a
               conditions <- decodeMaybe "conditions" a
               failed <- decodeMaybe "failed" a
               startTime <- decodeMaybe "startTime" a
               succeeded <- decodeMaybe "succeeded" a
               pure $ JobStatus { active, completionTime, conditions, failed, startTime, succeeded }
instance encodeJobStatus :: Encode JobStatus where
  encode (JobStatus a) = encode $ StrMap.fromFoldable $
               [ Tuple "active" (encodeMaybe a.active)
               , Tuple "completionTime" (encodeMaybe a.completionTime)
               , Tuple "conditions" (encodeMaybe a.conditions)
               , Tuple "failed" (encodeMaybe a.failed)
               , Tuple "startTime" (encodeMaybe a.startTime)
               , Tuple "succeeded" (encodeMaybe a.succeeded) ]


instance defaultJobStatus :: Default JobStatus where
  default = JobStatus
    { active: Nothing
    , completionTime: Nothing
    , conditions: Nothing
    , failed: Nothing
    , startTime: Nothing
    , succeeded: Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/"