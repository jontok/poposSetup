RED='\033[0;31m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'
echo "${RED}Running Setup${NC}"
sleep 1
sudo apt update && sudo apt upgrade -y
sleep 1
echo "${CYAN}Start installing dependencies${NC}"
sleep 1

#Install Dependencies
echo "${CYAN}Installing Flatpak...${NC}"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update


#Install tools
echo "${CYAN}Install htop, nano, neofetch...${NC}"
sudo apt install htop nano neofetch


#Install Apps
echo "${CYAN}Installing Evolution Email...${NC}"
sudo apt install evolution

echo "${CYAN}Installing KeepassXC...${NC}"
sudo apt install keepassxc

echo "${CYAN}Installing Chromium...${NC}"
sudo apt install chromium-browser
git clone https://github.com/proprietary/chromium-widevine.git && \
	cd chromium-widevine && \
	./use-standalone-widevine.sh && \
	killall -q -SIGTERM chromium-browser || \
	killall -q -SIGTERM chromium && \
	exec $(command -v chromium-browser || command -v chromium) ./test-widevine.html &

echo "${CYAN}Installing Spotify...${NC}"
flatpak install flathub -y com.spotify.Client

echo "${CYAN}Installing VSCode...${NC}"
flatpak install flathub -y com.visualstudio.code

echo "${CYAN}Autoremove...${NC}"
sudo apt autoremove -y
neofetch
echo "${GREEN}Done!${NC}"