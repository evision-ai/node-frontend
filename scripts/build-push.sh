#!/usr/bin/env bash

set -e
set -x

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

tag=14

docker build -t gmface/node-frontend:${tag} .

docker tag gmface/node-frontent:${tag} gmface/node-frontend:latest

docker push gmface/node-frontend:${tag}

docker push gmface/node-frontend:latest

docker tag gmface/node-frontent:${tag} evision2:5000/library/node-frontend:${tag}

docker tag gmface/node-frontent:${tag} evision2:5000/library/node-frontend:latest

docker push evision2:5000/library/node-frontend:${tag}

docker push evision2:5000/library/node-frontend:latest
