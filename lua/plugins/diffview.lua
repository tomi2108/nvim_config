return {
	"sindrets/diffview.nvim",
  config = function ()
    vim.keymap.set("n","<leader>gdd",":DiffviewOpen<CR>")
    vim.keymap.set("n","<leader>gdm",":DiffviewOpen main..HEAD<CR>")
  end
}
