cp nginx/proxy_test.conf nginx/proxy.conf

docker-compose -f docker-compose-test.yml down
docker-compose -f docker-compose-test.yml build
docker-compose -f docker-compose-test.yml up -d

rm nginx/proxy.conf
