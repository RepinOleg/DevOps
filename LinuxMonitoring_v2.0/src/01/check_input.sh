#!/bin/bash

if [ $# -ne 6 ]; then
    echo "Put 6 parametrs"
    exit 1
fi

export path=$1
export amount_folders=$2
export letters_folder=$3
export amount_files=$4
export letters_file=$5
export size_type=$6
export size_file=${6%kb*}
export file_name=${5%.*}
export file_extension=${5#*.}
export memory=$(df / | awk 'FNR == 2 {print $4}')
export date="_`date +%d%m%y`"
export last_ch_folder=${letters_folder:(${#letters_folder}-1):1}
export last_ch_file=${file_name:(${#file_name}-1):1}

validation_input() {
    isNumber="^[0-9]+$"
    isString="^[a-zA-Z.]+$"
   
    #if folder not exists
    if [[ ! -d $path ]]; then
        echo "Wrong path"
        exit 2
    fi

    #if number of folder is not a number
    if [[ ! $amount_folders =~ $isNumber ]]; then
        echo "Second argument is not a number"
        exit 3
    fi

    if [[ ! $letters_folder =~ $isString ]]; then
        echo "Third argument is not a string"
        exit 4
    fi

    if [[ ${#letters_folder} -gt 7 ]]; then
        echo "The third argument must contain a maximum of seven letters"
        exit 5
    fi

    if [[ ! $amount_files =~ $isNumber ]]; then
        echo "Fourth argument is not a number"
        exit 6
    fi

    if [[ ! $letters_file =~ $isString ]]; then
        echo "Firth argument is not a string"
        exit 7
    fi

    if [[ ${#file_name} -gt 7 ]]; then
        echo "The firth argument must contain a maximum of seven letters in part name"
        exit 8
    fi

    if [[ ${#file_extension} -gt 3 ]]; then
        echo "The firth argument must contain a maximum of three letters in part extension"
        exit 9
    fi

    if [[ ! $size_type =~ "kb" ]]; then
        echo "Last argument is not a kb"
        exit 10
    fi

    if [[ $size_file -gt 100 || $size_file < 1 ]] ; then
        echo "Last argument is not the correct size"
        exit 11
    fi

    if [[ $memory -le 1000000 ]]; then
        echo "Not enough memory"
        exit 12
    fi
}