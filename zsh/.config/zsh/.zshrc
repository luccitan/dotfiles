# ...........................................................................
# Core ZSHRC custon configuratiosn
#   - loading specific configuration scripts, organized by topics
#    - loading OS specific script
# ...........................................................................

export ZSH="$HOME/.zsh"
export ZSHRC="$HOME/.zshrc"

# Enabling Homebrew links
###################################################

if [[ $(which brew) ]]; then eval "$(/usr/bin/env brew shellenv)"; fi

# Adding user custom zsh functions and loading them all
fpath=( "$HOME/.config/zsh/functions" "${fpath[@]}" )
autoload -Uz pathmod

source "$HOME/.config/zsh/aliases.zshrc"
source "$HOME/.config/zsh/envs.zshrc"
source "$HOME/.config/zsh/opts.zshrc"
source "$HOME/.config/zsh/plugins.zshrc"

case "$(uname -s)" in
    Darwin*)
        alias brew='arch -arm64 /usr/bin/env brew'
        alias brew-x86='arch -x86_64 /usr/bin/env brew'

        # Enable autocompletions through Homebrew zsh-autocompletions
        if type brew &>/dev/null; then
            FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

            autoload -Uz compinit
            compinit
        fi
    ;;

    Linux*)
    ;;
esac

# ......... Auto-completes enablement .........
if command -v "docker" >/dev/null 2>&1; then
    compfile="$HOME/.zsh/completions/_docker"
    if [[ ! -f $compfile || $(command -v docker) -nt $compfile ]]; then
        docker completion zsh > $compfile
    fi
fi

declare -U fpath
fpath=("$HOME/.zsh/completions" $fpath)

# Autoload the ZSH completion system
autoload -Uz compinit && compinit