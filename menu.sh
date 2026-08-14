#!/bin/bash

echo "1. Show user"
echo "2. Show IP addresses"
echo "3. Show listening ports"
echo "4. Show processes"

read -p "Choose an option: " CHOICE

case "$CHOICE" in
    1)
        whoami
        ;;
    2)
        ip -4 addr
        ;;
    3)
        ss -tuln
        ;;
    4)
        ps
        ;;
    *)
        echo "Invalid choice."
        ;;
esac

