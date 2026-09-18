#!/bin/bash

DIR=$1
FILE=$2

if [ -d "$DIR" ]; then
    echo "Directory exists: $DIR"
else
    echo "Directory does not exist: $DIR"
    mkdir -p "$DIR"
    echo "Directory created: $DIR" 
fi

if [ -f "$DIR/$FILE" ]; then
    echo "File exists: $DIR/$FILE"
else
    echo "File does not exist: $DIR/$FILE"
    touch "$DIR/$FILE"
    echo "File created: $DIR/$FILE"
fi

echo "Directory and file check completed."

# sh dir-file-exist.sh EXAMPLE example.txt