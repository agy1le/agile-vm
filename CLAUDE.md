# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

AgileVM is a one-command installer that spins up a containerized Firefox desktop (via `lscr.io/linuxserver/webtop:ubuntu-xfce`) accessible through a browser at port 3000. It's designed to run inside GitHub Codespaces so users can browse the web without local installs or admin rights.

## Commands

**Desktop (run from a Codespace terminal):**
```bash
bash install.sh
```

**Mobile (portrait 390x844, Firefox kiosk mode):**
```bash
bash install-mobile.sh
```

Both scripts stop/remove the existing `AgileVM` container before starting, so running either one swaps the mode automatically.

**Rebuild just the Docker image:**
```bash
# Desktop
docker build -t agilevm . --no-cache
# Mobile
docker build -t agilevm-mobile -f Dockerfile.mobile . --no-cache
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

- **`Dockerfile`** / **`Dockerfile.mobile`** — install Firefox on top of the webtop base image and copy `firefox.js` into `/etc/firefox/syspref.js`. The mobile variant also copies `kiosk-init.sh` into `/custom-cont-init.d/`, which the linuxserver init system runs at container startup.
- **`firefox.js`** — shared system-wide Firefox prefs for both variants: homepage, hardware acceleration, AV1 disabled, animations disabled to reduce VNC redraws.
- **`kiosk-init.sh`** — writes an XFCE autostart `.desktop` file that launches Firefox with `--kiosk` on container start, hiding the desktop entirely.
- **`install.sh`** / **`install-mobile.sh`** — full lifecycle scripts: clone the repo fresh, build the image, run the container. Mobile uses `RESOLUTION=390x844` (portrait) and the `agilevm-mobile` image.

## Key constraints

- The base image (`linuxserver/webtop`) controls the VNC/noVNC server, XFCE desktop, and user (`abc`). Don't fight its conventions.
- `RESOLUTION` in `install.sh` directly controls how many pixels the VNC server encodes per frame — lower resolution is the single biggest lever for reducing lag.
- `--shm-size=1gb` is required; without it Firefox will crash inside the container due to shared memory limits.
- `firefox.js` is applied at the system level (`/etc/firefox/syspref.js`), so preferences set there cannot be overridden by the user inside the VM.
