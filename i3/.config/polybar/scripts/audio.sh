#!/bin/bash

TOGGLE_FILE="/tmp/polybar_audio_toggle"

if [ "$1" == "toggle" ]; then
  if [ -f "$TOGGLE_FILE" ]; then
    rm "$TOGGLE_FILE"
  else
    touch "$TOGGLE_FILE"
  fi
fi

count="$(pamixer --get-volume-human)"
if [ -f "$TOGGLE_FILE" ]; then
    if [ "$count" == "muted" ]; then
        echo " "
    else
        echo " "
    fi
else
    if [ "$count" == "muted" ]; then
        echo " "
    else
        echo $count
    fi
fi

