#!/bin/bash -e

CWD=$(cd $(dirname $0) && pwd)
PARENT=$(dirname $CWD)
DOMAIN="www.guillaume-bertello.fr"

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
OPTIONS="$OPTIONS -p 80:80|443:443"

if [[ $ENV -eq "prod" ]]
then
  OPTIONS="$OPTIONS -r always"
  VOLUME="$CWD/certs/"
  TARGET_VOLUME="/certs/"
  OPTIONS="$OPTIONS -v $VOLUME:$TARGET_VOLUME"
  mkdir -p $VOLUME

  sudo service nginx stop &> /dev/null || true

  certbot certificates
  certbot renew --force-renewal

  mkdir -p $CWD/nginx/certs
  cp /etc/letsencrypt/live/$DOMAIN/* $CWD/nginx/certs/

  $CWD/nginx/start.sh -s prod
fi


cp $CWD/config/proxy_$SYSTEM.conf $CWD/config/proxy.conf
start -i $IMAGE -s $SYSTEM -n $NETWORK $OPTIONS
rm $CWD/config/proxy.conf
