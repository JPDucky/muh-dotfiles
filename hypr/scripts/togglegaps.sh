#!/bin/sh

gaps=$(hyprctl getoption general:gaps_in | grep int | awk '{print $2}')

if [ $gaps -gt 0 ]; then
	hyprctl keyword general:gaps_in 0
	hyprctl keyword general:gaps_out 0
else
	hyprctl keyword general:gaps_in 8
	hyprctl keyword general:gaps_out 15
fi
