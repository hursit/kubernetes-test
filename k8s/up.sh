eval $(minikube docker-env)
eval $(minikube docker-env)
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

kubectl apply -f nginx/ConfigMap.yaml
kubectl apply -f nginx/deployment.yaml
kubectl apply -f nginx/service.yaml
kubectl apply -f nginx/ingress.yaml

kubectl apply -f fpm/deployment.yaml
kubectl apply -f fpm/service.yaml

#minikube tunnel