nginx/stop.sh -s prod
sudo service nginx stop
certbot certificates 
certbot renew
cp /etc/letsencrypt/live/www.guillaume-bertello.fr/* certs/
nginx/start.sh -s prod