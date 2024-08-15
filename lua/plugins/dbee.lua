return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install()
	end,
	config = function()
		require("dbee").setup({
			default_connection = "gdd",
			editor = {
				winheight = 10,
				winfixheight = true,
			},
			call_log = {
				window_options = {
					winheight = 10,
					winfixheight = true,
				},
			},
			result = {
				page_size = 7,
				window_options = {
					winheight = 10,
					winfixheight = true,
				},
			},
			drawer = {
				window_options = {
					winheight = 10,
					winfixheight = true,
				},
				disable_help = true,
			},
			sources = {
			},
		})
	end,
}
