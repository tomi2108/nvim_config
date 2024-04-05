require("everforest").setup({
  on_highlights = function(hl, palette)
    hl.FloatBorder = { fg = palette.grey1, bg = palette.bg0 }
    hl.NeoTreeFloatNormal = { bg = palette.bg0, fg = palette.grey1 }
    hl.NeoTreeFloatTitle = { bg = palette.bg0, fg = palette.grey1 }
    hl.NeoTreeFloatBorder = { fg = palette.grey1, bg = palette.bg0 }
    hl.NeoTreeNormal = { bg = palette.bg0 }
    hl.NeoTreeEndOfBuffer = { bg = palette.bg0, fg = palette.bg0 }
    hl.TSString = { fg = palette.orange, bg = palette.none }
    hl.String = { fg = palette.orange, bg = palette.none }
  end,
})

vim.cmd.colorscheme("everforest")
