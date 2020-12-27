export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="minimal"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

unalias -m '*'

if [ -f ~/.aliases ]; then
    . ~/.aliases;
fi

if [ -d $HOME/.sdkman ]; then
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s $HOME/.sdkman/bin/sdkman-init.sh ]] && source $HOME/.sdkman/bin/sdkman-init.sh
fi

if [ -d $HOME/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
    #[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi


