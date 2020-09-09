#!/usr/bin/env bash

mkdir -p /srv/docker/postgres && chmod -Rf 777 /srv/docker/postgres

docker run -d \
--name postgres \
--restart=always \
-p 5432:5432 \
-v /srv/docker/postgres:/var/lib/postgresql/data \
postgres
