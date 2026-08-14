#! /bin/bash

COUNT=10
if [ "$COUNT" -eq 10 ]; then
    echo "Exactly 10."
elif [ "$COUNT" -gt 10 ]; then
    echo "COUNT is greater than 10."
else
    echo "COUNT is less than 10."
fi
