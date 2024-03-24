return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local tree_sitter = require("nvim-treesitter.configs")
		tree_sitter.setup({
			auto_install = true,
			highlight = { enabled = true },
			indent = { enabled = true },
		})
	end,
}
