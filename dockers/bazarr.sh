docker create \
  --name=bazarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 6767:6767 \
  -v /home/luiz/media-center-config/bazarr:/config \
  -v /mnt/movies:/movies \
  -v /mnt/tvshows:/tv \
  --rm \
  linuxserver/bazarr
  # --restart unless-stopped \
  
docker start bazarr
