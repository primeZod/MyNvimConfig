return     {
        "folke/which-key.nvim",
         event = "VeryLazy",
        config = function()
            	vim.o.timeout = true
            	vim.o.timeoutlen = 300
                local wk = require("which-key")

                local mappings = {
                    q = {":q<cr>", "Quit"},
                    Q = {":wq<cr>", "Save & Quit"},
                    w = {":w<cr>", "Write"},
                    s = {":so<cr>", "Source File"},
                    h = {"<C-w>h", "Move to left pane"},
                    l = {"<C-w>l", "Move to right pane"},
                    k = {"<C-w>k", "Move to top pane"},
                    j = {"<C-w>j", "Move to bottom pane"},
                    x = {":bdelete<cr>", "Close"},
                    E = {":e ~/.config/nvim/init.lua", "Edit config"},
                    f = { ":Telescope find_files<cr>", "Telescope Find File" },
                    g = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
                    v = { ":NvimTreeToggle<cr>", "File structure view" },
                    F = { "f<cr>", "Format document"},
                    N = { ":bn<cr>", "Next buffer"},
                    P = { ":bp<cr>", "Prev buffer"},
                }

                local tmux_mappings = {
                    h = { "<cmd> TmuxNavigateLeft<CR>", "window Left" },
                    j = { "<cmd> TmuxNavigateDown<CR>", "window Down" },
                    k = { "<cmd> TmuxNavigateUp<CR>", "window Up" },
                    l = { "<cmd> TmuxNavigateRight<CR>", "window Right" }
                }

                local opts = { prefix = '<leader>' }
                local tmux_opts = { prefix = '<cmd>' }
                wk.register(mappings, opts)
        end
}

