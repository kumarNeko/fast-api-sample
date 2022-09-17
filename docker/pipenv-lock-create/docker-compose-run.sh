#!/usr/bin/env bash

cd "$(dirname $0)" || exit

. ./config.sh

docker rm ${container_name} 2>/dev/null

docker-compose \
  run --rm \
  ${container_name} \
  ash /sh/pipenv-lock-create.sh
