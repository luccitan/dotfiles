# General exports and aliases
alias ls='ls -lahG'
export DOTFILES="$HOME/.dotfiles"
export ZSHRC="$HOME/.dotfiles/.zshrc"

# zsh theme
source ~/.powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

# Virtualenvwrapper 
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

