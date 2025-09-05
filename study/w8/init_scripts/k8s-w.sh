#!/usr/bin/env bash

echo ">>>> K8S Node config Start <<<<"


echo "[TASK 1] K8S Controlplane Join"
curl --silent -o /root/kubeadm-join-worker-config.yaml https://raw.githubusercontent.com/iamjjanga-ouo/cilium-lab/refs/heads/main/study/w8/kubeadm-configs/kubeadm-join-worker-config.yaml
NODEIP=$(ip -4 addr show eth1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
sed -i "s/NODE_IP_PLACEHOLDER/${NODEIP}/g" /root/kubeadm-join-worker-config.yaml
kubeadm join --config="/root/kubeadm-join-worker-config.yaml" > /dev/null 2>&1


echo ">>>> K8S Node config End <<<<"
