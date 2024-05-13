local custom_colors = require("addons.everforest-palette")
require("everforest").setup({
  on_highlights = function(hl, palette)
    hl.FloatBorder = { fg = palette.fg, bg = "none" }
    hl.NeoTreeFloatNormal = { bg = "none", fg = palette.fg }
    hl.NeoTreeFloatTitle = { bg = "none", fg = palette.fg }
    hl.NeoTreeFloatBorder = { fg = palette.fg, bg = "none" }
    hl.NeoTreeNormal = { bg = "none", fg = palette.fg }
    hl.NeoTreeEndOfBuffer = { bg = "none", fg = "none" }
    hl.TSString = { fg = palette.orange, bg = "none" }
    hl.String = { fg = palette.orange, bg = "none" }
    hl.EndOfBuffer = { bg = "none", fg = "none" }
  end,
  colours_override = function(palette)
    for k, v in pairs(custom_colors) do
      palette[k] = v
    end
  end,
})

vim.cmd.colorscheme("everforest")
