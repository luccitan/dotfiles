#
# Shell options (setopt / bindkey / umask)
#
#  Zsh options are set with setopt (enable) or unsetopt (disable).
#  Options listed but commented are off by default — uncomment to enable.
#  Options with DEFAULT ON are active unless explicitly unset.
#

# --- History -----------------------------------------------------------------
setopt HIST_IGNORE_ALL_DUPS   # Don't save duplicate commands to history
setopt HIST_FIND_NO_DUPS      # Skip duplicates when searching history
setopt HIST_IGNORE_SPACE      # Don't save commands prefixed with a space (useful for secrets)
setopt HIST_REDUCE_BLANKS     # Strip superfluous whitespace before saving
setopt SHARE_HISTORY          # Share history across all open sessions in real time
# setopt INC_APPEND_HISTORY   # Write to history file immediately, not on shell exit (weaker than SHARE_HISTORY)
# setopt EXTENDED_HISTORY     # Save timestamp + duration alongside each command

# --- Navigation --------------------------------------------------------------
setopt AUTO_CD                # Type a dir name to cd into it (no need to type cd)
setopt AUTO_PUSHD             # cd pushes old dir onto the stack automatically (enables cd -)
setopt PUSHD_IGNORE_DUPS      # Don't push duplicate dirs onto the stack
# setopt PUSHD_SILENT         # Don't print the dir stack after pushd/popd

# --- Globbing ----------------------------------------------------------------
# setopt EXTENDED_GLOB        # Enable extended glob patterns (#, ~, ^)
# setopt GLOB_DOTS            # Include dotfiles in glob matches without explicit leading dot
# setopt NULL_GLOB            # Silently remove unmatched globs instead of erroring
# unsetopt CASE_GLOB          # DEFAULT ON — disable for case-insensitive glob matching

# --- Completion --------------------------------------------------------------
setopt ALWAYS_TO_END          # Move cursor to end of word after completion
setopt COMPLETE_IN_WORD       # Allow completion from within a word
# setopt MENU_COMPLETE        # Auto-insert first completion match immediately
# setopt AUTO_MENU            # DEFAULT ON — show completion menu after second Tab

# --- Correction --------------------------------------------------------------
setopt CORRECT                # Suggest corrections for mistyped commands
# setopt CORRECT_ALL          # Suggest corrections for all arguments, not just the command

# --- Misc --------------------------------------------------------------------
# setopt INTERACTIVE_COMMENTS # Allow comments (#) in interactive shell (useful for annotation)
setopt LONG_LIST_JOBS         # Show PID and status when listing background jobs
# setopt NO_BEEP              # Silence bell on errors / ambiguous completions
# unsetopt FLOW_CONTROL       # DEFAULT ON — disable Ctrl+S/Ctrl+Q flow control (frees those bindings)

# --- Permissions -------------------------------------------------------------
umask 0022   # Default file permissions: owner rw, group/others r (dirs: 755, files: 644)

# --- Key bindings ------------------------------------------------------------
bindkey -e               # Emacs key bindings mode (alt: -v for vi mode)
bindkey '\e\e[C' forward-word    # ⌥→ jump forward one word
bindkey '\e\e[D' backward-word   # ⌥← jump backward one word
bindkey '^R' history-incremental-search-backward   # Ctrl+R history search
bindkey '^[[A' history-search-backward  # ↑ search history by current prefix
bindkey '^[[B' history-search-forward   # ↓ search history by current prefix
bindkey '^U' backward-kill-line         # Ctrl+U delete from cursor to line start (bash default)
