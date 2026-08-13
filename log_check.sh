#! /bin/bash

read -p "Enter the log file: " LOGFILE
read -p "Username: " USERNAME  
echo 
echo "Analysing: $LOGFILE"

grep -ic failed "$LOGFILE"
