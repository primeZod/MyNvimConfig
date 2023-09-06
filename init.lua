-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
	    package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    }
})
require("mason-lspconfig").setup()

-- Rust Tools
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})


-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
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
