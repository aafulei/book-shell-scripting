#!/bin/bash

# 22/04/15 = Fri

# ---------------------
# Chapter 1, Exercise 4
# ---------------------

# Write a shell script to check to see if the file "/etc/shadow" exists. If it
# does exist, display "Shadow passwords are enabled." Next, check to see if you
# can write to the file. If you can, display "You have permissions to edit
# /etc/shadow." If you cannot, display "You do NOT have permissions to edit
# /etc/shadow."

FILE="/etc/shadow"

if [ -e $FILE ]
then
    echo "Shadow passwords are enabled."
    if [ -w $FILE ]
    then
        echo "You have permissions to edit ${FILE}."
    else
        echo "You do NOT have permissions to edit ${FILE}."
    fi
fi
