#!/bin/bash

remove_folders() {
    folders=$(cat ../02/create_files.log | grep Folder | awk '{print $2}')
    if [ $1 -eq 1 ]; then
        for p in $folders;
        do
            echo "Remove $p"
            sudo rm -rf $p
        done
    elif [ $1 -eq 2 ]; then
        echo "Input start time in format: YYYY-mm-DD HH:MM"
        read START_TIME
        echo "Input end time in format: YYYY-mm-DD HH:MM"
        read END_TIME
        echo "Delete starting"
        paths=$(find / -mindepth 1 -type d,f -newermt "$START_TIME" ! -newermt "$END_TIME" | grep -e bin -e sbin -e /DO4_LinuxMonitoring_v2.0-1 -v)
        for f in $paths
        do  
            echo "Remove $f"
            rm -rf $f
        done
        echo "Removal completed successfully"
    elif [ $1 -eq 3 ]; then
        echo "Input mask:"
        read MASK
        paths=$(find / -type f,d -name "*${MASK}*" &>/dev/null)
        for file_path in $paths
        do
            echo "Remove $file_path"
            if [[ -f $file_path ]]; then 
                sudo rm -f $file_path
            else
                sudo rm -rf $file_path
            fi
        done
    fi
}