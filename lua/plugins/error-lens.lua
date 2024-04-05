return {
	"chikko80/error-lens.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		auto_adjust = {
			enable = true,
			fallback_bg_color = "#2D353B",
		},
	},
}
