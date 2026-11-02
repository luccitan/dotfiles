return {

  -- Auto-close brackets, quotes, etc. as you type
  {
    "nvim-mini/mini.pairs",
    event = "InsertEnter",
    opts  = {},
  },


  -- Comment lines with gcc (line), gc (visual/motion), gcap (paragraph)
  {
    "nvim-mini/mini.comment",
    event = { "BufReadPost", "BufNewFile" },
    opts  = {},
  },

}
