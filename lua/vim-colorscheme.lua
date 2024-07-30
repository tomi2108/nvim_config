local common_setup = function()
  vim.keymap.set("n", "<leader>fhw", function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    print(vim.inspect(result))
  end)
end
local everforest_setup = function()
  local custom_colors = require("addons.everforest-palette")
  require("everforest").setup({
    italics = true,
    disable_italic_comments = false,
    ui_contrast = "low",
    sign_column_background = "none",
    dim_inactive_windows = false,
    diagnostic_text_highlight = false,
    diagnostic_virtual_text = "coloured",
    diagnostic_line_highlight = false,
    spell_foreground = false,
    show_eob = false,
    float_style = "dim",
    inlay_hints_background = "none",
    background = "medium",
    transparent_background_level = 2,
    on_highlights = function(hl, palette)
      hl.FloatBorder = { fg = palette.bg0, bg = "none" }
      hl.TelescopeBorder = { fg = palette.bg0, bg = "none" }
      hl.TelescopeSelection = { fg = palette.fg, bg = palette.bg_visual }
      hl.NeoTreeFloatNormal = { bg = "none", fg = palette.fg }
      hl.NeoTreeFloatTitle = { bg = "none", fg = palette.fg }
      hl.NeoTreeFloatBorder = { fg = palette.bg0, bg = "none" }
      hl.NeoTreeNormal = { bg = "none", fg = palette.fg }
      hl.NeoTreeEndOfBuffer = { bg = "none", fg = "none" }
      hl.TSString = { fg = palette.orange, bg = "none" }
      hl.TSType = { fg = palette.yellow, bg = "none" }
      hl.TSTypeDefinition = { fg = palette.yellow, bg = "none" }
      hl.TSConstructor = { fg = palette.yellow, bg = "none" }
      hl.TSTypeBuiltin = { fg = palette.yellow, bg = "none" }
      hl.String = { fg = palette.orange, bg = "none" }
      hl.EndOfBuffer = { bg = "none", fg = "none" }
      hl.YankyYanked = { bg = palette.bg_visual, fg = "none" }
      hl.flogBranch0 = { bg = "none", fg = palette.green }
      hl.flogBranch1 = { bg = "none", fg = palette.green }
      hl.flogBranch2 = { bg = "none", fg = palette.yellow }
      hl.flogBranch3 = { bg = "none", fg = palette.orange }
      hl.flogBranch4 = { bg = "none", fg = palette.purple }
      hl.flogBranch5 = { bg = "none", fg = palette.green }
      hl.flogBranch6 = { bg = "none", fg = palette.aqua }
      hl.flogBranch7 = { bg = "none", fg = palette.purple }
      hl.flogBranch8 = { bg = "none", fg = palette.red }
      hl.flogBranch9 = { bg = "none", fg = palette.purple }
    end,
    colours_override = function(palette)
      for k, v in pairs(custom_colors) do
        palette[k] = v
      end
    end,
  })
  vim.cmd("hi TelescopeSelection guibg=" .. custom_colors.bg_visual)
  vim.cmd.colorscheme("everforest")
  common_setup()
end

local solarized_osaka_setup = function()
  require("solarized-osaka").setup({
    transparent = false,
  })
  vim.o.background = "dark"
  vim.cmd.colorscheme("solarized-osaka-storm")
  common_setup()
end

return {
  everforest_setup = everforest_setup,
  solarized_osaka_setup = solarized_osaka_setup,
}
