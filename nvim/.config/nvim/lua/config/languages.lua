-- Desired state: Mason installs/enables servers; Treesitter installs parsers.
return {
  servers = {
    "lua_ls", "pyright", "ruff", "bashls", "vtsls", "rust_analyzer",
    "html", "cssls", "jsonls", "yamlls",
  },
  parsers = {
    "lua", "python", "typescript", "javascript", "tsx", "rust",
    "html", "css", "json", "yaml", "bash", "markdown", "markdown_inline",
  },
  -- Use exactly one formatting client; Pyright handles Python types, Ruff edits.
  formatters = { python = "ruff" },
}
