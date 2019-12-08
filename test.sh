#!/bin/bash -ex

ENV=$1

docker exec -it reverse_proxy_test_$1 env TERM=xterm-256color pytest
