-- Treesitter Plugin Setup
require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "rust", "toml" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

require('keys')
require('set')
require('telescope-config')
require('whichkey-config')
require('nvim-tree-config')
require('lualine-config')
require('colorscheme-config')
require('catppuccin-config')
require('harpoon-config')
require('lsp-zero-config')
require('treesitter-config')

require('rust-config')
