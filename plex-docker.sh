#!/bin/sh
# plex server
# docker container stop plex; docker container rm plex

docker run -d --name=plex \
 --hostname=plex --domainname=YOURDOMAIN.com \
 --net=host \
 --dns="8.8.8.8" \
 --device=/dev/dri:/dev/dri \
 --restart=unless-stopped \
 --privileged \
 -e VERSION=latest \
 -e PUID=1001 -e PGID=100 \
 -e TZ="America/Denver" \
 -e ADVERTISE_IP="https://plex.YOURDOMAIN.com:32400/" \
 -e PLEX_MEDIA_SERVER_USER=plex \
 -e HOSTNAME=plex \
 -e LAN_NETWORKS='192.168.11.0/23' \
 -e ALLOWED_NETWORKS='192.168.11.0/23' \
 -v /home/dockers/configs/plex:/config \
 -v /mnt/movies/TV:/tv \
 -v /mnt/movies/TV:/data/tvshows \
 -v /mnt/movies/Movies:/movies \
 -v /mnt/movies/Movies:/data/movies \
 -v /mnt/movies/Prerolls:/data/prefolls \
 -v /mnt/ramdisk:/transcode \
 -v /etc/timezone:/etc/timezone:ro \
 -v /etc/ssl/private/:/etc/ssl/private:ro \
 -v /mnt/ramdisk/plex/Logs:'/config/Library/Application Support/Plex Media Server/Logs' \
 -l LAN_NETWORKS='192.168.11.0/23' \
 -l ALLOWED_NETWORKS='192.168.11.0/23' \
 linuxserver/plex:latest
