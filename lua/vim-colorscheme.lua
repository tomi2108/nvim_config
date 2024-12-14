local common_setup = function()
  vim.keymap.set("n", "<leader>fhw", ":Inspect<CR>")
end

local sierra_setup = function()
  local palette = require("addons.sierra-palette")
  vim.cmd.colorscheme("sierra")
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "None", bg = "None" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = palette.inactive, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "None", bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "None", bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "None", bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "None", bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.fg, bg = palette.visual })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "None", bg = "None" })
  vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = "None", fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "None", fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "None", bg = "None" })
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "None", fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "None", fg = "None" })
  vim.api.nvim_set_hl(0, "TSType", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeDefinition", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSConstructor", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeBuiltin", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None", fg = "None" })
  vim.api.nvim_set_hl(0, "YankyYanked", { bg = palette.visual, fg = "None" })
  vim.api.nvim_set_hl(0, "flogBranch0", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch1", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch2", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "flogBranch3", { bg = "None", fg = palette.lilac })
  vim.api.nvim_set_hl(0, "flogBranch4", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "flogBranch5", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch6", { bg = "None", fg = palette.blue })
  vim.api.nvim_set_hl(0, "flogBranch7", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "flogBranch8", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "flogBranch9", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = palette.green, fg = "None" })
  vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = palette.green, fg = palette.background })
  vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = palette.red, fg = "None" })
  vim.api.nvim_set_hl(0, "diffAdded", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "diffRemoved", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "None", fg = palette.green })
  vim.cmd("hi TelescopeSelection guibg=" .. palette.visual .. " guifg=" .. palette.background)
  common_setup()
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
    background = "hard",
    transparent_background_level = 2,
    on_highlights = function(hl, palette)
      hl.FloatBorder = { fg = palette.bg0, bg = "None" }
      hl.TelescopeBorder = { fg = palette.bg0, bg = "None" }
      hl.TelescopeResultsBorder = { fg = palette.bg0, bg = "None" }
      hl.TelescopePromptBorder = { fg = palette.bg0, bg = "None" }
      hl.TelescopePreviewBorder = { fg = palette.bg0, bg = "None" }
      hl.TelescopeSelection = { fg = palette.fg, bg = palette.bg_visual }
      hl.WinSeparator = { fg = palette.bg0, bg = "None" }
      hl.NeoTreeFloatNormal = { bg = palette.bg0, fg = palette.fg }
      hl.NeoTreeFloatTitle = { bg = palette.bg0, fg = palette.fg }
      hl.NeoTreeFloatBorder = { fg = palette.bg0, bg = "None" }
      hl.NeoTreeNormal = { bg = palette.bg0, fg = palette.fg }
      hl.NeoTreeEndOfBuffer = { bg = palette.bg0, fg = "None" }
      hl.TSString = { fg = palette.orange, bg = "None" }
      hl.TSTag = { fg = palette.orange, bg = "None" }
      hl.String = { fg = palette.orange, bg = "None" }
      hl.TSType = { fg = palette.yellow, bg = "None" }
      hl.TSTypeDefinition = { fg = palette.yellow, bg = "None" }
      hl.TSConstructor = { fg = palette.yellow, bg = "None" }
      hl.TSTypeBuiltin = { fg = palette.yellow, bg = "None" }
      hl.String = { fg = palette.orange, bg = "None" }
      hl.EndOfBuffer = { bg = "None", fg = "None" }
      hl.YankyYanked = { bg = palette.bg_visual, fg = "None" }
      hl.flogBranch0 = { bg = "None", fg = palette.green }
      hl.flogBranch1 = { bg = "None", fg = palette.green }
      hl.flogBranch2 = { bg = "None", fg = palette.yellow }
      hl.flogBranch3 = { bg = "None", fg = palette.orange }
      hl.flogBranch4 = { bg = "None", fg = palette.purple }
      hl.flogBranch5 = { bg = "None", fg = palette.green }
      hl.flogBranch6 = { bg = "None", fg = palette.aqua }
      hl.flogBranch7 = { bg = "None", fg = palette.purple }
      hl.flogBranch8 = { bg = "None", fg = palette.red }
      hl.flogBranch9 = { bg = "None", fg = palette.purple }
      hl.DiffAdd = { bg = palette.bg_visual, fg = "None" }
      hl.diffAdded = { bg = "None", fg = palette.green }
      hl.GitSignsDelete = { bg = "None", fg = palette.red }
      hl.GitSignsChange = { bg = "None", fg = palette.aqua }
      hl.GitSignsAdd = { bg = "None", fg = palette.green }
    end,
    colours_override = function(palette)
      for k, v in pairs(custom_colors) do
        palette[k] = v
      end
    end,
  })
  vim.cmd.colorscheme("everforest")
  vim.cmd("hi TelescopeSelection guibg=" .. custom_colors.bg_visual)
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

