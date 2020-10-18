
export ZSH="/home/debian/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="bureau"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Load alias
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases;
fi
