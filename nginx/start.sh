#!/bin/bash -e

CWD=$(cd $(dirname $0) && pwd)
PARENT=$(dirname $CWD)

source $CWD/lib/common.sh

SYSTEM="dev"
while getopts ":s:" option; do
  case "${option}" in
    s)
      SYSTEM=${OPTARG}
      ;;
  esac
done

NETWORK=$SYSTEM
IMAGE=${PARENT##*/}_${CWD##*/}_${SYSTEM}
stop -i $IMAGE &> /dev/null || true

OPTIONS=""
OPTIONS="$OPTIONS -p 80:80"

if [[ $ENV -eq "prod" ]]
then
  OPTIONS="$OPTIONS -r always"
  VOLUME="$CWD/certs/"
  TARGET_VOLUME="/certs/"
  OPTIONS="$OPTIONS -v $VOLUME:$TARGET_VOLUME"
  mkdir -p $VOLUME
  OPTIONS="$OPTIONS -p 443:443"
fi


cp $CWD/config/proxy_$SYSTEM.conf $CWD/config/proxy.conf
start -i $IMAGE -s $SYSTEM -n $NETWORK $OPTIONS
rm $CWD/config/proxy.conf
