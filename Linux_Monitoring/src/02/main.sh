#!/bin/bash

if [ $# != 0 ]
then
    echo "ERROR"
else
    chmod u+x information.sh
    ./information.sh
    read -p "Would you like to save to a document? (Y/N)" ACCEPT

    if [[ $ACCEPT == y ]] || [[ $ACCEPT == Y ]]
    then
        ./information.sh >> "$(date +"%d_%m_%Y_%H_%M_%S").status"
        echo "FILE SAVED"
    else
        echo "FILE NOT SAVED"
    fi
fi