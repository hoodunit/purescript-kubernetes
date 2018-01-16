module Kubernetes.Api.AuthenticationV1Beta1 where

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
import Kubernetes.Client (delete, formatQueryString, get, head, options, patch, post, put, makeRequest)
import Kubernetes.Config (Config)
import Kubernetes.Default (class Default)
import Kubernetes.Json (jsonOptions)
import Node.HTTP (HTTP)
import Prelude

-- | io.k8s.api.authentication.v1beta1.TokenReview
-- | TokenReview attempts to authenticate a token to a known user. Note: TokenReview requests may be cached by the webhook token authenticator plugin in the kube-apiserver.
newtype TokenReview = TokenReview
  { apiVersion :: (NullOrUndefined String)
  , kind :: (NullOrUndefined String)
  , metadata :: (NullOrUndefined MetaV1.ObjectMeta)
  , spec :: (NullOrUndefined TokenReviewSpec)
  , status :: (NullOrUndefined TokenReviewStatus) }

derive instance newtypeTokenReview :: Newtype TokenReview _
derive instance genericTokenReview :: Generic TokenReview _
instance showTokenReview :: Show TokenReview where show a = genericShow a
instance decodeTokenReview :: Decode TokenReview where
  decode a = genericDecode jsonOptions a 
instance encodeTokenReview :: Encode TokenReview where
  encode a = genericEncode jsonOptions a

instance defaultTokenReview :: Default TokenReview where
  default = TokenReview
    { apiVersion: NullOrUndefined Nothing
    , kind: NullOrUndefined Nothing
    , metadata: NullOrUndefined Nothing
    , spec: NullOrUndefined Nothing
    , status: NullOrUndefined Nothing }

-- | io.k8s.api.authentication.v1beta1.TokenReviewSpec
-- | TokenReviewSpec is a description of the token authentication request.
newtype TokenReviewSpec = TokenReviewSpec
  { token :: (NullOrUndefined String) }

derive instance newtypeTokenReviewSpec :: Newtype TokenReviewSpec _
derive instance genericTokenReviewSpec :: Generic TokenReviewSpec _
instance showTokenReviewSpec :: Show TokenReviewSpec where show a = genericShow a
instance decodeTokenReviewSpec :: Decode TokenReviewSpec where
  decode a = genericDecode jsonOptions a 
instance encodeTokenReviewSpec :: Encode TokenReviewSpec where
  encode a = genericEncode jsonOptions a

instance defaultTokenReviewSpec :: Default TokenReviewSpec where
  default = TokenReviewSpec
    { token: NullOrUndefined Nothing }

-- | io.k8s.api.authentication.v1beta1.TokenReviewStatus
-- | TokenReviewStatus is the result of the token authentication request.
newtype TokenReviewStatus = TokenReviewStatus
  { authenticated :: (NullOrUndefined Boolean)
  , error :: (NullOrUndefined String)
  , user :: (NullOrUndefined UserInfo) }

derive instance newtypeTokenReviewStatus :: Newtype TokenReviewStatus _
derive instance genericTokenReviewStatus :: Generic TokenReviewStatus _
instance showTokenReviewStatus :: Show TokenReviewStatus where show a = genericShow a
instance decodeTokenReviewStatus :: Decode TokenReviewStatus where
  decode a = genericDecode jsonOptions a 
instance encodeTokenReviewStatus :: Encode TokenReviewStatus where
  encode a = genericEncode jsonOptions a

instance defaultTokenReviewStatus :: Default TokenReviewStatus where
  default = TokenReviewStatus
    { authenticated: NullOrUndefined Nothing
    , error: NullOrUndefined Nothing
    , user: NullOrUndefined Nothing }

-- | io.k8s.api.authentication.v1beta1.UserInfo
-- | UserInfo holds the information about the user needed to implement the user.Info interface.
newtype UserInfo = UserInfo
  { extra :: (NullOrUndefined (StrMap (Array String)))
  , groups :: (NullOrUndefined (Array String))
  , uid :: (NullOrUndefined String)
  , username :: (NullOrUndefined String) }

derive instance newtypeUserInfo :: Newtype UserInfo _
derive instance genericUserInfo :: Generic UserInfo _
instance showUserInfo :: Show UserInfo where show a = genericShow a
instance decodeUserInfo :: Decode UserInfo where
  decode a = genericDecode jsonOptions a 
instance encodeUserInfo :: Encode UserInfo where
  encode a = genericEncode jsonOptions a

instance defaultUserInfo :: Default UserInfo where
  default = UserInfo
    { extra: NullOrUndefined Nothing
    , groups: NullOrUndefined Nothing
    , uid: NullOrUndefined Nothing
    , username: NullOrUndefined Nothing }

-- | create a TokenReview
createTokenReview :: forall e. Config -> TokenReview -> Aff (http :: HTTP | e) (Either MetaV1.Status TokenReview)
createTokenReview cfg body = makeRequest (post cfg url (Just encodedBody))
  where
    url = "/apis/authentication.k8s.io/v1beta1/tokenreviews"
    encodedBody = encodeJSON body

-- | get available resources
getAPIResources :: forall e. Config -> Aff (http :: HTTP | e) (Either MetaV1.Status MetaV1.APIResourceList)
getAPIResources cfg = makeRequest (get cfg url Nothing)
  where
    url = "/apis/authentication.k8s.io/v1beta1/"