docker create \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -v /mnt/media-center/config/plex:/config \
  -v /mnt/media-center/plex/tvshows:/tv \
  -v /mnt/media-center/plex/movies:/movies \
  -v /mnt/media-center/plex/transcode:/transcode \
  --restart unless-stopped \
  linuxserver/plex

docker start plex
