return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>q", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

      vim.keymap.set("n", "<leader>fws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>fWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"package-lock",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
