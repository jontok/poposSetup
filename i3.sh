#!/bin/bash
echo "[PREPARING] Setup"
sleep 1
sudo apt update && sudo apt upgrade -y
sleep 1
echo ""

echo "[PREPARING] Start installing dependencies"
sleep 1

#Install Dependencies
sudo apt install -y i3 polybar neofetch compton nitrogen firefox brightnessctl lxappearance rofi
sudo apt install -y autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
echo ""

echo "[RUNNING] Setup BASH..."
cp .bashrc $HOME/
source $HOME/.bashrc
echo ""

echo "[RUNNING] Setup i3 and Polybar..."
echo "[RUNNING] Installing i3lock-color..."    
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
cd ..
echo ""

echo "[RUNNING] Configureing i3 & polybar..."
cd i3wm/
cp i3/config i3/lock.sh $HOME/.config/i3/
cp polybar/brightness.sh polybar/launch.sh $HOME/.config/polybar/
cd ..
echo ""

echo "[RUNNING] Configuring rofi..."
cp -r i3wm/rofi $HOME/.config/

echo "[RUNNING] Get the wallpaper..."
cp i3wm/Wallpapers/misty-trees_wallpaper.png $HOME/Pictures/Wallpapers/misty-trees_wallpaper.png
echo ""

echo "[RUNNING] configure compton..."
cp i3wm/picom.conf $HOME/.config/
echo ""

echo "[DONE] Your configuration files can be found in in ${HOME}/.config"
echo "[DONE] For this to take effect Logout of the current Session and Select 'i3' in your login-manager"
