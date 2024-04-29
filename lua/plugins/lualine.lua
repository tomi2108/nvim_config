return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "archibate/lualine-time" },
	},
	config = function()
		local theme = require("lualine.themes.everforest")
		local sections = { "a", "b", "c" }

		theme.normal.a.fg = theme.normal.a.bg
		theme.insert.a.fg = theme.insert.a.bg
		theme.visual.a.fg = theme.visual.a.bg
		theme.replace.a.fg = theme.replace.a.bg
		theme.command.a.fg = theme.command.a.bg
		theme.terminal.a.fg = theme.command.a.bg
		theme.inactive.a.fg = theme.command.a.bg

		for _, letter in pairs(sections) do
			theme.normal[letter].bg = "none"
			theme.insert[letter].bg = "none"
			theme.visual[letter].bg = "none"
			theme.replace[letter].bg = "none"
			theme.command[letter].bg = "none"
			theme.terminal[letter].bg = "none"
			theme.inactive[letter].bg = "none"
		end

		local word_count = function()
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			local content = table.concat(lines, " ")
			local words = 0
			for _ in content:gmatch("%a+") do
				words = words + 1
			end

			return "Words: " .. words
		end

		require("lualine").setup({
			options = {
				theme = theme,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { word_count }, "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location", "ctime" },
			},
		})
	end,
}
