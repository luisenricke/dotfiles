# IMPORTANT 
#   1. run with root user
#   2. download dotfiles project

USER_DEFAULT="luisenricke"
DOTFILES=/home/$USER_DEFAULT/Projects/dotfiles
SQL_ROOT=$DOTFILES/install/extra/mariadb.sql

cd /home/$USER_DEFAULT/

apt install mariadb-server -y

service mariadb start
mariadb -u root < $SQL_ROOT

unset USER_DEFAULT
unset DOTFILES
unset SQL_ROOT

# reference
#   * https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-10
#   * https://mariadb.com/kb/en/completely-unistall-and-then-reinstall-mariadb-103/
