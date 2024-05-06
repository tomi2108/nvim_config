return {
	"otavioschwanck/tmux-awesome-manager.nvim",

	config = function()
		local tmux = require("tmux-awesome-manager")
		tmux.setup({
			project_open_as = "window",
			open_new_as = "window",
		})

		tmux.run({
			cmd = "npm install %1",
			name = "npm install",
			questions = { { question = "package name: ", required = true } },
		})

		tmux.run({
			cmd = "tmuxifier load-window tpso",
			name = "tp SO",
			read_after_cmd = false,
		})

		tmux.run({
			cmd = "npm run dev",
			name = "npm run dev",
		})

		vim.keymap.set("n", "<leader>ll", function()
			vim.cmd(":Telescope tmux-awesome-manager list_terms")
		end, {}) -- List all terminals
		vim.keymap.set("n", "<leader>lo", function()
			vim.cmd(":Telescope tmux-awesome-manager list_open_terms")
		end, {}) -- List open terminals
	end,
}
