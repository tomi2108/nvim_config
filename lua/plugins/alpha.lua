return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local alpha = require("alpha")
		local theta = require("alpha.themes.theta")
		local cdir = vim.fn.getcwd()
		local mru = theta.mru
		local plugin_list = require("lazy").plugins()
		local plugin_count = 0
		for _ in pairs(plugin_list) do
			plugin_count = plugin_count + 1
		end
		local header_val = {
			[[                 *       +]],
			[[           '                  |]],
			[[       ()    .-.,="``"=.    - o -]],
			[[             '=/_       \     |]],
			[[          *   |  '=._    |]],
			[[               \     `=./`,        ']],
			[[            .   '=.__.=' `='      *]],
			[[   +                         +]],
			[[        O      *        '       .]],
		}
		local header = {
			type = "text",
			val = header_val,
			opts = {
				position = "center",
				hl = "Type",
			},
		}
		local section_mru = {
			type = "group",
			val = {
				{
					type = "text",
					val = "Recent files",
					opts = {
						hl = "SpecialComment",
						shrink_margin = false,
						position = "center",
					},
				},
				{ type = "padding", val = 1 },
				{
					type = "group",
					val = function()
						return { mru(0, cdir) }
					end,
					opts = { shrink_margin = false },
				},
			},
		}
		theta.config.layout = {
			{ type = "padding", val = 2 },
			header,
			{ type = "padding", val = 2 },
			section_mru,
			{ type = "padding", val = 1 },
			{
				type = "text",
				val = string.format("♍ %s Plugins installed  ♍", plugin_count),
				opts = {
					position = "center",
					hl = "SpecialComment",
					shrink_margin = false,
				},
			},
		}
		alpha.setup(theta.config)
	end,
}
