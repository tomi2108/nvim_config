return {
  "aaronik/treewalker.nvim",
  config = function()
    require("treewalker").setup({ highlight = true})
    vim.api.nvim_set_keymap('n', '<M-j>', ':Treewalker Down<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<M-k>', ':Treewalker Up<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<M-h>', ':Treewalker Left<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<M-l>', ':Treewalker Right<CR>', { noremap = true })
  end
}
