#!/usr/bin/env bash

cd "$(dirname $0)" || exit

. ./config.sh

docker rm ${container_name} 2>/dev/null

echo "uwsgi --ini /var/src/conf/uwsgi-docker.ini"
echo "もしくは DJANGO_SETTINGS_MODULE=torico-exam-django.settings.local uwsgi --ini /var/src/conf/uwsgi-docker.ini"

./run.sh /bin/sh
