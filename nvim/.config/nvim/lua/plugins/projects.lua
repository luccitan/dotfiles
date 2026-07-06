return {

  -- Detect project root (git / lockfile / config) and auto-change cwd on file open
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",

    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns          = { ".git", "package.json", "pyproject.toml", "Cargo.toml" },
        silent_chdir      = true, -- Don't print the cwd change in the cmdline
      })

      -- <leader>fp  →  pick a recent project, then open its file browser
      vim.keymap.set("n", "<Leader>fp", function()
        local projects = require("project_nvim.utils.history").get_recent_projects()
        require("fzf-lua").fzf_exec(projects, {
          prompt  = "Projects> ",
          actions = {
            ["default"] = function(selected)
              vim.cmd.cd(selected[1])
              vim.schedule(function()
                require("fzf-lua").files({ cwd = selected[1] })
              end)
            end,
          },
        })
      end, { desc = "find project" })
    end,
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
