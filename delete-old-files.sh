#!/bin/bash

DIR=$1

FILES=$(find "$DIR" -type f -mmin +60)

if [ -z "$FILES" ]; then
    echo "No files older than 60 minutes found in $DIR."
else
    echo "Deleting the following files older than 60 minutes in $DIR:"
    echo "$FILES"
    rm -f $FILES
    echo "Deletion completed."
fi