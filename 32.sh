#!/bin/bash

# 22/04/16 = Sat

# ---------------------
# Chpater 3, Exercise 2
# ---------------------

# Modify the script from the previous exercise. Make the file_count function
# accept a directory as an argument. Next, have the function display the name of
# the directory followed by a colon. Finally, display the number of files to the
# screen on the next line. Call the function three times. First on the "/etc"
# directory, next on the "/var" directory and finally on the "/usr/bin"
# directory.

# Example output:

# /etc:
#     85

function file_count() {
    local DIR=$1
    local FILE_NUM=$(ls $1 | wc -l)
    echo "${DIR}:"
    echo "    $FILE_NUM"
}

file_count /etc
file_count /var
file_count /usr/bin
