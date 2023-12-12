#!/bin/bash
#had to change the name bc the scrpt was killall-ing iteself
set +x

echo "Killing xdg-desktop-portal-hyprland..."
killall -e xdg-desktop-portal-hyprland
echo "Killing xdg-desktop-portal-wlr..."
killall -e xdg-desktop-portal-wlr
echo "Killing xdg-desktop-portal..."
killall -e xdg-desktop-portal
echo "Starting xdg-desktop-portal-hyprland.service..."
bash -c "systemctl --user start xdg-desktop-portal-hyprland.service"

exit

