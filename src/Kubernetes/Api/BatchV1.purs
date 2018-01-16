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

-- | create a Job
createNamespacedJob :: forall e. Config -> String -> Job -> Aff (http :: HTTP | e) (Either MetaV1.Status Job)
createNamespacedJob cfg namespace body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/batch/v1/namespaces/" <> namespace <> "/jobs"
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

-- | Fields:
-- | - `gracePeriodSeconds`: The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
-- | - `orphanDependents`: Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
-- | - `propagationPolicy`: Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
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

-- | Fields:
-- | - `exact`: Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
-- | - `export`: Should this value be exported.  Export strips fields that a user can not specify.
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