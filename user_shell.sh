#!/bin/bash

for USER in $(awk -F ':' '$7 == "/bin/bash" {print $1}' /etc/passwd)
do
    echo "Interactive user: $USER"
done
