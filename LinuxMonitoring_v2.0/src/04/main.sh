#!/bin/bash
. ./generate.sh
if [ $# -ne 0 ]; then
    echo "Not need input"
    exit 1
fi
LOGS_DIR="./nginx_logs"
DAY=5
if [ ! -d "$LOGS_DIR" ]; then
    mkdir "$LOGS_DIR"
else
    rm -rf "$LOGS_DIR"
    mkdir "$LOGS_DIR"
fi
cd $LOGS_DIR
for ((i=1; i < 6; i++))
    do
        touch nginx_$i.log
        number_of_str=$((RANDOM%901+100))
        
        for ((j=0; j < $number_of_str;j++))
        do
            ip=$(generate_ip)
            date=$(generate_date)
            status=$(generate_code_answer)
            method=$(generate_methods)
            url=$(generate_url)
            agent=$(generate_agent)
            echo "$ip - - [$date] \"$method  $url HTTP/1.0\" $status "-" \"$agent\"" >> nginx_$i.log
        done
        ((DAY=DAY-1))
    done