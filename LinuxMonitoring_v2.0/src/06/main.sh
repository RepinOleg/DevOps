#!/bin/bash

if [ $# != 0 ]; then
    echo "Need only main.sh, without parametrs"
    exit 1
fi

goaccess ../04/nginx_logs/*.log --log-format=COMBINED -a -o ./nginx_logs.html
open nginx_logs.html
