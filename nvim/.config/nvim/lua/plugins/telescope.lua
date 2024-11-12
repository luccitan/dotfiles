local file_browser_extension = {
  theme = "ivy",
  -- disables netrw and use telescope-file-browser in its place
  hijack_netrw = true,
  mappings = {
    ["i"] = {
      -- your custom insert mode mappings
    },
    ["n"] = {
      -- your custom normal mode mappings
    },
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    cmd = "Telescope", -- Load Telescope when command is used
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-n>"] = "move_selection_next",
              ["<C-p>"] = "move_selection_previous",
              ["<C-c>"] = "close",
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
            hidden = true,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
          },
        },
        extensions = {
          file_browser = file_browser_extension
        },
      })

      -- Load Telescope extensions if needed
      telescope.load_extension("workspaces")
      telescope.load_extension("project")
      telescope.load_extension("file_browser")
    end,
  },

  -- Telescope File Browser extension
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- Telescope project extension
  {
      "nvim-telescope/telescope-project.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
}