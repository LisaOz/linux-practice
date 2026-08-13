#! /bin/bash

read -p "Enter the log file: " LOGFILE
read -p "Username: " USERNAME  
echo 
echo "Analysing: $LOGFILE"

echo "User: $USERNAME"
echo "Log: $LOGFILE"

grep -ic failed "$LOGFILE"
