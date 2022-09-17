#!/usr/bin/env bash

cd "$(dirname $0)" || exit

. ./config.sh

[ $(docker container ls -a -q -f name=${container_name}) ] && docker rm ${container_name}

docker run \
  --rm -it \
  -p 8080:8080 \
  --name=${container_name} ${image_name} "$@"
