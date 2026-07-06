-- Set leader key before anything else loads (plugins read it at setup time)
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Load core configuration modules
require("config.settings")
require("config.mappings")
require("config.autocmds")

-- Load plugin manager
require("config.lazy")


-- Native LSP servers — one config file per server in lua/lsp/
-- Reference configs: https://github.com/neovim/nvim-lspconfig/tree/master/lsp
-- Install instructions are at the top of each file.
vim.lsp.enable({
  "luals",         -- Lua
  "pyright",       -- Python  (type checking)
  "ruff",          -- Python  (linting + formatting)
  "bashls",        -- Bash / Shell
  "vtsls",         -- TypeScript / JavaScript
  "rust_analyzer", -- Rust
  "html",          -- HTML
  "cssls",         -- CSS / SCSS / Less
  "jsonls",        -- JSON / JSONC
  "yamlls",        -- YAML
})


-- Enable native completion and inlay hints for every LSP that supports them.
-- No extra completion plugin needed — Neovim 0.12 ships this built-in.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then return end

    -- Native popup completion (C-n / C-p to navigate, Enter to confirm)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Inline parameter names and return types next to code
    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end
  end,
})
