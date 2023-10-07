#!/bin/bash

create() {
    #go to our path
    cd $path

    #call function which add letters to our folders and files name
    add_chars_to_file_name
    
    #create file with log
    touch create_files.log

    #save file name to tmp variable
    tmp_file_name=$file_name
    
    #start cycle with create folder
    for (( i = 0; i < amount_folders && memory > 1000000; i++ ))
        do
            mkdir $letters_folder$date
            echo "Folder: $path$letters_folder$date $('date')" >> create_files.log

            #going to folder which we created
            cd $letters_folder$date

        #start cycle with create files inside folder
        for (( j = 0; j < amount_files && memory > 1000000; j++ ))
        do
            #use utilit 'dd' for create files with right size
            dd if=/dev/zero of=$file_name.$file_extension bs=$size_file"kB" count=1 > /dev/null 2>&1

            #write to log file
            echo "File: $path$letters_folder$date/$file_name.$file_extension $('date') $size_file kb" >> ../create_files.log

            #add letter for next file
            file_name=$file_name$last_ch_file

            #take memory and check her in condition cycle
            memory=$(df / | awk 'FNR == 2 {print $4}')
        done

        # go back
        cd ..

        # return old file_name to variable file_name
        file_name=$tmp_file_name

        #add letter to folder_name
        letters_folder=$letters_folder$last_ch_folder
    done
}

add_chars_to_file_name() {
    #need minimum 4 letters in folder name
    #if lower add some letters
    while [ ${#letters_folder} -lt 4 ]
        do
            letters_folder=$letters_folder$last_ch_folder
    done
    #need minimum 4 letters in file name
    while [ ${#file_name} -lt 4 ]
        do
            file_name=$file_name$last_ch_file
    done
}
    