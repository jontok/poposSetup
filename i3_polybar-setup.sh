#!/bin/bash
if echo $* | grep -e "--help" -q || echo $* | grep -e "-h" -q
then
   # Display Help
    echo "Script which configures i3 and polybar like jontok"
    echo
    echo "Syntax: ./i3_polybar-setup [-l|h]"
    echo "options:"
    echo "--help     Print all options"
    echo " -h        Print all options"
    echo "--laptop   Use the laptop configuration instead"
    echo " -l        Use the laptop configuration instead"


else
    echo "Running Setup"
    sleep 1
    sudo apt update && sudo apt upgrade -y
    sleep 1
    echo "Start installing dependencies"
    sleep 1

    #Install Dependencies
    sudo apt install git i3 polybar neofetch compton nitrogen evolution firefox brightnessctl
    sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
    echo "Dependencies installed..."

    echo "Get dmenu..."
    cd dmenu-5.0
    echo "Make dmenu"
    sudo make clean install
    cd ..
    echo "dmenu installed..."

    echo "Setup i3 and Polybar..."
    cd i3wm/
    cp i3/config i3/lock.sh ~/.config/i3/
    cp polybar/brightness.sh polybar/launch.sh ~/.config/polybar/
    if echo $* | grep -e "--laptop" -q || echo $* | grep -e "-l" -q
    then
        echo "Use laptop configuration..."
        cp i3/laptop_config ~/.config/i3/config
        cp polybar/laptop_config ~/.config/polybar/config
    else
        cp polybar/laptop_config ~/.config/polybar/config
    fi
    cd ..
    echo "i3 and polybar configured"
    echo "Get the wallpaper..."
    cp i3wm/Wallpapers/misty-trees_wallpaper.png ~/Pictures/Wallpapers/misty-trees_wallpaper.png
    
    echo "configure compton..."
    cp compton.conf ~/.config/

    echo "Your configuration files can be found in in /home/[user]/.config"
    echo "For this to take effect Logout of the current Session and Select 'i3' in your login-manager"
    echo "Done!"
fi