return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local tree_sitter = require("nvim-treesitter.configs")
    tree_sitter.setup({
      ensure_installed = {"lua","javascript","typescript","c","html","css","json","markdown","tsx","yaml"},
      highlight = {enable = true },
      indent = {enable = true}
    })

  end
  }
