docker create \
  --name=transmission \
  --net=host \
  --rm \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -e USER=luiz `#optional` \
  -e PASS=funcione `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /media/luiz/SAMSUNG/media-center/media-center-config/transmission:/config \
  -v /media/luiz/SAMSUNG/media-center/downloads:/downloads \
  -v /media/luiz/SAMSUNG/media-center/downloads/watch:/watch \
  linuxserver/transmission
# --restart unless-stopped \

docker start transmission
