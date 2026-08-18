#!/bin/bash

check_file () {

    # Check whether a filename was provided

    if [ -z "$1" ]; then
        echo "ERROR: No file provided."
        return 
    fi

    # Check whether the file exists
    if [ ! -f "$1" ]; then
        echo "ERROR: File does not exist."
        return 1
    fi

    # The file exists
    echo "File to validate: $1"
    return 0
}  

check_file "$1"

