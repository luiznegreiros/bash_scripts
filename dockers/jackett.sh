docker create \
  --name=jackett \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 9117:9117 \
  -v /home/luiz/media-center-config/jackett:/config \
  -v /home/luiz/Downloads:/downloads \
  --rm \
  linuxserver/jackett
  # --restart unless-stopped \
  
docker start jackett
