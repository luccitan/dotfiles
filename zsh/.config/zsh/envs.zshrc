# ...........................................................................
# Shell environment variables
# ...........................................................................

# Fast and simple prompt
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

# Extending PATH
pathmod add "$HOME/.krew/bin"
pathmod add "$HOME/.nvm"

export XDG_CONFIG_HOME="$HOME/.config"

export NVM_DIR=~/.nvm

export PAGER=less
export EDITOR=vim
export VISUAL=$EDITOR

export LANG='en_US.UTF-8'
export LC_ALL=$LANG
export LC_COLLATE=$LANG
export LC_CTYPE=$LANG
export LC_MESSAGES=$LANG
export LC_MONETARY=$LANG
export LC_NUMERIC=$LANG
export LC_TIME=$LANG

export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=30000 # How many commands zsh will load to memory.
export SAVEHIST=30000 # How many commands history will save on file.