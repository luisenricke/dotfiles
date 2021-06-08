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

if [ ! -d $HOME_WINDOWS/AppData/Roaming/'Sublime Text 3'  ]; then
    forget_local_variables
    print_ 'Error: Sublime text isnt installed' 'red'
    return
fi

print_ 'Set up personal configurations' 'green'
ln -f $HOME_WINDOWS/Projects/dotfiles/sublime/'Default (Windows)'.sublime-keymap $HOME_WINDOWS/AppData/Roaming/'Sublime Text 3'/Packages/User/
ln -f $HOME_WINDOWS/Projects/dotfiles/sublime/Guna.sublime-settings $HOME_WINDOWS/AppData/Roaming/'Sublime Text 3'/Packages/User/
ln -f $HOME_WINDOWS/Projects/dotfiles/sublime/GitGutter.sublime-settings $HOME_WINDOWS/AppData/Roaming/'Sublime Text 3'/Packages/User/
ln -f $HOME_WINDOWS/Projects/dotfiles/sublime/Preferences.sublime-settings $HOME_WINDOWS/AppData/Roaming/'Sublime Text 3'/Packages/User/
ln -f $HOME_WINDOWS/Projects/dotfiles/sublime/'Package Control'.sublime-settings $HOME_WINDOWS/AppData/Roaming/'Sublime Text 3'/Packages/User/
ln -f $HOME_WINDOWS/Projects/dotfiles/sublime/'Package Control'.sublime-settings $HOME_WINDOWS/AppData/Roaming/'Sublime Text 3'/Packages/User/
ln -f $HOME_WINDOWS/Projects/dotfiles/sublime/phpfmt.sublime-settings $HOME_WINDOWS/AppData/Roaming/'Sublime Text 3'/Packages/User/
echo ''

forget_local_variables
