#!/usr/bin/env bash

APPNAME="postgresql"
DOCKER_HUB_URL="postgres"

sudo mkdir -p "$DATADIR"
sudo chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  sudo docker pull "$DOCKER_HUB_URL"
  sudo docker restart "$APPNAME"
else

  sudo docker run -d \
    --name postgres \
    --restart=always \
    -p 5432:5432 \
    -v "$DATADIR":/var/lib/postgresql/data \
    "$DOCKER_HUB_URL"
fi
