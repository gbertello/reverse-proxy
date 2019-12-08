#!/bin/bash -ex

ENV=$1

source ~/.profile

docker network create --driver bridge $ENV &> /dev/null || true
cp nginx/proxy_$ENV.conf nginx/proxy.conf

docker-compose -f docker-compose-$ENV.yml build
docker-compose -f docker-compose-$ENV.yml up -d

rm nginx/proxy.conf