local rose_pine_setup = function()
  require("rose-pine").setup({})
  vim.o.background = "dark"
  vim.cmd.colorscheme("rose-pine")
  common_setup()
end

local darkearth_setup = function()
  local palette = require("addons.darkearth-palette")
  vim.cmd.colorscheme("darkearth")
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.fg, bg = palette.visual })
  vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = palette.background, bg = palette.visual })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = palette.background, fg = "None" })
  vim.api.nvim_set_hl(0, "TSString", { fg = palette.purple, bg = "None" })
  vim.api.nvim_set_hl(0, "TSType", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeDefinition", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSConstructor", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeBuiltin", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag", { fg = palette.cyan, bg = "None" })
  vim.api.nvim_set_hl(0, "@function.tsx", { fg = palette.cyan, bg = "None" })
  vim.api.nvim_set_hl(0, "@variable.parameter.tsx", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag.attribute", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag.builtin.javascript", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag.javascript", { fg = palette.purple, bg = "None" })
  vim.api.nvim_set_hl(0, "@keyword.operator.javascript", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@constructor.javascript", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@lsp.type.class.javascript", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = palette.red, bg = "None" })
  vim.api.nvim_set_hl(0, "Number", { fg = palette.red, bg = "None" })
  vim.api.nvim_set_hl(0, "String", { fg = palette.purple, bg = "None" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None", fg = "None" })
  vim.api.nvim_set_hl(0, "YankyYanked", { bg = palette.green, fg = "None" })
  vim.api.nvim_set_hl(0, "flogBranch0", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch1", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch2", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "flogBranch3", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "flogBranch4", { bg = "None", fg = palette.purple })
  vim.api.nvim_set_hl(0, "flogBranch5", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch6", { bg = "None", fg = palette.blue })
  vim.api.nvim_set_hl(0, "flogBranch7", { bg = "None", fg = palette.purple })
  vim.api.nvim_set_hl(0, "flogBranch8", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "flogBranch9", { bg = "None", fg = palette.purple })
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = palette.green, fg = "None" })
  vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = palette.green, fg = palette.background })
  vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = palette.red, fg = "None" })
  vim.api.nvim_set_hl(0, "diffAdded", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "diffRemoved", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "Error", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "DapUIDecoration", { bg = "None", fg = palette.background })
  vim.api.nvim_set_hl(0, "DapUIFloatBorder", { bg = "None", fg = palette.background })
  vim.api.nvim_set_hl(0, "DapUIType", { bg = "None", fg = palette.blue })
  vim.api.nvim_set_hl(0, "LineNr", { bg = palette.background, fg = palette.green })
  vim.api.nvim_set_hl(0, "LineNrAbove", { bg = palette.background, fg = palette.disabled })
  vim.api.nvim_set_hl(0, "LineNrBelow", { bg = palette.background, fg = palette.disabled })
  vim.api.nvim_set_hl(0, "OilDir", { bg = palette.background, fg = palette.green })
  common_setup()
end

local react_setup = function()
  local palette = require("addons.react-palette")
  vim.cmd.colorscheme("text-to-colorscheme")
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.fg, bg = palette.visual })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = palette.background, fg = "None" })
  vim.api.nvim_set_hl(0, "TSString", { fg = palette.purple, bg = "None" })
  vim.api.nvim_set_hl(0, "TSType", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeDefinition", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSConstructor", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeBuiltin", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag", { fg = palette.cyan, bg = "None" })
  vim.api.nvim_set_hl(0, "@function.tsx", { fg = palette.cyan, bg = "None" })
  vim.api.nvim_set_hl(0, "@variable.parameter.tsx", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag.attribute", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "@tag.builtin.javascript", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "@keyword.operator.javascript", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@constructor.javascript", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "@lsp.type.class.javascript", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "Function", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = palette.red, bg = "None" })
  vim.api.nvim_set_hl(0, "Number", { fg = palette.red, bg = "None" })
  vim.api.nvim_set_hl(0, "Special", { fg = palette.blue, bg = "None" })
  vim.api.nvim_set_hl(0, "String", { fg = palette.purple, bg = "None" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None", fg = "None" })
  vim.api.nvim_set_hl(0, "YankyYanked", { bg = palette.purple, fg = "None" })
  vim.api.nvim_set_hl(0, "flogBranch0", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch1", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch2", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "flogBranch3", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "flogBranch4", { bg = "None", fg = palette.purple })
  vim.api.nvim_set_hl(0, "flogBranch5", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch6", { bg = "None", fg = palette.blue })
  vim.api.nvim_set_hl(0, "flogBranch7", { bg = "None", fg = palette.purple })
  vim.api.nvim_set_hl(0, "flogBranch8", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "flogBranch9", { bg = "None", fg = palette.purple })
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = palette.green, fg = "None" })
  vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = palette.green, fg = palette.background })
  vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = palette.red, fg = "None" })
  vim.api.nvim_set_hl(0, "diffAdded", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "diffRemoved", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "Error", { bg = "None", fg = palette.red })
  common_setup()
