#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Put 3 parametrs"
    exit 1
fi

export letters_folder=$1
export letters_file=$2
export file_name=${2%.*}
export file_extension=${2#*.}
export size_type=$3
export size_file=${3%Mb*}

export memory=$(df / | awk 'FNR == 2 {print $4}')
export date="_`date +%d%m%y`"
export last_ch_folder=${letters_folder:(${#letters_folder}-1):1}
export last_ch_file=${file_name:(${#file_name}-1):1}

validation_input() {
    isString="^[a-zA-Z.]+$"

    if [[ ! $letters_folder =~ $isString ]]; then
        echo "First argument is not a string"
        exit 2
    fi

    if [[ ${#letters_folder} -gt 7 ]]; then
        echo "The first argument must contain a maximum of seven letters"
        exit 3
    fi

    if [[ ! $letters_file =~ $isString ]]; then
        echo "Second argument is not a string"
        exit 4
    fi

    if [[ ${#file_name} -gt 7 || ${#file_name} -lt 1 ]]; then
        echo "The second argument must contain a maximum of seven and minimum 1 letters in part name"
        exit 5
    fi

    if [[ ${#file_extension} -gt 3 || ${#file_extension} -lt 1 ]]; then
        echo "The second argument must contain a maximum of three letters and minimum 1 in part extension"
        exit 6
    fi

    if ! [[ $size_type =~ "Mb" ]]; then
        echo "Last argument is not a Mb"
        exit 7
    fi

    if [[ $size_file -gt 100 || $size_file -lt 1 ]] ; then
        echo "Last argument is not the correct size"
        exit 8
    fi

    if [[ $memory -le 1000000 ]]; then
        echo "Not enough memory"
        exit 9
    fi
}