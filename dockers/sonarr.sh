docker create \
  --name=sonarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 8989:8989 \
  -v /mnt/media-center/config/sonarr:/config \
  -v /mnt/media-center/plex/tvshows:/tv \
  -v /mnt/media-center/download:/downloads \
  --restart unless-stopped \
  linuxserver/sonarr

docker