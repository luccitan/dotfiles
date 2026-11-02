---@type vim.lsp.Config
return {
  on_attach = function(client)
    -- Pyright supplies Python documentation; Ruff supplies linting and edits.
    client.server_capabilities.hoverProvider = false
  end,
}
