# Environments variables
# ---------------------------

# Fast and simple prompt
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

export XDG_CONFIG_HOME="$HOME/.config"
export ZSH=$HOME/.zsh
export ZSHRC="$HOME/.zshrc"

export ENVS="$HOME/miniforge3/envs"
export NVM_DIR=~/.nvm

export PAGER=less
export EDITOR=nvim
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

# Shell options
# ---------------------------
setopt HIST_IGNORE_ALL_DUPS # History won't save duplicates.
setopt HIST_FIND_NO_DUPS # History won't show duplicates on search.

umask 0022

bindkey -e
bindkey '\e\e[C' forward-word # ⌥→
bindkey '\e\e[D' backward-word # ⌥←
bindkey '^R' history-incremental-search-backward

# Aliases
# ---------------------------
# 1. Defining shortcuts
alias fullclear='clear && printf "\e[3J"'
alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias printpath="echo $PATH | sed 's/:/\n/g'"
alias isosudo='sudo -E env "PATH=$PATH"' 

# 2. Defining CLI default options
alias ls='ls -lah --color=auto'
alias rm='rm -i'

# 3. Adding upgraded alternatives
alias "cat++"='bat'
alias "ping++"='gping'
alias "ls++"='eza --long --tree --all --header --binary --level=1 --color=always'
