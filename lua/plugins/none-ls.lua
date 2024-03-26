local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.stylelint,
        -- null_ls.builtins.formatting.rustywind,
        null_ls.builtins.formatting.clang_format,
      },
      -- format on save
      on_attach = function(client, bufr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufr,
              })
            end,
          })
        end
      end,

      vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {}),
    })
  end,
}
