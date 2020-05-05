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

if [[ $ENV -eq "prod" ]]
then
  OPTIONS="$OPTIONS -r always"
fi

cp $CWD/config/proxy_$SYSTEM.conf $CWD/config/proxy.conf
start -i $IMAGE -s $SYSTEM -n $NETWORK -p 3000:80 $OPTIONS
rm $CWD/config/proxy.conf
