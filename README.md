# reverse-proxy

This project sets up a nginx reverse proxy to be used on a server host in order to host multiple web applications and have a single entry point.

## Usage

1) First edit the file nginx/proxy_prod.conf
2) Then run the file ./run.sh

## Test

To test the application, run the file ./run_test.sh. It should show a hello world coming from 2 apps with traffic going through the same proxy.
