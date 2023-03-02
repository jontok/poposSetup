#!/bin/bash
echo "[PREPARING] Setup"
sleep 1
sudo apt update && sudo apt upgrade -y
sleep 1
echo ""

echo "[PREPARING] Start installing dependencies"
sleep 1

#Install Dependencies
sudo apt install -y polybar neofetch picom nitrogen firefox lxappearance rofi
sudo apt install -y autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake
echo ""

echo "[RUNNING] Setup BASH..."
cp i3wm/.bashrc $HOME/
source $HOME/.bashrc
echo ""

echo "[RUNNING] Setup i3 and Polybar..."
echo "[RUNNING] Installing i3 4.22..."
git clone https://github.com/i3/i3.git
mv -r i3 i3wm
cd i3wm
make && sudo make install 
cd ..
echo ""

echo "[RUNNING] Installing i3lock-color..."    
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
cd ..
echo ""

echo "[RUNNING] Configureing i3 & polybar..."
cd i3wm/
cp i3/config i3/lock.sh $HOME/.config/i3/
mkdir $HOME/.config/polybar
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
