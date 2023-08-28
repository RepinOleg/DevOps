#!/bin/bash
    export HOSTNAME=$HOSTNAME
    
    export TIMEZONE=$(< /etc/timezone)
   
    export USER=$USER
    
    export OS=$(awk '{print $1, $2, $3}' /etc/issue | sed ':a; /$/N; s/\n//; ta')
   
    export DATE=$(date)
    
    export UPTIME=$(uptime -p)
    
    export UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)
    
    export IP=$(hostname -I)
    
    export MASK=$(ifconfig | grep $(hostname -I) | awk '{print$4}')
    
    export GATEWAY=$(ip r | grep default | awk '{print $3}')

    export RAM_TOTAL=$(free -m | awk '/Mem/{printf "%.3f GB\n", $2/1024}')

    export RAM_USED=$(free -m | awk '/Mem/{printf "%.3f GB\n", $3/1024}')

    export RAM_FREE=$(free -m | awk '/Mem/{printf "%.3f GB\n", $4/1024}')

    export SPACE_ROOT=$(df /root/ | awk '/\/$/{printf "%.2f MB\n", $2/1024}')

    export SPACE_ROOT_USED=$(df /root/ | awk '/\/$/{printf "%.2f MB\n", $3/1024}')

    export SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/{printf "%.2f MB\n", $4/1024}')

    chmod u+x ./color.sh
    ./color.sh
