
# IMPORTANT: run with root user
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
wget https://ff.static.1001fonts.net/a/n/anonymous-pro.regular.ttf
mv anonymous-pro.regular.ttf /usr/local/share/fonts/
wget https://ff.static.1001fonts.net/a/n/anonymous-pro.italic.ttf
mv anonymous-pro.italic.ttf /usr/local/share/fonts/
wget https://ff.static.1001fonts.net/a/n/anonymous-pro.bold.ttf
mv anonymous-pro.bold.ttf /usr/local/share/fonts/
wget https://ff.static.1001fonts.net/a/n/anonymous-pro.bold-italic.ttf
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

curl https://raw.githubusercontent.com/luisenricke/dotfiles/main/.gitconfig -o .gitconfig
chown $USER_DEFAULT:$USER_DEFAULT .gitconfig
#chmod 644 .gitconfig

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
# - apps
#	* https://linuxtips.us/install-sublime-text-debian-10/
#	* https://vitux.com/how-to-install-custom-fonts-in-debian/

