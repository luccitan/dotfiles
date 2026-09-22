#
# Command aliases
#
# There are grouped in different kind of aliases
#  - pure shortcuts. The native command with or without defaults with a shorter alias.
#  - overwriting common commands with defaults to change default behaviours.
#  - "extended alternatives"
#       commands in the form of `command++` propose an third-party alternative which is more "modern"
#

# 1. Defining shortcuts
alias isosudo='sudo -E env "PATH=$PATH"'
alias k='kubectl'
alias kubectl='kubecolor'
alias tf='terraform'
alias justg='just -g'

# 2. Defining CLI default options
alias ls='ls -lah --color=auto'
alias rm='rm -i'

# 3. Using upgraded alternatives
alias "clear++"='clear && printf "\e[3J"'
alias "cat++"='bat'
alias "ls++"='eza --long --tree --group --all --header --binary --level=1 --color=always --icons=auto'
