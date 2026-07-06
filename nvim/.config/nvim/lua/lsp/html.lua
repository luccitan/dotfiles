-- https://github.com/microsoft/vscode-html-languageservice
-- install: npm i -g vscode-langservers-extracted

---@type vim.lsp.Config
return {
  cmd          = { "vscode-html-language-server", "--stdio" },
  filetypes    = { "html" },
  root_markers = { ".git", "package.json" },
  settings     = {},
}
