if [ ! -e nginx/proxy_test.conf ]; then
  echo "Create nginx/proxy_test.conf file to configure reverse proxy on test environment."
  exit 1
fi

cp nginx/proxy_test.conf nginx/proxy.conf

docker-compose -f docker-compose-test.yml down
docker-compose -f docker-compose-test.yml build
docker-compose -f docker-compose-test.yml up -d

rm nginx/proxy.conf
