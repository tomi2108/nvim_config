local Lsps = {
	"lua_ls",
	"clangd",
	"cssls",
	"eslint",
	"html",
	"jsonls",
	"ts_ls",
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
	"yamlls",
}
local custom_setup = {
	"clangd",
	-- "snyk_ls",
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
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = require("addons.typescript"),
		config = function()
			local mason_path = "/home/tsanchen/.local/share/nvim/mason"
			local mason_bin_path = mason_path .. "/bin"
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lsp = require("lspconfig")
			for _, v in ipairs(Lsps) do
				if custom_setup[v] == nil then
					if lsp[v] ~= nil then
						if lsp[v].setup ~= nil then
							lsp[v].setup({
								autostart = true,
								capabilities = capabilities,
							})
						else
							vim.notify("LSP server " .. v .. " does not have a setup function", vim.log.levels.ERROR)
						end
					end
				end
			-- 	require("sonarlint").setup({
			-- 		settings = {
			-- 			sonarlint = {
			-- 				connectedMode = {
			-- 					project = {
			-- 						projectKey = "migra-apoderados",
			-- 						connectionId = "https-sonarqube-agil-movistar-com-ar-",
			-- 					},
			-- 				},
			-- 			},
			-- 			connections = {
			-- 				sonarqube = {
			-- 					{
			-- 						connectionId = "https-sonarqube-agil-movistar-com-ar-",
			-- 						serverUrl = "https://sonarqube.agil.movistar.com.ar/",
			-- 					},
			-- 				},
			-- 			},
			-- 		},
			-- 		server = {
			-- 			cmd = {
			-- 				mason_bin_path .. "/sonarlint-language-server",
			-- 				"-stdio",
			-- 				"-analyzers",
			-- 				vim.fn.expand(mason_path .. "/share/sonarlint-analyzers/sonarjs.jar"),
			-- 			},
			-- 		},
			-- 		filetypes = {
			-- 			"javascript",
			-- 			"javascriptreact",
			-- 			"typescript",
			-- 			"typescriptreact",
			-- 		},
			-- 	})
			end

			lsp.sqls.setup({
				cmd = {
					mason_bin_path .. "/sqls",
					"-config",
					"/home/tsanchen/.config/sqls/config.yml",
				},
			})

			lsp.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
			-- lsp.snyk_ls.setup({
			-- 	capabilities = capabilities,
			-- 	init_options = {
			-- 		token = "f0cd6820-702c-4722-b399-1fddb93abd15",
			-- 		enableTrustedFoldersFeature = "false",
			-- 		authenticationMethod = "token",
			-- 	},
			-- })

			-- Borders on hover
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				bg = "none",
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
