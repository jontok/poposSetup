echo "Running Setup"
sleep 1
sudo apt update && sudo apt upgrade
sleep 1
echo "Start installing ependencies"
sleep 1

#Install Dependencies
echo "Installing Flatpak..."
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

#Install Apps
echo "Installing Evolution Email..."
sudo apt install evolution

echo "Installing KeepassXC..."
sudo apt install keepassxc

echo "Installing Chromium..."
sudo apt install chromium-browser
git clone https://github.com/proprietary/chromium-widevine.git && \
	cd chromium-widevine && \
	./use-standalone-widevine.sh && \
	killall -q -SIGTERM chromium-browser || \
	killall -q -SIGTERM chromium && \
	exec $(command -v chromium-browser || command -v chromium) ./test-widevine.html &


echo "Installing neofetch..."
sudo apt install neofetch

echo "Installing Spotify..."
flatpak install flathub -y com.spotify.Client

echo "Installing VSCode..."
flatpak install flathub -y com.visualstudio.code

echo "Autoremove..."
sudo apt autoremove -y
neofetch
echo "Done!"
