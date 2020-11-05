
SQL_ROOT=~/Projects/dotfiles/install/extra/mariadb.sql

sudo apt install mariadb-server -y
sudo service mariadb start

if [ -f $SQL_ROOT  ]; then
    echo -e "\n Change root password \n"
    mariadb -u root < $SQL_ROOT
fi

unset SQL_ROOT

# reference
#   * https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-10
#   * https://mariadb.com/kb/en/completely-unistall-and-then-reinstall-mariadb-103/
