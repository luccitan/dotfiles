# ...........................................................................
# Command aliases
# ...........................................................................

# 1. Defining shortcuts
alias isosudo='sudo -E env "PATH=$PATH"'
alias k='kubectl'
alias tf='terraform'
alias justg='just -g'

# 2. Defining CLI default options
alias ls='ls -lah --color=auto'
alias rm='rm -i'

# 3. Using upgraded alternatives
alias "clear++"='clear && printf "\e[3J"'
alias "cat++"='bat'
alias "ls++"='eza --long --tree --group --all --header --binary --level=1 --color=always --icons=auto'
