return {
	"mistweaverco/kulala.nvim",
	config = function()
		vim.filetype.add({
			extension = { ["http"] = "http" },
		})
		require("kulala").setup({
			default_view = "headers_body",
			debug = true,
		})
		vim.keymap.set({ "n", "v" }, "<leader>r", function()
			require("kulala").run()
		end)
		vim.keymap.set({ "n", "v" }, "<leader>kc", function()
			require("kulala").copy()
		end)
	end,
}
