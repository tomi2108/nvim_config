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

-- Move lines
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

-- Half page jumping
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
