return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        opleader = {
          line = 'gc',
          block = 'gb',
        },
        mappings = {
          basic = true,
          extra = true,
        },
        pre_hook = nil,
        post_hook = nil,
      })
      
      -- Create custom command for VSCode-like toggling
      vim.api.nvim_create_user_command('CommentToggle', function()
        local mode = vim.api.nvim_get_mode().mode
        if mode == 'n' then
          require('Comment.api').toggle.linewise.current()
        elseif mode == 'v' or mode == 'V' or mode == '' then
          local start_line = vim.fn.line("'<")
          local end_line = vim.fn.line("'>")
          for line = start_line, end_line do
            vim.api.nvim_win_set_cursor(0, {line, 0})
            require('Comment.api').toggle.linewise.current()
          end
        end
      end, {})
    end,
  },
}