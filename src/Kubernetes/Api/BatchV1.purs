module Kubernetes.Api.BatchV1 where

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
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | io.k8s.api.batch.v1.Job
-- | Job represents the configuration of a single job.
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

-- | io.k8s.api.batch.v1.JobCondition
-- | JobCondition describes current state of a job.
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

-- | io.k8s.api.batch.v1.JobList
-- | JobList is a collection of jobs.
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

-- | io.k8s.api.batch.v1.JobSpec
-- | JobSpec describes how the job execution will look like.
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

-- | io.k8s.api.batch.v1.JobStatus
-- | JobStatus represents the current state of a Job.
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

-- | create a Job
createNamespacedJob :: forall e. Config -> String -> Job -> Aff (http :: HTTP | e) (Either MetaV1.Status Job)
createNamespacedJob cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs"
    encodedBody = encodeJSON body

-- | DeleteCollectionNamespacedJobOptions
newtype DeleteCollectionNamespacedJobOptions = DeleteCollectionNamespacedJobOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedJobOptions :: Newtype DeleteCollectionNamespacedJobOptions _
derive instance genericDeleteCollectionNamespacedJobOptions :: Generic DeleteCollectionNamespacedJobOptions _
instance showDeleteCollectionNamespacedJobOptions :: Show DeleteCollectionNamespacedJobOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedJobOptions :: Decode DeleteCollectionNamespacedJobOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedJobOptions :: Encode DeleteCollectionNamespacedJobOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedJobOptions :: Default DeleteCollectionNamespacedJobOptions where
  default = DeleteCollectionNamespacedJobOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of Job
deleteCollectionNamespacedJob :: forall e. Config -> String -> DeleteCollectionNamespacedJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedJob cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs" <> formatQueryString options

-- | DeleteNamespacedJobOptions
newtype DeleteNamespacedJobOptions = DeleteNamespacedJobOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedJobOptions :: Newtype DeleteNamespacedJobOptions _
derive instance genericDeleteNamespacedJobOptions :: Generic DeleteNamespacedJobOptions _
instance showDeleteNamespacedJobOptions :: Show DeleteNamespacedJobOptions where show a = genericShow a
instance decodeDeleteNamespacedJobOptions :: Decode DeleteNamespacedJobOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedJobOptions :: Encode DeleteNamespacedJobOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedJobOptions :: Default DeleteNamespacedJobOptions where
  default = DeleteNamespacedJobOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a Job
deleteNamespacedJob :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedJob cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/"

-- | list or watch objects of kind Job
listJobForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status JobList)
listJobForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/jobs"

-- | ListNamespacedJobOptions
newtype ListNamespacedJobOptions = ListNamespacedJobOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedJobOptions :: Newtype ListNamespacedJobOptions _
derive instance genericListNamespacedJobOptions :: Generic ListNamespacedJobOptions _
instance showListNamespacedJobOptions :: Show ListNamespacedJobOptions where show a = genericShow a
instance decodeListNamespacedJobOptions :: Decode ListNamespacedJobOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedJobOptions :: Encode ListNamespacedJobOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedJobOptions :: Default ListNamespacedJobOptions where
  default = ListNamespacedJobOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind Job
listNamespacedJob :: forall e. Config -> String -> ListNamespacedJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status JobList)
listNamespacedJob cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs" <> formatQueryString options

-- | ReadNamespacedJobOptions
newtype ReadNamespacedJobOptions = ReadNamespacedJobOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedJobOptions :: Newtype ReadNamespacedJobOptions _
derive instance genericReadNamespacedJobOptions :: Generic ReadNamespacedJobOptions _
instance showReadNamespacedJobOptions :: Show ReadNamespacedJobOptions where show a = genericShow a
instance decodeReadNamespacedJobOptions :: Decode ReadNamespacedJobOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedJobOptions :: Encode ReadNamespacedJobOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedJobOptions :: Default ReadNamespacedJobOptions where
  default = ReadNamespacedJobOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified Job
readNamespacedJob :: forall e. Config -> String -> String -> ReadNamespacedJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status Job)
readNamespacedJob cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs/" <> name <> "" <> formatQueryString options

-- | read status of the specified Job
readNamespacedJobStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status Job)
readNamespacedJobStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs/" <> name <> "/status"

-- | replace the specified Job
replaceNamespacedJob :: forall e. Config -> String -> String -> Job -> Aff (http :: HTTP | e) (Either MetaV1.Status Job)
replaceNamespacedJob cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified Job
replaceNamespacedJobStatus :: forall e. Config -> String -> String -> Job -> Aff (http :: HTTP | e) (Either MetaV1.Status Job)
replaceNamespacedJobStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of Job
watchJobListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchJobListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/watch/jobs"

-- | watch changes to an object of kind Job
watchNamespacedJob :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedJob cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/watch/namespaces/" <> namespace <> "/jobs/" <> name <> ""

-- | watch individual changes to a list of Job
watchNamespacedJobList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedJobList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1/watch/namespaces/" <> namespace <> "/jobs"