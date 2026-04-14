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

# Locales
export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB.UTF-8"
export LC_COLLATE="fr_FR.UTF-8"
export LC_CTYPE="fr_FR.UTF-8"
export LC_MESSAGES="en_GB.UTF-8"
export LC_MONETARY="fr_FR.UTF-8"
export LC_NUMERIC="fr_FR.UTF-8"
export LC_TIME="fr_FR.UTF-8"

export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=30000 # How many commands zsh will load to memory.
export SAVEHIST=30000 # How many commands history will save on file.

# Disabling few auto-updates
export TLDR_AUTO_UPDATE_DISABLED=1
export HOMEBREW_NO_AUTO_UPDATE=1