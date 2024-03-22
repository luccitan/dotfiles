return {
  -- Telescope plugin
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },

    init = function ()
      local telescope = require('telescope')
      telescope.load_extension('command_palette')
      -- telescope.load_extension('workspaces')
    end,

    config = true,

    opts = {
      defaults = {
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
          }
        }
      },
      extensions = {
        workspaces = {
          -- keep insert mode after selection in the picker, default is false
          keep_insert = true,
        }
      }
    }
  },

  -- Telescope extension: command palette
  {
    'LinArcX/telescope-command-palette.nvim',
    lazy = true,
  },

}



