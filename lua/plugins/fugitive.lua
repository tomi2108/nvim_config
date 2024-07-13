return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<C-g>", ":Gedit :<CR>")
    vim.keymap.set("n", "<C-p>", ":Git pull<CR>")
    vim.keymap.set("n", "<C-P>", ":Git push<CR>")
    vim.cmd("let g:nremap = {'=': '<TAB>'}");
  end,
}
