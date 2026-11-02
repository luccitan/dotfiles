-- Run from anywhere: nvim --headless -u NONE -l /path/to/nvim/tests/check.lua
local root = vim.fs.dirname(vim.fs.dirname(debug.getinfo(1, "S").source:sub(2)))
vim.opt.rtp:prepend(root)
vim.g.mapleader = " "

local function check()
  for _, path in ipairs(vim.fn.glob(root .. "/**/*.lua", false, true)) do
    assert(loadfile(path), path)
  end

  require("config.settings")
  require("config.mappings")
  local lsp = require("config.lsp")
  local buf = vim.api.nvim_get_current_buf()
  local calls, clients = {}, {}
  local get_clients, format, notify = vim.lsp.get_clients, vim.lsp.buf.format, vim.notify
  vim.lsp.get_clients = function(opts)
    assert(opts.bufnr == buf and opts.method == "textDocument/formatting")
    return clients
  end
  vim.lsp.buf.format = function(opts) calls[#calls + 1] = opts end
  vim.notify = function() error("Unexpected notification") end

  vim.bo.filetype = "python"
  clients = { { id = 1, name = "pyright" }, { id = 2, name = "ruff" } }
  lsp.format(buf, true)
  assert(#calls == 1 and calls[1].id == 2 and calls[1].timeout_ms == 2000)
  clients = {}
  lsp.format(buf, true)
  assert(#calls == 1, "No formatter must be a no-op")
  vim.bo.filetype = "lua"
  clients = { { id = 3, name = "second" }, { id = 1, name = "first" } }
  lsp.format(buf, true)
  assert(#calls == 2 and calls[2].id == 1, "Use exactly one deterministic client")

  clients = {}
  dofile(root .. "/lua/config/autocmds.lua")
  local count = #vim.api.nvim_get_autocmds({ group = "Editor" })
  dofile(root .. "/lua/config/autocmds.lua")
  assert(#vim.api.nvim_get_autocmds({ group = "Editor" }) == count, "Autocmds must not accumulate")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "text  " })
  vim.fn.setreg("/", "search")
  vim.api.nvim_exec_autocmds("BufWritePre", { buf = buf, group = "Editor" })
  assert(vim.api.nvim_buf_get_lines(buf, 0, -1, false)[1] == "text")
  assert(vim.fn.getreg("/") == "search", "Whitespace cleanup must preserve search")
  vim.bo.filetype = "markdown"
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "line break  " })
  vim.api.nvim_exec_autocmds("BufWritePre", { buf = buf, group = "Editor" })
  assert(vim.api.nvim_buf_get_lines(buf, 0, -1, false)[1] == "line break  ")

  vim.lsp.get_clients, vim.lsp.buf.format, vim.notify = get_clients, format, notify
  local get_client = vim.lsp.get_client_by_id
  local enable_completion, enable_hints = vim.lsp.completion.enable, vim.lsp.inlay_hint.enable
  local completion, hints = false, false
  vim.lsp.get_client_by_id = function()
    return { id = 1, supports_method = function() return true end }
  end
  vim.lsp.completion.enable = function(enabled, _, bufnr)
    completion = enabled and bufnr == buf
  end
  vim.lsp.inlay_hint.enable = function(enabled, opts)
    hints = enabled and opts.bufnr == buf
  end
  lsp.setup()
  lsp.setup()
  assert(#vim.api.nvim_get_autocmds({ group = "NativeLsp" }) == 1)
  vim.api.nvim_exec_autocmds("LspAttach", { buf = buf, group = "NativeLsp", data = { client_id = 1 } })
  assert(completion and hints, "Completion and hints must be enabled on attach")
  assert(vim.fn.maparg("gd", "n", false, true).buffer == 1)
  assert(vim.fn.maparg("<CR>", "i", false, true).expr == 1)
  assert(vim.fn.maparg("gr", "n") == "", "Do not shadow native gr* mappings")
  vim.lsp.get_client_by_id = get_client
  vim.lsp.completion.enable, vim.lsp.inlay_hint.enable = enable_completion, enable_hints
end

local ok, err = xpcall(check, debug.traceback)
if not ok then
  io.stderr:write(err .. "\n")
  vim.cmd.cquit()
end
print("Config checks passed")
vim.cmd("qa!")
