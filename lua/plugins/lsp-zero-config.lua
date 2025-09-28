return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "L3MON4D3/LuaSnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    local lspconfig    = require("lspconfig")
    local util         = require("lspconfig.util")
    local blink        = require("blink.cmp")
    local capabilities = blink.get_lsp_capabilities()

    local function on_attach(client, buf)
      vim.notify("LSP attached: " .. client.name .. " → " .. vim.api.nvim_buf_get_name(buf))
    end

    require("fidget").setup({})
    require("mason").setup({
      ui = { border = "rounded" },
    })

    -- Helper: attach capabilities and any common opts
    local function setup(server, opts)
      opts = opts or {}
      opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
      lspconfig[server].setup(opts)
    end

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "svelte",
        -- "ts_ls",
        "gopls",
        -- "zls"   -- enable if you use Zig
      },
      handlers = {
        -- default
        function(server_name)
          setup(server_name, {})
        end,

        -- Zig
        zls = function()
          setup("zls", {
            root_dir = util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
              zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
              },
            },
          })
          vim.g.zig_fmt_parse_errors = 0
          vim.g.zig_fmt_autosave = 0
        end,

        -- Lua
        lua_ls = function()
          setup("lua_ls", {
            settings = {
              Lua = {
                diagnostics = { globals = { "vim", "it", "describe", "before_each", "after_each" } },
                workspace = { checkThirdParty = false },
                completion = { callSnippet = "Replace" },
              },
            },
          })
        end,

        -- TypeScript and JavaScript
        -- ts_ls = function()
        --   setup("ts_ls", {
        --     cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio" },
        --     on_attach = on_attach,
        --     root_dir = util.root_pattern("tsconfig.json", "package.json", ".git"),
        --     filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        --     single_file_support = true,
        --   })
        -- end,

        -- Svelte (disable eslint LSP auto-start unless you want it)
        svelte = function()
          -- optional: keep eslint off by default
          pcall(function() lspconfig.eslint.setup({ autostart = false }) end)
          setup("svelte", {})
        end,
      },
    })

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
