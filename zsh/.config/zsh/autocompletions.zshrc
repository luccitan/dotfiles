#
# Autocompletions setup
#
#  Completions are loaded from three sources, in order:
#   1. A local dir of pre-generated completion files (fast, no per-tool startup cost)
#   2. Homebrew's zsh-completions
#   3. compinit (initializes the completion system)
#
#  To regenerate completions after tool updates, run: just zsh-completions
#

# --- Local pre-generated completions ----------------------------------------
# Add before compinit so these take precedence
ZSH_COMPLETIONS_DIR="${XDG_CONFIG_HOME}/zsh/completions"
mkdir -p "$ZSH_COMPLETIONS_DIR"
fpath=( "$ZSH_COMPLETIONS_DIR" "${fpath[@]}" ) 

# --- Homebrew completions ----------------------------------------------------
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi

# --- Init --------------------------------------------------------------------
autoload -Uz compinit
compinit

# --- FZF key bindings + completion -------------------------------------------
# Ctrl+T: file picker, Ctrl+R: history search, Alt+C: cd into dir
source <(fzf --zsh)