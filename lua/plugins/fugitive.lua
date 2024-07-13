return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<C-g>", ":Gedit :<CR>")
    vim.cmd("let g:nremap = {'=': '<TAB>'}");
  end,
}
