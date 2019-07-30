export COMPOSE_IGNORE_ORPHANS=True

cp nginx/proxy_local.conf nginx/proxy.conf

docker network create --driver bridge local &> /dev/null
docker-compose -f docker-compose-local.yml build
docker-compose -f docker-compose-local.yml up -d

rm nginx/proxy.conf

sleep 1
docker build -t reverse-proxy_test test/
docker run -it --rm --network="local" reverse-proxy_test python test.py

docker-compose -f docker-compose-local.yml down
