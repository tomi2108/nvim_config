return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
      constrain_cursor = "name",
			columns = {
        "permissions",
				"size",
        "mtime"
			},
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "<leader>n", ":Oil <CR>")
	end,
}
