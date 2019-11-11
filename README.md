# app-template

This repository is used as a reverse proxy for various applications running on different docker containers on the same machine.

## Environments

This application can be deployed in 3 environments:

### Test

Usage: `./run-test.sh`

The test environment is used for testing this application within an integrated environment (with a reverse proxy for example). It does not stop the containers after use. To stop them run the script `./shut-down-test.sh`.

The network used is "test". An environment variable ENV is set with the value "test".

### Production

Usage: `./run.sh`

The production environment is used for final deployment to real users. It does not stop the containers after use. To stop them run the script `./shut-down.sh`.

The network used is "prod". An environment variable ENV is set with the value "prod".

## Dependencies

Docker needs to be installed on the host machine for development or deployment purposes.
