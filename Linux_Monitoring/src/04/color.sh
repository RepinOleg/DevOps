#!/bin/bash
    export color1=$column1_background
    export color2=$column1_font_color
    export color3=$column2_background
    export color4=$column2_font_color
    export clear="\033[0m"
    
    export col1_back_name=0
    export font1_name=0
    export col2_back_name=0
    export font2_name=0

    if [ $color1 == 1 ]
    then
        column1_background="\033[107m"
        col1_back_name="white"
    elif [ $color1 == 2 ]
    then
        column1_background="\033[101m"
        col1_back_name="red"
    elif [ $color1 == 3 ]
    then
        column1_background="\033[102m"
        col1_back_name="green"
    elif [ $color1 == 4 ]
    then
        column1_background="\033[104m"
        col1_back_name="blue"
    elif [ $color1 == 5 ]
    then
        column1_background="\033[105m"
        col1_back_name="purple"
    elif [ $color1 == 6 ]
    then
        column1_background="\033[40m"
        col1_back_name="black"
    fi


    if [ $color2 == 1 ]
    then
        column1_font_color="\033[97m"
        font1_name="white"
    elif [ $color2 == 2 ]
    then
        column1_font_color="\033[91m"
        font1_name="red"
    elif [ $color2 == 3 ]
    then
        column1_font_color="\033[92m"
        font1_name="green"
    elif [ $color2 == 4 ]
    then
        column1_font_color="\033[94m"
        font1_name="blue"
    elif [ $color2 == 5 ]
    then
        column1_font_color="\033[95m"
        font1_name="purple"
    elif [ $color2 == 6 ]
    then
        column1_font_color="\033[30m"
        font1_name="black"
    fi

    if [ $color3 == 1 ]
    then
        column2_background="\033[107m"
        col2_back_name="white"
    elif [ $color3 == 2 ]
    then
        column2_background="\033[101m"
        col2_back_name="red"
    elif [ $color3 == 3 ]
    then
        column2_background="\033[102m"
        col2_back_name="green"
    elif [ $color3 == 4 ]
    then
        column2_background="\033[104m"
        col2_back_name="blue"
    elif [ $color3 == 5 ]
    then
        column2_background="\033[105m"
        col2_back_name="purple"
    elif [ $color3 == 6 ]
    then
        column2_background="\033[40m"
        col2_back_name="black"
    fi

    if [ $color4 == 1 ]
    then
        column2_font_color="\033[97m"
        font2_name="white"
    elif [ $color4 == 2 ]
    then
        column2_font_color="\033[91m"
        font2_name="red"
    elif [ $color4 == 3 ]
    then
        column2_font_color="\033[92m"
        font2_name="green"
    elif [ $color4 == 4 ]
    then
        column2_font_color="\033[94m"
        font2_name="blue"
    elif [ $color4 == 5 ]
    then
        column2_font_color="\033[95m"
        font2_name="purple"
    elif [ $color4 == 6 ]
    then
        column2_font_color="\033[30m"
        font2_name="black"
    fi

    chmod +x ./print_info.sh
    ./print_info.sh
    
    
