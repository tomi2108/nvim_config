return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		config = function()
			require("lazydev").setup({})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0,
			})
		end,
	},
}
