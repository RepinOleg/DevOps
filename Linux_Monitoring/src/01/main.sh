#!/bin/bash

if [ "$#" == 1 ]
then
    if [[ $1 == *[0-9]* ]]; then
        echo "Invalid input, enter the string"
    else
        echo $1
    fi
else
    echo "Invalid input, enter one parametr"
fi
