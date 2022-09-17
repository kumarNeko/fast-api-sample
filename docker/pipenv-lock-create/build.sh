#!/usr/bin/env bash
cd "$(dirname $0)" || exit

. ./config.sh

cd ../..

docker build . --ssh default -t ${image_name}:${image_tag}  -f docker/${container_name}/dockerfile
docker tag ${image_name}:${image_tag} ${image_name}:latest
