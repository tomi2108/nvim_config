vim.api.nvim_create_augroup("custom_buffer", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
	group = "custom_buffer",
	pattern = "*",
	command = "startinsert | set winfixheight",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "custom_buffer",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 100, higroup = "YankyYanked" })
	end,
})
