#!/usr/bin/env bash

KUBEADM_TOKEN=$1

echo ">>>> K8S Node config Start <<<<"

echo "[TASK 1] K8S Controlplane Join" 
kubeadm join --token $KUBEADM_TOKEN --discovery-token-unsafe-skip-ca-verification 192.168.10.100:6443  >/dev/null 2>&1


echo ">>>> K8S Node config End <<<<"