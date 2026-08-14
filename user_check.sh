#! /bin/bash

read  -p "Enter username: " TARGET_USER
if [ "$TARGET_USER" = "root" ]; then
    echo "WARNING: root account selected."
elif [ "$TARGET_USER" = "$USER" ]; then
    echo "This is the current user."
else
    echo "Another user."
fi
