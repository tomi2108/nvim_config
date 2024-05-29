return {
	"bloznelis/before.nvim",
	config = function()
		local before = require("before")
		before.setup()
		vim.keymap.set("n", "<C-i>", before.jump_to_last_edit, {})
		-- Jump to next entry in the edit history
		vim.keymap.set("n", "<C-o>", before.jump_to_next_edit, {})

		vim.keymap.set("n", "<leader>oo", before.show_edits_in_telescope, {})
	end,
}
