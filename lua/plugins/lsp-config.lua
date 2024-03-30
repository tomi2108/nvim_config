local Lsps = {
  "lua_ls",
  "clangd",
  "cssls",
  "eslint",
  "html",
  "jsonls",
  "ltex",
  "tsserver",
  "marksman",
  "somesass_ls",
  "taplo",
  "tailwindcss",
  "lemminx",
}
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = Lsps,
    },
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = Lsps,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp = require("lspconfig")
      for _, v in pairs(Lsps) do
        lsp[v].setup({
          capabilities = capabilities,
        })
      end
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
