require("nvim-tree").setup({
    renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "icon",
        indent_width = 1,
        icons = {
            webdev_colors = false,
        }
    },
})
