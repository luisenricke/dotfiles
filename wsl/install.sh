forget_local_variables() {
    unset HOME_WINDOWS
    unset USER_WINDOWS
}

# request permissions
sudo echo ''

# request user
echo -n "Enter your windows user: "
read USER_WINDOWS
echo ''

HOME_WINDOWS="/mnt/c/Users/$USER_WINDOWS"

if [ ! -d $HOME_WINDOWS  ]; then
    forget_local_variables
    echo -e "\033[0;31mError: The windows user doesnt exist"
    return
fi

sudo apt update
sudo apt upgrade -y
echo ''

# packages
echo -e "\033[0;32mInstall packages"
sudo apt install zip unzip -y
sudo apt install curl -y
echo ''

# git
echo -e "\033[0;32mInstall and configuration of git"
sudo apt install git xclip -y

if [ ! -d ~/.ssh  ]; then
    echo -n "Enter your email: "
    read EMAIL

    ssh-keygen -t ed25519 -C $EMAIL
    eval "$(ssh-agent -s)"
    
    ssh-add ~/.ssh/id_ed25519
    
    xclip -selection clipboard < ~/.ssh/id_ed25519.pub
    
    echo "Your key is in your clipboard"
    echo "Press any key to continue configuration"
    read 

    unset EMAIL
fi

# personal documents
if [ ! -d $HOME_WINDOWS/Projects ]; then
    echo -e "\033[0;32mCreate 'Projects' directory"
    mkdir $HOME_WINDOWS/Projects
fi

if [ ! -d $HOME_WINDOWS/Projects/dotfiles ]; then
    echo -e "\033[0;32mImport 'dotfiles' respository"
    git clone git@github.com:luisenricke/dotfiles.git $HOME_WINDOWS/Projects/dotfiles
fi

echo ''

# MariaDB
echo -e "\033[0;32mInstall mariadb"
sudo apt install mariadb-server -y
sudo service mysql start

if [ -f $HOME_WINDOWS/Projects/dotfiles/wsl/mariadb.sql ]; then
    echo -e "\033[0;32mChange root password of mariadb"
    sudo mysql -u root < $HOME_WINDOWS/Projects/dotfiles/wsl/mariadb.sql
else
    echo -e "\033[0;31mError: the configuration of mariadb doesnt exist"
fi

echo ''

# Javascript
echo -e "\033[0;32mInstall nvm: { node, npm: [typescript, angular] }"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install node

npm install -g typescript
npm install -g @angular/cli
echo ''

# JVM
echo -e "\033[0;32mInstall sdkman: { java[java 8.0.275.open-adpt], groovy[3.0.6], grails[3.3.8] }"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.275.open-adpt
sdk install groovy 3.0.6
sdk install grails 3.3.8
echo ''

# zsh & oh-my-zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Personal configurations
echo -e "\033[0;32mSet up personal configurations"
[ -f $HOME_WINDOWS/Projects/dotfiles/wsl/.aliases ] && ln -sf $HOME_WINDOWS/Projects/dotfiles/wsl/.aliases ~/.aliases
source ~/.aliases

[ -f $HOME_WINDOWS/Projects/dotfiles/wsl/.gitconfig ] && ln -sf $HOME_WINDOWS/Projects/dotfiles/wsl/.gitconfig ~/.gitconfig
[ -f $HOME_WINDOWS/Projects/dotfiles/wsl/.zshrc ] && ln -sf $HOME_WINDOWS/Projects/dotfiles/wsl/.zshrc ~/.zshrc
echo ''

forget_local_variables
