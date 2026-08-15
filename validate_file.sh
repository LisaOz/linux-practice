#!/bin/bash

# Check whether the file is provided

validate_file() {
    if [ -z "$1" ]; then
        echo "ERROR: No file provided."
        return 1
    fi

    # Check whether the file exists
    if [ ! -f "$1" ]; then
        echo "ERROR: File does not exist."
        return 1
    fi

    # If the file is provided and exists
    echo "File to validate: $1"
    return 0
}

# Call the function
validate_file "$1"
