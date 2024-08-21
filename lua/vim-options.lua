vim.opt.autoindent = true
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "es_es" }
vim.cmd(":set guicursor=i:block")

vim.wo.wrap = false
vim.opt.fillchars:append("eob: ")

vim.g.mapleader = " "

-- format on save
-- local autocmd = vim.api.nvim_create_autocmd
-- local augroupf = vim.api.nvim_create_augroup
-- augroupf("__formatter__", { clear = true })
-- autocmd("BufWritePost", {
-- 	group = "__formatter__",
-- 	command = ":FormatWrite",
-- })

-- show diagnostics in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
})
