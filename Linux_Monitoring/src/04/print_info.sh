#!/bin/bash

echo -e "$column1_background$column1_font_color HOSTNAME            $clear = $column2_background$column2_font_color $HOSTNAME $clear"
echo -e "$column1_background$column1_font_color TIMEZONE            $clear = $column2_background$column2_font_color $TIMEZONE $clear"
echo -e "$column1_background$column1_font_color USER                $clear = $column2_background$column2_font_color $USER $clear"
echo -e "$column1_background$column1_font_color OS                  $clear = $column2_background$column2_font_color $OS $clear"
echo -e "$column1_background$column1_font_color DATE                $clear = $column2_background$column2_font_color $DATE $clear"
echo -e "$column1_background$column1_font_color UPTIME              $clear = $column2_background$column2_font_color $UPTIME $clear"
echo -e "$column1_background$column1_font_color UPTIME_SEC          $clear = $column2_background$column2_font_color $UPTIME_SEC $clear"
echo -e "$column1_background$column1_font_color IP                  $clear = $column2_background$column2_font_color $IP $clear"
echo -e "$column1_background$column1_font_color MASK                $clear = $column2_background$column2_font_color $MASK $clear"
echo -e "$column1_background$column1_font_color GATEWAY             $clear = $column2_background$column2_font_color $GATEWAY $clear"
echo -e "$column1_background$column1_font_color RAM_TOTAL           $clear = $column2_background$column2_font_color $RAM_TOTAL $clear"
echo -e "$column1_background$column1_font_color RAM_USED            $clear = $column2_background$column2_font_color $RAM_USED $clear"
echo -e "$column1_background$column1_font_color RAM_FREE            $clear = $column2_background$column2_font_color $RAM_FREE $clear"
echo -e "$column1_background$column1_font_color RAM_FREE            $clear = $column2_background$column2_font_color $RAM_FREE $clear"
echo -e "$column1_background$column1_font_color SPACE_ROOT          $clear = $column2_background$column2_font_color $SPACE_ROOT $clear"
echo -e "$column1_background$column1_font_color SPACE_ROOT_USED     $clear = $column2_background$column2_font_color $SPACE_ROOT_USED $clear"
echo -e "$column1_background$column1_font_color SPACE_ROOT_FREE     $clear = $column2_background$column2_font_color $SPACE_ROOT_FREE $clear"
echo

if [ $default1 -eq 1 ]
then
    echo " Column 1 background = default ($col1_back_name)"
else
    echo " Column 1 background = $color1 ($col1_back_name)"
fi

if [ $default2 -eq 1 ]
then
    echo " Column 1 font color = default ($font1_name)"
else
    echo " Column 1 font color = $color2 ($font1_name)"
fi

if [ $default3 -eq 1 ]
then
    echo " Column 2 background = default ($col2_back_name)"
else
    echo " Column 2 background = $color3 ($col2_back_name)"
fi

if [ $default4 -eq 1 ]
then
    echo " Column 2 font color = default ($font2_name)"
else
    echo " Column 2 font color = $color4 ($font2_name)"
fi
