local custom_colors = require("addons.everforest-palette")
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
	colours_override = function(palette)
		for k, v in pairs(custom_colors) do
			palette[k] = v
		end
	end,
})

vim.cmd.colorscheme("everforest")
