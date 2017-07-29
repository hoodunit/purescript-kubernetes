module Kubernetes.Api.BatchV1Beta1 where

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
import Kubernetes.Api.BatchV1 as BatchV1
import Kubernetes.Api.CoreV1 as CoreV1
import Kubernetes.Api.MetaV1 as MetaV1
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | create a CronJob
createNamespacedCronJob :: forall e. Config -> String -> CronJob -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJob)
createNamespacedCronJob cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs"
    encodedBody = encodeJSON body

-- | DeleteCollectionNamespacedCronJobOptions
newtype DeleteCollectionNamespacedCronJobOptions = DeleteCollectionNamespacedCronJobOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeDeleteCollectionNamespacedCronJobOptions :: Newtype DeleteCollectionNamespacedCronJobOptions _
derive instance genericDeleteCollectionNamespacedCronJobOptions :: Generic DeleteCollectionNamespacedCronJobOptions _
instance showDeleteCollectionNamespacedCronJobOptions :: Show DeleteCollectionNamespacedCronJobOptions where show a = genericShow a
instance decodeDeleteCollectionNamespacedCronJobOptions :: Decode DeleteCollectionNamespacedCronJobOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteCollectionNamespacedCronJobOptions :: Encode DeleteCollectionNamespacedCronJobOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteCollectionNamespacedCronJobOptions :: Default DeleteCollectionNamespacedCronJobOptions where
  default = DeleteCollectionNamespacedCronJobOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | delete collection of CronJob
deleteCollectionNamespacedCronJob :: forall e. Config -> String -> DeleteCollectionNamespacedCronJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteCollectionNamespacedCronJob cfg namespace options = makeRequest (delete cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs" <> formatQueryString options

-- | DeleteNamespacedCronJobOptions
newtype DeleteNamespacedCronJobOptions = DeleteNamespacedCronJobOptions
  { gracePeriodSeconds :: (NullOrUndefined Int)
  , orphanDependents :: (NullOrUndefined Boolean)
  , propagationPolicy :: (NullOrUndefined String) }

derive instance newtypeDeleteNamespacedCronJobOptions :: Newtype DeleteNamespacedCronJobOptions _
derive instance genericDeleteNamespacedCronJobOptions :: Generic DeleteNamespacedCronJobOptions _
instance showDeleteNamespacedCronJobOptions :: Show DeleteNamespacedCronJobOptions where show a = genericShow a
instance decodeDeleteNamespacedCronJobOptions :: Decode DeleteNamespacedCronJobOptions where
  decode a = genericDecode jsonOptions a 
instance encodeDeleteNamespacedCronJobOptions :: Encode DeleteNamespacedCronJobOptions where
  encode a = genericEncode jsonOptions a

instance defaultDeleteNamespacedCronJobOptions :: Default DeleteNamespacedCronJobOptions where
  default = DeleteNamespacedCronJobOptions
    { gracePeriodSeconds: NullOrUndefined Nothing
    , orphanDependents: NullOrUndefined Nothing
    , propagationPolicy: NullOrUndefined Nothing }

-- | delete a CronJob
deleteNamespacedCronJob :: forall e. Config -> String -> String -> MetaV1.DeleteOptions -> DeleteNamespacedCronJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.Status)
deleteNamespacedCronJob cfg namespace name body options = makeRequest (delete cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs/" <> name <> "" <> formatQueryString options
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/"

-- | io.k8s.api.batch.v1beta1.CronJob
-- | CronJob represents the configuration of a single cron job.
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

-- | io.k8s.api.batch.v1beta1.CronJobList
-- | CronJobList is a collection of cron jobs.
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

-- | io.k8s.api.batch.v1beta1.CronJobSpec
-- | CronJobSpec describes how the job execution will look like and when it will actually run.
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

-- | io.k8s.api.batch.v1beta1.CronJobStatus
-- | CronJobStatus represents the current state of a cron job.
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

-- | io.k8s.api.batch.v1beta1.JobTemplateSpec
-- | JobTemplateSpec describes the data a Job should have when created from a template
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

-- | list or watch objects of kind CronJob
listCronJobForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJobList)
listCronJobForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/cronjobs"

