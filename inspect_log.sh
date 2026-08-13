#! /bin/bash

echo "Analysing:"
echo "$1"

echo
echo "Number of failed entries:"
grep -ic failed "$1"

