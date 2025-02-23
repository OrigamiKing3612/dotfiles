#!/bin/bash

# Generate a list of volume percentages (0 to 100 in steps of 5)
volumes=$(seq 0 10 100)

# Use Rofi to display the list
selected=$(echo "$volumes" | rofi -dmenu -p "Select volume" -width 50 -lines 10)

# If the user selected a volume, set the volume using `pamixer`
if [[ -n "$selected" ]]; then
  pamixer --set-volume "$selected"
fi

