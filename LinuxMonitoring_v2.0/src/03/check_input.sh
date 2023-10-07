#!/bin/bash
if [ $# != 1 ]; then
        echo "Need 1 parametr"
        exit 1
fi

validation() {

    isNumber="^[0-9]+$"
    if [[ ! $parametr =~ $isNumber ]];
    then
        echo "Need number"
        exit 2
    fi

    if [[ $parametr -gt 3 || $parametr -lt 1 ]];
    then
        echo "Need a number from 1 to 3"
        exit 2
    fi
}
