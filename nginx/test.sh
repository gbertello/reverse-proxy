#!/bin/bash -e

CWD=$(cd $(dirname $0) && pwd)
PARENT=$(dirname $CWD)

source $CWD/lib/common.sh

SYSTEM="test"

NETWORK=$SYSTEM
IMAGE=${PARENT##*/}_${CWD##*/}_${SYSTEM}

SYSTEM_TEST="pytest"

DOCKERFILE_TEST=$CWD/Dockerfile_test
IMAGE_TEST=${PARENT##*/}_${CWD##*/}_${SYSTEM_TEST}

stop -i $IMAGE_TEST &> /dev/null || true
stop -i $IMAGE &> /dev/null || true
$CWD/../app1/stop.sh -s test &> /dev/null || true
$CWD/../app2/stop.sh -s test &> /dev/null || true

OPTIONS="-v $VOLUME:$TARGET_VOLUME"

$CWD/../app1/start.sh -s test
$CWD/../app2/start.sh -s test

cp $CWD/config/proxy_test.conf $CWD/config/proxy.conf
start -i $IMAGE -n $NETWORK -s $SYSTEM $OPTIONS
rm $CWD/config/proxy.conf

start -i $IMAGE_TEST -d $DOCKERFILE_TEST -n $NETWORK -s $SYSTEM_TEST

docker exec $IMAGE_TEST pytest -q --color=yes test.py

stop -i $IMAGE_TEST &> /dev/null || true
stop -i $IMAGE &> /dev/null || true
$CWD/../app1/stop.sh -s test &> /dev/null || true
$CWD/../app2/stop.sh -s test &> /dev/null || true

