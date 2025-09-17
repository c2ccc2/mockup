#!/bin/bash
chmod +x /usr/local/wysoft/app/ruoyi-admin.jar
chmod +x /usr/local/wysoft/app/ctl-tools.sh

/usr/local/wysoft/app/ctl-tools.sh start
tail -f /dev/null
