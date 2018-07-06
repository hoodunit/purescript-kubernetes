module Kubernetes.Api.Batch.V2Alpha1 where

import Prelude
import Prelude
import Prelude
import Control.Alt ((<|>))
import Data.Either (Either(Left,Right))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(Tuple))
import Effect.Aff (Aff)
import Foreign.Class (class Decode, class Encode, decode, encode)
import Foreign.Class (class Decode, class Encode, encode, decode)
import Prelude
import Data.Maybe (Maybe(Just,Nothing))
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Foreign.Generic (encodeJSON, genericEncode, genericDecode)
import Foreign.Generic.Types (Options)
import Foreign.Index (readProp)
import Foreign.Object (Object)
import Foreign.Object as Object
import Kubernetes.Client as Client
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (assertPropEq, decodeMaybe, encodeMaybe, jsonOptions)
import Kubernetes.Api.Batch.V1 as BatchV1
import Kubernetes.Api.Core.V1 as CoreV1
import Kubernetes.Api.Meta.V1 as MetaV1

-- | CronJob represents the configuration of a single cron job.
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of a cron job, including the schedule. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
-- | - `status`: Current status of a cron job. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype CronJob = CronJob
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe CronJobSpec)
  , status :: (Maybe CronJobStatus) }

derive instance newtypeCronJob :: Newtype CronJob _
derive instance genericCronJob :: Generic CronJob _
instance showCronJob :: Show CronJob where show a = genericShow a
instance decodeCronJob :: Decode CronJob where
  decode a = do
               assertPropEq "apiVersion" "batch/v2alpha1" a
               assertPropEq "kind" "CronJob" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ CronJob { metadata, spec, status }
instance encodeCronJob :: Encode CronJob where
  encode (CronJob a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "batch/v2alpha1")
               , Tuple "kind" (encode "CronJob")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultCronJob :: Default CronJob where
  default = CronJob
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | CronJobList is a collection of cron jobs.
-- |
-- | Fields:
-- | - `items`: items is the list of CronJobs.
-- | - `metadata`: Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
newtype CronJobList = CronJobList
  { items :: (Maybe (Array CronJob))
  , metadata :: (Maybe MetaV1.ListMeta) }

derive instance newtypeCronJobList :: Newtype CronJobList _
derive instance genericCronJobList :: Generic CronJobList _
instance showCronJobList :: Show CronJobList where show a = genericShow a
instance decodeCronJobList :: Decode CronJobList where
  decode a = do
               assertPropEq "apiVersion" "batch/v2alpha1" a
               items <- decodeMaybe "items" a
               assertPropEq "kind" "CronJobList" a
               metadata <- decodeMaybe "metadata" a
               pure $ CronJobList { items, metadata }
instance encodeCronJobList :: Encode CronJobList where
  encode (CronJobList a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "batch/v2alpha1")
               , Tuple "items" (encodeMaybe a.items)
               , Tuple "kind" (encode "CronJobList")
               , Tuple "metadata" (encodeMaybe a.metadata) ]


instance defaultCronJobList :: Default CronJobList where
  default = CronJobList
    { items: Nothing
    , metadata: Nothing }

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
  { concurrencyPolicy :: (Maybe String)
  , failedJobsHistoryLimit :: (Maybe Int)
  , jobTemplate :: (Maybe JobTemplateSpec)
  , schedule :: (Maybe String)
  , startingDeadlineSeconds :: (Maybe Int)
  , successfulJobsHistoryLimit :: (Maybe Int)
  , suspend :: (Maybe Boolean) }

derive instance newtypeCronJobSpec :: Newtype CronJobSpec _
derive instance genericCronJobSpec :: Generic CronJobSpec _
instance showCronJobSpec :: Show CronJobSpec where show a = genericShow a
instance decodeCronJobSpec :: Decode CronJobSpec where
  decode a = do
               concurrencyPolicy <- decodeMaybe "concurrencyPolicy" a
               failedJobsHistoryLimit <- decodeMaybe "failedJobsHistoryLimit" a
               jobTemplate <- decodeMaybe "jobTemplate" a
               schedule <- decodeMaybe "schedule" a
               startingDeadlineSeconds <- decodeMaybe "startingDeadlineSeconds" a
               successfulJobsHistoryLimit <- decodeMaybe "successfulJobsHistoryLimit" a
               suspend <- decodeMaybe "suspend" a
               pure $ CronJobSpec { concurrencyPolicy, failedJobsHistoryLimit, jobTemplate, schedule, startingDeadlineSeconds, successfulJobsHistoryLimit, suspend }
