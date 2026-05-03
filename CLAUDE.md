# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

AgileVM is a one-command installer that spins up a containerized Firefox desktop (via `lscr.io/linuxserver/webtop:ubuntu-xfce`) accessible through a browser at port 3000. It's designed to run inside GitHub Codespaces so users can browse the web without local installs or admin rights.

## Commands

**Build and run the VM (from a Codespace terminal):**
```bash
bash install.sh
```
This stops/removes any existing `AgileVM` container, rebuilds the image from scratch (`--no-cache`), and starts it.

**Rebuild just the Docker image:**
```bash
docker build -t agilevm . --no-cache
```

**Check running container:**
```bash
docker ps -f name=AgileVM
docker logs AgileVM
```

**Stop/remove the container:**
```bash
docker stop AgileVM && docker rm AgileVM
```

## Architecture

Three files do everything:

- **`Dockerfile`** — installs Firefox on top of the webtop base image and copies `firefox.js` into `/etc/firefox/syspref.js` (Firefox's system-wide preferences path).
- **`firefox.js`** — locks Firefox settings for the containerized environment: homepage, hardware acceleration, animation/telemetry disabling to reduce VNC lag.
- **`install.sh`** — the full lifecycle script: clones this repo fresh, builds the image, and runs the container with the correct env vars (`RESOLUTION`, `PASSWORD`, `SUBFOLDER`, etc.) expected by the linuxserver/webtop image.

## Key constraints

- The base image (`linuxserver/webtop`) controls the VNC/noVNC server, XFCE desktop, and user (`abc`). Don't fight its conventions.
- `RESOLUTION` in `install.sh` directly controls how many pixels the VNC server encodes per frame — lower resolution is the single biggest lever for reducing lag.
- `--shm-size=1gb` is required; without it Firefox will crash inside the container due to shared memory limits.
- `firefox.js` is applied at the system level (`/etc/firefox/syspref.js`), so preferences set there cannot be overridden by the user inside the VM.
