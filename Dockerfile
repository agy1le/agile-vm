FROM kasmweb/firefox:1.16.0

USER root

# Set the window title
ENV KASM_VNC_PORT=6901
ENV TITLE="AgileVM"

# Install uBlock Origin and set Firefox as the default start page
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Firefox preferences: disable telemetry, set start page, etc.
COPY firefox.js /usr/lib/firefox/browser/defaults/preferences/firefox.js

USER 1000
