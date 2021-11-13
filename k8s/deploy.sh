VERSION="1.0.1"
docker tag docker_test-nginx hursittopal/test-nginx:${VERSION}
docker push hursittopal/test-nginx:${VERSION}

docker tag docker_test-fpm hursittopal/test-fpm:${VERSION}
docker push hursittopal/test-fpm:${VERSION}

docker tag docker_test-mongo hursittopal/test-mongo:${VERSION}
docker push hursittopal/test-mongo:${VERSION}

docker tag docker_test-mysql hursittopal/test-mysql:${VERSION}
docker push hursittopal/test-mysql:${VERSION}

docker tag docker_test-memcached hursittopal/test-memcached:${VERSION}
docker push hursittopal/test-memcached:${VERSION}

docker tag docker_test-rabbitmq hursittopal/test-rabbitmq:${VERSION}
docker push hursittopal/test-rabbitmq:${VERSION}
