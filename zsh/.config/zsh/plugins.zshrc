mkdir -p $ZSH/plugins $ZSH/themes

function zshcloneplugin { if [ ! -d "$ZSH/plugins/$1" ]; then git clone "$2" "$ZSH/plugins/$1"; fi }
function zshsourceplugin { source "$ZSH/plugins/$1"; }

# Syntax highlighting for commands
zshcloneplugin syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
zshsourceplugin syntax-highlighting/zsh-syntax-highlighting.zsh

# ssh autocompletion
zshcloneplugin zsh-ssh https://github.com/sunlei/zsh-ssh
zshsourceplugin zsh-ssh/zsh-ssh.zsh
