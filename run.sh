#!/usr/bin/sh
#
# Mylinux config on Popos 20.10

DIRECTORY=$(cd `dirname $0` && pwd)
OSNUMBER=$(lsb_release -sr)
printf "\033c"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "${GREEN}Add some PPA${NC}"
# Add albert launcher to PPA
echo "${BLUE}Albert launcher${NC}"
echo "deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_$OSNUMBER/ /" | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_$OSNUMBER/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:manuelschneid3r.gpg > /dev/null

# Add vscode to PPA
echo "${BLUE}Visual Studio Code${NC}"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Add ibus-bamboo
echo "${BLUE}Ibus bamboo${NC}"
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo -y
sudo apt update

# Install some packages
echo "${GREEN} Install some packages${NC}"
echo "${BLUE}Install vscode${NC}"
sudo apt install code -y
printf "\033c"

echo "${GREEN} Install some packages${NC}"
echo "${BLUE}Install Google Chrome${NC}"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f
printf "\033c"

echo "${GREEN}Install some packages${NC}"
echo "${BLUE}Install Teamviewer${NC}"
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer_amd64.deb
sudo apt install -f
printf "\033c"

echo "${GREEN}Install some packages${NC}"
echo "${BLUE}Install Skype${NC}"
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb
sudo apt install -f 

# Remove some downloaded file
rm google-chrome-stable_current_amd64.deb
rm teamviewer_amd64.deb
rm skypeforlinux-64.deb
rm packages.microsoft.gpg
printf "\033c"



echo "${GREEN}Install some packages${NC}"
sudo apt install zsh ruby ruby-dev ibus-bamboo python3-pip gnome-tweak-tool albert python3-nautilus libinput-tools xdotool htop nodejs npm gnome-shell-extensions chrome-gnome-shell -y
# Install colorls
sudo gem install colorls
# Install bing-daily-wallpaper
sudo npm install -g bing-daily-wallpaper

# Restart ibus
ibus-restart
printf "\033c"

# Install some Gnome Shell Extensions
echo "${GREEN}You should install some Gnome Shell Extensions here:${NC}"
echo "- ${RED}Dash to Dock: ${BLUE}https://extensions.gnome.org/extension/307/dash-to-dock/${NC}"
echo "- ${RED}AlternateTab: ${BLUE}https://extensions.gnome.org/extension/15/alternatetab/${NC}"
echo "- ${RED}Hide Activities Button: ${BLUE}https://extensions.gnome.org/extension/744/hide-activities-button/${NC}"
echo "${GREEN}Press any key to continue...${NC}"; read a
printf "\033c"

# Switch bash to zsh
echo "${GREEN}Install zsh and oh-my-zsh${NC}"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp $DIRECTORY/.zshrc ~/
printf "\033c"

# Copy fonts
echo "${GREEN}Copy fonts${NC}"
sudo cp $DIRECTORY/fonts/* /usr/share/fonts/truetype/
echo "${BLUE}Updating font... please wait...${NC}"
fc-cache -f -v > /dev/null
printf "\033c"

# Fix time for Window and Linux dualboot
echo "${GREEN}Fix time for Window and Linux dualboot${NC}"
timedatectl set-local-rtc 1 --adjust-system-clock

# Install fusuma - multitouch gesture recognizer
echo "${GREEN}Install fusuma${NC}"
sudo gpasswd -a $USER input
sudo gem install fusuma
cp -r fusuma ~/.config/

echo "${GREEN}Copy some config${NC}"
# Config for albert
cp -r albert ~/.config/

# Autostart on login
cp -r autostart ~/.config
printf "\033c"

# Vscode Nautilus
echo "${GREEN}Install Nautilus-OpenInVSCode${NC}"
git clone https://github.com/vvanloc/Nautilus-OpenInVSCode.git
cd Nautilus-OpenInVSCode
echo '\n'
sudo ./install.sh
cd ..
rm -rf Nautilus-OpenInVSCode

# Copy user config
cp user ~/.config/dconf/

printf "\033c"
echo "${RED}DONE! <3${RED}"
