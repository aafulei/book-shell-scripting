#!/bin/bash

# 22/04/18 = Mon

# This script greets users.

GLOBAL_VAR="World"

function greet() {
    local LOCAL_VAR=1
    local NAME_LIST=$@

    if [ $# -eq 0 ]
    then
        echo "Hello, ${GLOBAL_VAR}!"
    else
        for NAME in $NAME_LIST
        do
            echo "${LOCAL_VAR}: Hello, ${NAME}!"
            LOCAL_VAR=$((${LOCAL_VAR}+1))
        done
    fi
}

greet $@

exit 0
