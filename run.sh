#!/usr/bin/bash
#
# Mylinux config on Popos 20.04

DIRECTORY=$(cd `dirname $0` && pwd)
OSNUMBER=$(lsb_release -sr)

# Add albert launcher to APT
echo "deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_$OSNUMBER/ /" | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_$OSNUMBER/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:manuelschneid3r.gpg > /dev/null

# Add vscode to APT
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update

# Install some packages
sudo apt install code -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb 
sudo dpkg -i teamviewer_amd64.deb
sudo dpkg -i skypeforlinux-64.deb
sudo apt install -f 
sudo apt install zsh ruby ruby-dev python3-pip gnome-tweak-tool albert python3-nautilus libinput-tools xdotool htop nodejs npm gnome-shell-extensions chrome-gnome-shell -y
# Install colorls
sudo gem install colorls
# Install bing-daily-wallpaper
sudo npm install -g bing-daily-wallpaper
# Install some Gnome Shell Extensions
printf "\033c"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
echo "${GREEN}You should install some Gnome Shell Extensions here:${NC}"
echo "- ${RED}Dash to Dock: ${BLUE}https://extensions.gnome.org/extension/307/dash-to-dock/${NC}"
echo "- ${RED}AlternateTab: ${BLUE}https://extensions.gnome.org/extension/15/alternatetab/${NC}"
echo "- ${RED}Hide Activities Button: ${BLUE}https://extensions.gnome.org/extension/744/hide-activities-button/${NC}"
echo "${GREEN}Press any key to continue...${NC}"; read a
printf "\033c"

# Switch bash to zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp $DIRECTORY/.zshrc ~/

# Copy fonts
sudo cp $DIRECTORY/fonts/* /usr/share/fonts/truetype/
fc-cache -f -v

# Fix time for Window and Linux dualboot
timedatectl set-local-rtc 1 --adjust-system-clock

# Install fusuma - multitouch gesture recognizer
sudo gpasswd -a $USER input
sudo gem install fusuma
cp -r fusuma ~/.config/

# Config for albert
cp -r albert ~/.config/

# Autostart on login
cp -r autostart ~/.config

# Vscode Nautilus
git clone https://github.com/vvanloc/Nautilus-OpenInVSCode.git
cd Nautilus-OpenInVSCode
sudo ./install.sh
cd ..

# Copy user config
cp user ~/.config/dconf/
