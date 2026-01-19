# ...........................................................................
# MacOS specific ZSH configurations
# ...........................................................................

# OS Specifics
alias brew='arch -arm64 /opt/homebrew/bin/brew'
alias brew-x86='arch -x86_64 /usr/homebrew/bin/brew'

# Enable autocompletions through Homebrew zsh-autocompletions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi