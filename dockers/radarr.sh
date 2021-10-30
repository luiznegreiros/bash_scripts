docker create \
  --name=radarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 7878:7878 \
  -v /home/luiz/Downloads:/downloads \
  -v /home/luiz/media-center-config/radarr:/config \
  -v /home/luiz/bash_scripts:/scripts \
  -v /mnt/movies:/movies \
  --restart unless-stopped \
  linuxserver/radarr

docker start radarr


