#!/bin/bash
set -e

echo "**** Starting AgileVM Mobile (neko) ****"

# Fix docker-proxy missing issue on Codespaces
sudo mkdir -p /usr/libexec/docker
sudo ln -sf $(which docker-proxy) /usr/libexec/docker/docker-proxy 2>/dev/null || true

docker stop AgileVM 2>/dev/null || true
docker rm AgileVM 2>/dev/null || true

docker run -d \
    --name=AgileVM \
    -e NEKO_SCREEN=390x844@30 \
    -e NEKO_PASSWORD=agilevm \
    -e NEKO_PASSWORD_ADMIN=agilevm \
    -e NEKO_ICELITE=1 \
    -e NEKO_TCPMUX=3478 \
    -p 8080:8080 \
    -p 3478:3478/tcp \
    --shm-size=1gb \
    --restart unless-stopped \
    ghcr.io/m1k1o/neko/firefox:latest

clear
echo "================================================================"
echo "  AgileVM Mobile installed! Open the Ports tab and forward port 8080."
echo "  Password: agilevm"
echo "================================================================"
