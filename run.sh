sudo apt install git
sudo apt install python3-pip gnome-tweak-tool curl zsh ruby ruby-dev
sudo gem install colorls
chsh -s $(which zsh)
DIRECTORY=$(cd `dirname $0` && pwd)
sudo cp $DIRECTORY/fonts/* /usr/share/fonts/truetype/
fc-cache -f -v
cp -r $DIRECTORY/vscode/Code ~/.config/
timedatectl set-local-rtc 1 --adjust-system-clock
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp $DIRECTORY/.zshrc ~/
chmod +x $DIRECTORY/wallpaper.sh
sudo cp $DIRECTORY/wallpaper.sh /usr/bin/
