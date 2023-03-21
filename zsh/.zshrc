# Misc fixes etc
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# NVM
export NVM_DIR=~/.nvm
source "$NVM_DIR/nvm.sh"

source $HOME/.bash_profile
source $HOME/.zplugrc

source ~/dotfiles/zsh/interactive



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/i350532/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/i350532/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/i350532/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/i350532/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/i350532/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/i350532/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

