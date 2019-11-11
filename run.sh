#!/bin/bash -ex
#
# Configuration needs to be defined in ~/.profile with the following variables:
#   - USER: user name used for mongodb
#   - PASSWORD: password used for mongodb

source ~/.profile

docker network create --driver bridge prod &> /dev/null || true
docker-compose down || true

docker-compose build
docker-compose up -d
