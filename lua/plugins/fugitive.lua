return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<C-g>", ":Gedit :<CR>")
    vim.keymap.set("n", "<C-p><C-h>", ":Git push<CR>")
    vim.keymap.set("n", "<C-p><C-l>", ":Git pull<CR>")
    vim.cmd("let g:nremap = {'=': '<TAB>'}");
  end,
}
