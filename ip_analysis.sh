#!/bin/bash

FILE="ips.txt"

# Check whether the file exists
if [ ! -f "$FILE" ]; then
    echo "ERROR: File does not exist."
    exit 1
fi

# Skip the blank lines (string length==zero characters)
while read -r IP
do
    if [ -z "$IP" ]; then
        continue
    fi

    # Stop the code execution when reaching a STOP word in the file
    if [ "$IP" = "STOP" ]; then
        break
    fi

    # If the ping request received an  answer, void  both the positive and negative putput, 
    # but print the  status to the terminal
    if ping -c --W 2 "$IP" > /dev/null 2>&1; then
        echo "$IP -> ONLINE"
    else
        echo "$IP -> OFFLINE"
    fi

#  Read all the input from the  provided file
done < "$FILE"

