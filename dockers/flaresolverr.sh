docker create \
  --name=flaresolverr \
  --net=host \
  -p 8191:8191 \
  -e LOG_LEVEL=info \
  --rm \
  ghcr.io/flaresolverr/flaresolverr:latest
  # --restart unless-stopped \

  docker start flaresolverr
  