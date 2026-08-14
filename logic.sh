#!/bin/bash

read -p "Username: " USERNAME
read -p "Failed attempts: " FAILED

if [ "$USERNAME" = "root" ] || [ "$USERNAME" = "admin" ]; then
    echo "Privileged account"
fi


if [ "$FAILED" -gt 10 ] && [ "$USERNAME" != "root" ]; then
    echo "Investigate suspicious activity"
fi
