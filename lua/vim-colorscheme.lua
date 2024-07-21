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
		hl.FloatBorder = { fg = palette.fg, bg = "none" }
		hl.NeoTreeFloatNormal = { bg = "none", fg = palette.fg }
		hl.NeoTreeFloatTitle = { bg = "none", fg = palette.fg }
		hl.NeoTreeFloatBorder = { fg = palette.fg, bg = "none" }
		hl.NeoTreeNormal = { bg = "none", fg = palette.fg }
		hl.NeoTreeEndOfBuffer = { bg = "none", fg = "none" }
		hl.TSString = { fg = palette.orange, bg = "none" }
		hl.String = { fg = palette.orange, bg = "none" }
		hl.EndOfBuffer = { bg = "none", fg = "none" }
		hl.YankyYanked = { bg = palette.bg_visual, fg = "none" }
	end,
	colours_override = function(palette)
		for k, v in pairs(custom_colors) do
			palette[k] = v
		end
	end,
})

vim.cmd.colorscheme("everforest")
