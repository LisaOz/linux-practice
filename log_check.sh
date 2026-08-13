#! /bin/bash

read -p "Enter the log file: " LOGFILE
read -p "Username: " USERNAME  
read -p "Enter hostname: " HOST
echo 
echo "Analysing: $LOGFILE"

echo "User: $USERNAME"
echo "Log: $LOGFILE"
echo "$HOST" 


grep -ic failed "$LOGFILE"
