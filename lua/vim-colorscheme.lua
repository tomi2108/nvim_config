local common_setup = function()
	vim.keymap.set("n", "<leader>fhw", function()
		local result = vim.treesitter.get_captures_at_cursor(0)
		print(vim.inspect(result))
	end)
end
local everforest_setup = function()
	local custom_colors = require("addons.everforest-palette")
	require("everforest").setup({
		italics = true,
		disable_italic_comments = false,
		ui_contrast = "low",
		sign_column_background = "none",
		dim_inactive_windows = false,
		diagnostic_text_highlight = false,
		diagnostic_virtual_text = "coloured",
		diagnostic_line_highlight = false,
		spell_foreground = false,
		show_eob = false,
		float_style = "dim",
		inlay_hints_background = "none",
		background = "medium",
		transparent_background_level = 2,
		on_highlights = function(hl, palette)
			hl.FloatBorder = { fg = palette.bg0, bg = "none" }
			hl.TelescopeBorder = { fg = palette.bg0, bg = "none" }
			hl.TelescopeSelection = { fg = palette.fg, bg = palette.bg_visual }
			hl.WinSeparator = { fg = palette.bg0, bg = "none" }
			hl.NeoTreeFloatNormal = { bg = "none", fg = palette.fg }
			hl.NeoTreeFloatTitle = { bg = "none", fg = palette.fg }
			hl.NeoTreeFloatBorder = { fg = palette.bg0, bg = "none" }
			hl.NeoTreeNormal = { bg = "none", fg = palette.fg }
			hl.NeoTreeEndOfBuffer = { bg = "none", fg = "none" }
			hl.TSString = { fg = palette.orange, bg = "none" }
			hl.TSType = { fg = palette.yellow, bg = "none" }
			hl.TSTypeDefinition = { fg = palette.yellow, bg = "none" }
			hl.TSConstructor = { fg = palette.yellow, bg = "none" }
			hl.TSTypeBuiltin = { fg = palette.yellow, bg = "none" }
			hl.String = { fg = palette.orange, bg = "none" }
			hl.EndOfBuffer = { bg = "none", fg = "none" }
			hl.YankyYanked = { bg = palette.bg_visual, fg = "none" }
			hl.flogBranch0 = { bg = "none", fg = palette.green }
			hl.flogBranch1 = { bg = "none", fg = palette.green }
			hl.flogBranch2 = { bg = "none", fg = palette.yellow }
			hl.flogBranch3 = { bg = "none", fg = palette.orange }
			hl.flogBranch4 = { bg = "none", fg = palette.purple }
			hl.flogBranch5 = { bg = "none", fg = palette.green }
			hl.flogBranch6 = { bg = "none", fg = palette.aqua }
			hl.flogBranch7 = { bg = "none", fg = palette.purple }
			hl.flogBranch8 = { bg = "none", fg = palette.red }
			hl.flogBranch9 = { bg = "none", fg = palette.purple }
		end,
		colours_override = function(palette)
			for k, v in pairs(custom_colors) do
				palette[k] = v
			end
		end,
	})
	vim.cmd.colorscheme("everforest")
	vim.cmd("hi TelescopeSelection guibg=" .. custom_colors.bg_visual)
	common_setup()
end

local solarized_osaka_setup = function()
	require("solarized-osaka").setup({
		transparent = false,
	})
	vim.o.background = "dark"
	vim.cmd.colorscheme("solarized-osaka-storm")
	common_setup()
end

local rose_pine_setup = function()
	require("rose-pine").setup({})
	vim.o.background = "dark"
	vim.cmd.colorscheme("rose-pine")
	common_setup()
end

local lilac_garden_setup = function()
	local palette = require("addons.lilac-garden-palette")
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.background, bg = palette.background })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = palette.background, bg = palette.background })
	vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = palette.background, bg = palette.background })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = palette.background, bg = palette.background })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.fg, bg = palette.blue })
	vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.background, bg = palette.background })
	vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = palette.background, fg = palette.fg })
	vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = palette.background, fg = palette.fg })
	vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = palette.background, bg = palette.background })
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = palette.background, fg = palette.fg })
	vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = palette.background, fg = palette.background })
	vim.api.nvim_set_hl(0, "TSString", { fg = palette.lilac, bg = palette.background })
	vim.api.nvim_set_hl(0, "TSType", { fg = palette.yellow, bg = palette.background })
	vim.api.nvim_set_hl(0, "TSTypeDefinition", { fg = palette.yellow, bg = palette.background })
	vim.api.nvim_set_hl(0, "TSConstructor", { fg = palette.yellow, bg = palette.background })
	vim.api.nvim_set_hl(0, "TSTypeBuiltin", { fg = palette.yellow, bg = palette.background })
	vim.api.nvim_set_hl(0, "String", { fg = palette.lilac, bg = palette.background })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = palette.background, fg = palette.background })
	vim.api.nvim_set_hl(0, "YankyYanked", { bg = palette.cyan, fg = palette.background })
	vim.api.nvim_set_hl(0, "flogBranch0", { bg = palette.background, fg = palette.green })
	vim.api.nvim_set_hl(0, "flogBranch1", { bg = palette.background, fg = palette.green })
	vim.api.nvim_set_hl(0, "flogBranch2", { bg = palette.background, fg = palette.yellow })
	vim.api.nvim_set_hl(0, "flogBranch3", { bg = palette.background, fg = palette.lilac })
	vim.api.nvim_set_hl(0, "flogBranch4", { bg = palette.background, fg = palette.magenta })
	vim.api.nvim_set_hl(0, "flogBranch5", { bg = palette.background, fg = palette.green })
	vim.api.nvim_set_hl(0, "flogBranch6", { bg = palette.background, fg = palette.blue })
	vim.api.nvim_set_hl(0, "flogBranch7", { bg = palette.background, fg = palette.magenta })
	vim.api.nvim_set_hl(0, "flogBranch8", { bg = palette.background, fg = palette.cyan })
	vim.api.nvim_set_hl(0, "flogBranch9", { bg = palette.background, fg = palette.magenta })
	vim.api.nvim_set_hl(0, "DiffAdd", { bg = palette.cyan, fg = palette.background })
	vim.api.nvim_set_hl(0, "diffAdded", { bg = palette.background, fg = palette.cyan })
	common_setup()
end

return {
	everforest_setup = everforest_setup,
	solarized_osaka_setup = solarized_osaka_setup,
	rose_pine_setup = rose_pine_setup,
	lilac_garden_setup = lilac_garden_setup,
}
