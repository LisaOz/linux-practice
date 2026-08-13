#! /bin/bash

read -p "Enter a log file: " LOGFILE

echo
echo "Checking: $LOGFILE"

grep -ic failed "$LOGFILE"
