local custom_colors = require("addons.everforest-palette")
require("everforest").setup({
  on_highlights = function(hl, palette)
    hl.FloatBorder = { fg = palette.grey1, bg = "none" }
    hl.NeoTreeFloatNormal = { bg = "none", fg = palette.grey1 }
    hl.NeoTreeFloatTitle = { bg = "none", fg = palette.grey1 }
    hl.NeoTreeFloatBorder = { fg = palette.grey1, bg = "none" }
    hl.NeoTreeNormal = { bg = "none" }
    hl.NeoTreeEndOfBuffer = { bg = "none", fg = palette.bg0 }
    hl.TSString = { fg = palette.orange, bg = "none" }
    hl.String = { fg = palette.orange, bg = "none" }
    hl.EndOfBuffer = { bg = "none", fg = palette.bg0 }
  end,
  colours_override = function(palette)
    for k, v in pairs(custom_colors) do
      palette[k] = v
    end
  end,
})

vim.cmd.colorscheme("everforest")
