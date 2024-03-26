return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local highlights = require("nord").bufferline.highlights({
      italic = true,
      bold = true,
    })

    require("bufferline").setup({
      options = {
        separator_style = "thin",
      },
      highlights = highlights,
    })
    vim.keymap.set("n", "<leader>r", ":bnext<CR>")
    vim.keymap.set("n", "<leader>w", ":bprev<CR>")
  end,
}
