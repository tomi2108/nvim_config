return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"cssls",
					"eslint",
					"html",
					"jsonls",
					"tsserver",
					"ltex",
					"marksman",
					"somesass_ls",
					"taplo",
					"tailwindcss",
					"lemminx",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lsp = require("lspconfig")
			lsp.lua_ls.setup({
				capabilities = capabilities,
			})
			lsp.clangd.setup({
				capabilities = capabilities,
			})
			lsp.cssls.setup({
				capabilities = capabilities,
			})
			lsp.eslint.setup({
				capabilities = capabilities,
			})
			lsp.html.setup({
				capabilities = capabilities,
			})
			lsp.jsonls.setup({
				capabilities = capabilities,
			})
			lsp.tsserver.setup({
				capabilities = capabilities,
			})
			lsp.ltex.setup({
				capabilities = capabilities,
			})
			lsp.marksman.setup({
				capabilities = capabilities,
			})
			lsp.somesass_ls.setup({
				capabilities = capabilities,
			})
			lsp.taplo.setup({
				capabilities = capabilities,
			})
			lsp.tailwindcss.setup({
				capabilities = capabilities,
			})
			lsp.lemminx.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
