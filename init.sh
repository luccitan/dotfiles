#!/usr/bin/env bash

################################################################################
### Symbolic links to associate config files and other stuffs
################################################################################

echo "\033[0;34mCreating symbolics links for configurations...\033[m"

link () {
  rm -rf $2 && ln -s $1 $2
  echo "\033[0;32m\xE2\x9C\x93 LINK [$1] ~~~> [$2] created.\033[m"
}

link "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"

#if [[ $(uname) == 'Darwin' ]]; then
#fi

################################################################################

echo "\n\n\033[0;34mGetting Homebrew and installing from the Brewfile...\033[m"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

################################################################################

echo "\n\n\033[0;34mConfiguring zsh...\033[m"

echo "\033[0;34m-> Installing the Powerline fonts ...\033[m"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "\033[0;34m-> Installing the Powerlevel9K theme.\033[m"
if [ ! -d ~/.powerlevel9k ]; then
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.powerlevel9k
fi


################################################################################
echo "\n\n\033[0;34mInitialization script ended \xE2\x9C\x93 \033[m\n"

