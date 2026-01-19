# ...........................................................................
# Command aliases
# ...........................................................................

# 1. Defining shortcuts
alias fullclear='clear && printf "\e[3J"'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias isosudo='sudo -E env "PATH=$PATH"'
alias k='kubectl'
alias kmd='just -g'

# 2. Defining CLI default options
alias ls='ls -lah --color=auto'
alias rm='rm -i'

# 3. Adding upgraded alternatives
alias "cat++"='bat'
alias "ping++"='gping'
alias "ls++"='eza --long --tree --all --header --binary --level=1 --color=always'
