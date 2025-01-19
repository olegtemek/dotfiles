return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() 
    vim.g.barbar_auto_setup = false 
    vim.keymap.set('n', '<leader><tab>','<cmd>BufferNext<cr>')
    vim.keymap.set('n', '<leader>w','<cmd>BufferClose<cr>')
  end,
  opts = {
  }
}