module Kubernetes.RequestOptions where

import Prelude

import Data.Options (Option, opt)
import Data.StrMap (StrMap)

data RequestOptions
  
newtype RequestHeaders = RequestHeaders (StrMap String)

-- | The protocol to use
protocol :: Option RequestOptions String
protocol = opt "protocol"

-- | Domain name or IP
hostname :: Option RequestOptions String
hostname = opt "hostname"

-- | Port of remote server
port :: Option RequestOptions Int
port = opt "port"

-- | The HTTP request method: GET, POST, etc.
method :: Option RequestOptions String
method = opt "method"

-- | The request path, including query string if appropriate.
path :: Option RequestOptions String
path = opt "path"

headers :: Option RequestOptions RequestHeaders
headers = opt "headers"

-- | Basic authentication
auth :: Option RequestOptions String
auth = opt "auth"

-- | Private Key
key :: Option RequestOptions String
key = opt "key"

-- | Public x509 certificate
cert :: Option RequestOptions String
cert = opt "cert"

-- | Certificate authority
ca :: Option RequestOptions String
ca = opt "ca"

-- | Is cert verified against CAs
rejectUnauthorized :: Option RequestOptions Boolean
rejectUnauthorized = opt "rejectUnauthorized"
