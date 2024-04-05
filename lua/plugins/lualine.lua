local palette = require("addons.everforest-palette")
return {
	"nvim-lualine/lualine.nvim",
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
			theme.normal[letter].bg = palette.bg0
			theme.insert[letter].bg = palette.bg0
			theme.visual[letter].bg = palette.bg0
			theme.replace[letter].bg = palette.bg0
			theme.command[letter].bg = palette.bg0
			theme.terminal[letter].bg = palette.bg0
			theme.inactive[letter].bg = palette.bg0
		end

		require("lualine").setup({
			options = {
				theme = theme,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
