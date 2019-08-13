#!/bin/bash -ex
#
# Configuration needs to be defined in ~/.profile with the following variables:
#   - export COMPOSE_IGNORE_ORPHANS=True: This will avoid docker warnings
#

source ~/.profile

cp proxy_local.conf proxy.conf

docker network create --driver bridge local &> /dev/null || true
docker-compose -f docker-compose-local.yml build
docker-compose -f docker-compose-local.yml up -d

rm proxy.conf

sleep 1
docker build -t reverse-proxy_test test/
docker run -it --rm --network="local" reverse-proxy_test python test.py

docker-compose -f docker-compose-local.yml down
