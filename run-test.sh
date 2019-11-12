#!/bin/bash -ex
#
# Configuration needs to be defined in ~/.profile with the following variables:
#   - export COMPOSE_IGNORE_ORPHANS=True: This will avoid docker warnings
#

source ~/.profile

if [ ! -e nginx/proxy_test.conf ]; then
  echo "Create nginx/proxy_test.conf file to configure reverse proxy on test environment."
  exit 1
fi

cp nginx/proxy_test.conf nginx/proxy.conf

docker network create --driver bridge test &> /dev/null || true
docker-compose -f docker-compose-test.yml down
docker-compose -f docker-compose-test.yml build
docker-compose -f docker-compose-test.yml up -d

rm nginx/proxy.conf
