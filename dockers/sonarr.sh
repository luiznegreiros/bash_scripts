docker create \
  --name=sonarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 8989:8989 \
  -v /media/luiz/SAMSUNG/media-center/media-center-config/sonarr:/config \
  -v /media/luiz/SAMSUNG/media-center/downloads/series:/downloads/Series \
  -v /media/luiz/tv-shows:/tv \
  --rm \
  linuxserver/sonarr
# --restart unless-stopped \

docker start sonarr
