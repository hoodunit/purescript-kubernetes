#!/usr/bin/env bash
set -x
export KUBECONFIG=$HOME/.kube/config
sudo -E ./minikube config set WantKubectlDownloadMsg false
sudo -E ./minikube config set WantReportErrorPrompt false
sudo -E ./minikube start --vm-driver=none

# this for loop waits until kubectl can access the api server that Minikube has created
for i in {1..150}; do # timeout for 5 minutes
   ./kubectl get po &> /dev/null
   if [ $? -ne 1 ]; then
      break
  fi
  sleep 2
done

# kubectl commands are now able to interact with Minikube cluster
