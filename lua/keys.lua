-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>", "<Nop>", { silent = true, remap = false })
vim.keymap.set('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
vim.keymap.set('n', "Dw", ":call vimspector#AddWatch()<cr>")
vim.keymap.set('n', "De", ":call vimspector#Evaluate()<cr>")

-- FloaTerm configuration
vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set('n', "<leader>t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ bufnr = 0 })
end)
