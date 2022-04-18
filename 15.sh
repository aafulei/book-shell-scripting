#!/bin/bash

# 22/04/15 = Fri

# ---------------------
# Chapter 1, Exercise 5
# ---------------------

# Write a shell script that displays "man", "bear", "pig", "dog", "cat", and
# "sheep" on the screen with each appearing on a separate line. Try to do this
# in as few lines as possible.

# Hint: Loops can be used to perform repetitive tasks.

for ANIMAL in man bear pig dog cat sheep
do
    echo $ANIMAL
done
