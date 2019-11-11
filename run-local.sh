#!/bin/bash -ex
#
# Configuration needs to be defined in ~/.profile with the following variables:
#   - USER: user name used for mongodb
#   - PASSWORD: password used for mongodb

source ~/.profile

cd node
./run-local.sh
cd ..
