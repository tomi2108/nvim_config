local km = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
km.set("n", "+", "<C-a>")
km.set("n", "-", "<C-x>")
km.set("n", "<C-a>", "gg<S-v>G")

-- Diagnostics
km.set("n", "<C-j>", function()
	vim.diagnostic.goto_next({ float = { border = "rounded" } })
end, opts)
km.set("n", ":", "<cmd>FineCmdline<CR>", opts)
km.set("n", "<leader>b", ":TroubleToggle<CR>")
