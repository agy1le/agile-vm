#!/bin/bash
set -e

echo "**** Building AgileVM ****"

sudo apt update -qq
sudo apt install -y docker.io 2>/dev/null || true

docker build -t agilevm . --no-cache

docker run -d \
    --name=AgileVM \
    --shm-size=1gb \
    -p 3000:6901 \
    -e VNC_PW=agilevm \
    --restart unless-stopped \
    agilevm

clear
echo "================================================================"
echo "  AgileVM installed! Open the Ports tab and click port 3000."
echo "  Password: agilevm"
echo "================================================================"
