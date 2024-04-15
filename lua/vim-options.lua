vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.undofile = true

vim.g.mapleader = " "

-- format on save
local autocmd = vim.api.nvim_create_autocmd
local augroupf = vim.api.nvim_create_augroup
augroupf("__formatter__", { clear = true })
autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})

-- show diagnostics in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
})
