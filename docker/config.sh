#!/usr/bin/env bash

. ./.env

image_name=$DOCKER_USER/fast-api-sample
version=$(git rev-list --count HEAD)
image_tag=1.0.$version
container_name=fast-api-sample
container_project=$container_name
