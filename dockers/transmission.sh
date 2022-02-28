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
  -v /home/luiz/media-center-config/transmission:/config \
  -v /home/luiz/Downloads:/downloads \
  -v /home/luiz/Downloads:/watch \
  linuxserver/transmission
  # --restart unless-stopped \

docker start transmission
