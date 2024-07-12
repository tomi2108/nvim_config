return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
		vim.keymap.set("n", "<leader>gs", ":Gedit :<CR>")
		vim.keymap.set("n", "<leader>gp", ":Git pull<CR>")
		vim.keymap.set("n", "<leader>gP", ":Git push<CR>")
		vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>")
		vim.keymap.set("n", "<leader>gB", ":Git blame<CR>")
		vim.keymap.set("n", "<leader>gaa", ":Git add .<CR>")
	end,
}
