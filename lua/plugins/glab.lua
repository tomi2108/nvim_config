return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim",
  },
  build = function() require("gitlab.server").build(true) end,
  config = function()
    local gl = require("gitlab")
    gl.setup({
      discussion_tree = {
        auto_open = false
      }
    })
    vim.keymap.set("n", "<leader>mrl", function() gl.choose_merge_request_by_username({ username = "tosanche" }) end)
    vim.keymap.set("n", "<leader>mrd", function() gl.review() end)
    vim.keymap.set("n", "<leader>mrd", function() gl.review() end)
    vim.keymap.set("n", "<leader>mra", function() gl.add_assignee() end)
    vim.keymap.set("n", "<leader>mrm", function() gl.merge() end)
    vim.keymap.set("n", "<leader>mro", function() gl.open_in_browser() end)
    vim.keymap.set("n", "<leader>mrc", function() gl.create_mr({ delete_branch = true, description = "" }) end)
  end,
}
