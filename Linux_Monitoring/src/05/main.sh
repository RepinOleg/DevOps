#!/bin/bash

start_of_action=`date +%s.%N`
if [ $# != 1 ]
then
	echo "Wrong path"
	exit 1
fi

#присваиваем первый аргумент в переменную path
path=$1

#узнаем длину строки path
len=${#path}

#проверяем последний символ строки
if [ ${path:len-1} != '/' ]
then
	echo "Wrong path"
	exit 1
fi

export number_folders=$(find $path -type d | wc -l)
export biggerFolders=$(du -Sh $path | sort -rh | head -5 | cat -n | awk '{print $1, " - ",$3",", $2}')
export number_files=$(ls -laR $path | grep "^-" | wc -l)
export number_conf=$(find $path -type f -name "*.conf" | wc -l)
export number_txt=$(find $path -type f -name "*.txt" | wc -l)
export executable_files=$(find $path -type f -executable | wc -l)
export number_log=$(find $path -type f -name "*.log" | wc -l)
export number_rar=$(find $path -type f -name "*.tar" -o -name "*.zip" -o -name "*.rar" -o -name "*.7z" | wc -l)
export number_link=$(find $path -type l | wc -l)
export biggerFiles=$(find $path -type f -exec du -Sh {} + | sort -rh | head -n 10 | cat -n | awk -F '.' '{print $0 " " $NF}' | awk '{print $1 " - " $3",", $2",", $4}')
export big_executable_files=$(find $path -type f -executable -exec du -Sh {} + | sort -rh | head -n 10 | cat -n | awk '{print $1 " - ", $3",", $2}')

chmod 744 ./print.sh
./print.sh
end_of_action=`date +%s.%N`
total_time=$(echo "$end_of_action-$start_of_action" | bc -l)
format_time=$(printf "%.5s" $total_time)
echo "Script execution time (in seconds) = 0$format_time"
