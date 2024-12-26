docker create \
  --name=bazarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 6767:6767 \
  -v /media/luiz/SAMSUNG/media-center/media-center-config/bazarr:/config \
  -v /media/luiz/movies:/movies \
  -v /media/luiz/tv-shows:/tv \
  --rm \
  linuxserver/bazarr
# --restart unless-stopped \

docker start bazarr
