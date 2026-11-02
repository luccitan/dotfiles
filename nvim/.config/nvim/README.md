# Neovim 0.12+

- `lua/config/languages.lua`: desired servers, parsers and formatter preferences.
- `lua/plugins/`: plugin declarations; `lazy-lock.json` pins tested revisions.
- `after/lsp/`: intentional overrides of upstream nvim-lspconfig defaults.
- Keymap `desc` fields are the keybinding documentation (`<leader>fk`).

Run `brew bundle --file=Brewfile` from the dotfiles root for external dependencies.
Node on `PATH` must be >=22.13 (check `node --version` if using nvm).
On startup, Lazy installs plugins and Mason installs/enables declared servers.
First-time downloads need network access; open a file after installation finishes.
Rust projects also need a Rust toolchain with `rust-src`, `rustfmt` and `clippy`.

`<leader>li`: LSP health · `<leader>lm`: package status · `<leader>lf`: format.
Completion: `Ctrl-Space`, `Ctrl-N`/`Ctrl-P`, `Enter` to accept a selected item.
`<leader>fp`: maintained project.nvim fork's fzf-lua picker. It uses JSON history;
the original plugin's plain-text history is preserved but not imported automatically.
Update explicitly with `:Lazy update`, `:TSUpdate`, and `:Mason` (`U`); commit the lockfile.

Checks: `nvim --headless -u NONE -l nvim/.config/nvim/tests/check.lua` from the dotfiles root.
