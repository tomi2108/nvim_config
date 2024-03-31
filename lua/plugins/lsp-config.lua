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
  "jdtls",
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
    opts = require("addons.typescript"),
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp = require("lspconfig")
      for _, v in pairs(Lsps) do
        lsp[v].setup({
          capabilities = capabilities,
        })
      end

      -- Borders on hover
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
