module Kubernetes.Test.Unit.KubeConfig where

import Prelude

import Data.Either (Either(..))
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Kubernetes.KubeConfig as KubeConfig
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

example1 :: String
example1 = """
apiVersion: v1
clusters:
- cluster:
    certificate-authority: fake-ca-file
    server: https://1.2.3.4
  name: development
- cluster:
    insecure-skip-tls-verify: true
    server: https://5.6.7.8
  name: scratch
contexts:
- context:
    cluster: development
    namespace: frontend
    user: developer
  name: dev-frontend
- context:
    cluster: development
    namespace: storage
    user: developer
  name: dev-storage
- context:
    cluster: scratch
    namespace: default
    user: experimenter
  name: exp-scratch
current-context: ""
kind: Config
preferences: {}
users:
- name: developer
  user:
    client-certificate: fake-cert-file
    client-key: fake-key-file
- name: experimenter
  user:
    password: some-password
    username: exp
"""

tests :: TestSuite
tests = do
  suite "KubeConfig" do
    test "decodes example config" do
      let expected = Right $
          { apiVersion: Just "v1"
          , clusters: Map.fromFoldable $
            [ Tuple "development"
                { certificateAuthority: Just "fake-ca-file"
                , certificateAuthorityData: Nothing
                , insecureSkipTlsVerify: Nothing
                , server: Just "https://1.2.3.4" }
            , Tuple "scratch"
                { certificateAuthority: Nothing
                , certificateAuthorityData: Nothing
                , insecureSkipTlsVerify: Just true
                , server: Just "https://5.6.7.8" }
            ]
          , contexts: Map.fromFoldable $
            [ Tuple "dev-frontend"
                { cluster: "development"
                , namespace: Just "frontend"
                , user: "developer" }
            , Tuple "dev-storage"
                { cluster: "development"
                , namespace: Just "storage"
                , user: "developer" }
            , Tuple "exp-scratch"
                { cluster: "scratch"
                , namespace: Just "default"
                , user: "experimenter" }
            ]
          , currentContext: ""
          , preferences: { colors: Nothing }
          , users: Map.fromFoldable $
            [ Tuple "developer"
                { clientCertificate: Just "fake-cert-file"
                , clientCertificateData: Nothing
                , clientKey: Just "fake-key-file"
                , clientKeyData: Nothing
                , token: Nothing
                , tokenFile: Nothing
                , actAs: Nothing
                , actAsGroups: Nothing
                , actAsUserExtra: Nothing
                , username: Nothing
                , password: Nothing
                , authProvider: Nothing
                , exec: Nothing }
            , Tuple "experimenter"
                { clientCertificate: Nothing
                , clientCertificateData: Nothing
                , clientKey: Nothing
                , clientKeyData: Nothing
                , token: Nothing
                , tokenFile: Nothing
                , actAs: Nothing
                , actAsGroups: Nothing
                , actAsUserExtra: Nothing
                , username: Just "exp"
                , password: Just "some-password"
                , authProvider: Nothing
                , exec: Nothing }
            ]
          }
      Assert.equal expected $ KubeConfig.decode example1
