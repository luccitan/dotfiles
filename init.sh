#!/usr/bin/env bash

# Asking for sudoing

sudo -v
################################################################################
################################################################################
### Symbolic links to associate config files and other stuffs

echo -e "\033[0;34mCreating symbolics links for configurations...\033[m"

link () {
  rm -rf $2 && ln -s $1 $2
  echo -e "\033[0;32m\xE2\x9C\x93 LINK [$1] ~~~> [$2] created.\033[m"
}

link "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"
#link "${HOME}/.dotfiles/firefox/chrome" \
    #  "${HOME}/Library/Application Support/Firefox/Profiles//chrome"

# MacOS specific linkings
if [[ $(uname) == 'Darwin' ]]; then
  link "${HOME}/.dotfiles/skhd/.skhdrc" "${HOME}/.skhrc"
  link "${HOME}/.dotfiles/chunkwm/.chunkwmrc" "${HOME}/.chunkwmrc"
fi

################################################################################
################################################################################
