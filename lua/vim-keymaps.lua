local km = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
km.set("n", "+", "<C-a>")
km.set("n", "-", "<C-x>")

-- km.set("n", "<leader>dd", ":HexToggle<CR>")

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

-- Quick fix navigation
km.set("n", "]c", ":cnext<CR><CR>")
km.set("n", "[c", ":cprev<CR><CR>")
km.del("n", "<C-w><C-d>")
km.del("n", "<C-w>d")
km.set("n", "<C-w>", ":cclose<CR>", opts)

km.set({ "n", "v" }, "$", "_", opts)
km.set({ "n", "v" }, "_", "$", opts)

-- Jumplist
km.set("n", "<C-p>", "<C-I>", opts)
km.set("n", "<C-y>", "<C-O>", opts)

-- Copy to system clipboard
km.set("v", "Y", '"+y')

-- Lsp
-- km.set("n", "gd", vim.lsp.buf.definition)
km.set("n", "grn", vim.lsp.buf.rename)

-- Diagnostic navigation
km.set("n", "]d", vim.diagnostic.goto_next)
km.set("n", "[d", vim.diagnostic.goto_prev)

-- Alternate file
km.set("n", "<C-q>", "<C-^>")

-- Join lines
km.set("n", "J", "mzJ`z")
-- Split lines
km.set("n", "H", "r<CR>")

-- Disable q:
km.set("n", "q:", "<nop>")

-- Paste clipboard
km.set("n", "P", '"+p')

-- Open terminal split
-- km.set("n", "<leader>i", ":new<CR>:term<CR>")

-- Search and replace
km.set("v", "<leader>s", ":s//g<C-f>h<C-c>")
km.set("n", "<leader>s", ":%s//g<C-f>h<C-c>")

-- Cut to void register
km.set({ "n", "v" }, "x", '"_x', opts)
km.set({ "n", "v" }, "X", '"_X', opts)

-- Execute
km.set("n", "<leader>x", '<cmd>.lua<CR>', opts)
km.set("n", "<leader><leader>x", '<cmd>source %<CR>', opts)

-- Jump to start and end of line
km.set({ "n", "x" }, "H", "g^")
km.set({ "n", "x" }, "L", "g_")


vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup('custom-term', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

-- Run tests
km.set("n", "<leader>tt", function()
  vim.cmd.vnew()
  vim.cmd.term()
  local job_id = vim.bo.channel
  vim.fn.chansend(job_id, { "npm run test" })
end)

-- Open manual
-- km.set("n", "<leader>m", function()
--   local current_word = vim.fn.expand("<cword>")
--   vim.cmd(":new " .. current_word .. " Manual")
--   vim.cmd(":setlocal buftype=nofile")
--   vim.cmd(":setlocal bufhidden=delete")
--   vim.cmd(":setlocal noswapfile")
--   vim.cmd(":setlocal nonumber norelativenumber")
--   vim.cmd(":read !man -a " .. current_word)
--   vim.cmd(":silent! %s/.//g")
--   vim.cmd(":setlocal readonly")
--   vim.api.nvim_feedkeys("gg", "m", false)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("/NAME<CR>", true, true, true), "m", false)
-- end, {})

-- Diff clipboard
-- km.set("n","<leader>dc",function()
--   vim.cmd([[
--     let ft=&ft
--     leftabove vnew [Clipboard]
--     setlocal bufhidden=wipe buftype=nofile noswapfile
--     put +
--     0d_
--     " remove CR for Windows
--     silent %s/\r$//e
--     execute "set ft=" . ft
--     diffthis
--     wincmd p
--     diffthis
--   ]])
-- end, { desc = "Compare Active File with Clipboard" })
