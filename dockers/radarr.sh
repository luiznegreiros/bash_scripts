docker create \
  --name=radarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 7878:7878 \
  -v /mnt/media-center/config/radarr:/config \
  -v /mnt/media-center/plex/movies:/movies \
  -v /mnt/media-center/download:/downloads \
  -v /mnt/media-center/bash_scripts:/scripts \
  --restart unless-stopped \
  linuxserver/radarr

docker start radarr