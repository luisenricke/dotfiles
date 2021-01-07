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
    # Fixing issue of clone in git https://askubuntu.com/a/1118158/1130758
    sudo umount /mnt/c
    sudo mount -t drvfs C: /mnt/c -o metadata

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
print_ 'Install nvm: { node, npm: [typescript, angular] }' 'green'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.bashrc

nvm install node
npm install -g typescript
npm install -g @angular/cli
echo ''

# PHP 
print_ 'Install php:7.2 && composer:1.8.0' 'green'
sudo apt install software-properties-common apt-transport-https ca-certificates gnupg2 -y

if [[ $(lsb_release -is) == "Debian" ]]; then
    curl -fsSL https://packages.sury.org/php/apt.gpg | sudo apt-key add -
    sudo add-apt-repository "deb https://packages.sury.org/php/ $(lsb_release -cs) main"
fi


if [[ $(lsb_release -is) == "Ubuntu" ]]; then
    sudo add-apt-repository ppa:ondrej/php
fi

sudo apt update

sudo apt install php7.2 php-cli -y
php -v

sudo apt install php7.2-common php7.2-mysql php7.2-curl php7.2-json php7.2-cgi php7.2-opcache php7.2-mbstring
sudo update-alternatives --set php /usr/bin/php7.2
sudo a2enmod php7.2
sudo service apache2 restart

cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo composer self-update 1.8.0

echo ''

forget_local_variables

# zsh & oh-my-zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
