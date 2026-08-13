#! /bin/bash

read -p "Enter a log file: " LOGFILE

if [ -z "$LOGFILE" ]; then
    echo "ERROR: You did  not enter a filename."
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File not found."
    exit 1
fi

echo "File exists."
echo "Failed entries:"

grep -ic failed "$LOGFILE"

