return require('packer').startup(function()
    -- other plugins...
    use { "wbthomason/packer.nvim" }
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- Rust Config
    use 'simrat39/rust-tools.nvim'

    -- Useful completion sources:
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use "jose-elias-alvarez/null-ls.nvim"
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    -- other plugins...
    use 'puremourning/vimspector'
    use 'voldikss/vim-floaterm'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use 'navarasu/onedark.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        options = {
            theme = 'sonokai'
        }
    }
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'
    use { "alexghergh/nvim-tmux-navigation" }
end)
