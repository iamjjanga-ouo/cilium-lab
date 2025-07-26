#!/usr/bin/env bash

echo ">>>> K8S Node config Start <<<<"

echo "[TASK 1] K8S Controlplane Join" 
kubeadm join --config=/vagrant/kubeadm-config.yaml >/dev/null 2>&1


echo ">>>> K8S Node config End <<<<"