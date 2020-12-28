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

# oh-my-zsh plugins
print_ 'Install oh-my-zsh plugins' 'green'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo ''

# Personal configurations
print_ 'Set up personal configurations' 'green'
[ -f $HOME_WINDOWS/Projects/dotfiles/wsl/.aliases ] && ln -sf $HOME_WINDOWS/Projects/dotfiles/wsl/.aliases ~/.aliases
source ~/.aliases

[ -f $HOME_WINDOWS/Projects/dotfiles/wsl/.gitconfig ] && ln -sf $HOME_WINDOWS/Projects/dotfiles/wsl/.gitconfig ~/.gitconfig
[ -f $HOME_WINDOWS/Projects/dotfiles/wsl/.zshrc ] && ln -sf $HOME_WINDOWS/Projects/dotfiles/wsl/.zshrc ~/.zshrc
echo ''

forget_local_variables

zsh
