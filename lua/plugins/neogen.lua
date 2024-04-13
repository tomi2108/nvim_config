return {
	"danymat/neogen",
	config = function()
		require("neogen").setup({
			snippet_engine = "luasnip",
		})
		vim.keymap.set("n", "<leader>df", function()
			require("neogen").generate({ type = "func" })
		end)
	end,
}
