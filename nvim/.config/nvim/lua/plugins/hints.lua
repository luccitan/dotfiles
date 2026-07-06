return {
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",

    opts = {
      startVisible     = true,  -- Show hints right away (toggle with <leader>th)
      showBlankVirtLine = false, -- Don't insert an empty virtual line below hints

      -- Inline hints shown above the current line (higher prio = displayed first)
      hints = {
        Caret        = { text = "^", prio = 2 },  -- First non-blank character
        Dollar       = { text = "$", prio = 1 },  -- End of line
        MatchingPair = { text = "%", prio = 5 },  -- Jump to matching bracket
        Zero         = { text = "0", prio = 1 },  -- Column 0
        w            = { text = "w", prio = 10 }, -- Next word start
        b            = { text = "b", prio = 9 },  -- Previous word start
        e            = { text = "e", prio = 8 },  -- Next word end
        W            = { text = "W", prio = 7 },  -- Next WORD start (whitespace-delimited)
        B            = { text = "B", prio = 6 },  -- Previous WORD start
        E            = { text = "E", prio = 5 },  -- Next WORD end
      },

      -- Gutter hints on the left side for vertical navigation
      gutterHints = {
        G             = { text = "G",  prio = 10 }, -- Last line of file
        gg            = { text = "gg", prio = 9 },  -- First line of file
        PrevParagraph = { text = "{",  prio = 8 },  -- Previous paragraph
        NextParagraph = { text = "}",  prio = 8 },  -- Next paragraph
      },
    },

    config = function(_, o)
      require("precognition").setup(o)

      local function set_hl()
        local comment_fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg
        vim.api.nvim_set_hl(0, "PrecognitionHighlight", { fg = comment_fg, bg = "NONE" })
      end
      set_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })

      vim.keymap.set("n", "<Leader>th", function()
        require("precognition").toggle()
      end, { desc = "toggle motion hints" })
    end,
  },
}
