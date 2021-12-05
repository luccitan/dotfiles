# Misc fixes etc
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias rm='rm -i'
alias ls='exa --long --tree --all --header --git --binary --level 1'
alias fullclear='clear && printf "\e[3J"'
alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

source $(dirname $0)/.zplugrc
