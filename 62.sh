#!/bin/bash

# 22/04/18 = Mon

# ---------------------
# Chpater 6, Exercise 2
# ---------------------

# Modify the previous script so that it uses a logging function. Additionally,
# tag each syslog message with "randomly" and include the process ID. Generate 3
# random numbers.

function logit() {
    local MESSAGE=$@
    echo "$MESSAGE"
    logger -p user.info -t "randomly" -i "$MESSAGE"
}

logit "Random number: $RANDOM"
logit "Random number: $RANDOM"
logit "Random number: $RANDOM"
