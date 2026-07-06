-- https://rust-analyzer.github.io/  |  install: rustup component add rust-analyzer

---@type vim.lsp.Config
return {
  cmd          = { "rust-analyzer" },
  filetypes    = { "rust" },
  root_markers = { "Cargo.toml", "Cargo.lock", ".git" },

  settings = {
    ["rust-analyzer"] = {
      checkOnSave = { command = "clippy" }, -- Use clippy for richer diagnostics
    },
  },
}
