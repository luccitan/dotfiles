return {
    {
        "natecraddock/workspaces.nvim",
        lazy = false,
        opts = {
            hooks = {
                open = {
                    "NvimTreeOpen",
                    "Telescope find_files"
                },
            }
        }
    },
}