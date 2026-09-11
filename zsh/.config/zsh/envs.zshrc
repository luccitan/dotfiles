#
# Shell environment variables
#
#
# This section setups various environment variables that can be either
#   - "native" or conventional environment variables (e.g. XDG*)
#   - environment variables from custom / third-party tools
#       from tools used within these dotfiles
#
#  Some defaults are present but commented, as a matter of documentation,
#     letting room for customization

# --- Prompt ------------------------------------------------------------------
# Minimal prompt: blue cwd, green/red indicator based on last exit code
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

# --- PATH management ---------------------------------------------------------
pathmod add "$HOME/.krew/bin"
pathmod add "$HOME/.nvm"

# --- XDG base directories ----------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"       # User config files
# export XDG_DATA_HOME="$HOME/.local/share"    # User data files
# export XDG_CACHE_HOME="$HOME/.cache"         # User cache files
# export XDG_STATE_HOME="$HOME/.local/state"   # User state files (logs, history)

# --- Editor / pager ----------------------------------------------------------
export EDITOR=vim                         # Default editor for CLI tools (git, etc.)
export VISUAL=$EDITOR                     # Editor for full-screen editing; falls back to EDITOR
export PAGER=less                         # Default pager
export MANPAGER="less -R"                 # Man page viewer; alt: "nvim +Man!" for nvim rendering
export LESS="-R --mouse --wheel-lines=3"  # Default less flags: color, mouse scroll

# --- Terminal colors ---------------------------------------------------------
export TERM=xterm-256color   # Force 256-color support (usually set by terminal emulator)
export COLORTERM=truecolor   # Signal 24-bit color support to apps like nvim/tmux

# ---  Locale -----------------------------------------------------------------
export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB.UTF-8"
export LC_COLLATE="fr_FR.UTF-8"    # Sort order
export LC_CTYPE="fr_FR.UTF-8"      # Character classification and conversion
export LC_MESSAGES="en_GB.UTF-8"   # Language for system messages
export LC_MONETARY="fr_FR.UTF-8"   # Currency formatting
export LC_NUMERIC="fr_FR.UTF-8"    # Number formatting (decimal separator, etc.)
export LC_TIME="fr_FR.UTF-8"       # Date and time formatting

# --- Shell history -----------------------------------------------------------
export HISTFILE=$ZSH/.zsh_history  # History file location
export HISTSIZE=30000              # Commands loaded into memory per session
export SAVEHIST=30000              # Commands persisted to HISTFILE
# export LESSHISTFILE=- # Prevent less from writing its own history file

# --- ZSH UX ------------------------------------------------------------------
# Characters considered part of a word (affects Ctrl+W, alt+backspace, etc.)
# Default is very broad; empty string makes Ctrl+W stop at every non-alphanum
export WORDCHARS=''

# Reduce ESC key detection delay (ms); important in vi mode
export KEYTIMEOUT=1

# --- Homebrew specifics ------------------------------------------------------
if [[ $(which brew) ]]; then 
    eval "$(/usr/bin/env brew shellenv)"; 
    export HOMEBREW_NO_AUTO_UPDATE=1          # Disable auto-update on every brew command
    export HOMEBREW_NO_ANALYTICS=1          # Disable Homebrew telemetry
    # export HOMEBREW_NO_INSTALL_CLEANUP=1    # Keep old versions after install/upgrade
    export HOMEBREW_CLEANUP_MAX_AGE_DAYS=30 # Days before removing stale cached downloads
fi

# --- Misc. third-party tools specifics ---------------------------------------
NVM_DIR=~/.nvm   # NVM working directory
export TLDR_AUTO_UPDATE_DISABLED=1   # Disable tldr auto-update on every invocation
# export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/rg/config"   # rg config file location
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border"  # Default fzf appearance
