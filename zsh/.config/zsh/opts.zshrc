# ...........................................................................
# Shell options
# ...........................................................................

setopt HIST_IGNORE_ALL_DUPS # History won't save duplicates.
setopt HIST_FIND_NO_DUPS # History won't show duplicates on search.

umask 0022

bindkey -e
bindkey '\e\e[C' forward-word # ⌥→
bindkey '\e\e[D' backward-word # ⌥←
bindkey '^R' history-incremental-search-backward