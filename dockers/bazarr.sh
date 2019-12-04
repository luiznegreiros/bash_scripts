docker create \
  --name=bazarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 6767:6767 \
  -v /mnt/media-center/config/bazarr:/config \
  -v /mnt/media-center/plex/movies:/movies \
  -v /mnt/media-center/plex/tvshows:/tv \
  --restart unless-stopped \
  linuxserver/bazarr
  
docker start bazarr
