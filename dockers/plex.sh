docker create \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -v /media/luiz/SAMSUNG/media-center/media-center-config/plex:/config \
  -v /home/luiz/media-center/transcode:/transcode \
  -v /media/luiz/tv-shows:/tv \
  -v /media/luiz/movies:/movies \
  --rm \
  linuxserver/plex
# --restart unless-stopped \

docker start plex
