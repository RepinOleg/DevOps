#!/bin/bash

if [ $# != 4 ]
then
    echo "ERROR, enter four numbers"
    exit 1
fi
color1=$1
color2=$2
color3=$3
color4=$4

for i in 1 2 3 4 ; do
    if [[ $[color$i] -lt 1 || $[color$i] -gt 6 ]]
    then
        echo "ERROR, enter numbers from 1 to 6"
        exit 1
    fi
done
if [[ $color1 -eq $color2 ]] || [[ $color3 -eq $color4 ]]
then
    echo "ERROR, enter different numbers"
    exit 1
fi

export background_left=$color1
export font_left=$color2
export background_right=$color3
export font_right=$color4
chmod +x ./information.sh
./information.sh


