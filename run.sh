# Configuration needs to be defined in ~/.profile with the following variables:
#   - export COMPOSE_IGNORE_ORPHANS=True: This will avoid docker warnings
#

source ~/.profile

if [ ! -e nginx/proxy_prod.conf ]; then
  echo "Create nginx/proxy_prod.conf file to configure reverse proxy on production environment."
  exit 1
fi

cp nginx/proxy_prod.conf nginx/proxy.conf

docker network create --driver bridge prod &> /dev/null
docker-compose down
docker-compose build
docker-compose up -d

rm nginx/proxy.conf
