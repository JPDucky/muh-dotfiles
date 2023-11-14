#!/usr/bin/env zsh
# __        __    _ _                              
# \ \      / /_ _| | |_ __   __ _ _ __   ___ _ __  
#  \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__| 
#   \ V  V / (_| | | | |_) | (_| | |_) |  __/ |    
#    \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|    
#                    |_|         |_|               
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 

# ----------------------------------------------------- 
# Select wallpaper
# ----------------------------------------------------- 
selected=$(ls -1 ~/wallpaper | grep "jpg" | rofi -dmenu -config ~/dotfiles/rofi/config-wallpaper.rasi)

if [ "$selected" ]; then

    echo "Changing theme..."
    # ----------------------------------------------------- 
    # Set the new wallpaper
    # ----------------------------------------------------- 

    SWWW_TRANSITION_TYPE=random
    SWWW_TRANSITION_STEP=50
    SWWW_TRANSITION_BEZIER=.54,0,.34,.99
    SWWW_TRANSITION_POS=$(hyprctl cursorpos)
    
    ~/bin/swww img $HOME/wallpaper/$selected 
    # ----------------------------------------------------- 
    # Update wallpaper with pywal
    # ----------------------------------------------------- 
    # swww img ~/wallpaper/$selected

    ~/.local/bin/wal -i ~/wallpaper/$selected 

    # ----------------------------------------------------- 
    # Get new theme
    # ----------------------------------------------------- 
    source "$HOME/.cache/wal/colors.sh"

    # ----------------------------------------------------- 
    # Copy selected wallpaper into .cache folder
    # ----------------------------------------------------- 
    cp $wallpaper ~/.cache/current_wallpaper.jpg   

    newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")


    ~/dotfiles/waybar/launch.sh
    # sleep 1

    # ----------------------------------------------------- 
    # Send notification
    # ----------------------------------------------------- 
    # notify-send "Colors and Wallpaper updated" "with image $newwall"

    echo "Done."
fi
