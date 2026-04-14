# ...........................................................................
# Command aliases
# ...........................................................................

# 1. Defining shortcuts
alias fullclear='clear && printf "\e[3J"'
alias isosudo='sudo -E env "PATH=$PATH"'
alias k='kubectl'
alias tf='terraform'
alias justg='just -g'

# 2. Defining CLI default options
alias ls='ls -lah --color=auto'
alias rm='rm -i'

# 3. Using upgraded alternatives
alias "cat++"='bat'
alias "ping++"='gping'
alias "ls++"='eza --long --tree --all --header --binary --level=1 --color=always'
