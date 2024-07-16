local km = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
km.set("n", "+", "<C-a>")
km.set("n", "-", "<C-x>")

km.set("n", "<leader>dd", ":HexToggle<CR>")

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

km.set("n", "<leader>for", "ofor (int i = 0; condition; i++){<CR>}<Esc>Oreturn i;<Esc>kfcdwi")
km.set("n", "<leader>if", "oif (condition){<CR>}<Esc>kfcdwi")

km.set({ "n", "v" }, "$", "_", opts)
km.set({ "n", "v" }, "_", "$", opts)

-- jumplist
km.set("n", "<C-p>", "<C-I>", opts)
km.set("n", "<C-y>", "<C-O>", opts)

-- Copy to system clipboard
km.set("v", "Y", '"+y')

-- Jump to definition
km.set("n", "gd", vim.lsp.buf.definition)

-- Jump to diagnostics
km.set("n", "]d", vim.diagnostic.goto_next)
km.set("n", "[d", vim.diagnostic.goto_prev)

-- Alternate file
km.set("n", "<C-q>", "<C-^>")

-- Join lines
km.set("n", "J", "mzJ`z")

-- Disable q:
km.set("n", "q:", "<nop>")

-- Open c manual
km.set("n", "<leader>m", function()
	local current_word = vim.fn.expand("<cword>")
	vim.cmd(":new " .. current_word .. " Manual")
	vim.cmd(":setlocal buftype=nofile")
	vim.cmd(":setlocal bufhidden=delete")
	vim.cmd(":setlocal noswapfile")
	vim.cmd(":setlocal nonumber norelativenumber")
	vim.cmd(":read !man -a " .. current_word)
	vim.cmd(":silent! %s/.//g")
	vim.cmd(":setlocal readonly")
	vim.api.nvim_feedkeys("gg", "m", false)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("/NAME<CR>", true, true, true), "m", false)
end, {})
