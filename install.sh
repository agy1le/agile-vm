#!/bin/bash
set -e

echo "**** Building AgileVM ****"

docker stop AgileVM 2>/dev/null || true
docker rm AgileVM 2>/dev/null || true
rm -rf AgileVM

git clone https://github.com/agy1le/school-vm AgileVM
cd AgileVM

docker build -t agilevm . --no-cache

docker run -d \
    --name=AgileVM \
    --network host \
    --shm-size=1gb \
    -e VNC_PW=agilevm \
    --restart unless-stopped \
    agilevm

clear
echo "================================================================"
echo "  AgileVM installed! Open the Ports tab and forward port 6901."
echo "  Password: agilevm"
echo "================================================================"
