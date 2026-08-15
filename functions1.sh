#!/bin/bash

show_system_info() {

    echo "User: $(whoami)"
    echo "Hostname: $(hostname)"
    echo "Shell: $SHELL"
}
show_system_info
