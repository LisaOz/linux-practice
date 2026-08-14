#!/bin/bash

read -p "Choose investigation type (1-4): " CHOICE

case "$CHOICE" in
    1)
        echo "=== Users ===="
        cut -d ':' -f 1 /etc/passwd
        ;;
    2)
        echo "=== Processes ==="
        ps aux
        ;;
    3)
        echo "=== Listening Ports ==="
        sudo ss -tulnp
        ;;
    4)
        echo "=== Recent Logs ==="
        journalctl; -n 30 --no-pager
        ;;
    *) 
        echo "Invalid choice."
        exit 1
        ;;
esac 
