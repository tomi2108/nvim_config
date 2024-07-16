return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<C-g>", ":Gedit :<CR>")
    vim.keymap.set("n", "<C-p><C-h>", ":Git pull<CR>")
    vim.keymap.set("n", "<C-p><C-l>", ":Git push<CR>")
    vim.cmd("let g:nremap = {'=': '<TAB>'}");
  end,
}
