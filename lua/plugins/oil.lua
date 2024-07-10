return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			columns = {
				"size",
				"icon",
			},
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "<leader>n", ":Oil <CR>")
	end,
}
