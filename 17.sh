#!/bin/bash

# 22/04/15 = Fri

# ---------------------
# Chapter 1, Exercise 7
# ---------------------

# Modify the previous script so that it accepts the file or directory name as an
# argument instead of prompting the user to enter it.

# ---------------------
# Chapter 1, Exercise 6
# ---------------------

# Write a shell script that prompts the user for a name of a file or directory
# and reports if it is a regular file, a directory, or another type of file.
# Also perform an ls command against the file or directory with the long
# listing option.

$FILE=$1

if [ -f $FILE ]
then
    echo "${FILE} is a regular file."
elif [ -d $FILE ]
then
    echo "${FILE} is a directory."
else
    echo "${FILE} is neither a regular file nor a directory."
fi

ls -l $FILE
