module Kubernetes.Api.BatchV2Alpha1 where

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
import Kubernetes.Api.BatchV1 as BatchV1
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | CronJob represents the configuration of a single cron job.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of a cron job, including the schedule. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Current status of a cron job. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype CronJob = CronJob
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined CronJobSpec)
  , status :: (NullOrUndefined CronJobStatus) }

derive instance newtypeCronJob :: Newtype CronJob _
derive instance genericCronJob :: Generic CronJob _
instance showCronJob :: Show CronJob where show a = genericShow a
instance decodeCronJob :: Decode CronJob where
  decode a = genericDecode jsonOptions a 
instance encodeCronJob :: Encode CronJob where
  encode a = genericEncode jsonOptions a

instance defaultCronJob :: Default CronJob where
  default = CronJob
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | CronJobList is a collection of cron jobs.
-- |
-- | Fields:
-- | - `apiVersion`: APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#resources
-- | - `items`: items is the list of CronJobs.
-- | - `kind`: Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype CronJobList = CronJobList
  { apiVersion :: (NullOrUndefined String)
  , items :: (NullOrUndefined (Array CronJob))
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ListMeta) }

derive instance newtypeCronJobList :: Newtype CronJobList _
derive instance genericCronJobList :: Generic CronJobList _
instance showCronJobList :: Show CronJobList where show a = genericShow a
instance decodeCronJobList :: Decode CronJobList where
  decode a = genericDecode jsonOptions a 
instance encodeCronJobList :: Encode CronJobList where
  encode a = genericEncode jsonOptions a

instance defaultCronJobList :: Default CronJobList where
  default = CronJobList
    { apiVersion: NullOrUndefined Nothing
    , items: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing }

-- | CronJobSpec describes how the job execution will look like and when it will actually run.
-- |
-- | Fields:
-- | - `concurrencyPolicy`: Specifies how to treat concurrent executions of a Job. Valid values are: - "Allow" (default): allows CronJobs to run concurrently; - "Forbid": forbids concurrent runs, skipping next run if previous run hasn't finished yet; - "Replace": cancels currently running job and replaces it with a new one
-- | - `failedJobsHistoryLimit`: The number of failed finished jobs to retain. This is a pointer to distinguish between explicit zero and not specified.
-- | - `jobTemplate`: Specifies the job that will be created when executing a CronJob.
-- | - `schedule`: The schedule in Cron format, see https://en.wikipedia.org/wiki/Cron.
-- | - `startingDeadlineSeconds`: Optional deadline in seconds for starting the job if it misses scheduled time for any reason.  Missed jobs executions will be counted as failed ones.
-- | - `successfulJobsHistoryLimit`: The number of successful finished jobs to retain. This is a pointer to distinguish between explicit zero and not specified.
-- | - `suspend`: This flag tells the controller to suspend subsequent executions, it does not apply to already started executions.  Defaults to false.
newtype CronJobSpec = CronJobSpec
  { concurrencyPolicy :: (NullOrUndefined String)
  , failedJobsHistoryLimit :: (NullOrUndefined Int)
  , jobTemplate :: (NullOrUndefined JobTemplateSpec)
  , schedule :: (NullOrUndefined String)
  , startingDeadlineSeconds :: (NullOrUndefined Int)
  , successfulJobsHistoryLimit :: (NullOrUndefined Int)
  , suspend :: (NullOrUndefined Boolean) }

derive instance newtypeCronJobSpec :: Newtype CronJobSpec _
derive instance genericCronJobSpec :: Generic CronJobSpec _
instance showCronJobSpec :: Show CronJobSpec where show a = genericShow a
instance decodeCronJobSpec :: Decode CronJobSpec where
  decode a = genericDecode jsonOptions a 
instance encodeCronJobSpec :: Encode CronJobSpec where
  encode a = genericEncode jsonOptions a

instance defaultCronJobSpec :: Default CronJobSpec where
  default = CronJobSpec
    { concurrencyPolicy: NullOrUndefined Nothing
    , failedJobsHistoryLimit: NullOrUndefined Nothing
    , jobTemplate: NullOrUndefined Nothing
    , schedule: NullOrUndefined Nothing
    , startingDeadlineSeconds: NullOrUndefined Nothing
    , successfulJobsHistoryLimit: NullOrUndefined Nothing
    , suspend: NullOrUndefined Nothing }

-- | CronJobStatus represents the current state of a cron job.
-- |
-- | Fields:
-- | - `active`: A list of pointers to currently running jobs.
-- | - `lastScheduleTime`: Information when was the last time the job was successfully scheduled.
newtype CronJobStatus = CronJobStatus
  { active :: (NullOrUndefined (Array CoreV1.ObjectReference))
  , lastScheduleTime :: (NullOrUndefined MetaV1.Time) }

derive instance newtypeCronJobStatus :: Newtype CronJobStatus _
derive instance genericCronJobStatus :: Generic CronJobStatus _
instance showCronJobStatus :: Show CronJobStatus where show a = genericShow a
instance decodeCronJobStatus :: Decode CronJobStatus where
  decode a = genericDecode jsonOptions a 
instance encodeCronJobStatus :: Encode CronJobStatus where
  encode a = genericEncode jsonOptions a

instance defaultCronJobStatus :: Default CronJobStatus where
  default = CronJobStatus
    { active: NullOrUndefined Nothing
    , lastScheduleTime: NullOrUndefined Nothing }

-- | JobTemplateSpec describes the data a Job should have when created from a template
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata of the jobs created from this template. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of the job. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype JobTemplateSpec = JobTemplateSpec
  { metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined BatchV1.JobSpec) }

derive instance newtypeJobTemplateSpec :: Newtype JobTemplateSpec _
derive instance genericJobTemplateSpec :: Generic JobTemplateSpec _
instance showJobTemplateSpec :: Show JobTemplateSpec where show a = genericShow a
instance decodeJobTemplateSpec :: Decode JobTemplateSpec where
  decode a = genericDecode jsonOptions a 
instance encodeJobTemplateSpec :: Encode JobTemplateSpec where
  encode a = genericEncode jsonOptions a

instance defaultJobTemplateSpec :: Default JobTemplateSpec where
  default = JobTemplateSpec
    { metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing }

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/"