#!/bin/bash
    echo "HOSTNAME = $HOSTNAME"
    
    echo "TIMEZONE = $(< /etc/timezone)"
   
    echo "USER = $USER"
    
    echo "OS = $(awk '{print $1, $2, $3}' /etc/issue)" | sed ':a; /$/N; s/\n//; ta'
   
    echo "DATE = $(date)"
    
    echo "UPTIME = $(uptime -p)"
    
    echo "UPTIME_SEC = $(awk '{print int($1)}' /proc/uptime)"
    
    echo "IP = $(hostname -I)"
    
    ifconfig | grep $(hostname -I) | awk '{print "MASK = " $4}'
    
    ip r | grep default | awk '{print "GATEWAY = " $3}'

    free -m | awk '/Mem/{printf "RAM_TOTAL = %.3f GB\n", $2/1024}'

    free -m | awk '/Mem/{printf "RAM_USED = %.3f GB\n", $3/1024}'

    free -m | awk '/Mem/{printf "RAM_FREE = %.3f GB\n", $4/1024}'

    df /root/ | awk '/\/$/{printf "SPACE_ROOT = %.2f MB\n", $2/1024}'

    df /root/ | awk '/\/$/{printf "SPACE_ROOT_USED = %.2f MB\n", $3/1024}'

    df /root/ | awk '/\/$/{printf "SPACE_ROOT_FREE = %.2f MB\n", $4/1024}'
