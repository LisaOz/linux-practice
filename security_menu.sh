#!/bin/bash

read -p "Choose the option (1-4) : " CHOICE

case "$CHOICE" in    
    1)
        echo "=== Users ==="
	cut -d ':' -f 1 /etc/passwd
	;;

    2)
	echo "=== Processes ==="
	ps aux
	;;

    3)
	echo "=== Ports ==="
	sudo ss -tulnp
	;;
    
    4)
	echo "=== Recent Logs ==="
	journalctl --since "10 minutes ago" 
	;;

    *)
	echo "Invalid choice"
	exit 1
	;;
esac 

