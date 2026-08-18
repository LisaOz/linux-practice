#!/bin/bash

# Function to handle grep result if the search fails: 
# if STATUS = 0 ->  matches found
# if STATUS = 1 -> no matches
# if STATUS > 1 -> actual grep error

# echo "Number of arguments: $#"
# echo "First argument: [$1]"
# echo "All arguments: [$@]"


LOGFILE="$1"

if [ -z "$LOGFILE" ]; then
    echo "ERROR: No logfile provided."
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File does not exist:  $LOGFILE"
    exit 1
fi


RESULT=$(grep -ic "failed" "$LOGFILE")
STATUS=$?

if [ "$STATUS" -gt 1 ]; then
    echo "ERROR: grep failed."
    exit 1
fi

echo "Failed entries: $RESULT"
