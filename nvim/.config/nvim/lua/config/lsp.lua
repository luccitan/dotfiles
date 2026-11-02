local M = {}

function M.format(bufnr, quiet)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local preferred = require("config.languages").formatters[vim.bo[bufnr].filetype]
  local clients = vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/formatting" })
  table.sort(clients, function(a, b) return a.id < b.id end)
  for _, client in ipairs(clients) do
    if not preferred or client.name == preferred then
      vim.lsp.buf.format({ bufnr = bufnr, id = client.id, async = false, timeout_ms = 2000 })
      return
    end
  end
  if not quiet then
    vim.notify("No LSP formatter attached (:checkhealth vim.lsp)", vim.log.levels.INFO)
  end
end

function M.setup()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("NativeLsp", { clear = true }),
    desc = "Buffer-local LSP actions, completion and inlay hints",
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if not client then return end

      local function map(lhs, rhs, desc, mode)
        vim.keymap.set(mode or "n", lhs, rhs, { buf = ev.buf, silent = true, desc = desc })
      end
      -- Keep gr* defaults intact; K is already provided by Neovim.
      map("gd", vim.lsp.buf.definition, "go to definition")
      map("gi", vim.lsp.buf.implementation, "go to implementation")
      map("<F12>", vim.lsp.buf.definition, "go to definition")
      map("<C-F12>", vim.lsp.buf.references, "find references")
      map("<F2>", vim.lsp.buf.rename, "rename symbol")
      map("<C-Space>", vim.lsp.buf.code_action, "code actions")
      map("<Leader>ld", vim.lsp.buf.definition, "go to definition")
      map("<Leader>lr", vim.lsp.buf.references, "find references")
      map("<Leader>ln", vim.lsp.buf.rename, "rename symbol")
      map("<Leader>la", vim.lsp.buf.code_action, "code actions")
      map("<Leader>lf", function() M.format(ev.buf) end, "format buffer")
      map("<Leader>lh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
      end, "toggle inlay hints")

      if client:supports_method("textDocument/completion", ev.buf) then
        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        map("<C-Space>", vim.lsp.completion.get, "complete", "i")
        vim.keymap.set("i", "<CR>", function()
          local visible = vim.fn.pumvisible() == 1
          if visible and vim.fn.complete_info({ "selected" }).selected >= 0 then return "<C-y>" end
          -- Retain bracket-aware newlines when mini.pairs has loaded.
          local pairs = package.loaded["mini.pairs"]
          local newline = pairs and pairs.cr() or "<CR>"
          return (visible and "<C-e>" or "") .. newline
        end, { buf = ev.buf, expr = true, silent = true, desc = "accept completion / newline" })
      end
      if client:supports_method("textDocument/inlayHint", ev.buf) then
        vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
      end
    end,
  })
end

return M
