local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
-- lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    formatting = lsp.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'lua_ls',
        'rust_analyzer',
        'prismals',
        'gopls',
        'html',
        'emmet_language_server',
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    lsp.buffer_autoformat()
    lsp.default_keymaps({ buffer = bufnr })

    --  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    --  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    --  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    --  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    --  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    --  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    --  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    --  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    --  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    --  vim.keymap.set("i", "<C-H>", function() vim.lsp.buf.signature_help() end, opts)
    --  vim.keymap.set('n', '<C-w>d', '<Cmd>split <bar> Telescope lsp_definitions<CR>', opts)
end)


lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

vim.diagnostic.config({
    virtual_text = true
})
