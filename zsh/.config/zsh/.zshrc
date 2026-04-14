# ...........................................................................
# Core ZSHRC custon configuratiosn
#   - loading specific configuration scripts, organized by topics
#    - loading OS specific script
# ...........................................................................

export ZSH="$HOME/.zsh"
export ZSHRC="$HOME/.zshrc"

# Enabling Homebrew links
###################################################

if [[ $(which brew) ]]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi

# Adding user custom zsh functions and loading them all
fpath=( "$HOME/.config/zsh/functions" "${fpath[@]}" )
autoload -Uz pathmod

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

# ......... Auto-completes enablement .........
if command -v "docker" >/dev/null 2>&1; then
    compfile="$HOME/.zsh/completions/_docker"
    if [[ ! -f $compfile || $(command -v docker) -nt $compfile ]]; then
        docker completion zsh > $compfile
    fi
fi

typeset -U fpath
fpath=("$HOME/.zsh/completions" $fpath)

autoload -Uz compinit
compinit