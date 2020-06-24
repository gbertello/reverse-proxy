#!/bin/bash -e

CWD=$(cd $(dirname $0) && pwd)
PARENT=$(dirname $CWD)
DOMAIN1="www.guillaume-bertello.fr"
DOMAIN2="www.bouboustar.fr"

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

if [[ $SYSTEM == "prod" ]]
then
  OPTIONS="$OPTIONS -r always"
  VOLUME="$CWD/certs/"
  TARGET_VOLUME="/certs/"
  OPTIONS="$OPTIONS -v $VOLUME:$TARGET_VOLUME"
  mkdir -p $VOLUME

  sudo service nginx stop &> /dev/null || true

  certbot certificates &> /dev/null ||true
  certbot renew &> /dev/null || true

  mkdir -p $CWD/$DOMAIN1
  cp /etc/letsencrypt/live/$DOMAIN1/* $CWD/certs/$DOMAIN1/

  mkdir -p $CWD/$DOMAIN2
  cp /etc/letsencrypt/live/$DOMAIN2/* $CWD/certs/$DOMAIN2/

  if [[ ! -f $CWD/certs/dh4096.pem ]]
  then
    openssl dhparam -out $CWD/certs/dh4096.pem 4096
  fi
fi

cp $CWD/config/proxy_$SYSTEM.conf $CWD/config/proxy.conf
start -i $IMAGE -s $SYSTEM -n $NETWORK $OPTIONS
rm $CWD/config/proxy.conf
