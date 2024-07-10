return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require("gitsigns")
		gs.setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)
			end,
		})
		vim.keymap.set("n", "<leader>hp", gs.preview_hunk, {})
		vim.keymap.set("n", "<leader>hr", gs.reset_hunk, {})
		vim.keymap.set("n", "<leader>hs", gs.stage_hunk, {})
		vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, {})
		vim.keymap.set("n", "<leader>hd", gs.diffthis, {})
	end,
}
