vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus" 

vim.keymap.set('n', '<leader>s', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})