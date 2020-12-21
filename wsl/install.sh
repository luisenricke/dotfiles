sudo apt update
sudo apt upgrade -y

# packages
echo "Installing packages"
sudo apt install zip unzip -y
sudo apt install curl -y

# mariadb
echo "Installing mariadb"
sudo apt install mariadb-server -y
sudo service mysql start

if [ -f /mnt/c/Users/luise/Projects/dotfiles/install/extra/mariadb.sql ]; then
    echo "Change root password of mariadb"
    sudo mysql -u root < /mnt/c/Users/luise/Projects/dotfiles/install/extra/mariadb.sql
else
    echo "Error: the configuration of mariadb doesnt exist"
fi

# Javascript
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install node

npm install -g typescript
npm install -g @angular/cli

# JVM
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.275.open-adpt
sdk install groovy 3.0.6
sdk install grails 3.3.8

# Git
sudo apt install software-properties-common -y
