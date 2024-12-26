#!/bin/bash

function plextraktsync-create() {
  docker create \
    --name=plextraktsync \
    --net=host \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=America/Sao_Paulo \
    -v /media/luiz/SAMSUNG/media-center/media-center-config/plextraktsync:/app/config \
    ghcr.io/taxel/plextraktsync
}

function plextraktsync-start() {
  docker start plextraktsync
}

function plextraktsync-watch() {
  docker exec plextraktsync plextraktsync watch
}

function plextraktsync-sync() {
  docker exec plextraktsync plextraktsync sync
}

if [ "$(docker ps -q -f name=plextraktsync)" ]; then
  echo "Container plextraktsync is already running"
else
  if [ ! "$(docker ps -aq -f status=exited -f name=plextraktsync)" ]; then
    plextraktsync-create
  fi
  plextraktsync-start
fi

plextraktsync-sync
