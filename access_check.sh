#! /bin/bash

read -p "Username: " TARGET_USER
read -p "Failed login attempts: " FAILED

# Decision 1: Check for logged in user  access level

if [ "$TARGET_USER" = "root" ]; then
    echo "Privileged access."
else
    echo "Normal user logged in."
fi


# Decision 2: Check for failed login attempts

if [ " $FAILED" -lt 5 ]; then
    echo "NORMAL"
elif [ "$FAILED" -lt 10 ]; then
    echo "NOTICE"
elif [ "$FAILED" -lt 20 ]; then
    echo "WARNING"
else
    echo "CRITICAL"
fi

# Decision 3: compound check of privileged access and failed login attempts

if [ "$FAILED" -gt 10 ] && [ "$TARGET_USER" != "root" ]; then
    echo "Investigate suspicious login activity."
fi
