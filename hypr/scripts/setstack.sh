#!/bin/bash
set -x

arg=$1

# Get the current stack count
stacks=$(hyprctl getoption plugin:nstack:layout:stacks -j | jq '.int')

#TODO: save a file to cache so that it can remember the amount as it doesnt seem to work past 3 or below 2

# Perform arithmetic operations
if [[ "$arg" == "plus" ]]; then
    new_stacks=$((stacks + 1))
elif [[ "$arg" == "minus" ]]; then
    new_stacks=$((stacks - 1))
else
    echo "Invalid argument. Use 'plus' or 'minus'."
    exit 1
fi

# Execute the hyprctl command with the new stack count
hyprctl dispatch layoutmsg setstackcount $new_stacks

exit 0

