# General exports and aliases
alias ls='ls -lahG'
export DOTFILES="$HOME/.dotfiles"
export ZSHRC="$HOME/.dotfiles/.zshrc"

# Virtualenvwrapper 
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


# ZPLUG loading 	
export ZPLUG_HOME=/usr/local/opt/zplug	
source $ZPLUG_HOME/init.zsh	
	
# ZSH themes	
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme	
	
# Loading everything ...	
zplug load
