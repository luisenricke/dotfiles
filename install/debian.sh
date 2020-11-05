# support functions
download_font_from_1001fonts() {
    local user=$1
    local url=$2
    local output_file=$3
    local output_directory=$4

    curl $url -L -o $output_file
    unzip $output_file "*.ttf" -d $output_directory
    chown $user:$user $output_directory
    rm $output_file
    mv $output_directory /usr/local/share/fonts
}


# IMPORTANT 
#   1. run with root user
#   2. enable 'Non-DFSG-compatible Software (non-free)'

# AFTER RUN
#   - set up git and github ssh
#       * https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
#       * https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account

USER_DEFAULT="luisenricke"

FIRA_CODE_VERSION="5.2"
FIRA_CODE_FILE="Fira_Code_v$FIRA_CODE_VERSION.zip"

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
curl https://github.com/tonsky/FiraCode/releases/download/$FIRA_CODE_VERSION/$FIRA_CODE_FILE -L -o $FIRA_CODE_FILE
chown $USER_DEFAULT:$USER_DEFAULT $FIRA_CODE_FILE
unzip $FIRA_CODE_FILE "ttf/*"
rm $FIRA_CODE_FILE
mv ttf FiraCode
mv FiraCode/ /usr/local/share/fonts

download_font_from_1001fonts $USER_DEFAULT "https://dl.1001fonts.com/anonymous-pro.zip" "anonymous-pro.zip" "AnonymousPro"
download_font_from_1001fonts $USER_DEFAULT "https://dl.1001fonts.com/ariesta-moon-demo.zip" "ariesta-moon-demo.zip" "AriestaMoonDemo"


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
#   * https://tecnoysoft.com/es/configurar-sudo-en-debian/
#   * https://stackoverflow.com/questions/16823591/how-to-add-lines-to-end-of-file-on-linux
#
# - date & time
#   * https://www.cyberciti.biz/faq/howto-set-date-time-from-linux-command-prompt/
#
# - permissions
#   * https://linuxize.com/post/chmod-command-in-linux/
#   * https://linuxize.com/post/linux-chown-command/
#
# - zsh & oh-my-zsh
#   * https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/
#   * https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95
#   * https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
#   * https://unix.stackexchange.com/questions/136423/making-zsh-default-shell-without-root-access
#
# - apps
#   * https://linuxtips.us/install-sublime-text-debian-10/
#   * https://vitux.com/how-to-install-custom-fonts-in-debian/
#
# - functions
#   * https://bash.cyberciti.biz/guide/Pass_arguments_into_a_function
#
# - unzip
#   * https://stackoverflow.com/questions/48873243/curl-not-working-when-downloading-zip-file-from-github
#   * https://unix.stackexchange.com/questions/59276/how-to-extract-only-a-specific-folder-from-a-zipped-archive-to-a-given-directory


# clean declarations
unset USER_DEFAULT
unset FIRA_CODE_VERSION
unset FIRA_CODE_FILE

unset -f download_font_from_1001fonts
