docker run -d \
  --name=trailarr \
  --net=host \
  -e TZ=America/Sao_Paulo \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 7889:7889 \
  -v /media/luiz/SAMSUNG/media-center/media-center-config/trailarr:/config \
  -v /media/luiz/movies:/movies \
  -v /media/luiz/tv-shows:/tv \
  --rm \
  nandyalu/trailarr:latest

# -v <LOCAL_MEDIA_FOLDER>:<RADARR_ROOT_FOLDER> \
# -v <LOCAL_MEDIA_FOLDER>:<SONARR_ROOT_FOLDER> \
# --restart unless-stopped \
