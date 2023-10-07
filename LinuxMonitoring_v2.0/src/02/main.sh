#!/bin/bash
script_start=$(date +%T)
start_seconds=`date +%M%S`
 . ./check_input.sh
 . ./create_files.sh

# call function which check all arguments
validation_input
# call function which creating folders and files
create

script_end=$(date +%T)
end_seconds=`date +%M%S`
script_time=$(($end_seconds - $start_seconds))

cd $path_log_file
echo "Script start: $script_start" >> create_files.log
echo "Script finish: $script_end" >> create_files.log
echo "Runtime: $script_time" >> create_files.log

echo "Script start: $script_start"
echo "Script finish: $script_end"
echo "Runtime: $script_time seconds"
