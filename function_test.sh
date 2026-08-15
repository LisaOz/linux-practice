#!/bin/bash

check_users() {
    echo "=== Users === "
    cut -d ':' -f 1 /etc/passwd
}

check_ports() {
    echo "=== Listening Ports ==="
    ss -tulnp
}

check_processes() {
    echo "=== Processes ==="
    ps aux
}


check_users
check_ports
check_processes
