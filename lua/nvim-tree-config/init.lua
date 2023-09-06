vim.g.nvim_tree_width = 25
require 'nvim-tree'.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  }
})
vim.cmd [[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
