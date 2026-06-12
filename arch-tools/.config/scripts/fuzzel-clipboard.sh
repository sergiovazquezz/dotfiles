#!/usr/bin/env bash
cliphist list | fuzzel --dmenu --width=60 --lines=12 | cliphist decode | wl-copy
