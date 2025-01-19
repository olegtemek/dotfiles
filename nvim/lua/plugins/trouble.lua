return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    focus = true,
  },
  cmd = "Trouble",
  keys = {
    { "<leader>ge", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
  },
}