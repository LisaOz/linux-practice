#! /bin/bash

read -p "Enter the log file: " LOGFILE

echo 
echo "Analysing: $LOGFILE"

grep -ic failed "$LOGFILE"
