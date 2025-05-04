return {
  -- Git signs in the gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          
          -- Navigation
          vim.keymap.set("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr, desc = "Next Git Hunk" })
          
          vim.keymap.set("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr, desc = "Previous Git Hunk" })
          
          -- Git actions
          vim.keymap.set({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", 
                         { buffer = bufnr, desc = "Stage Hunk" })
          vim.keymap.set({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", 
                         { buffer = bufnr, desc = "Reset Hunk" })
          vim.keymap.set("n", "<leader>gS", gs.stage_buffer, 
                         { buffer = bufnr, desc = "Stage Buffer" })
          vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, 
                         { buffer = bufnr, desc = "Undo Stage Hunk" })
          vim.keymap.set("n", "<leader>gR", gs.reset_buffer, 
                         { buffer = bufnr, desc = "Reset Buffer" })
          vim.keymap.set("n", "<leader>gp", gs.preview_hunk, 
                         { buffer = bufnr, desc = "Preview Hunk" })
          vim.keymap.set("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end, { buffer = bufnr, desc = "Blame Line" })
          vim.keymap.set("n", "<leader>gtb", gs.toggle_current_line_blame, 
                         { buffer = bufnr, desc = "Toggle Line Blame" })
          vim.keymap.set("n", "<leader>gd", gs.diffthis, 
                         { buffer = bufnr, desc = "Diff This" })
          vim.keymap.set("n", "<leader>gD", function()
            gs.diffthis("~")
          end, { buffer = bufnr, desc = "Diff This ~" })
          vim.keymap.set("n", "<leader>gtd", gs.toggle_deleted, 
                         { buffer = bufnr, desc = "Toggle Delete" })
        end,
      })
    end,
  },
  
  -- Full Git integration with Telescope
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      { "<leader>gg", ":Git<CR>", desc = "Open Git status" },
    },
  },
  
  -- Telescope Git Integration
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
    }
  }
}
