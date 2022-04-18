#!/bin/bash

# 22/04/18 = Mon

# ---------------------
# Chpater 6, Exercise 1
# ---------------------

# Write a shell script that displays one random number on the screen and also
# generates a syslog message with that random number. Use the user facility and
# the info severity for your messages.

# Hint: Use $RANDOM

# Run "sudo service rsyslog start" first

MESSAGE="Random number: $RANDOM"

echo "$MESSAGE"

logger -p user.info "$MESSAGE"
