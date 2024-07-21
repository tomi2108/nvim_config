local git_hunks = function()
	require("telescope.pickers")
		.new({
			finder = require("telescope.finders").new_oneshot_job({ "git", "jump", "--stdout", "diff" }, {
				entry_maker = function(line)
					local filename, lnum_string = line:match("([^:]+):(%d+).*")
					if filename:match("^/dev/null") then
						return nil
					end
					return {
						value = filename,
						display = line,
						ordinal = line,
						filename = filename,
						lnum = tonumber(lnum_string),
					}
				end,
			}),
			sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
			previewer = require("telescope.config").values.grep_previewer({}),
			results_title = "Results",
			prompt_title = "Git hunks",
			layout_strategy = "horizontal",
		}, {})
		:find()
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>q", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>gh", git_hunks, {})
			vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
			vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, {})
			vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fm", builtin.man_pages, {})
			vim.keymap.set("n", "<leader>km", builtin.keymaps, {})
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
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							width = 0.95,
							prompt_position = "bottom",
							preview_width = 0.65,
						},
					},
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
