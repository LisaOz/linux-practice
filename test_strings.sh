#! /bin/bash

if [ "$USER = "root" ]; then
    echo "Running as root"
else 
    echo "Running as normal user."
fi
