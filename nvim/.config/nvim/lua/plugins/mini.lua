return {

  -- Auto-close brackets, quotes, etc. as you type
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts  = {},
  },


  -- Comment lines with gcc (line), gc (visual/motion), gcap (paragraph)
  {
    "echasnovski/mini.comment",
    event = { "BufReadPost", "BufNewFile" },
    opts  = {},
  },

}
