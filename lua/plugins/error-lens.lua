local palette = require("addons.everforest-palette")
return {
	"chikko80/error-lens.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		colors = {
			error_fg = palette.red,
			error_bg = palette.bg_red,
			warn_fg = palette.yellow,
			warn_bg = palette.bg_yellow,
			info_fg = palette.blue,
			info_bg = palette.bg_blue,
			hint_fg = palette.green,
			hint_bg = palette.bg_green,
		},
	},
}
