docker create \
  --name=sonarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 8989:8989 \
  -v /home/luiz/media-center-config/sonarr:/config \
  -v /mnt/tvshows:/tv \
  -v /home/luiz/download:/downloads \
  --restart unless-stopped \
  linuxserver/sonarr

docker start sonarr

