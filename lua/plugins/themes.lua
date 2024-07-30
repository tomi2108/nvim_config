local setups = require("vim-colorscheme")
return {
	{
		"neanias/everforest-nvim",
		lazy = false,
		config = function()
			local setup = require("vim-colorscheme")
			setup.everforest_setup()
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		-- config = setups.solarized_osaka_setup,
	},
}
