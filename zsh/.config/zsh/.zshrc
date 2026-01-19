# ...........................................................................
# Core ZSHRC custon configuratiosn
#   - loading specific configuration scripts, organized by topics
#    - loading OS specific script
# ...........................................................................

export ZSH="$HOME/.zsh"
export ZSHRC="$HOME/.zshrc"

# Enabling Homebrew links
###################################################

eval "$(/opt/homebrew/bin/brew shellenv)"

# Adding user custom zsh functions and loading them all
fpath=( "$HOME/.config/zsh/functions" "${fpath[@]}" )
autoload -Uz pathmod
# autoload -Uz $fpath[1]/*(.:t)

source "$HOME/.config/zsh/aliases.zshrc"
source "$HOME/.config/zsh/envs.zshrc"
source "$HOME/.config/zsh/opts.zshrc"
source "$HOME/.config/zsh/plugins.zshrc"

case "$(uname -s)" in
    Darwin*)
        source $HOME/.config/zsh/os.darwin.zshrc
    ;;

    Linux*)
        source $HOME/.config/zsh/os.linux.zshrc
    ;;

esac

# Enabling auto-completes
autoload -Uz compinit
compinit