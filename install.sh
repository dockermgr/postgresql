#!/usr/bin/env bash

APPNAME="postgresql"

mkdir -p "$DATADIR" && chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  docker pull postgres && docker restart "$APPNAME"
else

  docker run -d \
    --name postgres \
    --restart=always \
    -p 5432:5432 \
    -v "$DATADIR":/var/lib/postgresql/data \
    postgres
fi
