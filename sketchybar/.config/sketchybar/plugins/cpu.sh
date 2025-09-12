#!/bin/bash

CPU_USAGE=$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ printf("%2.0f\n", $3 + $5) }')

sketchybar --set $NAME label="${CPU_USAGE}%"
