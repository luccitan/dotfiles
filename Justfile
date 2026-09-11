ZSH_COMPLETIONS_DIR := env("XDG_CONFIG_HOME", env("HOME") + "/.config") + "/zsh/completions"

stow-all:
	stow --verbose --target=$HOME --restow */

stow-delete:
	stow --verbose --target=$HOME --delete */

# Generate zsh completions for all tools
zsh-completions: _completion-kubectl _completion-helm _completion-colima _completion-just _completion-uv _completion-docker
	@echo "All completions written to {{ZSH_COMPLETIONS_DIR}}"

_completion-kubectl:
	#!/usr/bin/env bash
	if ! command -v kubectl &>/dev/null; then echo "kubectl: not found, skipping"; exit 0; fi
	mkdir -p "{{ZSH_COMPLETIONS_DIR}}"
	kubectl completion zsh > "{{ZSH_COMPLETIONS_DIR}}/_kubectl"

_completion-helm:
	#!/usr/bin/env bash
	if ! command -v helm &>/dev/null; then echo "helm: not found, skipping"; exit 0; fi
	mkdir -p "{{ZSH_COMPLETIONS_DIR}}"
	helm completion zsh > "{{ZSH_COMPLETIONS_DIR}}/_helm"

_completion-colima:
	#!/usr/bin/env bash
	if ! command -v colima &>/dev/null; then echo "colima: not found, skipping"; exit 0; fi
	mkdir -p "{{ZSH_COMPLETIONS_DIR}}"
	colima completion zsh > "{{ZSH_COMPLETIONS_DIR}}/_colima"

_completion-just:
	#!/usr/bin/env bash
	if ! command -v just &>/dev/null; then echo "just: not found, skipping"; exit 0; fi
	mkdir -p "{{ZSH_COMPLETIONS_DIR}}"
	just --completions zsh > "{{ZSH_COMPLETIONS_DIR}}/_just"

_completion-uv:
	#!/usr/bin/env bash
	if ! command -v uv &>/dev/null; then echo "uv: not found, skipping"; exit 0; fi
	mkdir -p "{{ZSH_COMPLETIONS_DIR}}"
	uv generate-shell-completion zsh > "{{ZSH_COMPLETIONS_DIR}}/_uv"

_completion-docker:
	#!/usr/bin/env bash
	if ! command -v docker &>/dev/null; then echo "docker: not found, skipping"; exit 0; fi
	mkdir -p "{{ZSH_COMPLETIONS_DIR}}"
	docker completion zsh > "{{ZSH_COMPLETIONS_DIR}}/_docker"