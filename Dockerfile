FROM lscr.io/linuxserver/webtop:ubuntu-xfce

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends firefox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY firefox.js /etc/firefox/syspref.js

EXPOSE 3000
