#!/bin/bash -ex

ENV=$1

docker-compose -f docker-compose-$ENV.yml down
