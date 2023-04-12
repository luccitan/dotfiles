-- smart search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- tabs are two spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- line break configuration
vim.opt.textwidth = 99
vim.opt.colorcolumn = {100, 120}
vim.opt.breakindent = true
vim.opt.linebreak = true

-- show line numbers and highlight cursor line number
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'line,number'


vim.opt.termguicolors = true   -- 24-bit RGB color in the TUI
vim.opt.undofile = true        -- persistent undo history
vim.opt.showmode = true        -- DO show mode message on last line
vim.opt.hidden = true          -- switch buffers without having to save changes
vim.opt.joinspaces = false     -- insert one space when joining two sentences
vim.opt.confirm = true         -- raise dialog asking to save changes when commands like ':q' fail
vim.opt.title = true           -- set terminal window title to something descriptive
vim.opt.virtualedit = "block"  -- virtual editing in visual block mode
vim.opt.shortmess:append("I")  -- don't give intro message when starting vim

-- Variables
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

