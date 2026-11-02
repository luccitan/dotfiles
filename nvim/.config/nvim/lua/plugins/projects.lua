return {

  -- Detect project root (git / lockfile / config) and auto-change cwd on file open
  {
    "DrKJeff16/project.nvim",
    event = "VeryLazy",
    dependencies = { "ibhagwan/fzf-lua" },

    opts = {
      patterns = { ".git", "package.json", "pyproject.toml", "Cargo.toml" },
      fzf_lua = { enabled = true },
    },
    main = "project",
    keys = {
      { "<Leader>fp", "<Cmd>Project fzf-lua<CR>", desc = "find project" },
    },
  },


  -- Save and restore the session (open buffers, splits, cursor) per project directory
  {
    "rmagatti/auto-session",
    lazy = false, -- Must load at startup to restore the previous session

    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/" }, -- Never auto-save these
    },
  },

}
