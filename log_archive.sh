#!/bin/bash

echo "This is a file archiving tool"
echo "It will create a tar archive of the specified file"
echo "and move it to the archive directory"

file=$1
folder="archive"
number=1000648

archive_file(){
    echo "Archiving file"
    date=$(date +%Y-%m-%d)

    # Create directory if it doesn't exist
    while [ ! -d "${folder}" ]; do
        echo "Creating archive directory"
        mkdir "${folder}"
    done

    #Check if file exist
    if [ -f "${file}" ]; then
        while [ -f "${folder}/log_archive_${date}_${number}.tar.gz" ]; do
            number=$((number + 1))
        done

        # Create a tar archive of the file
        sudo tar -cvzf "${folder}/log_archive_${date}_${number}.tar.gz" "${file}"
        echo "File archived as ${folder}/log_archive_${date}_${number}.tar.gz"

    else
        echo "File ${file} does not exist"
        exit 1
    fi
}

if [ $# -ne 1 ]; then
    echo "Give a single argument: the name of file to be archived"
    exit 1
else
    archive_file
fi
   

