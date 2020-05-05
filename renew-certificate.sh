nginx/stop.sh -s prod &> /dev/null || true
sudo service nginx stop &> /dev/null || true

certbot certificates
certbot renew --force-renewal

mkdir -p nginx/certs
cp /etc/letsencrypt/live/www.guillaume-bertello.fr/* nginx/certs/

nginx/start.sh -s prod
