#!/bin/bash

if [[ $# -ne 1 || $1 -lt 1 || $1 -gt 4 ]]; then
    echo "Put one number > 0 and < 5"
    exit 1
fi

FOLDER_PATH="../04/nginx_logs/"

case $1 in
    1)
        awk '{print $9, $0}' "$FOLDER_PATH"*.log | sort -nk 9 | cut -d ' ' -f 2- > all_logs.log
    ;;
    2)
        awk '{print $1}' "$FOLDER_PATH"*.log | sort -u > unique_ip.log
    ;;
    3)
        awk '{print $9, $0}' "$FOLDER_PATH"*.log |  cut -d ' ' -f 2- | awk '$9 ~ /[45][0-9][0-9]/ {print}' > errors.log
    ;;
    4)
        awk '{print $9, $0}' "$FOLDER_PATH"*.log |  cut -d ' ' -f 2- | awk '$9 ~ /[45][0-9][0-9]/ {print}' | awk '{print $1}' | sort -u > unique_ip2.log
    ;;
esac
