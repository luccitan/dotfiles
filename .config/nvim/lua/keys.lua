local map = vim.api.nvim_set_keymap
local defaults = { noremap = true, silent = true }

-- remap the key used to leave insert mode
map('i', 'jj', '<esc>', defaults)

-- Toggle nvim-tree
map('n', 'n', [[:NvimTreeToggle]], {})
