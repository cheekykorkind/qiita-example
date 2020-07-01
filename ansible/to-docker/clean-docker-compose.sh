#!/bin/sh

docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
yes | docker network prune
yes | docker volume prune

docker images -a | grep "amazonlinux2-ansible" | awk '{print $3}' | xargs docker rmi --force

DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up
# DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up -d