#!/bin/bash
set -x

# -----------------------------------------------------
# Select random wallpaper and create color scheme
# -----------------------------------------------------
/usr/bin/wal -q -i ~/wallpaper/

# -----------------------------------------------------
# Load current pywal color scheme
# -----------------------------------------------------
source "$HOME/.cache/wal/colors.sh"

# -----------------------------------------------------
# Copy selected wallpaper into .cache folder
# -----------------------------------------------------
cp "$wallpaper" ~/.cache/current_wallpaper.jpg

# -----------------------------------------------------
# get wallpaper iamge name
# -----------------------------------------------------
newwall=$(echo "$wallpaper" | sed "s|$HOME/wallpaper/||g")

# -----------------------------------------------------
# Set the new wallpaper
# -----------------------------------------------------
SWWW_TRANSITION_TYPE=random
SWWW_TRANSITION_STEP=5
SWWW_TRANSITION_BEZIER=.54,0,.34,.99
SWWW_TRANSITION_POS=$(hyprctl cursorpos)

/usr/bin/swww img "$wallpaper"

~/dotfiles/waybar/launch.sh
# sleep 1

# -----------------------------------------------------
# Send notification
# -----------------------------------------------------
# notify-send "Colors and Wallpaper updated" "with image $newwall"

echo "DONE!"
