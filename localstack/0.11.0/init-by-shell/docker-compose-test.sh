#!/bin/bash
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)

yes | docker system prune --volumes

docker rmi $(docker images -q) --force

export DOCKER_UID=$(id -u $USER)
export DOCKER_GID=$(id -g $USER)
export DOCKER_UNAME=$USER

docker-compose up -d
docker attach localstack-dev

# DOCKER_UNAME=$USER DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up