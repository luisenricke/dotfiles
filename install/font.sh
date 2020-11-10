# helper functions
download_font_from_1001fonts() {
    local url=$1
    local output_file=$2
    local output_directory=$3
    
    if [ ! -d /usr/local/share/fonts/$output_directory ]; then
        echo -e "\n Installing '$output_directory' font \n"
        curl $url -L -o $output_file
        unzip $output_file "*.ttf" -d $output_directory
        rm $output_file
        sudo mv $output_directory /usr/local/share/fonts
    fi
}

sudo apt install curl -y
sudo apt install unzip -y

# Fira Code
if [ ! -d /usr/local/share/fonts/FiraCode ]; then
    echo -e "\n Installing 'FiraCode' font \n"
    
    FIRA_CODE_VERSION="5.2"
    FIRA_CODE_FILE="Fira_Code_v$FIRA_CODE_VERSION.zip"

    curl https://github.com/tonsky/FiraCode/releases/download/$FIRA_CODE_VERSION/$FIRA_CODE_FILE -L -o $FIRA_CODE_FILE
    unzip $FIRA_CODE_FILE "ttf/*"
    rm $FIRA_CODE_FILE
    mv ttf FiraCode
    sudo mv FiraCode/ /usr/local/share/fonts

    unset FIRA_CODE_VERSION
    unset FIRA_CODE_FILE
fi

# Anonymous Pro
download_font_from_1001fonts "https://dl.1001fonts.com/anonymous-pro.zip" "anonymous-pro.zip" "AnonymousPro"

# Ariesta Moon Demo
download_font_from_1001fonts "https://dl.1001fonts.com/ariesta-moon-demo.zip" "ariesta-moon-demo.zip" "AriestaMoonDemo"

# Source Code Pro
download_font_from_1001fonts "https://dl.1001fonts.com/source-code-pro.zip" "source-code-pro.zip" "SourceCodePro"


# reference
# 
# * https://vitux.com/how-to-install-custom-fonts-in-debian/
# * https://bash.cyberciti.biz/guide/Pass_arguments_into_a_function
#
# - unzip
#   * https://stackoverflow.com/questions/48873243/curl-not-working-when-downloading-zip-file-from-github
#   * https://unix.stackexchange.com/questions/59276/how-to-extract-only-a-specific-folder-from-a-zipped-archive-to-a-given-directory
