#!/bin/bash
FPM_DEPLOY_VERSION="1.0.8"
HOST="test.box"
KEY_FILE="nginx/ssl/keyfile"
CERT_FILE="nginx/ssl/certfile"
CERT_NAME="ssl-cert"

deploy:
	docker tag docker_test-fpm hursittopal/test-fpm:${FPM_DEPLOY_VERSION}
	docker push hursittopal/test-fpm:${FPM_DEPLOY_VERSION}
	
deploy-all:
	docker tag docker_test-fpm hursittopal/test-fpm:${FPM_DEPLOY_VERSION}
	docker push hursittopal/test-fpm:${FPM_DEPLOY_VERSION}

	docker tag docker_test-nginx hursittopal/test-nginx:1.0.1
	docker push hursittopal/test-nginx:1.0.1

	docker tag docker_test-mongo hursittopal/test-mongo:1.0.1
	docker push hursittopal/test-mongo:1.0.1

	docker tag docker_test-mysql hursittopal/test-mysql:1.0.1
	docker push hursittopal/test-mysql:1.0.1

	docker tag docker_test-memcached hursittopal/test-memcached:1.0.1
	docker push hursittopal/test-memcached:1.0.1

	docker tag docker_test-rabbitmq hursittopal/test-rabbitmq:1.0.1
	docker push hursittopal/test-rabbitmq:1.0.1

locust-up:
	kubectl apply -f locust/master-deployment.yaml
	kubectl apply -f locust/nodeport.yaml
	kubectl apply -f locust/scripts-cm.yaml
	kubectl apply -f locust/service.yaml
	kubectl apply -f locust/slave-deployment.yaml

up:
	kubectl apply -f memcached/deployment.yaml
	kubectl apply -f memcached/service.yaml

	kubectl apply -f mongo/deployment.yaml
	kubectl apply -f mongo/service.yaml

	kubectl apply -f mysql/ConfigMap.yaml
	kubectl apply -f mysql/persistentVolumeClaim.yaml
	kubectl apply -f mysql/secret.yaml
	kubectl apply -f mysql/deployment.yaml
	kubectl apply -f mysql/service.yaml

	kubectl apply -f rabbitmq/secret.yaml
	kubectl apply -f rabbitmq/deployment.yaml
	kubectl apply -f rabbitmq/service.yaml
	kubectl apply -f rabbitmq/hpa.yaml

	kubectl apply -f nginx/ConfigMap.yaml
	kubectl apply -f nginx/deployment.yaml
	kubectl apply -f nginx/service.yaml
	kubectl apply -f nginx/hpa.yaml
	kubectl apply -f nginx/ingress.yaml

	kubectl apply -f fpm/Secret.yaml
	kubectl apply -f fpm/ConfigMap.yaml
	kubectl apply -f fpm/deployment.yaml
	kubectl apply -f fpm/service.yaml
	kubectl apply -f fpm/hpa.yaml
	#kubectl rollout restart deployment/fpm-deployment
	
status:
	kubectl get all

generate-ssl:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${KEY_FILE} -out ${CERT_FILE} -subj "/CN=${HOST}/O=${HOST}"
	kubectl create secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}

clear:
	kubectl delete all --all