-- | ListNamespacedCronJobOptions
newtype ListNamespacedCronJobOptions = ListNamespacedCronJobOptions
  { continue :: (NullOrUndefined String)
  , fieldSelector :: (NullOrUndefined String)
  , includeUninitialized :: (NullOrUndefined Boolean)
  , labelSelector :: (NullOrUndefined String)
  , limit :: (NullOrUndefined Int)
  , resourceVersion :: (NullOrUndefined String)
  , timeoutSeconds :: (NullOrUndefined Int)
  , watch :: (NullOrUndefined Boolean) }

derive instance newtypeListNamespacedCronJobOptions :: Newtype ListNamespacedCronJobOptions _
derive instance genericListNamespacedCronJobOptions :: Generic ListNamespacedCronJobOptions _
instance showListNamespacedCronJobOptions :: Show ListNamespacedCronJobOptions where show a = genericShow a
instance decodeListNamespacedCronJobOptions :: Decode ListNamespacedCronJobOptions where
  decode a = genericDecode jsonOptions a 
instance encodeListNamespacedCronJobOptions :: Encode ListNamespacedCronJobOptions where
  encode a = genericEncode jsonOptions a

instance defaultListNamespacedCronJobOptions :: Default ListNamespacedCronJobOptions where
  default = ListNamespacedCronJobOptions
    { continue: NullOrUndefined Nothing
    , fieldSelector: NullOrUndefined Nothing
    , includeUninitialized: NullOrUndefined Nothing
    , labelSelector: NullOrUndefined Nothing
    , limit: NullOrUndefined Nothing
    , resourceVersion: NullOrUndefined Nothing
    , timeoutSeconds: NullOrUndefined Nothing
    , watch: NullOrUndefined Nothing }

-- | list or watch objects of kind CronJob
listNamespacedCronJob :: forall e. Config -> String -> ListNamespacedCronJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJobList)
listNamespacedCronJob cfg namespace options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs" <> formatQueryString options

-- | ReadNamespacedCronJobOptions
newtype ReadNamespacedCronJobOptions = ReadNamespacedCronJobOptions
  { exact :: (NullOrUndefined Boolean)
  , export :: (NullOrUndefined Boolean) }

derive instance newtypeReadNamespacedCronJobOptions :: Newtype ReadNamespacedCronJobOptions _
derive instance genericReadNamespacedCronJobOptions :: Generic ReadNamespacedCronJobOptions _
instance showReadNamespacedCronJobOptions :: Show ReadNamespacedCronJobOptions where show a = genericShow a
instance decodeReadNamespacedCronJobOptions :: Decode ReadNamespacedCronJobOptions where
  decode a = genericDecode jsonOptions a 
instance encodeReadNamespacedCronJobOptions :: Encode ReadNamespacedCronJobOptions where
  encode a = genericEncode jsonOptions a

instance defaultReadNamespacedCronJobOptions :: Default ReadNamespacedCronJobOptions where
  default = ReadNamespacedCronJobOptions
    { exact: NullOrUndefined Nothing
    , export: NullOrUndefined Nothing }

-- | read the specified CronJob
readNamespacedCronJob :: forall e. Config -> String -> String -> ReadNamespacedCronJobOptions -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJob)
readNamespacedCronJob cfg namespace name options = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs/" <> name <> "" <> formatQueryString options

-- | read status of the specified CronJob
readNamespacedCronJobStatus :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJob)
readNamespacedCronJobStatus cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs/" <> name <> "/status"

-- | replace the specified CronJob
replaceNamespacedCronJob :: forall e. Config -> String -> String -> CronJob -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJob)
replaceNamespacedCronJob cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs/" <> name <> ""
    encodedBody = encodeJSON body

-- | replace status of the specified CronJob
replaceNamespacedCronJobStatus :: forall e. Config -> String -> String -> CronJob -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJob)
replaceNamespacedCronJobStatus cfg namespace name body = makeRequest (put cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs/" <> name <> "/status"
    encodedBody = encodeJSON body

-- | watch individual changes to a list of CronJob
watchCronJobListForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchCronJobListForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/watch/cronjobs"

-- | watch changes to an object of kind CronJob
watchNamespacedCronJob :: forall e. Config -> String -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedCronJob cfg namespace name = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/watch/namespaces/" <> namespace <> "/cronjobs/" <> name <> ""

-- | watch individual changes to a list of CronJob
watchNamespacedCronJobList :: forall e. Config -> String -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.WatchEvent)
watchNamespacedCronJobList cfg namespace = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/watch/namespaces/" <> namespace <> "/cronjobs"