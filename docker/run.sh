#!/usr/bin/env bash

cd "$(dirname $0)" || exit

. ./config.sh

[ $(docker container ls -a -q -f name=${container_name}) ] && docker rm ${container_name}

docker run \
  --rm -it \
  -p 8024:8024 \
  --env DJANGO_SETTINGS_MODULE=torico_exam.settings.local \
  --name=${container_name} ${image_name} "$@"
