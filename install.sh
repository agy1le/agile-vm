#!/bin/bash
set -e

echo "**** Building AgileVM ****"

# Fix docker-proxy missing issue on Codespaces
sudo mkdir -p /usr/libexec/docker
sudo ln -sf $(which docker-proxy) /usr/libexec/docker/docker-proxy 2>/dev/null || true

docker stop AgileVM 2>/dev/null || true
docker rm AgileVM 2>/dev/null || true
rm -rf AgileVM

git clone https://github.com/agy1le/school-vm AgileVM
cd AgileVM

docker build -t agilevm . --no-cache

docker run -d \
    --name=AgileVM \
    -e PUID=1000 \
    -e PGID=1000 \
    --security-opt seccomp=unconfined \
    -e TZ=Etc/UTC \
    -e SUBFOLDER=/ \
    -e TITLE=AgileVM \
    -e PASSWORD=agilevm \
    -p 3000:3000 \
    --shm-size=1gb \
    --restart unless-stopped \
    agilevm

clear
echo "================================================================"
echo "  AgileVM installed! Open the Ports tab and click port 3000."
echo "  Username: abc | Password: agilevm"
echo "================================================================"
