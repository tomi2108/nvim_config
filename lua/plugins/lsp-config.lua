local Lsps = {
  "lua_ls",
  "clangd",
  "cssls",
  "eslint",
  "html",
  "jsonls",
  -- "tsserver",
  "marksman",
  "omnisharp",
  -- "sonarlint",
  "somesass_ls",
  "taplo",
  "gopls",
  "tailwindcss",
  "lemminx",
  -- "csharp_ls",
  "jdtls",
  "zls",
  "yamlls"
}
local custom_setup = {
  "clangd",
  "snyk_ls",
  "sqls",
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
      local mason_path = "/Users/tsanchen/.local/share/nvim/mason"
      local mason_bin_path = mason_path .. "/bin"
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp = require("lspconfig")
      for _, v in pairs(Lsps) do
        if custom_setup[v] == nil then
          lsp[v].setup({
            capabilities = capabilities,
            autostart = true,
          })
        end
        require("sonarlint").setup({
          settings = {
            sonarlint = {
              connectedMode = {
                project = {
                  projectKey = "migra-apoderados",
                  connectionId = "https-sonarqube-agil-movistar-com-ar-",
                },
              },
            },
            connections = {
              sonarqube = {
                {
                  connectionId = "https-sonarqube-agil-movistar-com-ar-",
                  serverUrl = "https://sonarqube.agil.movistar.com.ar/",
                  token = "squ_dad782ef2f02488725669d9cea51c1c53ba05dbe",
                },
              },
            },
          },
          server = {
            cmd = {
              mason_bin_path .. "/sonarlint-language-server",
              "-stdio",
              "-analyzers",
              vim.fn.expand(mason_path .. "/share/sonarlint-analyzers/sonarjs.jar"),
            },
          },
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
        })
      end

      lsp.sqls.setup({
        cmd = {
          mason_bin_path .. "/sqls",
          "-config",
          "/Users/tsanchen/.local/share/nvim/mason/share/sqls-config.yml"
        },
      })

      lsp.clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
        },
      })
      lsp.snyk_ls.setup({
        capabilities = capabilities,
        init_options = {
          token = "f0cd6820-702c-4722-b399-1fddb93abd15",
          enableTrustedFoldersFeature = "false",
          authenticationMethod = "token",
        },
      })

      -- Borders on hover
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        bg = "none",
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
