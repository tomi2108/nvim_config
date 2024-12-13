return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<C-g>", ":Gedit :<CR>")
    vim.keymap.set("n", "<C-p><C-h>", ":Git push<CR>")
    vim.keymap.set("n", "<C-p><C-l>", ":Git pull<CR>")
    vim.keymap.set("n", "<leader>gb",
      function()
        local title = ""
        local Input = require("nui.input")
        local input = Input({
          position = "50%",
          relative = "editor",
          size = 40,
          border = {
            style = "rounded",
            text = {
              top = "Branch name",
            },
          },
        }, {
          prompt = "",
          default_value = "feature/",
          on_close = function() end,
          on_submit = function()
            if title == "" then return end
            vim.cmd("Git branch " .. title)
            vim.cmd("Git switch " .. title)
          end,
          on_change = function(value)
            title = value
          end,
        })
        input:mount()
      end
    )
    vim.cmd("let g:nremap = {'=': '<TAB>'}");
  end,
}
