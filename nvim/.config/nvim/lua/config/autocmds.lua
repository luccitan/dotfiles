local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local group = augroup("Editor", { clear = true })


-- ─── File editing ─────────────────────────────────────────────────────────────

-- Markdown trailing spaces can encode hard line breaks.
autocmd("BufWritePre", {
  group = group,
  desc = "Trim trailing whitespace without changing search or cursor",
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= "" or not vim.bo[ev.buf].modifiable or vim.bo[ev.buf].filetype == "markdown" then
      return
    end
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns keepjumps %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- Auto-create parent directories when saving a file in a new path
autocmd("BufWritePre", {
  group = group,
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= "" or ev.match:match("^%w+://") then return end
    local file = vim.uv.fs_realpath(ev.match) or ev.match
    local dir  = vim.fn.fnamemodify(file, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Restore cursor to its last known position when reopening a file
autocmd("BufReadPost", {
  group = group,
  callback = function()
    local mark  = vim.api.nvim_buf_get_mark(0, '"')
    local lines = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lines then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})


-- ─── LSP format on save ───────────────────────────────────────────────────────

autocmd("BufWritePre", {
  group = group,
  desc = "Format with one capable LSP client; skip buffers without a formatter",
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= "" or not vim.bo[ev.buf].modifiable then return end
    require("config.lsp").format(ev.buf, true)
  end,
})


-- ─── Window & layout ──────────────────────────────────────────────────────────

-- Re-equalise split sizes when the Neovim window is resized
autocmd("VimResized", {
  group = group,
  callback = function() vim.cmd("wincmd =") end,
})

-- Open :help windows in a vertical split to the right
autocmd("BufEnter", {
  group = group,
  pattern  = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then vim.cmd("wincmd L") end
  end,
})


-- ─── Visual feedback ──────────────────────────────────────────────────────────

-- Flash yanked region briefly (like VS Code's copy highlight)
autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})


-- ─── Terminal ─────────────────────────────────────────────────────────────────

-- Clean terminal buffer appearance
autocmd("TermOpen", {
  group = group,
  pattern  = "term://*",
  callback = function()
    vim.opt_local.number         = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn     = "no"
    vim.cmd("startinsert")
  end,
})

-- Return to normal mode when leaving a terminal buffer
autocmd("BufLeave", {
  group = group,
  pattern  = "term://*",
  callback = function() vim.cmd("stopinsert") end,
})