end

local lilac_garden_setup = function()
  local palette = require("addons.lilac-garden-palette")
  vim.cmd.colorscheme("text-to-colorscheme")
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.fg, bg = palette.visual })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = palette.background, fg = "None" })
  vim.api.nvim_set_hl(0, "TSString", { fg = palette.lilac, bg = "None" })
  vim.api.nvim_set_hl(0, "TSType", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeDefinition", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSConstructor", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeBuiltin", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "String", { fg = palette.lilac, bg = "None" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None", fg = "None" })
  vim.api.nvim_set_hl(0, "YankyYanked", { bg = palette.cyan, fg = "None" })
  vim.api.nvim_set_hl(0, "flogBranch0", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch1", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch2", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "flogBranch3", { bg = "None", fg = palette.lilac })
  vim.api.nvim_set_hl(0, "flogBranch4", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "flogBranch5", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch6", { bg = "None", fg = palette.blue })
  vim.api.nvim_set_hl(0, "flogBranch7", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "flogBranch8", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "flogBranch9", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = palette.visual, fg = "None" })
  vim.api.nvim_set_hl(0, "diffAdded", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "None", fg = palette.lilac })
  vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "Error", { bg = "None", fg = palette.magenta })
  common_setup()
end

local zenbones_setup = function()
  local palette = require("addons.zenwritten-palette")
  common_setup()
  vim.cmd.colorscheme("zenwritten")
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.background, bg = "None" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = palette.inactive, bg = "None" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = palette.background, bg = palette.background })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = palette.background, bg = palette.background })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = palette.background, bg = palette.background })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = palette.background, bg = palette.background })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.fg, bg = palette.visual })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.background, bg = palette.background })
  vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = palette.background, bg = palette.background })
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = palette.background, fg = palette.fg })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = palette.background, fg = palette.background })
  vim.api.nvim_set_hl(0, "TSType", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeDefinition", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSConstructor", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "TSTypeBuiltin", { fg = palette.yellow, bg = "None" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None", fg = "None" })
  vim.api.nvim_set_hl(0, "YankyYanked", { bg = palette.visual, fg = "None" })
  vim.api.nvim_set_hl(0, "Search", { bg = palette.visual, fg = "None" })
  vim.api.nvim_set_hl(0, "flogBranch0", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch1", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch2", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "flogBranch3", { bg = "None", fg = palette.lilac })
  vim.api.nvim_set_hl(0, "flogBranch4", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "flogBranch5", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "flogBranch6", { bg = "None", fg = palette.blue })
  vim.api.nvim_set_hl(0, "flogBranch7", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "flogBranch8", { bg = "None", fg = palette.cyan })
  vim.api.nvim_set_hl(0, "flogBranch9", { bg = "None", fg = palette.magenta })
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = palette.green, fg = "None" })
  vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = palette.green, fg = palette.background })
  vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = palette.red, fg = "None" })
  vim.api.nvim_set_hl(0, "diffAdded", { bg = "None", fg = palette.green })
  vim.api.nvim_set_hl(0, "diffRemoved", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "None", fg = palette.red })
  vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "None", fg = palette.yellow })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "None", fg = palette.green })
end

return {
  everforest_setup = everforest_setup,
  zenbones_setup = zenbones_setup,
  solarized_osaka_setup = solarized_osaka_setup,
  rose_pine_setup = rose_pine_setup,
  lilac_garden_setup = lilac_garden_setup,
  react_setup = react_setup,
  darkearth_setup = darkearth_setup,
  sierra_setup = sierra_setup,
}
