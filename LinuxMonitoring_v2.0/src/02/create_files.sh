#!bin/bash

create() {
    #RANDOM number_of_folder in range 100
    range=100
    number_of_folder=$RANDOM
    let "number_of_folder%=$range"
    #call function which add letters to our folders and files name
    add_chars_to_file_name
    #create file with log
    touch create_files.log
    export path_log_file=$(pwd)
    #save file name to tmp variable
    tmp_file_name=$file_name
    range=20
    log_date=`date +%F`
    #start cycle with create folder
    for (( i = 0; i < number_of_folder && memory > 1000000; i++ ))
        do
            path=$(sudo find / -type d -writable 2>/dev/null | grep -v -e bin -e sbin -e Permission -e sys -e proc -e snap | shuf -n $(shuf -i 1-1 -n 1))
            mkdir $path/$letters_folder$date
            echo "Folder: $path/$letters_folder$date $log_date" >> $path_log_file/create_files.log
            # RANDOM number_of_file in range 20
            number_of_file=$RANDOM
            let "number_of_file%=$range"
            #going to folder which we created
            cd $path/$letters_folder$date

            #start cycle with create files inside folder
            for (( j = 0; j < number_of_file && memory > 1000000; j++ ))
            do
                #use utilit 'dd' for create files with right size
                dd if=/dev/zero of=$file_name.$file_extension bs=$size_file"Mb" count=1 > /dev/null 2>&1

                #write to log file
                echo "File: $path/$letters_folder$date/$file_name.$file_extension $log_date $size_file Mb" >> $path_log_file/create_files.log

                #add letter for next file
                file_name=$file_name$last_ch_file

                #take memory and check her in condition cycle
                memory=$(df / | awk 'FNR == 2 {print $4}')
            done
        cd /
        # return old file_name to variable file_name
        file_name=$tmp_file_name

        #add letter to folder_name
        letters_folder=$letters_folder$last_ch_folder
    done
}




add_chars_to_file_name() {
    #need minimum 5 letters in folder name
    #if lower add some letters
    while [ ${#letters_folder} -lt 5 ]
        do
            letters_folder=$letters_folder$last_ch_folder
    done
    #need minimum 4 letters in file name
    while [ ${#file_name} -lt 5 ]
        do
            file_name=$file_name$last_ch_file
    done
}