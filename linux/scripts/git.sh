su -c 'apt install git xclip -y'

if [ ! -d ~/.ssh  ]; then
    echo -e "\n Enter your email \n"
    read EMAIL

    ssh-keygen -t ed25519 -C $EMAIL
    eval "$(ssh-agent -s)"

    ssh-add ~/.ssh/id_ed25519

    xclip -selection clipboard < ~/.ssh/id_ed25519.pub

    echo ""
    echo "Your key is in your clipboard."
    echo "Add your key in GitHub https://github.com/settings/ssh/new"
    echo "Or in other pages"
    echo "When you are ready to continue, press [ENTER] key"
    echo ""
    read

    unset EMAIL
fi

if [ ! -d ~/Projects ]; then
    echo -e "\n Create 'Projects' directory \n"
    mkdir ~/Projects
fi

if [ ! -d ~/Projects/dotfiles ]; then
    echo -e "\n Import 'dotfiles' respository \n"
    git clone git@github.com:luisenricke/dotfiles.git ~/Projects/dotfiles
fi

if [ ! -f ~/.gitconfig ]; then
    if [ -d ~/Projects/dotfiles ]; then
        echo -e "\n Import '.gitconfig' file from dotfiles directory \n"
        cp ~/Projects/dotfiles/.gitconfig ~/.gitconfig
    else
        echo -e "\n Import '.gitconfig' file from dotfiles repository \n"
        curl https://raw.githubusercontent.com/luisenricke/dotfiles/main/.gitconfig -o .gitconfig
        #chmod 644 .gitconfig
    fi
fi

# reference
#
# - SSH Key
#   * https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"
#   * https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account"
#
# - Input
#   * http://www.codebind.com/linux-tutorials/bash-scripting-tutorial-read-user-input/
