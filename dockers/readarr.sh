docker create \
  --name=readarr \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Sao_Paulo \
  -p 8787:8787 \
  -v /media/luiz/SAMSUNG/media-center/media-center-config/readarr:/config \
  -v /media/luiz/SAMSUNG/media-center/books:/books `#optional` \
  -v /media/luiz/SAMSUNG/media-center/downloads:/downloads `#optional` \
  --rm \
  lscr.io/linuxserver/readarr:develop
