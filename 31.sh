#!/bin/bash

# 22/04/16 = Sat

# ---------------------
# Chpater 3, Exercise 1
# ---------------------

# Write a shell script that consists of a function that displays the number of
# files in the present working directory. Name this function file_count and
# call it in your script. If you use a variable in your function, remember to
# make it a local variable.

# Hint: The wc utility is used to count the number of lines, words, and bytes.

function file_count() {
    local FILE_NUM=$(ls | wc -l)
    echo "$FILE_NUM"
}

file_count
