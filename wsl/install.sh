print_() {
    local message=$1
    local color=$2

    case "$color" in
        "green") echo -e "\033[0;32m$message\033[0m";;
        "red") echo -e "\033[0;31m$message\033[0m";;
        *) echo "$message";;
    esac
}

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
    print_ 'Error: The windows user doesnt exist' 'red'
    return
fi

sudo apt update
sudo apt upgrade -y
echo ''

# packages
print_ 'Install packages' 'green'
sudo apt install zip unzip -y
sudo apt install curl -y
echo ''

# git
print_ 'Install and configuration of git' 'green'
sudo apt install git -y

if [ ! -d ~/.ssh  ]; then
    echo -n "Enter your email: "
    read EMAIL

    ssh-keygen -t ed25519 -C $EMAIL
    eval "$(ssh-agent -s)"
    
    ssh-add ~/.ssh/id_ed25519
    
    clip.exe < ~/.ssh/id_ed25519.pub
    
    echo "Your key is in your clipboard"
    echo "Press any key to continue configuration"
    read 

    unset EMAIL
fi

# personal documents
if [ ! -d $HOME_WINDOWS/Projects ]; then
    print_ 'Create 'Projects' directory' 'green'
    mkdir $HOME_WINDOWS/Projects
fi

if [ ! -d $HOME_WINDOWS/Projects/dotfiles ]; then
    print_ 'Import 'dotfiles' respository' 'green'
    git clone git@github.com:luisenricke/dotfiles.git $HOME_WINDOWS/Projects/dotfiles
fi

echo ''

# MariaDB
print_ 'Install mariadb' 'green'
sudo apt install mariadb-server -y
sudo service mysql start

if [ -f $HOME_WINDOWS/Projects/dotfiles/wsl/mariadb.sql ]; then
    print_ 'Change root password of mariadb' 'green'
    sudo mysql -u root < $HOME_WINDOWS/Projects/dotfiles/wsl/mariadb.sql
else
    print_ 'Error: the configuration of mariadb doesnt exist' 'red'
fi

echo ''

# JVM
print_ 'Install sdkman: { java[java 8.0.275.open-adpt], groovy[3.0.6], grails[3.3.8] }' 'green'
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.275.open-adpt
sdk install groovy 3.0.6
sdk install grails 3.3.8
echo ''

# Javascript
print_ 'Install nvm: { node, npm: [typescript, angular] }\033[0m' 'green'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.bashrc

nvm install node
npm install -g typescript
npm install -g @angular/cli
echo ''

forget_local_variables

# zsh & oh-my-zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
