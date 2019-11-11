#!/bin/bash -ex
#
# Configuration needs to be defined in ~/.profile with the following variables:
#   - USER: user name used for mongodb
#   - PASSWORD: password used for mongodb

source ~/.profile

docker network create --driver bridge test &> /dev/null || true
docker-compose -f docker-compose-test.yml down || true

docker-compose -f docker-compose-test.yml build
docker-compose -f docker-compose-test.yml up -d
