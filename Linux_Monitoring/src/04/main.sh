#!/bin/bash

if [ $# != 0 ]
then
    echo "ERROR, don't enter numbers"
    exit 1
fi

source config.conf

export column1_background=$column1_back
export column1_font_color=$column1_font
export column2_background=$column2_back
export column2_font_color=$column2_font
export default1=0
export default2=0
export default3=0
export default4=0

#устанавливает цвета, если они не установлены в конфиге
if [ -z $column1_background ]
then
    default1=1
    if [[ $column1_font_color -ne 3 ]]
    then
        column1_background=3
    else
        column1_background=4
    fi
fi

if [ -z $column1_font_color ]
then
    default2=1
    if [[ $column1_background -ne 1 ]]
    then
        column1_font_color=1
    else
        column1_font_color=3
    fi
fi

if [ -z $column2_background ]
then
    default3=1
    if [[ $column2_font_color -ne 3 ]]
    then
        column2_background=3
    else
        column2_background=4
    fi
fi

if [ -z $column2_font_color ]
then
    default4=1
    if [[ $column2_background -ne 5 ]]
    then
        column2_font_color=5
    else
        column1_font_color=2
    fi
fi

color1=$column1_background
color2=$column1_font_color
color3=$column2_background
color4=$column2_font_color

#проверка чисел
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

chmod +x ./information.sh
./information.sh


