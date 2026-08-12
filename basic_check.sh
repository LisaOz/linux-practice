#!/bin/bash

echo "================Basic Security Check================"
echo
# Display the current user
echo "Current user:"
whoami

# Display the current host
echo
echo "Hostname:"
hostname

# Display IP addresses
echo
echo "IP addesses:"
ip -4 addr

# Display ports
echo
echo "Listening Ports:"
sudo ss -tuln
