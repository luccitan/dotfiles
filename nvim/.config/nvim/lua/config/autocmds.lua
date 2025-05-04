local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto format on save (like VSCode)
local format_augroup = augroup("LspFormatting", {})

-- Auto remove trailing whitespace
autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Restore cursor position when opening a file
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto create directories when saving a file
autocmd("BufWritePre", {
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    local dir = vim.fn.fnamemodify(file, ":p:h")
    local res = vim.fn.isdirectory(dir)

    if res == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Auto resize splits when window is resized
autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end,
})

-- Highlight yanked text briefly (VSCode-like visual feedback)
local highlight_yank = augroup("HighlightYank", {})
autocmd("TextYankPost", {
  group = highlight_yank,
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })
  end,
})

-- AutoSave (like VSCode's autosave feature)
-- Note: Uncomment this if you want autosave
-- autocmd("TextChanged", {
--   pattern = "*",
--   callback = function()
--     if vim.bo.modified and
--     not vim.bo.readonly and
--     vim.bo.buftype == "" and
--     vim.fn.expand("%") ~= "" then
--       vim.api.nvim_command("silent update")
--     end
--   end,
-- })

-- Auto close nvim-tree when it's the last window
autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= "" then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-- Open help windows to the right
autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd L")
    end
  end,
})

-- Auto format on save using LSP
autocmd("BufWritePre", {
  group = format_augroup,
  callback = function()
    local filetype = vim.bo.filetype
    local format_filetypes = {
      "javascript", "typescript", "typescriptreact", "javascriptreact",
      "css", "scss", "html", "json", "yaml", "markdown", 
      "python", "go", "lua", "rust"
    }
    
    -- Check if the current filetype should be formatted
    local should_format = false
    for _, ft in ipairs(format_filetypes) do
      if ft == filetype then
        should_format = true
        break
      end
    end
    
    if should_format then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

-- Terminal settings
autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})

-- Exit terminal mode when switching buffers
autocmd("BufLeave", {
  pattern = "term://*",
  callback = function()
    vim.cmd("stopinsert")
  end,
})