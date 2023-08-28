#!/bin/bash

echo "Total number of folders (including all nested ones) = $number_folders"  
echo -e "TOP 5 folders of maximum size arranged in descending order (path and size): \n$biggerFolders"
echo "Total number of files = $number_files"
echo "Number of:"  
echo "Configuration files (with the .conf extension) = $number_conf"
echo "Text files = $number_txt"  
echo "Executable files = $executable_files"
echo "Log files (with the extension .log) = $number_log"
echo "Archive files = $number_rar"
echo "Symbolic links = $number_link"
echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type): \n$biggerFiles"
echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file) \n$big_executable_files"

