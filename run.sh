cp nginx/proxy_prod.conf nginx/proxy.conf

docker-compose down
docker-compose build
docker-compose up -d

rm nginx/proxy.conf
