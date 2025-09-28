return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local blink = require("blink.cmp")
    require("typescript-tools").setup({
      capabilities = blink.get_lsp_capabilities(),
      root_dir = require("lspconfig.util").root_pattern("tsconfig.json","package.json",".git"),
      on_attach = function(c,b) vim.notify("TT attached: "..vim.api.nvim_buf_get_name(b)) end,
    })
  end,
}