instance encodeCronJobSpec :: Encode CronJobSpec where
  encode (CronJobSpec a) = encode $ Object.fromFoldable $
               [ Tuple "concurrencyPolicy" (encodeMaybe a.concurrencyPolicy)
               , Tuple "failedJobsHistoryLimit" (encodeMaybe a.failedJobsHistoryLimit)
               , Tuple "jobTemplate" (encodeMaybe a.jobTemplate)
               , Tuple "schedule" (encodeMaybe a.schedule)
               , Tuple "startingDeadlineSeconds" (encodeMaybe a.startingDeadlineSeconds)
               , Tuple "successfulJobsHistoryLimit" (encodeMaybe a.successfulJobsHistoryLimit)
               , Tuple "suspend" (encodeMaybe a.suspend) ]


instance defaultCronJobSpec :: Default CronJobSpec where
  default = CronJobSpec
    { concurrencyPolicy: Nothing
    , failedJobsHistoryLimit: Nothing
    , jobTemplate: Nothing
    , schedule: Nothing
    , startingDeadlineSeconds: Nothing
    , successfulJobsHistoryLimit: Nothing
    , suspend: Nothing }

-- | CronJobStatus represents the current state of a cron job.
-- |
-- | Fields:
-- | - `active`: A list of pointers to currently running jobs.
-- | - `lastScheduleTime`: Information when was the last time the job was successfully scheduled.
newtype CronJobStatus = CronJobStatus
  { active :: (Maybe (Array CoreV1.ObjectReference))
  , lastScheduleTime :: (Maybe MetaV1.Time) }

derive instance newtypeCronJobStatus :: Newtype CronJobStatus _
derive instance genericCronJobStatus :: Generic CronJobStatus _
instance showCronJobStatus :: Show CronJobStatus where show a = genericShow a
instance decodeCronJobStatus :: Decode CronJobStatus where
  decode a = do
               active <- decodeMaybe "active" a
               lastScheduleTime <- decodeMaybe "lastScheduleTime" a
               pure $ CronJobStatus { active, lastScheduleTime }
instance encodeCronJobStatus :: Encode CronJobStatus where
  encode (CronJobStatus a) = encode $ Object.fromFoldable $
               [ Tuple "active" (encodeMaybe a.active)
               , Tuple "lastScheduleTime" (encodeMaybe a.lastScheduleTime) ]


instance defaultCronJobStatus :: Default CronJobStatus where
  default = CronJobStatus
    { active: Nothing
    , lastScheduleTime: Nothing }

-- | JobTemplateSpec describes the data a Job should have when created from a template
-- |
-- | Fields:
-- | - `metadata`: Standard object's metadata of the jobs created from this template. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
-- | - `spec`: Specification of the desired behavior of the job. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
newtype JobTemplateSpec = JobTemplateSpec
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe BatchV1.JobSpec) }

derive instance newtypeJobTemplateSpec :: Newtype JobTemplateSpec _
derive instance genericJobTemplateSpec :: Generic JobTemplateSpec _
instance showJobTemplateSpec :: Show JobTemplateSpec where show a = genericShow a
instance decodeJobTemplateSpec :: Decode JobTemplateSpec where
  decode a = do
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               pure $ JobTemplateSpec { metadata, spec }
instance encodeJobTemplateSpec :: Encode JobTemplateSpec where
  encode (JobTemplateSpec a) = encode $ Object.fromFoldable $
               [ Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec) ]


instance defaultJobTemplateSpec :: Default JobTemplateSpec where
  default = JobTemplateSpec
    { metadata: Nothing
    , spec: Nothing }

-- | get available resources
getAPIResources :: Config -> Aff (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/batch/v2alpha1/"