#!/usr/bin/env bash

cd "$(dirname $0)" || exit

. ./config.sh

cd ..

docker build . --no-cache --target build-stage --ssh default -t ${image_name}:build-stage -f docker/Dockerfile
docker build . --no-cache --target app-stage --ssh default -t ${image_name}:${image_tag} -f docker/Dockerfile
docker tag ${image_name}:${image_tag} ${image_name}:latest
