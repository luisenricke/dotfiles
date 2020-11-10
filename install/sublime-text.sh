SUBLIME_CONFIG=~/.config/sublime-text-3/Packages/User

curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt install sublime-text


if [ ! -f $SUBLIME_CONFIG/Preferences.sublime-settings ]; then
    subl

    echo ""
    echo "Please install packages"
    echo "When you are ready to continue, press [ENTER] key"
    read 

	echo "Please copy & install packages with advance installer"
	echo ""

	cat ~/Projects/dotfiles/sublime/packages.list

	echo ""
	echo "When you are ready to continue, close Sublime Text and press [ENTER] key"
	read 

	echo -e "\n Import 'Default (Linux).sublime-keymap' file \n"
	cp ~/Projects/dotfiles/sublime/'Default (OS).sublime-keymap' $SUBLIME_CONFIG/'Default (Linux).sublime-keymap'
	
	echo -e "\n Import 'GitGutter.sublime-settings' file \n"
	cp ~/Projects/dotfiles/sublime/GitGutter.sublime-settings $SUBLIME_CONFIG/GitGutter.sublime-settings
	
	echo -e "\n Import 'Guna.sublime-settings' file \n"
	cp ~/Projects/dotfiles/sublime/Guna.sublime-settings $SUBLIME_CONFIG/Guna.sublime-settings
	
	echo -e "\n Import 'Preferences.sublime-settings' file \n"
	cp ~/Projects/dotfiles/sublime/Preferences.sublime-settings $SUBLIME_CONFIG/Preferences.sublime-settings

    subl
fi

unset SUBLIME_CONFIG
