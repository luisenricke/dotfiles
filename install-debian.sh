
# IMPORTANT 
#   1. run with root user
#   2. enable 'Non-DFSG-compatible Software (non-free)'
USER_DEFAULT="luisenricke"

cd /home/$USER_DEFAULT/


# update & upgrade
apt update
apt upgrade -y


# install & config sudo
apt install sudo -y

echo "" >> /etc/sudoers
echo "$USER_DEFAULT ALL=(ALL) ALL" >> /etc/sudoers


# config date & time
timedatectl set-timezone 'America/Mexico_City'
timedatectl set-ntp yes


# apps
apt install synaptic -y # Check the latest microcode
apt install build-essential dkms linux-headers-$(uname -r) -y
apt install vlc -y
apt install rar unrar -y
apt install font-manager -y
apt install git -y
apt install curl -y
apt install apt-transport-https ca-certificates software-properties-common -y


# fonts
curl https://ff.static.1001fonts.net/a/n/anonymous-pro.regular.ttf -o anonymous-pro.regular.ttf
mv anonymous-pro.regular.ttf /usr/local/share/fonts/

curl https://ff.static.1001fonts.net/a/n/anonymous-pro.italic.ttf -o anonymous-pro.italic.ttf
mv anonymous-pro.italic.ttf /usr/local/share/fonts/

curl https://ff.static.1001fonts.net/a/n/anonymous-pro.bold.ttf -o anonymous-pro.bold.ttf
mv anonymous-pro.bold.ttf /usr/local/share/fonts/

curl https://ff.static.1001fonts.net/a/n/anonymous-pro.bold-italic.ttf -o anonymous-pro.bold-italic.ttf
mv anonymous-pro.bold-italic.ttf /usr/local/share/fonts/


# sublime text 3
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
apt update
apt install sublime-text


# configs
curl https://raw.githubusercontent.com/luisenricke/dotfiles/main/.aliases -o .aliases
chown $USER_DEFAULT:$USER_DEFAULT .aliases
#chmod 644 .aliases
source .aliases

echo "" >> /home/$USER_DEFAULT/.bashrc
echo -e "if [ -f ~/.aliases ]; then\n\t. ~/.aliases;\nfi" >> /home/$USER_DEFAULT/.bashrc

curl https://raw.githubusercontent.com/luisenricke/dotfiles/main/.gitconfig -o .gitconfig
chown $USER_DEFAULT:$USER_DEFAULT .gitconfig
#chmod 644 .gitconfig


# zsh & oh-my-zsh
apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo -e "export SHELL=\`which zsh\`" >> /home/$USER_DEFAULT/.bashrc
echo -e "[ -z \"\$ZSH_VERSION\" ] && exec \"\$SHELL\" -l" >> /home/$USER_DEFAULT/.bashrc


# reference
#
# - sudo
# 	* https://tecnoysoft.com/es/configurar-sudo-en-debian/
# 	* https://stackoverflow.com/questions/16823591/how-to-add-lines-to-end-of-file-on-linux
#
# - date & time
#	* https://www.cyberciti.biz/faq/howto-set-date-time-from-linux-command-prompt/
#
# - permissions
#	* https://linuxize.com/post/chmod-command-in-linux/
#	* https://linuxize.com/post/linux-chown-command/
#
# - zsh & oh-my-zsh
#   * https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/
#   * https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95
#   * https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
#   * https://unix.stackexchange.com/questions/136423/making-zsh-default-shell-without-root-access
#
# - apps
#	* https://linuxtips.us/install-sublime-text-debian-10/
#	* https://vitux.com/how-to-install-custom-fonts-in-debian/
#
