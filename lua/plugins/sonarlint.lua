return {
	url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
	dependencies = {
		"mfussenegger/nvim-jdtls",
	},
	config = function()
		require("sonarlint").setup({
			server = {
				cmd = {
					"~/.local/share/nvim/mason/packages/sonarlint-language-server/sonarlint-language-server.cmd",
					"-stdio",
					"-analyzers",
					"~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjs.jar",
				},
			},
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		})
	end,
}
