docker create \
  --name=radarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 7878:7878 \
  -v /media/luiz/SAMSUNG/media-center/media-center-config/radarr:/config \
  -v /media/luiz/SAMSUNG/media-center/bash_scripts:/scripts \
  -v /media/luiz/SAMSUNG/media-center/downloads/movies:/downloads/Movies \
  -v /media/luiz/movies:/movies \
  -v /media/luiz/movies:/media/arquivos/plex/movies \
  --rm \
  linuxserver/radarr
# -v /media/luiz/movies/0.downloads:/downloads \
# --restart unless-stopped \

docker start radarr
