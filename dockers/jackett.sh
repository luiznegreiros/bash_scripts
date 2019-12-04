docker create \
  --name=jackett \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 9117:9117 \
  -v /mnt/media-center/config/jackett:/config \
  -v /mnt/media-center/download:/downloads \
  --restart unless-stopped \
  linuxserver/jackett
  
docker start jackett
