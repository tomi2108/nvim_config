return {
	{
		-- "rose-pine/neovim",
		-- lazy = false,
		-- config = function()
		-- 	-- local setup = require("vim-colorscheme")
		-- 	-- setup.rose_pine_setup()
		-- end,
	},
	{
		"neanias/everforest-nvim",
		lazy = false,
		config = function()
			local setup = require("vim-colorscheme")
			-- setup.zenbones_setup()
			setup.everforest_setup()
		end,
	},
	{
		-- "craftzdog/solarized-osaka.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- opts = {},
		-- -- config = setups.solarized_osaka_setup,
	},
	{
		-- "kdheepak/monochrome.nvim",
		-- lazy = false,
		-- priority = 1000,
	},
	{
		-- "jesseleite/nvim-noirbuddy",
		-- dependencies = {
		-- 	{ "tjdevries/colorbuddy.nvim" },
		-- config = function()
		-- 	-- require("noirbuddy").setup({
		-- 	-- 	colors = {
		-- 	-- 		background = "#19191F",
		-- 	-- 		primary = "#89A7B1",
		-- 	-- 		secondary = "#566981",
		-- 	-- 	},
		-- 	-- })
		-- end,
		-- lazy = false,
		-- priority = 1000,
	},
	-- { "EdenEast/nightfox.nvim" },
	-- { "rebelot/kanagawa.nvim" },
	{
		-- "horanmustaplot/xcarbon.nvim",
		-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
		-- priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	-- vim.cmd("colorscheme xcarbon")
		-- end,
	},
}
