#!/bin/bash

# 22/04/16 = Sat

# ---------------------
# Chapter 2, Exercise 2
# ---------------------

# Write a shell script that accepts a file or directory name as an argument.
# Have the script report if it is a regular file, a directory, or another type
# of file. If it is a regular file, exit with a 0 exit status.  If it is a
# directory, exit with a 1 exit status.  If it is some other type of file, exit
# with a 2 exit status.

FILE=$1

if [ -f $FILE ]
then
    echo "${FILE} is a regular file."
    exit 0
elif [ -d $FILE ]
then
    echo "${FILE} is a directory."
    exit 1
else
    echo "${FILE} is neither a regular file nor a directory."
    exit 2
fi
