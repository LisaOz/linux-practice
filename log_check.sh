#! /bin/bash

read -p "Enter the log file: " LOGFILE

if [ -z "$LOGFILE" ]; then
    echo "ERROR: No log file provided."
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File  does not exist."
    exit 1
fi

read -p "Username: " USERNAME  
read -p "Enter hostname: " HOST
echo 
echo "Analysing: $LOGFILE"

echo "User: $USERNAME"
echo "Log: $LOGFILE"
echo "$HOST"
grep -ic failed "$LOGFILE"
exit 0
 


grep -ic failed "$LOGFILE"
