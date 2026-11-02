return {
  -- Git signs in the gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      attach_to_untracked = true,
      preview_config = { border = "single" },
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buf = bufnr, silent = true, desc = desc })
        end

        for lhs, direction in pairs({ ["]c"] = "next", ["[c"] = "prev" }) do
          map("n", lhs, function()
            if vim.wo.diff then
              vim.cmd.normal({ args = { vim.v.count1 .. lhs }, bang = true })
            else
              gs.nav_hunk(direction)
            end
          end, direction .. " git hunk")
        end

        map({ "n", "x" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "stage / unstage hunk")
        map({ "n", "x" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "reset hunk")
        map("n", "<leader>gS", gs.stage_buffer, "stage buffer")
        map("n", "<leader>gu", gs.stage_hunk, "stage / unstage hunk at cursor")
        map("n", "<leader>gR", gs.reset_buffer, "reset buffer")
        map("n", "<leader>gp", gs.preview_hunk, "preview hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "blame line")
        map("n", "<leader>gtb", gs.toggle_current_line_blame, "toggle line blame")
        map("n", "<leader>gd", gs.diffthis, "diff against index")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "diff against previous commit")
        map("n", "<leader>gtd", gs.preview_hunk_inline, "preview deleted lines inline")
      end,
    },
  },
}
