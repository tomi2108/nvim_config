return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require("gitsigns")
		gs.setup({})
		vim.keymap.set("n", "<leader>hp", gs.preview_hunk, {})
		vim.keymap.set("n", "<leader>hn", gs.next_hunk, {})
		vim.keymap.set("n", "<leader>hs", gs.stage_hunk, {})
		vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, {})
		vim.keymap.set("n", "<leader>hd", gs.diffthis, {})
	end,
}
