return {
  'rmehri01/onenord.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local colors = require("onenord.colors").load()
    require("onenord").setup({
      custom_highlights = {
        ["FloatBorder"] = { fg = colors.dark_blue, bg = colors.bg }
      }
    })
    vim.cmd.colorscheme("onenord")
  end
}
