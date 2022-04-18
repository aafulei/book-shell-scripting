#!/bin/bash

# 22/04/17 = Sun

# ---------------------
# Chpater 5, Exercise 1
# ---------------------

# Create a startup script for an application called "sleep-walking-server",
# which is provided below. The script should be named "sleep-walking" and accept
# "start" and "stop" as arguments. If anything other than "start" or "stop" is
# provided as an argument, display a usage statement: "Usage: sleep-walking
# start|stop" and terminate the script with an exit status of 1.

# To start sleep-walking-server, use this command:
#   /tmp/sleep-walking-server &

# To stop sleep-walking-server, use this command:
#   kill $(cat /tmp/sleep-walking-server.pid)

# Here are the contents of "sleep-walking-server". Be sure to put this file in
# /tmp and run chmod 755 /tmp/sleep-walking-server so that it is executable.

# --- sleep-walking-server -----------------------------------------------------
# !/bin/bash
# Instructions:
#   Place this script in /tmp

# Description:
#   This script simulates a service or a daemon.

# PID_FILE="/tmp/sleep-walking-server.pid"
# trap "rm $PID_FILE; exit" SIGHUP SIGINT SIGTERM
# echo "$$" > $PID_FILE
# while true
# do
#     :
# done
# ------------------------------------------------------------------------------

case "$1" in
    "start")
        /tmp/sleep-walking-server &
        ;;
    "stop")
        kill $(cat /tmp/sleep-walking-server.pid)
        ;;
    *)
        echo "Usage: $0 start|stop"
        exit 1
        ;;
esac
