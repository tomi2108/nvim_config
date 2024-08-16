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
			default_connection = "webapo-local",
			result = {
				page_size = 7,
			},
			drawer = {
				disable_help = true,
			},
			sources = {
			},
		})
		vim.keymap.set("n", "<leader>db", function()
			vim.cmd("Dbee")
			vim.cmd("resize +9")
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-h>", true, true, true), "m", false)
		end)
		vim.keymap.set("n", "<leader>dr", function()
			vim.cmd("resize +9")
		end)
	end,
}
