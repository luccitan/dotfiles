# ZPLUG loading 
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# ZSH themes
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# Loading everything ...
zplug load
