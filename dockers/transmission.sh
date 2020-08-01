docker create \
  --name=transmission \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -e USER=luiz `#optional` \
  -e PASS=funcione `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /home/luiz/media-center-config/transmission:/config \
  -v /home/luiz/download:/downloads \
  -v /home/luiz/download:/watch \
  --restart unless-stopped \
  linuxserver/transmission

docker start transmission
