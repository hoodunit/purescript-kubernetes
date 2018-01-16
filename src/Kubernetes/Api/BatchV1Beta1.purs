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
-- | - `failedJobsHistoryLimit`: The number of failed finished jobs to retain. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
-- | - `jobTemplate`: Specifies the job that will be created when executing a CronJob.
-- | - `schedule`: The schedule in Cron format, see https://en.wikipedia.org/wiki/Cron.
-- | - `startingDeadlineSeconds`: Optional deadline in seconds for starting the job if it misses scheduled time for any reason.  Missed jobs executions will be counted as failed ones.
-- | - `successfulJobsHistoryLimit`: The number of successful finished jobs to retain. This is a pointer to distinguish between explicit zero and not specified. Defaults to 3.
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

-- | create a CronJob
createNamespacedCronJob :: forall e. Config -> String -> CronJob -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJob)
createNamespacedCronJob cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1beta1/namespaces/" <> namespace <> "/cronjobs"
    encodedBody = encodeJSON body

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
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

-- | list or watch objects of kind CronJob
listCronJobForAllNamespaces :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status CronJobList)
listCronJobForAllNamespaces cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/batch/v1beta1/cronjobs"

-- | Fields:
-- | - `continue`: The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
-- | - `fieldSelector`: A selector to restrict the list of returned objects by their fields. Defaults to everything.
-- | - `includeUninitialized`: If true, partially initialized resources are included in the response.
-- | - `labelSelector`: A selector to restrict the list of returned objects by their labels. Defaults to everything.
-- | - `limit`: limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
-- |    
-- |    The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
-- | - `resourceVersion`: When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
-- | - `timeoutSeconds`: Timeout for the list/watch call.
-- | - `watch`: Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
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

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
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