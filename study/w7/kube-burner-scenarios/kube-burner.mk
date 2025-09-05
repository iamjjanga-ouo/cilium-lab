WORK_DIR := kube-burner-scenarios
LOG_LEVEL := debug

install-kube-burner-as-binary:
	curl -LO https://github.com/kube-burner/kube-burner/releases/download/v1.17.3/kube-burner-V1.17.3-darwin-arm64.tar.gz # mac M
	tar -xvf kube-burner-V1.17.3-darwin-arm64.tar.gz
	sudo mv kube-burner /usr/local/bin
	# check
	kube-burner -h
	# clean
	rm kube-burner-V1.17.3-darwin-arm64.tar.gz

# NOTE: Local환경 테스트 완료
# start-kube-burner:
# 	docker run \
# 	--rm \
# 	--name kube-burner \
# 	--entrypoint "/bin/bash" \
# 	--volume "./kube-burner:/root/kube-burner" \
# 	--volume "${HOME}/.kube/config:/root/.kube/config" \
# 	--network "host" \
# 	--interactive \
# 	--tty \
# 	--workdir "/root/kube-burner" \
# 	quay.io/kube-burner/kube-burner:v1.17.3-arm64

s1:
	time (cd ${WORK_DIR} && kube-burner init -c s1-config.yaml --log-level ${LOG_LEVEL})

s2-1-preloadimage-false:
	time (cd ${WORK_DIR} && kube-burner init -c s2-1-config-preloadimage-false.yaml --log-level ${LOG_LEVEL})

s2-2-waitwhenfinished-false:
	time (cd ${WORK_DIR} && kube-burner init -c s2-2-config-waitwhenfinished-false.yaml --log-level ${LOG_LEVEL})

s2-3-jobiteration-5:
	time (cd ${WORK_DIR} && kube-burner init -c s2-3-config-jobiteration-5.yaml --log-level ${LOG_LEVEL})
	# time (kube-burner init -c s2-config-jobiteration-5.yaml --log-level debug)

s2-4-replicas-2:
	time (cd ${WORK_DIR} && kube-burner init -c s2-4-config-replicas-2.yaml --log-level ${LOG_LEVEL})

s2-5-deployment-replicas-2:
	time (cd ${WORK_DIR} && kube-burner init -c s2-5-config-deployment-replicas-2.yaml --log-level ${LOG_LEVEL})

s2-6-jobiteration-10:
	time (cd ${WORK_DIR} && kube-burner init -c s2-6-config-jobiteration-10.yaml --log-level ${LOG_LEVEL})

s2-7-qps-burst:
	time (cd ${WORK_DIR} && kube-burner init -c s2-7-config-qps-burst.yaml --log-level ${LOG_LEVEL})

s2-8-qps-burst:
	time (cd ${WORK_DIR} && kube-burner init -c s2-8-config-qps-burst.yaml --log-level ${LOG_LEVEL})

s2-9-qps-burst:
	time (cd ${WORK_DIR} && kube-burner init -c s2-9-config-qps-burst.yaml --log-level ${LOG_LEVEL})

s2-10-qps-burst:
	time (cd ${WORK_DIR} && kube-burner init -c s2-10-config-qps-burst.yaml --log-level ${LOG_LEVEL})

s2-11-qps-burst:
	time (cd ${WORK_DIR} && kube-burner init -c s2-11-config-qps-burst.yaml --log-level ${LOG_LEVEL})

s2-12-qps-burst:
	time (cd ${WORK_DIR} && kube-burner init -c s2-12-config-qps-burst.yaml --log-level ${LOG_LEVEL})

s3-1:
	cd ${WORK_DIR} && kube-burner init -c s3-1-config.yaml --log-level ${LOG_LEVEL}

s3-2:
	cd ${WORK_DIR} && kube-burner init -c s3-2-config.yaml --log-level ${LOG_LEVEL}


delete-s1:
	cd ${WORK_DIR} && kube-burner init -c s1-config-delete.yaml --log-level ${LOG_LEVEL}

get-kube-burner-resources:
	kubectl get deploy -A -l kube-burner-job=delete-me
	kubectl get pod -A -l kube-burner-job=delete-me
	kubectl get ns -l kube-burner-job=delete-me