return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    require("neogit").setup({
      integrations = {
        telescope = true,
        diffview = true,
        fzf_lua = true,
      },
    })
    vim.keymap.set("n", "<leader>gg", ":Neogit<CR>")
    vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>")
    vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>")
    vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>")
    vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>")
  end,
}
