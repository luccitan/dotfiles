return {
  -- Nvim tree main plugin
  {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      sync_root_with_cwd = true,
      renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "icon",
        indent_width = 1,
        icons = {
          webdev_colors = false,
        }
      },
    }
  }
}
