-- https://github.com/microsoft/vscode-css-languageservice
-- install: npm i -g vscode-langservers-extracted

---@type vim.lsp.Config
return {
  cmd          = { "vscode-css-language-server", "--stdio" },
  filetypes    = { "css", "scss", "less" },
  root_markers = { ".git", "package.json" },

  settings = {
    css  = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
