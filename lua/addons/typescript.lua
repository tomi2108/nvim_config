return {
	servers = {
		tsserver = {
			keys = {
				{
					"<leader>co",
					function()
						vim.lsp.buf.code_action({
							apply = true,
							context = {
								only = { "source.organizeImports.ts" },
								diagnostics = {},
							},
						})
					end,
					desc = "Organize Imports",
				},
				{
					"<leader>cr",
					function()
						vim.lsp.buf.code_action({
							apply = true,
							context = {
								only = { "source.removeUnused.ts" },
								diagnostics = {},
							},
						})
					end,
					desc = "Remove Unused Imports",
				},
			},
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		},
	},
}
