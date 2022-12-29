# IMPORTANT
#   1. run with user to config
#   2. enable 'Non-DFSG-compatible Software (non-free)'

DOTFILES=~/Projects/dotfiles

cd ~

# install & config sudo
su -c 'apt install sudo -y'
su -c 'echo -e "\n$USER ALL=(ALL) ALL\n" >> /etc/sudoers'

# enable 'Non-DFSG-compatible Software (non-free)'
sudo apt-add-repository non-free
#sudo apt-add-repository contrib

# update & upgrade
sudo apt update
sudo apt upgrade -y

# utility & software
if [ -d ~/Projects/dotfiles ]; then
    source $DOTFILES/linux/scripts/toolkit-packages.sh
    source $DOTFILES/linux/scripts/font.sh
    source $DOTFILES/linux/scripts/mariadb.sh
    source $DOTFILES/linux/scripts/sublime-text.sh
fi

# personal configurations
if [ ! -f ~/.aliases  ]; then
    echo -e "\n Apply aliases \n"

    if [ -d ~/Projects/dotfiles ]; then
        cp $DOTFILES/linux/.aliases ~
    else
        curl https://raw.githubusercontent.com/luisenricke/dotfiles/main/linux/.aliases -o .aliases
    fi

    source .aliases

    if [ -f ~/.bashrc ]; then
        sudo echo -e "\nif [ -f ~/.aliases ]; then\n\t. ~/.aliases;\nfi\n" >> ~/.bashrc
    fi
fi

# zsh & oh-my-zsh
apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo -e "export SHELL=\`which zsh\`" >> ~/.bashrc
echo -e "[ -z \"\$ZSH_VERSION\" ] && exec \"\$SHELL\" -l" >> ~/.bashrc

# config
timedatectl set-timezone 'America/Mexico_City'
timedatectl set-ntp yes

# clean declarations
unset DOTFILES

# reference
#
# - sudo
#   * https://tecnoysoft.com/es/configurar-sudo-en-debian/
#   * https://stackoverflow.com/questions/16823591/how-to-add-lines-to-end-of-file-on-linux
#   * https://stackoverflow.com/questions/11636840/changing-to-root-user-inside-shell-script
#
# - date & time
#   * https://www.cyberciti.biz/faq/howto-set-date-time-from-linux-command-prompt/
#
# - zsh & oh-my-zsh
#   * https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/
#   * https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95
#   * https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
#   * https://unix.stackexchange.com/questions/136423/making-zsh-default-shell-without-root-access
