return {
  "davmacario/nvim-quicknotes",
  keys = { "<leader>nn" },
  cmd = { "Quicknotes", "QuicknotesClear", "QuicknotesCleanup" }, -- Lazy-load the plugin

  config = function()
    require("nvim-quicknotes").setup()

    vim.keymap.set("n", "<leader>nn", vim.cmd.Quicknotes, { desc = "Open quicknotes" })
  end,
}
