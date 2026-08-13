#! /bin/bash

if ping -c 1 -W 2 8.8.8.8 > /dev/null; then
    echo "Internet connectivity works."
else 
    echo "Network connectivity failed."
fi
