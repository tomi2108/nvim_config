local opts = { noremap = true, silent = true }
return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			hide_numbers = false,
			size = 12,
			direction = "horizontal",
			autochdir = true,
		})
		vim.api.nvim_create_autocmd({ "TermEnter" }, {
			pattern = { "*" },
			callback = function()
				vim.cmd("startinsert")
				vim.api.nvim_buf_set_keymap(0, "t", "<c-h>", [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<c-j>", [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<c-k>", [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<c-l>", [[<C-\><C-n><C-W>l]], opts)
			end,
		})
		vim.keymap.set("n", [[<C-\>]], ":ToggleTerm<CR>", opts)
	end,
}
