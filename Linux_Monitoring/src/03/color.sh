#!/bin/bash
    color1=$background_left
    color2=$font_left
    color3=$background_right
    color4=$font_right
    export clear="\033[0m"
    #Обозначения цветов: (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)
    if [ $color1 == 1 ]
    then
    background_left="\033[107m"
    elif [ $color1 == 2 ]
    then
    background_left="\033[101m"
    elif [ $color1 == 3 ]
    then
    background_left="\033[102m"
    elif [ $color1 == 4 ]
    then
    background_left="\033[104m"
    elif [ $color1 == 5 ]
    then
    background_left="\033[105m"
    elif [ $color1 == 6 ]
    then
    background_left="\033[40m"
    fi


    if [ $color2 == 1 ]
    then
    font_left="\033[97m"
    elif [ $color2 == 2 ]
    then
    font_left="\033[91m"
    elif [ $color2 == 3 ]
    then
    font_left="\033[92m"
    elif [ $color2 == 4 ]
    then
    font_left="\033[94m"
    elif [ $color2 == 5 ]
    then
    font_left="\033[95m"
    elif [ $color2 == 6 ]
    then
    font_left="\033[30m"
    fi

    if [ $color3 == 1 ]
    then
    background_right="\033[107m"
    elif [ $color3 == 2 ]
    then
    background_right="\033[101m"
    elif [ $color3 == 3 ]
    then
    background_right="\033[102m"
    elif [ $color3 == 4 ]
    then
    background_right="\033[104m"
    elif [ $color3 == 5 ]
    then
    background_right="\033[105m"
    elif [ $color3 == 6 ]
    then
    background_right="\033[40m"
    fi

    if [ $color4 == 1 ]
    then
    font_right="\033[97m"
    elif [ $color4 == 2 ]
    then
    font_right="\033[91m"
    elif [ $color4 == 3 ]
    then
    font_right="\033[92m"
    elif [ $color4 == 4 ]
    then
    font_right="\033[94m"
    elif [ $color4 == 5 ]
    then
    font_right="\033[95m"
    elif [ $color4 == 6 ]
    then
    font_right="\033[30m"
    fi

    chmod +x ./print_info.sh
    ./print_info.sh
    
    
