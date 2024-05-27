local km = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
km.set("n", "+", "<C-a>")
km.set("n", "-", "<C-x>")

km.set("n", ":", "<cmd>FineCmdline<CR>", opts)
km.set("n", "<leader>b", ":TroubleToggle<CR>")
km.set("n", "<leader>d", ":HexToggle<CR>")

-- Move lines
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

-- Half page jumping
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

-- Whitespace jumping
km.set("n", "E", "El")
km.set("n", "B", "Bh")

km.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Unbind arrow keys
km.set({ "n", "i", "v" }, "<left>", "")
km.set({ "n", "i", "v" }, "<right>", "")
km.set({ "n", "i", "v" }, "<up>", "")
km.set({ "n", "i", "v" }, "<down>", "")

km.set("n", "<leader>]", ":cnext<CR><CR>")
km.set("n", "<leader>[", ":cprev<CR><CR>")
km.set("n", "<C-q>", ":cclose<CR>")

km.set("n", "<leader>for", "ofor (int i = 0; condition; i++) {<CR>}<Esc>Oreturn i;<Esc>kfcdwi")
km.set("n", "<C-t>", "I# <Esc>")

km.set({ "n", "v" }, "$", "_", opts)
km.set({ "n", "v" }, "_", "$", opts)

-- jumplist
km.set("n", "<C-p>", "<C-I>", opts)
km.set("n", "<C-y>", "<C-O>", opts)

-- Copy to system clipboard
km.set("v", "Y", '"+y')
