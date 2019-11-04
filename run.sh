sudo apt install git
sudo apt install python3-pip
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions
sudo apt install curl
sudo apt install zsh
chsh -s $(which zsh)
DIRECTORY=$(cd `dirname $0` && pwd)
sudo cp $DIRECTORY/fonts/* /usr/share/fonts/truetype/
fc-cache -f -v
sudo apt install gconf-editor
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "CascadiaCode Nerd Font Regular 12"
sudo apt purge gconf-editor
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sudo bash $DIRECTORY/install-vimix.sh
sudo cp $DIRECTORY/lockscreen.jpg $DIRECTORY/wallpaper.jpg /usr/share/backgrounds
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/wallpaper.jpg
gsettings set org.gnome.desktop.screensaver picture-uri file:///usr/share/backgrounds/lockscreen.jpg
sudo perl -i -0pe 's/#lockDialogGroup \{\n   background: #2c001e url\(noise-texture.png\);\n   background-repeat: repeat; \n\}/#lockDialogGroup \{\n   background: #2c001e url\(file:\/\/\/usr\/share\/backgrounds\/lockscreen.jpg\);\n   background-repeat: no-repeat;\n   background-size: cover;\n   background-position: center;\n\}/i' /usr/share/gnome-shell/theme/gdm3.css
sudo bash $DIRECTORY/install.sh
cp $DIRECTORY/.zshrc ~/
cp -r $DIRECTORY/.vscode ~/
timedatectl set-local-rtc 1 --adjust-system-clock
