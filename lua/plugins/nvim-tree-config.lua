return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- Set global variable for tree width
            vim.g.nvim_tree_width = 25

            -- nvim-tree setup
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
            })

            -- Auto-close nvim-tree when it's the last buffer
            vim.cmd([[
            autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
            ]])
        end,
    },
}
