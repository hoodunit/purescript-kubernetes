module Kubernetes.Test.Unit.Config where

import Prelude

import Control.Monad.Except (runExceptT)
import Data.Either (Either(..), isLeft)
import Data.Lens ((.~), (?~))
import Data.Lens as L
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Kubernetes.Config (Config(..), ConfigError(..), _basicAuth, _caCert, _clientCert, _clientKey, _cluster, _port, _tls, _verifyServerCert)
import Kubernetes.Config as Config
import Kubernetes.Default (default)
import Kubernetes.Request as Request
import Test.Unit (TestSuite, Test, suite, test)
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = do
  suite "Config" do
    test "parses simple config" do
      let configStr = """
        apiVersion: v1
        clusters:
        - cluster:
            certificate-authority-data: fake-ca-data
            server: https://1.2.3.4
          name: development
        contexts:
        - context:
            cluster: development
            namespace: frontend
            user: developer
          name: dev-frontend
        current-context: "dev-frontend"
        kind: Config
        preferences: {}
        users:
        - name: developer
          user:
            client-certificate-data: fake-cert-data
            client-key-data: fake-key-data
      """
      let (expected :: Config) =
            default
            # _cluster .~ { host: "1.2.3.4", port: 443, protocol: Request.ProtocolHTTPS }
            # _tls .~ { caCert: Just "fake-ca-data"
                      , clientCert: Just "fake-cert-data"
                      , clientKey: Just "fake-key-data"
                      , verifyServerCert: true }
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Right expected) config
    
    test "parses custom port" do
      let configStr = """
        apiVersion: v1
        clusters:
        - cluster:
            certificate-authority-data: fake-ca-data
            server: https://1.2.3.4:5000
          name: development
        contexts:
        - context:
            cluster: development
            namespace: frontend
            user: developer
          name: dev-frontend
        current-context: "dev-frontend"
        kind: Config
        preferences: {}
        users:
        - name: developer
          user:
            client-certificate-data: fake-cert-data
            client-key-data: fake-key-data
        """
      let _resultPort = L._Right <<< _cluster <<< _port
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Just 5000) (L.preview _resultPort config)
        
    test "chooses cluster and user based on current-context #1" do
      let configStr = """
        apiVersion: v1
        clusters:
          - cluster:
              certificate-authority-data: fake-ca-data
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
        current-context: "dev-frontend"
        kind: Config
        preferences: {}
        users:
          - name: developer
            user:
              client-certificate-data: fake-cert-data
              client-key-data: fake-key-data
          - name: experimenter
            user:
              password: some-password
              username: exp
        """
      let expected =
            (default :: Config)
            # _cluster .~ { host: "1.2.3.4", port: 443, protocol: Request.ProtocolHTTPS }
            # _tls .~ { caCert: Just "fake-ca-data"
                      , clientCert: Just "fake-cert-data"
                      , clientKey: Just "fake-key-data"
                      , verifyServerCert: true }
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Right expected) config

    test "chooses cluster and user based on current-context #2" do
      let configStr = """
        apiVersion: v1
        clusters:
          - cluster:
              certificate-authority-data: fake-ca-data
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
        current-context: "exp-scratch"
        kind: Config
        preferences: {}
        users:
          - name: developer
            user:
              client-certificate-data: fake-cert-data
              client-key-data: fake-key-data
          - name: experimenter
            user:
              password: some-password
              username: exp
        """
      let expected =
            (default :: Config)
            # _cluster .~ { host: "5.6.7.8", port: 443, protocol: Request.ProtocolHTTPS }
            # _basicAuth ?~ { user: "exp", password: "some-password" }
            # (_tls <<< _verifyServerCert) .~ false
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Right expected) config

    test "fails if current context is missing" do
      let configStr = """
        apiVersion: v1
        clusters:
          - cluster:
              certificate-authority-data: fake-ca-data
              server: https://1.2.3.4
            name: development
        contexts:
          - context:
              cluster: development
              namespace: frontend
              user: developer
            name: dev-frontend
        kind: Config
        preferences: {}
        users:
          - name: developer
            user:
              client-certificate-data: fake-cert-data
              client-key-data: fake-key-data
        """
      assertFailsToParse configStr

    test "fails if current context is the empty string" do
      let configStr = """
        apiVersion: v1
        clusters:
          - cluster:
              certificate-authority-data: fake-ca-data
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
              client-certificate-data: fake-cert-data
              client-key-data: fake-key-data
          - name: experimenter
            user:
              password: some-password
              username: exp
        """
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Left InvalidCurrentContext) config

    test "fails if current context does not exist" do
      let configStr = """
        apiVersion: v1
        clusters:
          - cluster:
              certificate-authority-data: fake-ca-data
              server: https://1.2.3.4
            name: development
        contexts:
          - context:
              cluster: development
              namespace: frontend
              user: developer
            name: dev-frontend
        current-context: "nonexistent"
        kind: Config
        preferences: {}
        users:
          - name: developer
            user:
              client-certificate-data: fake-cert-data
              client-key-data: fake-key-data
        """
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Left InvalidCurrentContext) config

    test "fails if cluster is missing" do
      let configStr = """
        apiVersion: v1
        contexts:
        - context:
            cluster: development
            namespace: frontend
            user: developer
        name: dev-frontend
        current-context: "dev-frontend"
        kind: Config
        preferences: {}
        users:
        - name: developer
        user:
            client-certificate-data: fake-cert-data
            client-key-data: fake-key-data
        """
      assertFailsToParse configStr

    test "fails if user is missing" do
      let configStr = """
        apiVersion: v1
        clusters:
        - cluster:
            certificate-authority-data: fake-ca-data
            server: https://1.2.3.4
        name: development
        contexts:
        - context:
            cluster: development
            namespace: frontend
            user: notauser
        name: dev-frontend
        current-context: "dev-frontend"
        kind: Config
        preferences: {}
        """
      assertFailsToParse configStr

    test "loads certificate authority from file" do
      let configStr = """
        apiVersion: v1
        clusters:
        - cluster:
            certificate-authority: test/Unit/test_kubeconfig_files/certificate_authority.crt
            server: https://1.2.3.4
          name: development
        contexts:
        - context:
            cluster: development
            namespace: frontend
            user: developer
          name: dev-frontend
        current-context: "dev-frontend"
        kind: Config
        preferences: {}
        users:
        - name: developer
          user:
            client-certificate-data: fake-cert-data
            client-key-data: fake-key-data
      """
      let expectedCaCert = "-----BEGIN CERTIFICATE-----\nMIIC5zCCAc+gAwIBAgIBATANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p\na3ViZUNBMB4XDTE4MDgwNDAzMDY1NFoXDTI4MDgwMTAzMDY1NFowFTETMBEGA1UE\nAxMKbWluaWt1YmVDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALxH\nqxeKpm9ktC+5vWrkxu8SArqUvsRF3tlt9Xf2PDT04T3D39SvE7ifZt4ZVgim/LvB\nj7BmXQbOO8EAzzwm7hzDU0PriSFeV8ilh584iH33K2IzXUpgbCUOPKw5N/qH9LrX\niTrNyaR7NZxaggAXaBqMztzduF11pz15BmcB0SCDDQUHdMpAmS9jdvuZvtp4qRpi\nCUwJltQt7gClty8W8PdBiscv0CtpjWDB1pFvmZZC8+LHEkUElAKx2GeHThvosQRP\nNedzXs7lgFDdQ1ht6JtO3TL3eccPh0FIv3qLriiPrq90oMXWjn4yGQX4x9b6bqD+\ndaUuSbMP7rY/UyLyaTsCAwEAAaNCMEAwDgYDVR0PAQH/BAQDAgKkMB0GA1UdJQQW\nMBQGCCsGAQUFBwMCBggrBgEFBQcDATAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3\nDQEBCwUAA4IBAQAs8i7WzPiaonXiSJ2oVACxLE94AaEMslSyF4SywJW+H2NVhZTm\no5LB8Mx2QbQjuLKOigVm24IGe8vPyVN8UgAYM3Lahqxo7XgIsVG0f1EmTXIHbiNO\na/MuKRws45KdmNiKGGV+Ljl1C4NIisG+WDEc8WFUrO9PSsEJR/NRwC5SJQKLewVj\nWjQ4CC682BjesrJ001kYlTbj0jZINmRFNOElHlqsbfbZx+8zM1fpkmiI+emDlPO6\n0X0nM8/5CKfJSirLPOrWBeezZya+iYAqlOAQDZMw54/3dqRpt7FcKMBdm5MVEUy0\n+AnfSeNxyW8sF28mfyn3tAC5OGWXg0DgzWpa\n-----END CERTIFICATE-----\n"
      let _resultCert = L._Right <<< _tls <<< _caCert
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Just expectedCaCert) (L.view _resultCert config)

    test "loads client certificate from file" do
      let configStr = """
        apiVersion: v1
        clusters:
        - cluster:
            certificate-authority-data: fake-ca-data
            server: https://1.2.3.4
          name: development
        contexts:
        - context:
            cluster: development
            namespace: frontend
            user: developer
          name: dev-frontend
        current-context: "dev-frontend"
        kind: Config
        preferences: {}
        users:
        - name: developer
          user:
            client-certificate: test/Unit/test_kubeconfig_files/client_cert.crt
            client-key-data: fake-key-data
      """
      let expectedClientCert = "-----BEGIN CERTIFICATE-----\nMIIDADCCAeigAwIBAgIBAjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p\na3ViZUNBMB4XDTE4MDgwNDAzMTIyM1oXDTE5MDgwNDAzMTIyM1owMTEXMBUGA1UE\nChMOc3lzdGVtOm1hc3RlcnMxFjAUBgNVBAMTDW1pbmlrdWJlLXVzZXIwggEiMA0G\nCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC9MM68YkF3NdSzbVLTf61gdsGMykk3\nhGqKv2n+Qf3l7BoF1Lo+jcU7CGFJaItrMLylTxJbDyRN9+60GxODyIwhTtizTclR\n5n6Qj8uLPjHBLdGpHM2nGCegTdCKkQD6jvTM+Ot0/CmAF2ws6CEZNVx6iIOqq9lf\nVshXAGfPGx3FeKIwGWczbdFGxHsjIrZt1p57wQtO+UKc0CqgF6lmArQatoD+0vyc\neIb2IZLovGST/umYtYai92hFARga3zqPYW0AocUfQM/Dy4C72nA37UxPnsjyL0zO\nY02tYyqNPCb52suF9sFpsMAwkj7SG+R+b7sg86l9KxXIJVwG09VIvDEhAgMBAAGj\nPzA9MA4GA1UdDwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUH\nAwIwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAQEAqvgwpuf6M72Dls/g\n0fylOXU5LACyVdkuYkWnqkYl3jLxhBBcteKnhEZqhZHY3+kFPZ/ALfMbZmRMjXUl\ntgjvAEZtODGoa9qwJlt6HKl7Z4/ifoAPH/0QfqkR7tIPcXcnJRXFnk6f1ZVh+lHQ\n6GaTROwo/5orfCUQKcJkIuvCI9EU0UViiIjGBApDYpxHtFYZ6kM7MOdocwaqED4v\npRp0gmZ7Qc//TcsFlnW8ZBqFU9/evK+Vwltuz3vXbfCw2vhyS/wtumD1CeYx1NxI\nTU9l4DaU/HHhmajZ3uhADM+tTwZncfZFfR0v6lsABCfE9uP5QBnlXGPcMWmsi40o\nvCA93Q==\n-----END CERTIFICATE-----\n"
      let _resultCert = L._Right <<< _tls <<< _clientCert
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Just expectedClientCert) (L.view _resultCert config)

    test "loads client key from file" do
      let configStr = """
        apiVersion: v1
        clusters:
        - cluster:
            certificate-authority-data: fake-ca-data
            server: https://1.2.3.4
          name: development
        contexts:
        - context:
            cluster: development
            namespace: frontend
            user: developer
          name: dev-frontend
        current-context: "dev-frontend"
        kind: Config
        preferences: {}
        users:
        - name: developer
          user:
            client-certificate-data: fake-cert-data
            client-key: test/Unit/test_kubeconfig_files/client_key.key
      """
      let expectedClientKey = "-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAvTDOvGJBdzXUs21S03+tYHbBjMpJN4Rqir9p/kH95ewaBdS6\nPo3FOwhhSWiLazC8pU8SWw8kTffutBsTg8iMIU7Ys03JUeZ+kI/Liz4xwS3RqRzN\npxgnoE3QipEA+o70zPjrdPwpgBdsLOghGTVceoiDqqvZX1bIVwBnzxsdxXiiMBln\nM23RRsR7IyK2bdaee8ELTvlCnNAqoBepZgK0GraA/tL8nHiG9iGS6Lxkk/7pmLWG\novdoRQEYGt86j2FtAKHFH0DPw8uAu9pwN+1MT57I8i9MzmNNrWMqjTwm+drLhfbB\nabDAMJI+0hvkfm+7IPOpfSsVyCVcBtPVSLwxIQIDAQABAoIBAEEB31edz27d4VtR\n6k7gJTvrMnBlJalc55sLUKlcFZkGep6cTO6nmijBpWQq9xT65ydKNz1ww4HC+pOK\nZjc3FudvB0j9Jnrs33pe3orW8RO24b7hNcz/oMYVVt32G0b9DiLMOWO2LbBk2/fG\nP3FBA6ja9ZsUd5mp4Sb77a+dWqp6RMejv35qDBRwtzp4nw5WX5yKyXYg/1B+Sqi1\n+xFEarM3aQU3WnbURIHBaZd2ZX7F+ZrDoLftwIq3av2I47xJB4c3c/Y+YXFJ1wv0\n/K23573uurZ000NT9S3k085IFrb9+OCmKo8e37cv/jnejYs6mPhKox2uCfeSV2wJ\nQa4qY50CgYEA3vTibPhyY1lw224VBq0t6EhLFwXlC/pa5P4k/0niW+Gkrr/V5Oa8\nsKzNqzO0CEzoX89viKYhw1tdRTfzde/Fthg8lF4piE3zuiuqwhQP5psM10sqqpYj\nBJszY/conAZ2EAodi5s5l1hkln6xiBLgdBsHuJCh25L0H4MpeI4UM78CgYEA2TrS\nfhxciskKsHwLM8h2zlYstYLnVpLXuuU0xeEnczn9OxZvIWS9D52rT6LvRXigDgYa\nFS8K3VmvZmCwQKjgQV6RVL/WJ4fnWKKgA2qIvp4ipGRk+295p6UEl2g0+gRV682H\nQS7LY2POPV09dqBUQ1GAc0pmvYaqICtN5Y09Ux8CgYARwieWzmMuDp2ynJ4IHhsd\n+UQh3VJVFefPfX6s5tGkx+A6GwWKaeZ1nA31qPSaBKYtm3Qiyji+OrS/Iqm9pw90\nZZHNr4JXXP4gwgGj2704fPkU3OPVGohHgaUiPTl60/jrZiLcT8zShTPd2NGDKR2/\nobeHt91sg9P1/ph7BbYOOQKBgQCaQIvB40/PeUzu31ZxEfNTN5wN1AOD1Uf9Pc8I\niIYj61SnRZnqQ4eA9Dv2k8OGOE6nRqv0yO/VGF9VumjNsV107bsTTBm8/mNH7Erl\nwhuSB+afh26xoInpgmNNREECHFwK0mot3hWs4O1NY81GVDkhiFlHBNkJ0fsyVq28\nyFt4jwKBgAxVK85mn1N7+MixUcJ/d6nDxUlMB9d8q1WTJp39eWmv6Bfv4tb5czwp\n+RTSMVCTW4UGfCsiA9n9q3UUqKWVZ6roV0lC/IbLFPBi5KmGSSUqA8qL/D9pX5CS\n+zxUSublWG6m7lom71Fkd5xUFIJTUYMCFkBRJUxs19PsnojWvlYh\n-----END RSA PRIVATE KEY-----\n"
      let _resultKey = L._Right <<< _tls <<< _clientKey
      config <- runExceptT $ Config.parseAndLoadKubeConfig configStr
      Assert.equal (Just expectedClientKey) (L.view _resultKey config)

assertFailsToParse :: String -> Test
assertFailsToParse inputStr = do
  config <- runExceptT $ Config.parseAndLoadKubeConfig inputStr
  Assert.assert "Parsing config did not fail" (isLeft config)
