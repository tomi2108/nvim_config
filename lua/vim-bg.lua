vim.api.nvim_create_autocmd("Colorscheme", {
	callback = function()
		local groups = {
			"flogBranch0",
			"flogBranch1",
			"flogBranch2",
			"flogBranch3",
			"flogBranch4",
			"flogBranch5",
			"flogBranch6",
			"flogBranch7",
			"flogBranch8",
			"flogBranch9",
			"TelescopeBorder",
			"TelescopeResultsBorder",
			"TelescopePromptBorder",
			"TelescopePreviewBorder",
			"CursorLine",
			"Normal",
			"NormalNC",
			"NormalFloat",
			"Float",
			"FloatTitle",
			"FloatBorder",
			"SignColumn",
			"GitSignsAdd",
			"GitSignsChange",
			"GitSignsDelete",
			"Pmenu",
			"WinSeparator",
			"TelescopeNormal",
			"TelescopeBorder",
			"TelescopeSelection",
			"TelescopePreviewNormal",
			"WhichKeyFloat",
			"EndOfBuffer",
		}

		for _, group in ipairs(groups) do
			vim.cmd("hi " .. group .. " ctermbg=None guibg=NONE")
		end
		return true
	end,
	desc = "transparent backgrounds",
})
