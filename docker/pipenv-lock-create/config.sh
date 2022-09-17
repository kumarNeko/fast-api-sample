#!/usr/bin/env bash

. ./.env

container_name=pipenv-lock-create
image_name=$DOCKER_USER/$container_name
image_tag=python3.10