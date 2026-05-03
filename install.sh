#!/bin/bash
set -e

echo "**** Building SchoolVM ****"

sudo apt update -qq
sudo apt install -y docker.io 2>/dev/null || true

docker build -t schoolvm . --no-cache

docker run -d \
    --name=SchoolVM \
    --shm-size=1gb \
    -p 3000:6901 \
    -e VNC_PW=schoolvm \
    --restart unless-stopped \
    schoolvm

clear
echo "================================================================"
echo "  SchoolVM installed! Open the Ports tab and click port 3000."
echo "  Password: schoolvm"
echo "================================================================"
