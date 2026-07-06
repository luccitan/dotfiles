return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {

      -- Global picker window style
      winopts = {
        border  = "rounded",
        preview = {
          border = "rounded",
          layout = "flex", -- Switch between horizontal/vertical based on window size
        },
      },

      -- Key bindings active inside the fzf window
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept", -- Send all results to quickfix list
        },
      },

    },
    ---@diagnostic enable: missing-fields
  },
}
