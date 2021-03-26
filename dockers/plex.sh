docker create \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -v /home/luiz/media-center-config/plex:/config \
  -v /mnt/tvshows:/tv \
  -v /home/luiz/transcode:/transcode \
  -v /mnt/movies:/movies \
  --restart unless-stopped \
  linuxserver/plex

docker start plex
