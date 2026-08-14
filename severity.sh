#! /bin/bash
 
read -p "Enter number of failed login attempts: " FAILED

if [ "$FAILED" -lt 5 ]; then
    echo "NORMAL"
elif [ "$FAILED" -lt 10 ]; then
    echo "NOTICE"
elif [ "$FAILED" -lt 20 ]; then
    echo "WARNING"
else
    echo "CRITICAL"
fi
