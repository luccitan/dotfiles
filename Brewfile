# ...........................................................................
# Homebrew installation files for valuables tools
# ...........................................................................
# 
# Centralized personal Brewfile
#
#   It contains recipes that do not necesserily match for all setups
#       e.g. Cask recipes that are irrelevant for server-only setups
#       e.g. Recipes that are only relevant for MacOS laptops
#

# --- Core terminal/shell stuff -----------------------------------------------
brew "zellij"
cask "ghostty"

# --- Generic development-related stuff ---------------------------------------
brew "nvim"

# --- Generic CLI tools -------------------------------------------------------
brew "fzf"                              # Powerful CLI fuzzy file finder
brew "jq"                               # JSON CLI-tool manipulator
brew "yq"                               # YAML CLI-tool manipulator
brew "just"                             # Powerful command runner ; modern Makefile
brew "watch" if OS.mac?                 # GNU `watch` command, not available natively in MacOS

# --- CLI modern alternatives -------------------------------------------------
brew "bat"                              # modern `cat`
brew "btop"                             # modern `top` (process dashboard)
brew "duf"                              # disk usage tracker
brew "eza"                              # modern ls
brew "witr"                             # modern ps with even more features

# --- CLI helpers--------------------------------------------------------------
brew "tldr"                             # Community-maintained help pages CLI tool

# ------ Python-related stuff -------------------------------------------------
brew "uv"                               # Python ecosystem multi-tool

# ------ JS-related stuff -----------------------------------------------------
brew "pnpm"                             # Package manager for JS ecosystem
brew "nvm"                              # Node version manager

# ------ Infra/DevOps tools ---------------------------------------------------
brew "docker"
brew "docker-compose"
brew "docker-buildx"
brew "kubectl"
brew "kubecolor"