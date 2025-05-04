-- Basic editor settings
vim.opt.ignorecase = true        -- Case insensitive search
vim.opt.smartcase = true         -- But case sensitive when uppercase present
vim.opt.tabstop = 2              -- Number of spaces tabs count for
vim.opt.softtabstop = 2          -- Number of spaces of tab while editing
vim.opt.shiftwidth = 2           -- Size of an indent
vim.opt.expandtab = true         -- Use spaces instead of tabs
vim.opt.textwidth = 99           -- Maximum width of text
vim.opt.colorcolumn = {100, 120} -- Color columns for visual reference
vim.opt.breakindent = true       -- Enable indent on wrapped lines
vim.opt.linebreak = true         -- Break lines at words
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true    -- Show relative line numbers
vim.opt.cursorline = true        -- Highlight the current line
vim.opt.cursorlineopt = 'line,number' -- Highlight both line and number
vim.opt.showmode = false         -- Don't show mode (shown in lualine)
vim.opt.hidden = true            -- Enable switching buffer without saving
vim.opt.joinspaces = false       -- No double spaces with join after a dot
vim.opt.confirm = true           -- Prompt to save before closing
vim.opt.title = true             -- Show filename in title bar
vim.opt.virtualedit = "block"    -- Position cursor anywhere in visual block
vim.opt.timeoutlen = 300         -- Time to wait for a mapped sequence
vim.opt.updatetime = 100         -- Faster completion (default: 4000ms)
vim.opt.scrolloff = 8            -- Min num of lines to keep above/below cursor
vim.opt.sidescrolloff = 8        -- Min num of cols to keep left/right of cursor
vim.opt.mouse = "a"              -- Enable mouse in all modes
vim.opt.termguicolors = true     -- True color support
vim.opt.undofile = true          -- Persistent undo
vim.opt.undolevels = 10000       -- Maximum number of changes that can be undone
vim.opt.signcolumn = "yes"       -- Always show the signcolumn
vim.opt.splitright = true        -- Vertical splits to the right
vim.opt.splitbelow = true        -- Horizontal splits to the bottom
vim.opt.list = true              -- Show some invisible characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.laststatus = 3           -- Global statusline
vim.opt.shortmess:append("c")    -- Don't pass messages to |ins-completion-menu|
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Better completion experience
vim.opt.pumheight = 10           -- Max number of items in popup menu
vim.opt.conceallevel = 0         -- Don't hide quotes in markdown
vim.opt.foldlevelstart = 99      -- Start with all folds open
vim.opt.foldenable = true        -- Enable folding
vim.opt.foldmethod = "expr"      -- Use treesitter for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Variables
vim.g.mapleader = " "            -- Set leader key to space
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1           -- Disable netrw
vim.g.loaded_netrwPlugin = 1

-- Disable some builtin plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Highlight yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remember cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- VSCode-like handling of word wrap navigation
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- VSCode-like tab handling
vim.opt.smarttab = true

-- Auto resize panes when resizing nvim window
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- More VSCode-like behavior
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.wrap = true               -- Wrap long lines
vim.opt.whichwrap:append("<,>,[,],h,l") -- Allow specified keys to move to the previous/next line
vim.opt.swapfile = false          -- No swap file (more VSCode-like)
vim.opt.autowrite = true          -- Auto write before certain commands

-- Better default backspace behavior (like modern editors)
vim.opt.backspace = "indent,eol,start"

-- Auto completion settings
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.wildoptions = "pum"            -- Show completion matches in a popup menu