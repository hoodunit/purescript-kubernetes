module Kubernetes.Api.Authentication.V1Beta1 where

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
import Prelude
import Data.Maybe (Maybe(Just,Nothing))
import Foreign.Class (class Decode, class Encode, encode, decode)
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
import Kubernetes.Api.Meta.V1 as MetaV1

-- | TokenReview attempts to authenticate a token to a known user. Note: TokenReview requests may be cached by the webhook token authenticator plugin in the kube-apiserver.
-- |
-- | Fields:
-- | - `metadata`
-- | - `spec`: Spec holds information about the request being evaluated
-- | - `status`: Status is filled in by the server and indicates whether the request can be authenticated.
newtype TokenReview = TokenReview
  { metadata :: (Maybe MetaV1.ObjectMeta)
  , spec :: (Maybe TokenReviewSpec)
  , status :: (Maybe TokenReviewStatus) }

derive instance newtypeTokenReview :: Newtype TokenReview _
derive instance genericTokenReview :: Generic TokenReview _
instance showTokenReview :: Show TokenReview where show a = genericShow a
instance decodeTokenReview :: Decode TokenReview where
  decode a = do
               assertPropEq "apiVersion" "authentication.k8s.io/v1beta1" a
               assertPropEq "kind" "TokenReview" a
               metadata <- decodeMaybe "metadata" a
               spec <- decodeMaybe "spec" a
               status <- decodeMaybe "status" a
               pure $ TokenReview { metadata, spec, status }
instance encodeTokenReview :: Encode TokenReview where
  encode (TokenReview a) = encode $ Object.fromFoldable $
               [ Tuple "apiVersion" (encode "authentication.k8s.io/v1beta1")
               , Tuple "kind" (encode "TokenReview")
               , Tuple "metadata" (encodeMaybe a.metadata)
               , Tuple "spec" (encodeMaybe a.spec)
               , Tuple "status" (encodeMaybe a.status) ]


instance defaultTokenReview :: Default TokenReview where
  default = TokenReview
    { metadata: Nothing
    , spec: Nothing
    , status: Nothing }

-- | TokenReviewSpec is a description of the token authentication request.
-- |
-- | Fields:
-- | - `token`: Token is the opaque bearer token.
newtype TokenReviewSpec = TokenReviewSpec
  { token :: (Maybe String) }

derive instance newtypeTokenReviewSpec :: Newtype TokenReviewSpec _
derive instance genericTokenReviewSpec :: Generic TokenReviewSpec _
instance showTokenReviewSpec :: Show TokenReviewSpec where show a = genericShow a
instance decodeTokenReviewSpec :: Decode TokenReviewSpec where
  decode a = do
               token <- decodeMaybe "token" a
               pure $ TokenReviewSpec { token }
instance encodeTokenReviewSpec :: Encode TokenReviewSpec where
  encode (TokenReviewSpec a) = encode $ Object.fromFoldable $
               [ Tuple "token" (encodeMaybe a.token) ]


instance defaultTokenReviewSpec :: Default TokenReviewSpec where
  default = TokenReviewSpec
    { token: Nothing }

-- | TokenReviewStatus is the result of the token authentication request.
-- |
-- | Fields:
-- | - `authenticated`: Authenticated indicates that the token was associated with a known user.
-- | - `error`: Error indicates that the token couldn't be checked
-- | - `user`: User is the UserInfo associated with the provided token.
newtype TokenReviewStatus = TokenReviewStatus
  { authenticated :: (Maybe Boolean)
  , error :: (Maybe String)
  , user :: (Maybe UserInfo) }

derive instance newtypeTokenReviewStatus :: Newtype TokenReviewStatus _
derive instance genericTokenReviewStatus :: Generic TokenReviewStatus _
instance showTokenReviewStatus :: Show TokenReviewStatus where show a = genericShow a
instance decodeTokenReviewStatus :: Decode TokenReviewStatus where
  decode a = do
               authenticated <- decodeMaybe "authenticated" a
               error <- decodeMaybe "error" a
               user <- decodeMaybe "user" a
               pure $ TokenReviewStatus { authenticated, error, user }
instance encodeTokenReviewStatus :: Encode TokenReviewStatus where
  encode (TokenReviewStatus a) = encode $ Object.fromFoldable $
               [ Tuple "authenticated" (encodeMaybe a.authenticated)
               , Tuple "error" (encodeMaybe a.error)
               , Tuple "user" (encodeMaybe a.user) ]


instance defaultTokenReviewStatus :: Default TokenReviewStatus where
  default = TokenReviewStatus
    { authenticated: Nothing
    , error: Nothing
    , user: Nothing }

-- | UserInfo holds the information about the user needed to implement the user.Info interface.
-- |
-- | Fields:
-- | - `extra`: Any additional information provided by the authenticator.
-- | - `groups`: The names of groups this user is a part of.
-- | - `uid`: A unique value that identifies this user across time. If this user is deleted and another user by the same name is added, they will have different UIDs.
-- | - `username`: The name that uniquely identifies this user among all active users.
newtype UserInfo = UserInfo
  { extra :: (Maybe (Object (Array String)))
  , groups :: (Maybe (Array String))
  , uid :: (Maybe String)
  , username :: (Maybe String) }

derive instance newtypeUserInfo :: Newtype UserInfo _
derive instance genericUserInfo :: Generic UserInfo _
instance showUserInfo :: Show UserInfo where show a = genericShow a
instance decodeUserInfo :: Decode UserInfo where
  decode a = do
               extra <- decodeMaybe "extra" a
               groups <- decodeMaybe "groups" a
               uid <- decodeMaybe "uid" a
               username <- decodeMaybe "username" a
               pure $ UserInfo { extra, groups, uid, username }
instance encodeUserInfo :: Encode UserInfo where
  encode (UserInfo a) = encode $ Object.fromFoldable $
               [ Tuple "extra" (encodeMaybe a.extra)
               , Tuple "groups" (encodeMaybe a.groups)
               , Tuple "uid" (encodeMaybe a.uid)
               , Tuple "username" (encodeMaybe a.username) ]


instance defaultUserInfo :: Default UserInfo where
  default = UserInfo
    { extra: Nothing
    , groups: Nothing
    , uid: Nothing
    , username: Nothing }

-- | get available resources
getAPIResources :: Config -> Aff (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = Client.makeRequest (Client.get cfg url Nothing)
  where
    url = "/apis/authentication.k8s.io/v1beta1/"