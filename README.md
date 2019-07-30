# reverse-proxy

This project sets up a nginx reverse proxy to be used on a server host in order to host multiple web applications and have a single entry point.

## Environments

This application can be deployed in 3 environments:

### Local

Usage: `./run-local.sh`

The local environment is used for testing container in isolations. It launches the containers to be tested, deploys the virtual test servers if any, run the tests and shuts down the containers after use. A specific test container is created to run the tests.

The network used is "local". An environment variable ENV is set with the value "local".

### Test

Usage: `./run-test.sh`

The test environment is used for testing this application within an integrated environment. It does not stop the containers after use. To stop them run the script `./shut-down-test.sh`.

The network used is "test". An environment variable ENV is set with the value "test".

The port used for accessing the application is 81. 

### Production

Usage: `./run.sh`

The production environment is used for final deployment to real users. It does not stop the containers after use. To stop them run the script `./shut-down.sh`.

The network used is "prod". An environment variable ENV is set with the value "prod".

The port used for accessing the application is 80. 

## Dependencies

Docker needs to be installed on the host machine for development or deployment purposes.
