#!/bin/bash -ex
#
# Configuration needs to be defined in ~/.profile with the following variables:
#   - USER: user name used for mongodb
#   - PASSWORD: password used for mongodb

source ~/.profile

docker network create --driver bridge local &> /dev/null || true
docker-compose -f docker-compose-local.yml down || true

docker-compose -f docker-compose-local.yml build
docker-compose -f docker-compose-local.yml up -d

docker build -t app_test test/
docker run -it --rm --network="local" app_test pytest

docker-compose -f docker-compose-local.yml down
rm -rf ../storage/node/local
