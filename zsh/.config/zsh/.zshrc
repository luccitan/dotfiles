#
# Core ZSH custom configuration
#
# For most sections, the config is split into dedicated local files
# For remaining parts that do not deserve dedicated files, this is done below
#

export ZSH="$HOME/.zsh"
export ZSHRC="$HOME/.zshrc"

# --- Custom ZSH functions ----------------------------------------------------
fpath=( "$HOME/.config/zsh/functions" "${fpath[@]}" ) 
autoload -Uz pathmod

# --- Dedicated ZSH configuration scripts -------------------------------------
source "$HOME/.config/zsh/aliases.zshrc"
source "$HOME/.config/zsh/envs.zshrc"
source "$HOME/.config/zsh/opts.zshrc"
source "$HOME/.config/zsh/plugins.zshrc"
source "$HOME/.config/zsh/autocompletions.zshrc"

# Additional completions settings
compdef kubecolor=kubectl