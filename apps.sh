#!/bin/bash
echo "[PREPARING] Installing App Collection"
echo ""

echo "[PREPARING] Updating existing..."
sudo apt update && sudo apt upgrade -y
echo ""

echo "[RUNNING] Install htop, nano, neofetch, tweaks..."
sudo apt install git htop nano neofetch neovim arandr pavucontrol 
echo ""

echo "[RUNNING] Get GTK-Theme Flat Remix..."
echo "Source: https://github.com/daniruiz/flat-remix"
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt update
sudo apt install flat-remix-gtk
echo ""

echo "[RUNNING] Installing sys-update utility..."
echo "Source: https://github.com/jontok/sys-update"
git clone https://github.com/jontok/sys-update.git
cd sys-update/
./install.sh --nala-install
cd ..
echo ""

echo "[RUNNING] Installing Mailspring..."
echo "Source: https://getmailspring.com/download"
wget https://updates.getmailspring.com/download?platform=linuxDeb -O mailspring.deb
sudo apt install ./mailspring.deb
echo ""

echo "[RUNNING] Installing Spotify..."
echo "Source: https://www.spotify.com/de/download/linux/"
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
echo ""

echo "[RUNNING] Installing VSCodium"
echo "Source: https://vscodium.com/#install"
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium
echo ""

echo "[DONE] Installed App Collection"