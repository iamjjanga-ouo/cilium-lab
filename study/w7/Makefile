# SHELL = /bin/bash
KIND_CLUSTER_NAME := myk8s
KIND_IMAGE := kindest/node:v1.33.2

include kube-burner-scenarios/kube-burner.mk


create-cluster:
	# Prometheus Target connection refused bind-address 설정 : kube-controller-manager , kube-scheduler , etcd , kube-proxy
	kind create cluster --name ${KIND_CLUSTER_NAME} --image ${KIND_IMAGE} --config kind-config.yaml

deploy-kube-ops-view:
	# kube-ops-view
	helm repo add geek-cookbook https://geek-cookbook.github.io/charts/
	helm install kube-ops-view geek-cookbook/kube-ops-view --version 1.2.2 --set service.main.type=NodePort,service.main.ports.http.nodePort=30003 --set env.TZ="Asia/Seoul" --namespace kube-system
	# open "http://localhost:30003/#scale=1.5"
	open "http://localhost:30003/#scale=2"

deploy-metrics-server:
	# metrics-server
	helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
	helm upgrade --install metrics-server metrics-server/metrics-server --set 'args[0]=--kubelet-insecure-tls' -n kube-system

deploy-kube-prometheus-stack:
	helm repo add kube-prometheus-stack https://prometheus-community.github.io/helm-charts
	helm repo update
	helm upgrade --install kube-prometheus-stack kube-prometheus-stack/kube-prometheus-stack -n monitoring --create-namespace -f helm-charts/kube-prometheus-stack/override-values.yaml
	kubectl create -k .
	sleep 1
	open http://localhost:30001 # Prometheus
	open http://localhost:30002 # Grafana

check-deploy:
	# 확인
	kubectl top node
	kubectl top pod -A --sort-by='cpu'
	kubectl top pod -A --sort-by='memory'
